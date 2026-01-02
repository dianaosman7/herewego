import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

function initMasonry() {
  const grid = document.querySelector("#pins")
  if (!grid) return
  if (!window.Masonry) return

  // prevent duplicates on turbo navigation
  if (grid._masonryInstance) {
    grid._masonryInstance.destroy()
    grid._masonryInstance = null
  }

  const msnry = new window.Masonry(grid, {
    itemSelector: ".box",
    gutter: 18,
    fitWidth: true,
    percentPosition: true
  })

  grid._masonryInstance = msnry

  // important: relayout after images load
  grid.querySelectorAll("img").forEach((img) => {
    if (img.complete) return
    img.addEventListener("load", () => msnry.layout(), { once: true })
    img.addEventListener("error", () => msnry.layout(), { once: true })
  })
}

document.addEventListener("turbo:load", initMasonry)

document.addEventListener("turbo:before-cache", () => {
  const grid = document.querySelector("#pins")
  if (grid && grid._masonryInstance) {
    grid._masonryInstance.destroy()
    grid._masonryInstance = null
  }
})