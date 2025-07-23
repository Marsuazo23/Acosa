<h1>{{productName}}</h1>

<div class="product-detail">
    <img src="{{productImgUrl}}" alt="{{productName}}">
    <div>
      <p>{{productDescription}}</p>
        <span class="price">{{displayPrice}}</span>
      <div class="quantity">
            <button class="btn-quantity" onclick="changeQuantity(this, -1)">-</button>
            <input type="number" min="1" value="1" readonly>
            <button class="btn-quantity" onclick="changeQuantity(this, 1)">+</button>
      </div> 
      
      <button class="add-to-cart">Agregar al carrito</button>
    </div>
</div>

<script>
    function changeQuantity(button, change) {
        const quantityDiv = button.closest('.quantity');
        const input = quantityDiv.querySelector('input');
            let currentValue = parseInt(input.value);
        const newValue = currentValue + change;
        if (newValue >= 1) {
            input.value = newValue;
        }
    }
</script>