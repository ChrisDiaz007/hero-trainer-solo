function duplicateSlidesOnce(sliderId) {
  const track = document.querySelector(`#${sliderId} .slider-track`);
  if (!track) return;                         // page without this slider
  if (track.dataset.duplicated === "true") return; // don't duplicate again (Turbo back/forward)

  const slides = Array.from(track.children);
  slides.forEach((slide) => {
    track.appendChild(slide.cloneNode(true));
  });

  track.dataset.duplicated = "true";
}

function initSliders() {
  ["slider1", "slider2", "slider3"].forEach(duplicateSlidesOnce);
}

// First load + Turbo page changes
document.addEventListener("turbo:load", initSliders);
// Fallback for non-Turbo setups
document.addEventListener("DOMContentLoaded", initSliders);
