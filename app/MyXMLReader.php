<?php

namespace TestTaskTransfermate;

require_once "AuthorsBooks.php";
use TestTaskTransfermate\AuthorsBooks as AuthorsBooks;

class MyXMLReader
{
	public $myFile;
	public $myFileName;
	public $myFilePath;
	public $myFileDirectory;
	public $authorsBooksObject;
    // const ROOT_XML_DIR = __DIR__ . '\xml_root_dir\\';
	
    public function __construct($pdo, $subDirectories)
	{
		$this->subDirectories = $subDirectories;
		$this->authorsBooksObject = new AuthorsBooks($pdo);
    }
	
	public function traverseDirectories()
	{
		$result = array();
		while($this->subDirectories->valid())
		{
			$this->myFile = $this->subDirectories->current();
			$this->fileName = $this->myFile->getFilename();
			$this->filePath = $this->myFile->getPathname();
			$this->fileDirectory = dirname($this->filePath);
			
			$this->subDirectories->next();

			if(file_exists($this->filePath) && is_file($this->filePath) === true)
			{
				$fileinfo = pathinfo($this->fileName);
				if($fileinfo['extension'] === 'xml')
				{
					$result[] = $this->readFromXMLFile($this->filePath);
				}
				else
				{
					$message = 'It is not XML file!';
				}
			}
			else
			{
				$message = 'It is not file or does not exists!';
			}
		}
		
		return $result;
	}
	
	public function readFromXMLFile()
	{
		$result = array();
		$xmlDataFromFIle = simplexml_load_file($this->filePath);
		
		$rowInFileIterator = 0;
		$insertData = array();
		$insertData['fileData']['filePath'] = $this->fileDirectory;
		$insertData['fileData']['fileName'] = $this->fileName;
		foreach($xmlDataFromFIle->book as $authorBook)
		{
			$rowInFileIterator++;
			
			$insertData['author'] = $authorBook->author->__toString();
			$insertData['name'] = $authorBook->name->__toString();
			$insertData['rowInFileIterator'] = $rowInFileIterator;
						
			$this->authorsBooksObject->insertItems($insertData);
		}
	}
}