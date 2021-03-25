window.addEventListener('load', () => {
  const btn = document.getElementById('btn');
  btn.addEventListener('mouseover', () => {
    btn.setAttribute('style', 'background-color:#FFBEDA;');
  });
  btn.addEventListener('mouseout', () => {
    btn.removeAttribute('style', 'background-color:#FFBEDA;');
  });
});