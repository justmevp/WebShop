document.addEventListener('DOMContentLoaded', function() {
    // Lắng nghe sự kiện click trên nút "Kích thước màn hình"
    var filterButton = document.querySelector('.btn-filter-parent');
    filterButton.addEventListener('click', function() {
        // Lấy phần tử chứa danh sách lọc
        var filterList = document.querySelector('.list-filter-child');

        // Toggle hiển thị/ẩn danh sách lọc
        if (filterList.style.display === 'block') {
            filterList.style.display = 'none';
        } else {
            // Ẩn tất cả các mục con trước khi hiển thị mục "Trên 6 inch"
            var filterItems = filterList.querySelectorAll('.btn-filter-item');
            filterItems.forEach(function(item) {
                item.style.display = 'none';
            });

            // Hiển thị mục "Trên 6 inch"
            var above6InchItem = filterList.querySelector('.btn-filter-item.button__filter-children');
            above6InchItem.parentElement.style.display = 'block'; // Đổi display của cha của nút "Trên 6 inch"

            // Hiển thị danh sách lọc
            filterList.style.display = 'block';
        }
    });

    // Lắng nghe sự kiện click trên nút "đóng"
    var closeButton = document.querySelector('.button__filter-children-close');
    closeButton.addEventListener('click', function() {
        // Lấy phần tử chứa danh sách lọc và ẩn đi
        var filterList = document.querySelector('.list-filter-child');
        filterList.style.display = 'none';
    });

    // Lắng nghe sự kiện click trên nút "xem kết quả"
    var submitButton = document.querySelector('.button__filter-children-submit');
    submitButton.addEventListener('click', function() {
        // Thực hiện các hành động khi người dùng bấm vào "xem kết quả"
        // Ví dụ: Gửi yêu cầu lọc đến máy chủ và cập nhật danh sách sản phẩm
        // ở đây bạn có thể thêm các hành động khác tương ứng với ứng dụng của bạn
    });
});
