// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"
import jQuery from "jquery"
import "flowbite"

window.$ = window.jQuery = jQuery;
import "./channels"
