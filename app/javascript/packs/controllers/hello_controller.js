import { Controller } from "stimulus"

export default class extends Controller {
  greet(e) {
    console.log("Hello, Stimulus!", this.element)
  }
}
