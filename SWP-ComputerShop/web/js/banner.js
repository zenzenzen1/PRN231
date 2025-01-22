var sliderImages = document.getElementsByClassName("slider-image");
var currentImageIndex = 0;

function showNextImage() {
    setTimeout(function() {
        sliderImages[currentImageIndex].classList.remove("active");
        currentImageIndex = (currentImageIndex + 1) % sliderImages.length;       
        sliderImages[currentImageIndex].classList.add("active");
    }, 50);
}

// Hiển thị ảnh đầu tiên
sliderImages[currentImageIndex].classList.add("active");

// Chuyển đổi ảnh sau mỗi 2 giây
setInterval(showNextImage, 5000);

