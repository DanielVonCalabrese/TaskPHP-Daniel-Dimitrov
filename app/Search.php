<?php

namespace TestTaskTransfermate;

class Search
{
	public $searchTerm;
	
	public function __construct($pdo)
	{
        $this->pdo = $pdo;
		if(isset($_POST['searchTerm']) === true)
		{
			$this->searchTerm = $_POST['searchTerm'];
		}
		else
		{
			$this->searchTerm = '';
		}
	}
	
	public function search()
	{
		$result = (object)[];
		$searchTerm = '%' . $this->searchTerm . '%';
		
		try{
			$query = "SELECT a.author_id, a.name AS author_name, b.book_id, b.title "
					. "FROM authors AS a "
					. "LEFT JOIN books AS b ON a.author_id = b.author_id "
					. "WHERE LOWER(name) LIKE LOWER(:name)";
			
			$statement = $this->pdo->prepare($query);
			$statement->bindParam(':name', $searchTerm);
			$statement->execute();
		}catch(\PDOException $e){
			throw new Exception("ERROR:". $e->getMessage());
		}
		
        if($statement->rowCount() <= 0)
		{
          return false;
        }
		
        $result = $statement->fetchAll(\PDO::FETCH_OBJ);
		
        return $result;
	}
}