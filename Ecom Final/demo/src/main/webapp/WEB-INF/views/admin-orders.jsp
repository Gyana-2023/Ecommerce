<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html><html><head><title>Admin Orders</title></head><body>
<h2>All Orders</h2>
<c:if test="${empty orders}">
  <p>No orders available.</p>
</c:if>
<table border="1" cellpadding="6">
  <tr><th>ID</th><th>Customer</th><th>Total</th><th>Status</th><th>Created</th><th>Action</th></tr>
  <c:forEach var="o" items="${orders}">
    <tr>
      <td>${o.id}</td>
      <td>${o.customerName} (${o.email})</td>
      <td>$${o.total}</td>
      <td>${o.status}</td>
      <td>${o.createdAt}</td>
      <td>
        <form action="/admin/orders/update/${o.id}" method="post" style="display:inline">
          <select name="status">
            <option ${o.status == 'PLACED' ? 'selected' : ''}>PLACED</option>
            <option ${o.status == 'SHIPPED' ? 'selected' : ''}>SHIPPED</option>
            <option ${o.status == 'DELIVERED' ? 'selected' : ''}>DELIVERED</option>
            <option ${o.status == 'CANCELLED' ? 'selected' : ''}>CANCELLED</option>
          </select>
          <button type="submit">Update</button>
        </form>
      </td>
    </tr>
    <tr>
      <td colspan="6">
        <strong>Items:</strong>
        <ul>
          <c:forEach var="it" items="${o.items}">
            <li>${it.product.name} x ${it.quantity} — $${it.total}</li>
          </c:forEach>
        </ul>
      </td>
    </tr>
  </c:forEach>
</table>
</body></html>
