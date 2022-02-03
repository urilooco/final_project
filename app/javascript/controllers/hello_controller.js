import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static target = [ "ouput" ]

  connect() {
    this.element.textContent = "Hello World!"
    console.log("asdasd")
  }
}
