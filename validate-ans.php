<?php

include_once 'config/dbcon.php';

if($_SERVER['REQUEST_METHOD'] == "POST"){

  $result = 0;
  $totalQuestions = $database->count("quiz_qna","qna_id", ["qna_status" => '1']);

  for($i=1; $i<=$totalQuestions; $i++){

    $fetchAns = $database->get("quiz_qna", "qna_ans", ["qna_id" => $i] );

    $getAns = $_POST['ques_'.$i];

    if($fetchAns == $getAns){
      $result = $result + 1;
    }

  }

  echo $result;

}





 ?>
