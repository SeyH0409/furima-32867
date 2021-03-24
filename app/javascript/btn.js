window.addEventListener('load', () => {
  const editBtn = document.getElementById('edit-btn');
  const buyBtn  = document.getElementById('buy-btn');
  editBtn.addEventListener('mouseover', () => {
    editBtn.setAttribute('style', 'background-color:#FFBEDA;');
  });
  editBtn.addEventListener('mouseout', () => {
    editBtn.removeAttribute('style', 'background-color:#FFBEDA;');
  });
  buyBtn.addEventListener('mouseover', () => {
    buyBtn.setAttribute('style', 'background-color:#FFBEDA;');
  });
  buyBtn.addEventListener('mouseout', () => {
    buyBtn.removeAttribute('style', 'background-color:#FFBEDA;');
  });
});