window.addEventListener('load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const priceMargin = document.getElementById('add-tax-price');
    const priceBenefit = document.getElementById('profit');
    priceMargin.innerHTML = Math.floor(inputValue * 0.1);
    const priceMarginValue = priceMargin.innerHTML
    priceBenefit.innerHTML = Math.floor(inputValue - priceMarginValue);
  });
});