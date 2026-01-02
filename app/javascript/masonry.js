document.addEventListener("turbo:load", () => {
  const grid = document.querySelector("#pins")
  if (!grid || !window.Masonry) return

  const msnry = new Masonry(grid, {
    itemSelector: ".pin-card",
    columnWidth: ".pin-card",
    gutter: 18,
    percentPosition: true,
  })

  if (window.imagesLoaded) {
    imagesLoaded(grid, () => msnry.layout())
  }
})