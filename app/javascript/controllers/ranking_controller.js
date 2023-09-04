import { Controller } from "@hotwired/stimulus"
import consumer from "channels/consumer"

// Connects to data-controller="ranking"
export default class extends Controller {
  static targets = ["list"]

  connect() {
    const ranking = this
    this.ranking = consumer.subscriptions.create("RankingChannel", {
      received(data) {
        const html = ranking.renderHTML(data.body)
        ranking.listTargets[0].innerHTML = html
      }
    })
  }

  renderHTML(data) {
    let html = ''
    data.forEach(element => {
      html += `
          <li class="py-3 sm:py-4">
          <div class="flex items-center space-x-4">
            <div class="flex-shrink-0">
              <img class="w-8 h-8 rounded-full" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" alt="Neil image">
            </div>
            <div class="flex-1 min-w-0">
              <p class="text-sm font-medium text-gray-900 truncate dark:text-white">
                ${element.player.email}
              </p>
              <p class="text-sm text-gray-500 truncate dark:text-gray-400">
                ${element.created_at}
              </p>
            </div>
            <div class="inline-flex items-center text-base font-semibold text-gray-900 dark:text-white">
              ${element.score}
            </div>
          </div>
          </li>
        `
    });
    return html
  }
}
