window.addEventListener('load', () => {
  

const priceInput = document.getElementById("furima-price");

const priceContent = document.getElementById("add-tax-price", "profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  

  const tax = inputValue/10
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(tax)

  const profit = inputValue - tax
  const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = Math.floor(profit)
})
});