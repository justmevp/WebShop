// script.js

// Định nghĩa hàm để xử lý sự kiện khi nút x được nhấn
function handleCloseButtonClick() {
    // Thực hiện hành động khi nút x được nhấn
    // Ví dụ: đóng một phần tử, ẩn một phần tử, hoặc thực hiện các hành động khác
    console.log("Nút x đã được nhấn!");
}

// Gán sự kiện click cho nút x khi trang web được tải xong
document.addEventListener("DOMContentLoaded", function() {
    var closeButton = document.querySelector(".fa.fa-times");
    closeButton.addEventListener("click", handleCloseButtonClick);
});
