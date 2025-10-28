function calculation() {
  const productPrice = document.getElementById("item-price");
  if (!productPrice) return;

  const commissionText = document.getElementById("add-tax-price");
  const profitText = document.getElementById("profit");

  productPrice.addEventListener("input", () => {
    const priceValue = parseInt(productPrice.value, 10);
    if (isNaN(priceValue)) {
      commissionText.textContent = "";
      profitText.textContent = "";
      return;
    }

    const commission = Math.floor(priceValue * 0.1);
    const profit = Math.floor(priceValue - commission);

    commissionText.textContent = commission;
    profitText.textContent = profit;
  });
}

window.addEventListener("turbo:load", calculation);
window.addEventListener("turbo:render", calculation);