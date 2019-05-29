<?php

require 'Medoo.php';

// Using Medoo namespace
use Medoo\Medoo;

// Initialize
$database = new Medoo([
    'database_type' => 'mysql',
    'database_name' => 'quiz',
    'server' => 'localhost',
    'username' => 'root',
    'password' => 'root'
]);

 ?>
