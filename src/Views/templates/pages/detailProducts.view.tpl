<h1>{{productName}}</h1>

<div class="product-detail">
    <img src="{{productImgUrl}}" alt="{{productName}}" style="max-width: 300px;">
    <div>
        <p>{{productDescription}}</p>
        <span class="price">{{displayPrice}}</span>

        <div class="quantity">
            <button class="btn-quantity" data-change="-1">-</button>
            <input id="product-qty" type="number" min="1" max="{{stock}}" value="1" readonly>
            <button class="btn-quantity" data-change="1">+</button>
        </div>

        <div id="stock-message" class="stock-message">
            No hay más stock disponible.
        </div>
        
        <button class="add-to-cart">Agregar al carrito</button>
    </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const buttons = document.querySelectorAll(".btn-quantity");
    const input = document.getElementById("product-qty");
    const stockMessage = document.getElementById("stock-message");
    const max = parseInt(input.getAttribute("max"));

    buttons.forEach((button) => {
      button.addEventListener("click", () => {
        const change = parseInt(button.getAttribute("data-change"));
        let currentValue = parseInt(input.value);
        const newValue = currentValue + change;

        if (newValue < 1) return;

        if (newValue > max) {
          stockMessage.style.display = "block";
          setTimeout(() => {
            stockMessage.style.display = "none";
          }, 3000);
          return;
        }

        input.value = newValue;
        stockMessage.style.display = "none";
      });
    });
  });
</script>
