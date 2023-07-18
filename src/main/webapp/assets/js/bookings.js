import {initializeApp} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-app.js";
import {getAnalytics} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-analytics.js";
import { getAuth, signInWithCustomToken } from "https://www.gstatic.com/firebasejs/9.22.0/firebase-auth.js";
import {
    getDatabase,
    ref,
    query,
    orderByChild,
    onValue
} from "https://www.gstatic.com/firebasejs/9.22.0/firebase-database.js";


const firebaseConfig = {
    apiKey: "AIzaSyBw3WcbcyFPMeZUO_npPMURfmE5SigdN7Y",
    authDomain: "ceylonese-envoy-d6431.firebaseapp.com",
    databaseURL: "https://ceylonese-envoy-d6431-default-rtdb.firebaseio.com",
    projectId: "ceylonese-envoy-d6431",
    storageBucket: "ceylonese-envoy-d6431.appspot.com",
    messagingSenderId: "964745241208",
    appId: "1:964745241208:web:73d7d7cf041d60f247438d",
    measurementId: "G-8RHTQHE5PF"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
const auth = getAuth(app);
const database = getDatabase(app);

signInWithCustomToken(auth, localStorage.getItem("authToken")).then((userCredential) => {
    var dbRef = query(ref(database, "requests"), orderByChild("requestedAt"));

    let itemsPerPage = 5;
    let currentPage = 1;
    let dataList = [];

    document.getElementById("loading-container").style.display = "block";
    onValue(dbRef, (snapshot) => {
        dataList = [];
        snapshot.forEach((childSnapshot) => {
            var childData = childSnapshot.val();
            childData.id = childSnapshot.key;
            dataList.push(childData);
        })

        renderTable(dataList);
        document.getElementById("loading-container").style.display = "none";
    });

    $("#nextButton").click(() => {
        var totalPages = Math.ceil(dataList.length / itemsPerPage);

        if (currentPage < totalPages) {
            currentPage++;
            renderTable(dataList);
        }
    })

    $("#previousButton").click(() => {
        if(currentPage > 1) {
            currentPage--;
            renderTable(dataList);
        }
    });


    function renderTable(dataList) {
        let reversedDataList = dataList.slice().reverse();

        var tbody = $("#dataList");
        tbody.empty();

        var startIndex = (currentPage - 1) * itemsPerPage;
        var endIndex = startIndex + itemsPerPage;

        let finalDataList = reversedDataList.slice(startIndex,endIndex);
        finalDataList.forEach((data) => {
            const row = `<tr>
                <td>${data.id}</td>
                <td>${data.tourName}</td>
                <td>${data.firstName} ${data.lastName}</td>
                <td>${data.email}</td>
                <td>${data.mobile}</td>
                <td>${data.total}</td>
                <td>${data.requestedAt}</td>
                 <td><a href="booking-view.jsp?req=${data.id}" class="btn btn-sm btn-dark">VIEW</a></td>
            </tr>`;
            tbody.append(row);
        });
    }
}).catch((error) => {
    console.log(error);
});

