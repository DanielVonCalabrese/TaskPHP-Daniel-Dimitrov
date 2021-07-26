<?php

namespace TestTaskTransfermate;

class AuthorsBooks
{
	public $authorId;
	public $bookId;
	public $fileId;
	
    public function __construct($pdo)
	{
        $this->pdo = $pdo;
		$this->authorId = 0;
		$this->bookId = 0;
    }
	
	public function insertAuthor($data)
	{
		$query = 'INSERT INTO authors(name) VALUES(:name)';
		
		try{
			$statement = $this->pdo->prepare($query);
			$statement->bindParam(':name', $data);
			$statement->execute();
			
			$this->authorId = $this->pdo->lastInsertId();	
			
		}catch(\PDOException $e){
			
			if($e->getCode() == 23505)
			{
				$author = $this->getItemByAuthor($data);
				$this->authorId = $author->author_id;
				
				// $filesItem = $this->getItemFilesDataByAuthorId($author->author_id);
				//$this->fileId = $filesItem->fileId;
				
				$message = 'Author\'s name is already in Database!';
			}
			else
			{
				$message = $e->getMessage();
			}
		}
		
		return $this->authorId;
	}
	
	public function insertBook($data)
	{
		$query = 'INSERT INTO books(title, author_id) VALUES(:title, :author_id)';
		
		try{
			$statement = $this->pdo->prepare($query);
			$statement->bindParam(':title', $data);
			$statement->bindParam(':author_id', $this->authorId);
			$statement->execute();
			
			$this->bookId = $this->pdo->lastInsertId();
			
		}catch(\PDOException $e){
			
			if($e->getCode() == 23505)
			{
				$book = $this->getItemByBook($data);
				$this->bookId = $book->book_id;
				
				// $filesItem = $this->getItemFilesDataByBookId($book->book_id);
				// $this->fileId = $filesItem->fileId;
				
				$message = 'Book\'s title is already in Database!';
			}
			else
			{
				$message = $e->getMessage();
			}
		}
		
		return $this->bookId;
	}
	
	public function insertFileData($data)
	{
		$query = 'INSERT INTO files(file_path, file_name, book_id, author_id, row_in_file) VALUES(:file_path, :file_name, :book_id, :author_id, :row_in_file)';
		
		try{
			$statement = $this->pdo->prepare($query);
			$statement->bindParam(':file_path', $data['fileData']['filePath']);
			$statement->bindParam(':file_name', $data['fileData']['fileName']);
			$statement->bindParam(':book_id', $this->bookId);
			$statement->bindParam(':author_id', $this->authorId);
			$statement->bindParam(':row_in_file', $data['rowInFileIterator']);
			$statement->execute();
			
		}catch(\PDOException $e){
			
			if($e->getCode() == 23505)
			{
				$message = 'Record is already in Database!';
			}
			else
			{
				$message = $e->getMessage();
			}
		}
	}
	
	// public function checkForUpdate($filePath, $fileName, $bookId, $authorId, $rowInFile)
	// {
		// $item = $this->getItemByFile($filePath, $fileName, $bookId, $authorId, $rowInFile);
		
		// var_dump($item);exit;
	// }
	
    // public function insertItem($insertData)
	// {		
		// var_dump($insertData, $insertData['author'], $insertData['name'], $insertData['fileData'], $insertData['rowInFileIterator']);exit;
		
		// $this->authorId = $this->insertAuthor($insertData['author']);
		// $this->bookId = $this->insertBook($insertData['name']);
		// $this->insertFileData($insertData);
    // }
	
    public function insertItems($insertData)
	{		
		$insertData['author'] = isset($insertData['author']) === true ? $insertData['author'] : '';
		$insertData['name'] = isset($insertData['name']) === true ? $insertData['name'] : '';
		
		$this->authorId = $this->insertAuthor($insertData['author']);
		$this->bookId = $this->insertBook($insertData['name']);
		$this->insertFileData($insertData);
    }
	
    public function getAll()
	{
		$items = (object)[];
		
		try{
			$statement = $this->pdo->query('SELECT a.name AS author_name, b.title '
					. 'FROM authors AS a '
					. 'LEFT JOIN books AS b '
					. 'ON a.author_id = b.author_id '
					. 'ORDER BY author_name ASC'
			);
			
		}catch(\PDOException $e){
			throw new Exception("ERROR:". $e->getMessage());
		}
		
        if($statement->rowCount() <= 0)
		{
          return false;
        }
		
		$items = $statement->fetchAll(\PDO::FETCH_OBJ);
		
        return $items;
    }
	
    public function getItemByAuthor($authorName)
	{
		$item = (object)[];
		
		try{
			$statement = $this->pdo->query('SELECT author_id, name '
					. 'FROM authors '
					. 'WHERE name = ' . "'" . $authorName . "'"
					. 'LIMIT 1'
			);
			
		}catch(\PDOException $e){
			throw new Exception("ERROR:". $e->getMessage());
		}
		
        if($statement->rowCount() <= 0)
		{
          return false;
        }
		
        $item = $statement->fetch(\PDO::FETCH_OBJ);
		
        return $item;
    }
	
    public function getItemByBook($bookTitle)
	{				
		$item = (object)[];
		
		try{
			$query = 'SELECT book_id, title '
					. 'FROM books '
					. 'WHERE title = :title';
			
			$statement = $this->pdo->prepare($query);
			$statement->bindParam(':title', $bookTitle);
			$statement->execute();
			
		}catch(\PDOException $e){
			throw new Exception("ERROR:". $e->getMessage());
		}
		
        if($statement->rowCount() <= 0)
		{
          return false;
        }
		
        $item = $statement->fetch(\PDO::FETCH_OBJ);
		
        return $item;
    }
	
	/*
    public function getItemByFile($filePath, $fileName, $bookId, $authorId, $rowInFile)
	{	
		$item = (object)[];
		
		try{
			$statement = $this->pdo->query('SELECT file_path, file_name, book_id, author_id, row_in_file '
					. 'FROM files '
					. 'WHERE file_path = ' . "'" . $filePath . "'" . ' AND file_name = ' . "'" . $fileName . "'" . ' AND book_id = ' . "'" . $bookId . "'" . ' AND author_id = ' . "'" . $authorId . "'" . ' AND row_in_file = ' . "'" . $rowInFile . "'"
					. 'LIMIT 1'
			);
			
		}catch(\PDOException $e){
			throw new Exception("ERROR:". $e->getMessage());
		}
		
        if($statement->rowCount() <= 0)
		{
          return false;
        }
		
        $item = $statement->fetch(\PDO::FETCH_OBJ);
		
        return $item;
    }
	*/
	
	/*
    public function getItemFilesDataByAuthorId($authorId)
	{
		$result = '';
        $statement = $this->pdo->query('SELECT * '
                . 'FROM files '
				. 'WHERE author_id = ' . "'" . $authorId . "'"
		);
		
        $result = $statement->fetchAll(\PDO::FETCH_OBJ);
		
        return $result;
    }
	*/
	
	/*
    public function getItemFilesDataByBookId($bookId)
	{
		$item = (object)[];
		
		try{
			$statement = $this->pdo->query('SELECT * '
					. 'FROM files '
					. 'WHERE book_id = ' . "'" . $bookId . "'"
			);
			
		}catch(\PDOException $e){
			throw new Exception("ERROR:". $e->getMessage());
		}
		
        if($statement->rowCount() <= 0)
		{
          return false;
        }
		
        $item = $statement->fetchAll(\PDO::FETCH_OBJ);
		
        return $item;
    }
	*/
}