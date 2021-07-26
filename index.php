<?php

require_once "app/Connection.php";
require_once "app/AuthorsBooks.php";
require_once "app/Search.php";
require_once "app/MyXMLReader.php";

use TestTaskTransfermate\Connection as Connection;
use TestTaskTransfermate\AuthorsBooks as AuthorsBooks;
use TestTaskTransfermate\Search as Search;
use TestTaskTransfermate\MyXMLReader as MyXMLReader;
 
// libxml_use_internal_errors(true);

try{    
	// connect to the PostgreSQL database
    $pdo = Connection::get()->connect();
	
	$authorsBooksObject = new AuthorsBooks($pdo);
	
}catch(\PDOException $e){
    echo $e->getMessage();
}

$rootDirectory = new RecursiveDirectoryIterator(__DIR__ . '\xml_root_dir\\');
$subDirectories = new RecursiveIteratorIterator($rootDirectory);
		
$myXmlReader = new MyXMLReader($pdo, $subDirectories);
$myXmlReader->traverseDirectories();

$tableTitle = 'Item List';
if(isset($_POST['submit']) === true && isset($_POST['searchTerm']) === true && $_POST['searchTerm'] !== '')
{
	$searcher = new Search($pdo);
	$searchTerm = $_POST['searchTerm'];
	$tableTitle = 'Search results for <strong>' . $searchTerm . '</strong>';
	$data = $searcher->search();
}
else
{
	$searchTerm = '';
	$data = $authorsBooksObject->getAll();
}

?>

<!DOCTYPE html>
<html>
    <head>
        <title>Task PHP TransferMate</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		<style>
			td.not-found
			{
				color: grey;
			}
		</style>
		<meta charset="utf-8" /> 
    </head>
    <body>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<a class="navbar-brand" href="#">Task PHP TransferMate</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarCollapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href=">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Search</a>
					</li>
				</ul>
				<form class="form-inline mt-2 mt-md-0" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" name="search" id="searchForm">
					<input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search" name="searchTerm" value="<?php echo $searchTerm ?>">
					<input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="submit" value="Search">
				</form>
			</div>
		</nav>
        <div class="container mt-5">
            <h1><?php echo $tableTitle; ?></h1>
            <table class="table table-bordered table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th>Authors</th>
                        <th>Books</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach($data as $row): ?>
                        <tr>
                            <td class="<?php echo (isset($row->author_name) && $row->author_name !== '') ? '' : 'table-secondary not-found'; ?>"><?php echo (isset($row->author_name) && $row->author_name !== '') ? htmlspecialchars($row->author_name) : htmlspecialchars('<none> (no author found)'); ?></td>
                            <td class="<?php echo (isset($row->title) && $row->title !== '') ? '' : 'table-secondary not-found'; ?>"><?php echo (isset($row->title) && $row->title !== '') ? htmlspecialchars($row->title) : htmlspecialchars('<none> (no books found)'); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		<script type="text/javascript">
            $(document).ready(function(){
				
            });
        </script>
    </body>
</html>