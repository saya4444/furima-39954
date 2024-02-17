window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    // Math.floorを使用し、販売手数料を小数点以下切り捨てで計算する
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    const profitDom = document.getElementById("profit");
    // Math.floorを使用し、販売利益を小数点以下切り捨てで計算する
    profitDom.innerHTML = Math.floor(inputValue * 0.9);
  });
});