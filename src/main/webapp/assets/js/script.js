$('#loginForm').submit((event) => {
    event.preventDefault();

    $.ajax({
        type: "post",
        url: "customer-login",
        async: true,
        data: $("#loginForm").serialize(),
        success: (result) => {
            let json = JSON.parse(result);

            if (json.status) {
                window.location.href = json.message;
            } else {
                $("#loginError").html(json.message);
            }
        }
    })
})

$('#fPwdForm').submit((event) => {
    event.preventDefault();

    $("#fPwdSubmitBtn").text("Please wait...").attr("disabled", true);
    $.ajax({
        type: "post",
        url: "forgot-password",
        async: true,
        data: $("#fPwdForm").serialize(),
        success: (result) => {

            let json = JSON.parse(result);
            if (json.status) {
                $("#fPwdError").text("");
                Swal.fire({
                    title: "Success",
                    text: "Reset link sent to your email",
                    icon: "success",
                    // ok button
                    confirmButtonText: "Back to Login"
                }).then((result) => {
                    if (result.isConfirmed) {
                        $("#fPwdSubmitBtn").html("SEND RESET LINK").attr("disabled", false);
                        window.location.href = json.message;
                    }
                });
            } else {
                $("#fPwdSubmitBtn").html("SEND RESET LINK").attr("disabled", false)
                $("#fPwdError").html(json.message);
            }
        }
    });
});

$("#resetPwdForm").submit((event) => {
    event.preventDefault();
    $("#resetPwdBtn").html("Please wait...").attr("disabled", true);
    $.ajax({
        type: "post",
        url: "reset-password",
        data: $("#resetPwdForm").serialize(),
        success: (result) => {
            let json = JSON.parse(result);
            if (json.status) {
                $("#resetPwdBtn").html("RESET PASSWORD").attr("disabled", false);
                Swal.fire({
                    title: "Success",
                    text: "Password changed successfully",
                    icon: "success",
                    // ok button
                    confirmButtonText: "Back to Login",
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = json.message;
                    }
                });
            } else {
                $("#resetPwdBtn").html("RESET PASSWORD").attr("disabled", false);
                Swal.fire({
                    title: "Error",
                    text: json.message,
                    icon: "error",
                });
            }
        }
    })
})

$("#registerForm").submit((event) => {
    event.preventDefault();

    $.ajax({
        type: "post",
        url: "customer-register",
        data: $("#registerForm").serialize(),
        success: (result) => {
            let json = JSON.parse(result);
            console.log(json)
            if (json.status) {
                $("#registerForm").trigger("reset");
                Swal.fire({
                    title: "Success",
                    text: "Registration successful",
                    icon: "success",
                    // ok button
                    confirmButtonText: "Go to Dashboard",
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = json.message;
                    }
                });
            } else {
                $("#registerError").html(json.message);
            }
        }
    });
});


function changeRatingStarOnHover(id) {

    for (let i = 1; i <= 5; i++) {
        if (i <= id) {
            document.getElementById("ratingStar" + i).classList.remove("fa-regular");
            document.getElementById("ratingStar" + i).classList.add("fa-solid");
        } else {
            document.getElementById("ratingStar" + i).classList.remove("fa-solid");
            document.getElementById("ratingStar" + i).classList.add("fa-regular");
        }
    }

}


// function addReview() {
//     console.log("add review called");
//     let formData = new FormData();
//     formData.append("name", document.getElementById("name").value);
//     formData.append("email", document.getElementById("email").value);
//     formData.append("comment", document.getElementById("comment").value);
//     formData.append("packageId", document.getElementById("packageId").value);
//     formData.append("rating", document.querySelectorAll(".fa-solid").length.toString());
//
//     const xhr = new XMLHttpRequest();
//     xhr.open("post", "add-review", true);
//     xhr.setRequestHeader("Content-Type", "multipart/form-data");
//     xhr.send(formData);
//     console.log("form sent");
// }

$("#addReviewForm").submit((event) => {
    event.preventDefault();

    let formData = $("#addReviewForm").serializeArray();
    formData.push({ name: "rating", value: document.querySelectorAll(".fa-solid.fa-star").length });

    $.ajax({
        type: 'post',
        url: 'add-review',
        data: $.param(formData),
        success: (result) => {
            let json = JSON.parse(result);
            if(json.status) {
                $("#addReviewForm").trigger("reset");
                Swal.fire({
                    title: "Success",
                    text: "Review added successfully",
                    icon: "success",
                    // ok button
                    confirmButtonText: "OK",
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.reload();
                    }
                });
            }else {
                Swal.fire({
                    title: "Error",
                    text: json.message,
                    icon: "error",
                });
            }
        }
    })
});

