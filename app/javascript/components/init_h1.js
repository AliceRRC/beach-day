const initUpdateH1OnScroll = () => {
  const h1 = document.querySelector('.scroll-hide');
  if (h1) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight * 1) {
        h1.classList.add('h1-hide');
      } else {
        h1.classList.remove('h1-hide');
      }
    });
  }
}






export { initUpdateH1OnScroll };

