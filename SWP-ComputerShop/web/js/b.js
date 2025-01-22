/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var images = document.querySelectorAll('.slider-image');
var currentImageIndex = 0;

function changeImage() {
  var previousImageIndex = currentImageIndex;
  currentImageIndex = (currentImageIndex + 1) % images.length;
  
  images[previousImageIndex].classList.remove('active');
  images[currentImageIndex].classList.add('active');
}

setInterval(changeImage, 3000);

