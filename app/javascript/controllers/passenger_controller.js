import { Controller } from "@hotwired/stimulus"

function elementFromHTML(html) {
    const template = document.createElement("template");
    template.innerHTML = html.trim();

    return template
}

export default class extends Controller {
    static targets = [ "formContainer" ]

    add() {
        const element = elementFromHTML(`
            <div class="passenger-details">
            </div>
        `)

        const clone = element.content.cloneNode(true)

        this.formContainerTarget.appendChild(clone)
    }
}
