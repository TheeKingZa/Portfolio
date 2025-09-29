// Lazy load images
const imgs = document.querySelectorAll("img[data-src]");
const observer = new IntersectionObserver(entries => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.src = entry.target.dataset.src;
      observer.unobserve(entry.target);
    }
  });
});
imgs.forEach(img => observer.observe(img));

console.log("Portfolio loaded successfully!");
