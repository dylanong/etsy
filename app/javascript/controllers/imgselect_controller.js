import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="imgselect"
export default class extends Controller {
  static targets = ["thumbnail"]

  connect(event) {

    console.log(hello);

  }
}
