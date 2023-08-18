// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "channels"


document.addEventListener("DOMContentLoaded", function() {
    var chatContent = document.getElementById("this");
    chatContent.scrollTop = chatContent.scrollHeight;
  });