window.addEventListener('load', () => {
  console.log("OK");

const priceInput = document.getElementById("furima-price");

const priceContent = document.getElementById("add-tax-price", "profit");

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  console.log(inputValue);

  const tax = inputValue/10
  const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(tax)
})
});