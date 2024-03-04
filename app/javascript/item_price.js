
const item_price = () => {
  const priceInput = document.getElementById("item-price");
  if (priceInput) {   // この行を追加
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const fee = Math.floor(inputValue * 0.1); // 手数料を計算
      addTaxDom.innerHTML = fee; // 手数料を表示
      const profitDom = document.getElementById("profit");
      const profit = inputValue - fee;  // 利益を計算
      profitDom.innerHTML = profit; // 利益を表示
    });
  }
};

window.addEventListener("turbo:load", item_price);
window.addEventListener("turbo:render", item_price);

