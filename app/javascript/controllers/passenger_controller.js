import { Controller } from "@hotwired/stimulus"

function addAttributesToForm(template, index) {
    let values = createFormAttributeValues(index)
    setThreeAttributes(template.firstElementChild.firstElementChild, values, "name")
    setThreeAttributes(template.firstElementChild.getElementsByTagName('div')[1], values, "email")
}

function setThreeAttributes(template, values, value) {
    template.firstElementChild.setAttribute("for", values[`${value}_id_for`])
    template.lastElementChild.setAttribute("id", values[`${value}_id_for`])
    template.lastElementChild.setAttribute("name", values[`${value}_input`])
}

function createFormAttributeValues(index) {
    let name_input = `booking[passengers_attributes][${index}][name]`
    let name_id_for = `booking_passengers_attributes_${index}_name`
    let email_input = `booking[passengers_attributes][${index}][email]`
    let email_id_for = `booking_passengers_attributes_${index}_email`

    return {
        name_input: name_input, name_id_for: name_id_for,
        email_input: email_input, email_id_for: email_id_for
    }
}

export default class extends Controller {
    static targets = [ "formContainer", "formTemplate", "details" ]
    static values = { count: String }

    connect() {
        this.element.addEventListener('keypress', (e) => {
            if (e.key == 'Enter') {
                event.preventDefault()
            }
        })
    }

    add() {
        const element = this.formTemplateTarget

        let clone = element.content.cloneNode(true)
        addAttributesToForm(clone, this.countValue)
        this.formContainerTarget.appendChild(clone)
        this.countValue++
    }

    remove() {
        if (this.formContainerTarget.getElementsByTagName('div').length > 3) {
            this.formContainerTarget.removeChild(event.target.parentNode)
        }
    }
}
