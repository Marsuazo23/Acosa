<h1 class="category-title">Productos de {{categoryName}}</h1>

<div class="product-list">
  {{foreach products}}
    <div class="product">
      {{discount}}
      <img src="{{productImgUrl}}" alt="{{productName}}">
      <h2>{{productName}}</h2>
      <div class="product-content">
        <p>{{productDescription}}</p>
      </div>
      <span class="price">
        {{originalPrice}}L. {{productPrice}}
      </span>
      <button class="add-to-cart" onclick="location.href='index.php?page=Pages\\detailProducts&productId={{productId}}'">Comprar</button>
    </div>
  {{endfor products}}
</div>
