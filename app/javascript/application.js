// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "active_storage_drag_and_drop"
//= require active_storage_drag_and_drop
require("@rails/activestorage").start()