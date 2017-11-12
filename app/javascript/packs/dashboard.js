import Chartist from "chartist"
import "chartist/dist/chartist.min.css"

const fetchSummary = () => {
  fetch('/dashboard.json', { credentials: 'same-origin' }).then(response => {
    return response.json()
  }).then(data=> {
    new Chartist.Bar('.ct-chart', data)
  })
}

document.addEventListener('DOMContentLoaded', () => {
  fetchSummary()
})

document.addEventListener('turbolinks:load', () => {
  fetchSummary()
})
