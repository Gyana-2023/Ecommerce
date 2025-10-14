<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head><title>Order Placed</title></head><body>
<h2>Order Placed Successfully</h2>

<p>Order ID: ${order.id}</p>
<p>Name: ${order.customerName}</p>
<p>Address: ${order.address}</p>
<p>Phone: ${order.phone}</p>
<p>Total: $${order.total}</p>
<h3>Items</h3>
<table border="1" cellpadding="6">
  <tr><th>Product</th><th>Qty</th><th>Price</th><th>Subtotal</th></tr>
  <c:forEach var="it" items="${order.items}">
    <tr>
      <td>${it.product.name}</td>
      <td>${it.quantity}</td>
      <td>$${it.price}</td>
      <td>$${it.total}</td>
    </tr>
  </c:forEach>
</table>

<a href="/my-orders">Go to My Orders</a>
</body></html>
