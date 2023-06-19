import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static target = ["menu"];

  connect() {
    // this.element.textContent = "Hello World!";
    this.menuElement = this.findMenuElement();
    this.hideMenu();
  }
  findMenuElement() {
    // Implement your logic to find the menu element, e.g., by ID or class name
    return document.getElementById("menu");
  }

  showMenu() {
    this.menuElement.classList.add("show");
  }

  hideMenu() {
    this.menuElement.classList.remove("show");
  }
}
