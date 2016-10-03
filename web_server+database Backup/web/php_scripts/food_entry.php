<?php

include 'connect.php';

///////////////////////////////////////////////////////////////// Food Entry ////////////////////////////////////////////////////////////////////////

// food information
$f_name 	= $_POST['f_name'];
$f_id 		= $_POST['f_id'];
$f_weight 	= $_POST['f_weight'];
$f_desc 	= $_POST['f_description'];
$f_image	= $_POST['f_image'];




// insert the above data to food table
	
	$sql = "INSERT INTO food (Foodid,FoodName,FoodImage,Weight,Description,current_weight) VALUES ('$f_id', '$f_name','$f_image','$f_weight', '$f_desc',0)"; 

	if (!mysql_query($sql)) {
		die ('Error: '. mysql_error());
	}
	else {


		// upload the food image to the food_image folder
		$target_dir = "/Users/hasibullahsahibzada/Documents/MastersDocs/3rd_ThirdSemester/MusicInteraction/Project/Software/Processing/main/data/images/food/";
		$target_file1 = $target_dir . basename($_FILES["f_image"]["name"]);
		$imageFileType = pathinfo($target_file1,PATHINFO_EXTENSION);


		// rename the file 
		$target_file = $target_dir . basename($f_name.".".$imageFileType);
		$uploadOk = 1;



		// Check if image file is a actual image or fake image
		$check = getimagesize($_FILES["f_image"]["tmp_name"]);
    	if($check !== false) {
        	echo "File is an image - " . $check["mime"] . ".";
        	$uploadOk = 1;
    	} 
    	else {
        	echo "File is not an image.";
        	$uploadOk = 0;
    	}


		// Check if $uploadOk is set to 0 by an error

		if ($uploadOk == 0) {
    		echo "Sorry, your file was not uploaded.";
			// if everything is ok, try to upload file
		} 
		else {
    	
    		if (move_uploaded_file($_FILES['f_image']['tmp_name'], $target_file)) {
        		echo "The file ". basename( $_FILES['f_image']['name']). " has been uploaded.";

			// upload the link to database
		
        		$sql = "UPDATE food SET FoodImage ='$target_file' WHERE FoodId = '$f_id'"; 
				if (!mysql_query($sql)) {
					die ('Error: '. mysql_error());
				}
    		}
    		else {
        		echo "Sorry, there was an error uploading your file.";
				print_r($_FILES);

			    }
			}


		///////////////////////////////////////////// Nutrition Entry ////////////////////////////////////////////////////////////////////////


		// nutrition information
		$f_id 		= $_POST['f_id'];
		$n_cal 		= $_POST['n_cal'];		// Calory



		// Calory
		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','1','$n_cal')"; 

		if (!mysql_query($sql)) {
		die ('Error: '. mysql_error());
		}

		// Fat

		$n_fat 		= $_POST['n_fat'];

		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','2','$n_fat')"; 

		if (!mysql_query($sql)) {
			die ('Error: '. mysql_error());
		}



		// cholestrol

		$n_chol 	= $_POST['n_chol'];		// Cholestrol

		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','3','$n_chol' )"; 

		if (!mysql_query($sql)) {
		die ('Error: '. mysql_error());
		}


		// Sodium

		$n_sod 		= $_POST['n_sod'];

		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','4','$n_sod')"; 

		if (!mysql_query($sql)) {
			die ('Error: '. mysql_error());
		}


		// Potasuim
		$n_pot 		= $_POST['n_pot'];

		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','5','$n_pot')"; 

		if (!mysql_query($sql)) {
			die ('Error: '. mysql_error());
		}


		// Carbohydrate
		$n_carbo 	= $_POST['n_carbo'];


		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','6','$n_carbo')"; 

		if (!mysql_query($sql)) {
			die ('Error: '. mysql_error());
		}


		// Protien
		$n_pro 		= $_POST['n_pro'];

		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','6','$n_pro')"; 

		if (!mysql_query($sql)) {
			die ('Error: '. mysql_error());
		}


		// Calcium
		$n_calc 	= $_POST['n_calc'];

		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','8','$n_calc')"; 

		if (!mysql_query($sql)) {
			die ('Error: '. mysql_error());
		}

		// Energy
		$n_ener 	= $_POST['n_ener'];


		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','9','$n_ener')"; 

		if (!mysql_query($sql)) {
			die ('Error: '. mysql_error());
		}

		// Iron
		$n_iron 	= $_POST['n_iron'];
		$sql = "INSERT INTO nutritionamount (NamountId,FoodId,NutritionId,Namount) VALUES (null,'$f_id','10','$n_iron')"; 

		if (!mysql_query($sql)) {
			die ('Error: '. mysql_error());
		}

	// close connection
	mysql_close();
	}



?> 