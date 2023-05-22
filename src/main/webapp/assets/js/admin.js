$("#adminLoginForm").submit((event) => {
    event.preventDefault();

    $.ajax({
        type: "POST",
        url: "login",
        async: true,
        data: $("#adminLoginForm").serialize(),
        success: (response) => {
            let json = JSON.parse(response);
            console.log(json);

            if (json.status) {
                window.location.href = json.message;
            } else {
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

})

function selectTourImages() {
    let files = document.getElementById("images").files;
    let container = document.getElementById("tiContainer");

    container.innerHTML = "";
    for (let i = 0; i < files.length; i++) {
        let div = document.createElement("div");
        let img = document.createElement("img");
        img.src = URL.createObjectURL(files[i]);
        img.height = 250;
        img.width = 250;
        div.appendChild(img);
        container.appendChild(div);
    }
}

function changePackageStatus(id) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "change-package-status", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let json = JSON.parse(this.responseText);
            if (json.status) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: json.message,
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: json.message,
                });
            }
        }
    }
    xhr.send("id=" + id);
}

$("#addAdminForm").submit((event) => {
    event.preventDefault();

    $.ajax({
        type: "POST",
        url: "add-admin",
        async: true,
        data: $("#addAdminForm").serialize(),
        success: (response) => {
            let json = JSON.parse(response);

            if (json.status) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: json.message,
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location = "all-admins.jsp";
                    }
                })
            }else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: json.message,
                });
            }
        },
        error: (error) => {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong!',
            });
        }
    });
})

function changeAdminStatus(id) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "change-admin-status", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let json = JSON.parse(this.responseText);
            if (json.status) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: json.message,
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: json.message,
                });
            }
        }
    }
    xhr.send("id=" + id);
}

function deleteAdmin(id) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "delete-admin", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            let json = JSON.parse(this.responseText);
            if (json.status) {
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: json.message,
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.reload();
                    }
                });
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: json.message,
                });
            }
        }
    }
    xhr.send("id=" + id);
}