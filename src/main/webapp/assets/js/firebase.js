import {initializeApp} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-app.js";
import {getAnalytics} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-analytics.js";
import {getDatabase, set, ref} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-database.js";

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
const analytics = getAnalytics(app);
const db = getDatabase(app);

$("#checkoutForm").submit((event) => {
    event.preventDefault();

    $("#checkoutSubmitBtn").attr("disabled", true).html("Please wait...");

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
        requestedAt: new Date().toLocaleString()
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
    }else if(data.checkOut === "") {
        errorMsg = "Check-out date is required.";
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

    set(ref(db, 'requests/' + Date.now()), data).then(() => {

        let form = new FormData();
        form.append("name", data.firstName + " " + data.lastName);
        form.append("email", data.email);

        $.ajax({
            url: "request-completed-email",
            type: "POST",
            data: "name=" + data.firstName + " " + data.lastName + "&email=" + data.email,
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