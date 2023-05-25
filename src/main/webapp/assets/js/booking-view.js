import {initializeApp} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-app.js";
import {getAnalytics} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-analytics.js";
import {
    getDatabase,
    ref,
    get,
    child
} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-database.js";

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
const database = getDatabase(app);


document.body.onload = function () {
    document.getElementById("loading-container").style.display = "block";

    const url = new URL(window.location.href);
    const searchParams = new URLSearchParams(url.search);

    const reqId = searchParams.get('req');

    var dbRef = ref(database);
    get(child(dbRef, `requests/${reqId}`)).then((snapshot) => {
        if (snapshot.exists()) {

            $("#reqId").html(reqId);
            $("#requestedAt").html(snapshot.val().requestedAt);
            $("#customerName").html(snapshot.val().firstName + " " + snapshot.val().lastName + " (" + snapshot.val().email + ")");
            $("#customerAddress").html(snapshot.val().address + " " + snapshot.val().city + " " + snapshot.val().province + " " + snapshot.val().postalCode);
            $("#customerMobile").html(snapshot.val().mobile);
            $("#moreInfo").html(snapshot.val().moreInfo );

            var $tbody = $("#tbody");
            var row = "<tr>" +
                "<td>" + snapshot.val().tourName + "</td>" +
                "<td>" + snapshot.val().checkIn + "</td>" +
                "<td>" + snapshot.val().checkOut + "</td>" +
                "<td>" + snapshot.val().members + "</td>" +
                "<td>" + snapshot.val().total + "</td>" +
                "</tr>";
            $tbody.append(row);

            document.getElementById("loading-container").style.display = "none";

            console.log(snapshot.val());
        } else {
            console.log("No data available");
        }
    }).catch((error) => {
        document.getElementById("loading-container").style.display = "none";
    });
}