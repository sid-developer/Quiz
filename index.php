<?php
require_once 'config/dbcon.php';
 ?>

 <!doctype html>
 <html lang="en">


<head>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">

    <center><h2>Welcome to Php Quiz </h2></center>
    <hr>
  </head>

    <body>

      <div class="container-fluid">
        <form id="frmqna" method="POST">
      <!-- Fetch questions from DB -->
      <?php
        $sql = $database->query("Select * from quiz_qna where qna_status = '1' ORDER BY RAND() ");

        $count1 = 1;
        $count2 = 0;
        $total_q = 5;
        $disp_page_q = 1;
        $pages = $total_q / $disp_page_q;

        foreach($sql as $data){

          $count1 = $count1 + 1;
          $count2 = $count2 + 1;
          $bck = $count2 - 1;

          if($count2 == 1){
            $cls = 'hide1';
            $bck_btn = '';
          }
          else{
            $cls = 'hide';
            $bck_btn = '<button class="nxtbck btn btn-primary" id="'.$bck.'" data-id="first" type="button">Previous</button>';
          }

          if($total_q == $count2){
            $nxt_btn = '<button class="btn btn-success nxtbck" type="submit" id="'.$count1.'" data-id="second" type="button">Finish</button>';
          }else{
            $nxt_btn = '<button class="nxtbck btn btn-primary" id="'.$count1.'" data-id="second" type="button">Next</button>';
          }

          $qnaID = $data['qna_id'];
          $qna_question = $data['qna_question'];
          $qna_options = $data['qna_options'];

          $ans_ex = $database->query("Select * from quiz_ans where ans_ques_id = '$qnaID' AND ans_status = '1' ");
          $answers = '';
          foreach($ans_ex as $ans){

              $ans_id = $ans['ans_id'];
              $ans_text = $ans['ans_text'];
              $ans_ques_id = $ans['ans_ques_id'];

              $answers .= '<p>'.$ans_text.'<input type="radio" name="ques_'.$ans_ques_id.'" value="'.$ans_id.'"><br>';
          }

          echo $div ='<div class="'.$cls.' fit" id="display'.$count2.'">

          <label>'.$qna_question.'</label>
                '.$answers.'

                <br>
                '.$bck_btn.'
                '.$nxt_btn.'
            </div>';
        }
      ?>
    </form>

          <div style="display:none;" id="passDiv"> <p class="alert alert-success" role="alert" id="pass"> </p>
            <center><button type="button" class="btn btn-success" onClick="window.location.reload();">Start again</button></center>
           </div>

          <div style="display:none;" id="failDiv"> <p class="alert alert-danger" role="alert" id="fail"> </p>
            <center><button type="button" class="btn btn-success" onClick="window.location.reload();">Start again</button></center>
          </div>

    </div>

<script src="js/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script>

    </body>

</html>


<script>

$('.nxtbck').click(function(){

  var div = $(this).attr('id');

  if(div == '6'){

  }else{
    $('.fit').removeClass('hide1');
    $('.fit').addClass('hide');
  }

  $('#display'+div).addClass('hide1');

});


$('#frmqna').submit(function(e){
  e.preventDefault();

  $.ajax({
    method : "POST",
    url : "validate-ans.php",
    data : $('#frmqna').serialize(),
    success:function(str){
      if(str > 0){
        var msg = "Congratulation's you have scored "+str+" out of 5";
        $('#pass').html(msg);
        $('.fit').removeClass('hide1');
        $('#passDiv').show();
      }
      else{
        var msg = "Sorry you have scored "+str+" out of 5";
        $('#fail').html(msg);
        $('.fit').removeClass('hide1');
        $('#failDiv').show();
      }
    }
  });
});


</script>
