<?php

header("Content-Type: application/json; charset=UTF-8");

header(
    "Access-Control-Allow-Origin: *"
);

header(
    "Access-Control-Allow-Methods: POST, OPTIONS"
);

header(
    "Access-Control-Allow-Headers: Content-Type"
);


if ($_SERVER["REQUEST_METHOD"] === "OPTIONS") {

    http_response_code(200);

    exit;

}


if ($_SERVER["REQUEST_METHOD"] !== "POST") {

    http_response_code(405);

    echo json_encode([
        "success" => false,
        "message" => "Invalid request method."
    ]);

    exit;

}


require_once "../includes/config.php";


/*
|--------------------------------------------------------------------------
| GET FORM DATA
|--------------------------------------------------------------------------
*/

$name = trim(
    $_POST["name"] ?? ""
);

$email = trim(
    $_POST["email"] ?? ""
);

$phone = trim(
    $_POST["phone"] ?? ""
);

$company = trim(
    $_POST["company"] ?? ""
);

$service = trim(
    $_POST["service"] ?? ""
);

$budget = trim(
    $_POST["budget"] ?? ""
);

$message = trim(
    $_POST["message"] ?? ""
);


/*
|--------------------------------------------------------------------------
| VALIDATION
|--------------------------------------------------------------------------
*/

if ($name === "") {

    echo json_encode([
        "success" => false,
        "message" => "Please enter your name."
    ]);

    exit;

}


if ($email === "" || !filter_var($email, FILTER_VALIDATE_EMAIL)) {

    echo json_encode([
        "success" => false,
        "message" => "Please enter a valid email address."
    ]);

    exit;

}


if ($message === "") {

    echo json_encode([
        "success" => false,
        "message" => "Please enter your project details."
    ]);

    exit;

}


/*
|--------------------------------------------------------------------------
| INSERT MESSAGE
|--------------------------------------------------------------------------
*/

$sql = "
    INSERT INTO contact_messages
    (
        name,
        email,
        phone,
        company,
        service,
        budget,
        message
    )
    VALUES (?, ?, ?, ?, ?, ?, ?)
";


$stmt = $conn->prepare($sql);


if (!$stmt) {

    http_response_code(500);

    echo json_encode([
        "success" => false,
        "message" => "Unable to process your inquiry."
    ]);

    exit;

}


$stmt->bind_param(
    "sssssss",
    $name,
    $email,
    $phone,
    $company,
    $service,
    $budget,
    $message
);


if ($stmt->execute()) {

    echo json_encode([
        "success" => true,
        "message" =>
            "Thank you. Your inquiry has been received."
    ]);

} else {

    http_response_code(500);

    echo json_encode([
        "success" => false,
        "message" =>
            "Unable to save your inquiry."
    ]);

}


$stmt->close();

$conn->close();

?>
