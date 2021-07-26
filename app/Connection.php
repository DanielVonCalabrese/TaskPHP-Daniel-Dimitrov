<?php

namespace TestTaskTransfermate;

class Connection
{
    private static $connection;

    protected function __construct()
	{
        
    }
	
    public function connect()
	{
        $params = parse_ini_file('database.ini');
        if($params === false)
		{
            throw new \Exception("Error reading database configuration file");
        }
		
        $connectionString = sprintf("pgsql:host=%s;port=%d;dbname=%s;user=%s;password=%s", 
                $params['host'], 
                $params['port'], 
                $params['database'], 
                $params['user'], 
                $params['password']
		);

        $pdo = new \PDO($connectionString);
        $pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

        return $pdo;
    }
	
    public static function get()
	{
        if(static::$connection === null)
		{
            static::$connection = new static();
        }

        return static::$connection;
    }
}