$('#loginForm').submit((event) => {
    event.preventDefault();

    $.ajax({
        type: "post",
        url: "customer-login",
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
                    if(result.isConfirmed) {
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
            if(json.status) {
                $("#resetPwdBtn").html("RESET PASSWORD").attr("disabled", false);
                Swal.fire({
                    title: "Success",
                    text: "Password changed successfully",
                    icon: "success",
                    // ok button
                    confirmButtonText: "Back to Login",
                }).then((result) => {
                    if(result.isConfirmed) {
                        window.location.href = json.message;
                    }
                });
            }else {
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
            if(json.status) {
                $("#registerForm").trigger("reset");
                Swal.fire({
                    title: "Success",
                    text: "Registration successful",
                    icon: "success",
                    // ok button
                    confirmButtonText: "Go to Dashboard",
                }).then((result) => {
                    if(result.isConfirmed) {
                        window.location.href = json.message;
                    }
                });
            }else {
                $("#registerError").html(json.message);
            }
        }
    });
});