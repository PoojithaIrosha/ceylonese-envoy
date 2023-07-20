import {initializeApp} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-app.js";
import {getAnalytics} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-analytics.js";
import {getAuth, signInWithCustomToken} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-auth.js";
import {
    getDatabase,
    ref,
    get,
    child
} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-database.js";
import {getFirebaseConfig} from "./firebase-config.js";

const firebaseConfig = getFirebaseConfig();

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);

document.body.onload = function () {
    document.getElementById("loading-container").style.display = "block";

    const url = new URL(window.location.href);
    const searchParams = new URLSearchParams(url.search);
    const reqId = searchParams.get('req');

    signInWithCustomToken(auth, localStorage.getItem("authToken")).then((userCredential) => {
        const database = getDatabase(app);
        var dbRef = ref(database);
        get(child(dbRef, `requests/${reqId}`)).then((snapshot) => {
            if (snapshot.exists()) {

                $("#reqId").html(reqId);
                $("#requestedAt").html(snapshot.val().requestedAt);
                $("#customerName").html(snapshot.val().firstName + " " + snapshot.val().lastName + " (" + snapshot.val().email + ")");
                $("#customerAddress").html(snapshot.val().address + " " + snapshot.val().city + " " + snapshot.val().province + " " + snapshot.val().postalCode);
                $("#customerMobile").html(snapshot.val().mobile);
                $("#moreInfo").html(snapshot.val().moreInfo);

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
            } else {
                console.log("No data available");
            }
        }).catch((error) => {
            document.getElementById("loading-container").style.display = "none";
        });
    }).catch((error) => {
        document.getElementById("loading-container").style.display = "none";
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Something went wrong!',
        });
    });

}
