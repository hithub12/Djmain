<?php
define('TITLE', 'Submit Request');
define('PAGE', 'SubmitRequest');
include('includes/header.php'); 
include('../dbConnection.php');
session_start();
if($_SESSION['is_login']){
 $rEmail = $_SESSION['rEmail'];
} else {
 echo "<script> location.href='RequesterLogin.php'; </script>";
}
if(isset($_REQUEST['submitrequest'])){
 // Checking for Empty Fields
 if(
   ($_REQUEST['requestinfo'] == "") || 
   (!isset($_REQUEST['requestQuantity'])) || 
   ($_REQUEST['requestdesc'] == "") || 
   ($_REQUEST['requestername'] == "") || 
   ($_REQUEST['requesteradd1'] == "") || 
   ($_REQUEST['requesteradd2'] == "") || 
   ($_REQUEST['requestercity'] == "") || 
   ($_REQUEST['requesterstate'] == "") || 
   ($_REQUEST['requesterzip'] == "") || 
   ($_REQUEST['requesteremail'] == "") || 
   ($_REQUEST['requestermobile'] == "") || 
   ($_REQUEST['requestdate'] == ""
 )){
  // msg displayed if required field missing
  $msg = '<div class="alert alert-warning col-sm-6 ml-5 mt-2" role="alert"> Fill All Fileds </div>';
 } else {
   // Assigning User Values to Variable
   $rinfo = $_REQUEST['requestinfo'];
   $rquantity = $_REQUEST['requestQuantity'];
   $rdesc = $_REQUEST['requestdesc'];
   $rname = $_REQUEST['requestername'];
   $radd1 = $_REQUEST['requesteradd1'];
   $radd2 = $_REQUEST['requesteradd2'];
   $rcity = $_REQUEST['requestercity'];
   $rstate = $_REQUEST['requesterstate'];
   $rzip = $_REQUEST['requesterzip'];
   $remail = $_REQUEST['requesteremail'];
   $rmobile = $_REQUEST['requestermobile'];
   $rdate = $_REQUEST['requestdate'];
   $rid = $_SESSION["requester"]["r_login_id"];
   $sql = "INSERT INTO submitrequest_tb(request_info, request_quantity, request_desc, requester_name, requester_add1, requester_add2, requester_city, requester_state, requester_zip, requester_email, requester_mobile, request_date, requester_id) VALUES ('$rinfo', '$rquantity', '$rdesc', '$rname', '$radd1', '$radd2', '$rcity', '$rstate', '$rzip', '$remail', '$rmobile', '$rdate', $rid)";
   if($conn->query($sql) == TRUE){
    // below msg display on form submit success
    $genid = mysqli_insert_id($conn);
    $msg = '<div class="alert alert-success col-sm-6 ml-5 mt-2" role="alert"> Request Submitted Successfully Your' . $genid .' </div>';
    session_start();
    $_SESSION['myid'] = $genid;
    echo "<script> location.href='submitrequestsuccess.php'; </script>";
    // include('submitrequestsuccess.php');
   } else {
    // below msg display on form submit failed
    $msg = '<div class="alert alert-danger col-sm-6 ml-5 mt-2" role="alert"> Unable to Submit Your Request </div>';
   }
 }
}
?>
<div class="col-sm-9 col-md-10 mt-5">
  <form class="mx-5" action="" method="POST">
    <div class="form-group">
      <label for="inputRequestInfo">Request Info</label>
      <?php
      if ($query = $conn->query("SELECT * FROM requestinfo_tb")) {
        $requestInfo = $query->fetch_all(MYSQLI_ASSOC);
        ?> 
        <select class="form-control" name="requestinfo" required>
          <option disabled selected>Select Request Info</option>
          <?php 
          foreach ($requestInfo as $key => $value) {
            ?>
          <option value="<?php echo $value["ri_id"]?>"><?php echo $value["ri_details"]?> (₱<?php echo $value["ri_price"]?>)</option>
            <?php
          }
          ?>
        </select>
        <?php
      } else {
        // Fallback requestInfo
        ?>
        <input type="text" class="form-control" id="inputRequestInfo" placeholder="Clean/Repair/Checkup(Maintenance)" name="requestinfo">
        <?php
      }
      ?>
    </div>
    <div class="form-group">
      <label for="inputRequestQuantity">Quantity</label>
      <input type="number" class="form-control" min="1" id="inputRequestQuantity" value="1" name="requestQuantity">
    </div>
    <div class="form-group">
      <label for="inputRequestDescription">Description</label>
      <input type="text" class="form-control" id="inputRequestDescription" placeholder="Write Description" name="requestdesc">
    </div>
    <div class="form-group">
      <label for="inputName">Name</label>
      <input type="text" class="form-control" id="inputName" placeholder="Name" name="requestername">
    </div>
    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="inputAddress">Address Line</label>
        <input type="text" class="form-control" id="inputAddress" placeholder="House No. 123" name="requesteradd1">
      </div>
      <div class="form-group col-md-6">
        <label for="inputAddress2">Type of Residency</label>
        <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment/Condo/Townhouse/Single-detached/Duplex" name="requesteradd2">
      </div>
    </div>
    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="inputCity">City</label>
        <input type="text" class="form-control" id="inputCity" name="requestercity">
      </div>
      <div class="form-group col-md-4">
        <label for="inputState">State</label>
        <input type="text" class="form-control" id="inputState" name="requesterstate">
      </div>
      <div class="form-group col-md-2">
        <label for="inputZip">Zip</label>
        <input type="text" class="form-control" id="inputZip" name="requesterzip" onkeypress="isInputNumber(event)">
      </div>
    </div>

    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="inputEmail">Email</label>
        <input type="email" class="form-control" id="inputEmail" name="requesteremail">
      </div>
      <div class="form-group col-md-2">
        <label for="inputMobile">Mobile</label>
        <input type="text" class="form-control" id="inputMobile" name="requestermobile" onkeypress="isInputNumber(event)">
      </div>
      <div class="form-group col-md-2">
        <label for="inputDate">Date</label>
        <input type="date" class="form-control" id="inputDate" name="requestdate">
      </div>
    </div>

    <button type="submit" class="btn btn-success" name="submitrequest">Submit</button>
    <button type="reset" class="btn btn-secondary">Reset</button>
  </form>
  <!-- below msg display if required fill missing or form submitted success or failed -->
  <?php if(isset($msg)) {echo $msg; } ?>
</div>
</div>
</div>
<!-- Only Number for input fields -->
<script>
  function isInputNumber(evt) {
    var ch = String.fromCharCode(evt.which);
    if (!(/[0-9]/.test(ch))) {
      evt.preventDefault();
    }
  }
</script>
<?php
include('includes/footer.php'); 
$conn->close();
?>