import {initializeApp} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-app.js";
import {getAnalytics} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-analytics.js";
import {getDatabase, ref, set} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-database.js";
import {getAuth, signInWithCustomToken} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-auth.js";

const firebaseConfig = {
    apiKey: "AIzaSyDUVHsSnSqNhBIVDKyb_5jSDVCMtO-jmu8",
    authDomain: "test-project-a74b6.firebaseapp.com",
    databaseURL: "https://test-project-a74b6-default-rtdb.firebaseio.com",
    projectId: "test-project-a74b6",
    storageBucket: "test-project-a74b6.appspot.com",
    messagingSenderId: "479402090311",
    appId: "1:479402090311:web:c0784b7986a04aa3c5b662",
    measurementId: "G-QDF1H2BYWK"
};

// Initialize Firebase

const app = initializeApp(firebaseConfig);
const auth = getAuth();
const analytics = getAnalytics(app);


$("#adminLoginForm").submit((event) => {
    event.preventDefault();
    document.getElementById("loading-container").style.display = "block";

    $.ajax({
        type: "POST",
        url: "login",
        async: true,
        data: $("#adminLoginForm").serialize(),
        success: (response) => {

            let json = JSON.parse(response);

            if (json.status) {
                localStorage.setItem("authToken", json.message);
                $("#adminLoginError").html("");

                signInWithCustomToken(auth, json.message).then((userCredential) => {
                    document.getElementById("loading-container").style.display = "none";
                    window.location = "../../admin";
                }).catch((error) => {
                    const errorCode = error.code;
                    const errorMessage = error.message;
                    console.log(errorCode);
                    console.log(errorMessage);
                });
            } else {
                document.getElementById("loading-container").style.display = "none";
                $("#adminLoginError").html(json.message);
            }
        },
        error: (error) => {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong!',
            });
        }
    })
});

function isDateInPast(dateString) {
    // Convert the string to a Date object
    var date = new Date(dateString);

    // Get the current date
    var currentDate = new Date();

    // Compare the converted date with the current date
    if (date.getTime() < currentDate.getTime()) {
        return true; // The date is in the past
    } else {
        return false; // The date is not in the past
    }
}

function getCurrentDateTime(currentDate) {
    var year = currentDate.getFullYear();
    var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // Months are zero-based
    var day = String(currentDate.getDate()).padStart(2, '0');
    var hours = String(currentDate.getHours()).padStart(2, '0');
    var minutes = String(currentDate.getMinutes()).padStart(2, '0');
    var seconds = String(currentDate.getSeconds()).padStart(2, '0');

    return year + '-' + month + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
}


$("#checkoutForm").submit((event) => {
    event.preventDefault();

    $("#checkoutSubmitBtn").attr("disabled", true).html("Please wait...");

    const date = new Date();
    const currentDateTime = getCurrentDateTime(date);

    const data = {
        firstName: $("#fName").val(),
        lastName: $("#lName").val(),
        email: $("#email").val(),
        mobile: $("#mobile").val(),
        address: $("#address").val(),
        city: $("#city").val(),
        province: $("#province").val(),
        postalCode: $("#postalCode").val(),
        country: $("#country").val(),
        tourId: $("#tourId").val(),
        tourName: $("#tourName").val(),
        total: $("#total").val(),
        checkIn: $("#checkIn").val(),
        checkOut: $("#checkOut").val(),
        members: $("#members").val(),
        moreInfo: $("#moreInfo").val(),
        requestedAt: currentDateTime
    }

    let errorMsg = "";

    if(data.firstName === "") {
        errorMsg = "First name is required.";
    }else if(data.lastName === "") {
        errorMsg = "Last name is required.";
    }else if(data.email === "") {
        errorMsg = "Email is required.";
    }else if(data.mobile === "") {
        errorMsg = "Mobile number is required.";
    }else if(data.address === "") {
        errorMsg = "Address is required.";
    }else if(data.city === "") {
        errorMsg = "City is required.";
    }else if(data.province === "") {
        errorMsg = "Province is required.";
    }else if(data.postalCode === "") {
        errorMsg = "Postal code is required.";
    }else if(data.country === "") {
        errorMsg = "Country is required.";
    }else if(data.checkIn === "") {
        errorMsg = "Check-in date is required.";
    }else if(isDateInPast(data.checkIn)){
        errorMsg = "Check-in date cannot be in the past.";
    }else if(data.checkOut === "") {
        errorMsg = "Check-out date is required.";
    }else if(isDateInPast(data.checkOut)){
        errorMsg = "Check-out date cannot be in the past.";
    }else if(data.members === "") {
        errorMsg = "Number of members is required.";
    }

    if(errorMsg !== "") {
        Swal.fire({
            icon: 'error',
            title: 'Request Failed',
            text: errorMsg,
            confirmButtonText: 'OK'
        }).then((result) => {
            if (result.isConfirmed) {
                $("#checkoutSubmitBtn").attr("disabled", false).html("Submit");
            }
        });
        return;
    }

    $.ajax({
        type: "GET",
        url: "generate-custom-token",
        async: true,
        success: (response) => {
            signInWithCustomToken(auth, response).then((userCredential) => {
                const db = getDatabase();
                set(ref(db, 'requests/' + date.getTime()), data).then(() => {

                    let form = new FormData();
                    form.append("name", data.firstName + " " + data.lastName);
                    form.append("email", data.email);

                    $.ajax({
                        url: "request-completed-email",
                        type: "POST",
                        data: "name=" + data.firstName + " " + data.lastName + "&email=" + data.email,
                        async: true,
                        success: function (response) {
                            let json = JSON.parse(response);
                            if (json.status) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Request Submitted',
                                    text: 'Your request has been submitted successfully. We will contact you soon.',
                                    confirmButtonText: 'OK'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location = "index.jsp";
                                    }
                                });
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Request Failed',
                                    text: 'Something went wrong. Please try again later.',
                                    confirmButtonText: 'OK'
                                }).then((result) => {
                                    if (result.isConfirmed) {
                                        window.location = "index.jsp";
                                    }
                                });
                            }
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    })
                });
            });
        }
    })



});