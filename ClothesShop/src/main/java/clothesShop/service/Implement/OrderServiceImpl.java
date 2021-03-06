package clothesShop.service.Implement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import clothesShop.dto.user.CartDto;
import clothesShop.entity.Order;
import clothesShop.entity.OrderDetail;
import clothesShop.entity.User;
import clothesShop.repository.OrderDetailRepository;
import clothesShop.repository.OrderRepository;
import clothesShop.service.IOrderService;

@Service
@Transactional
public class OrderServiceImpl implements IOrderService {
	@Autowired
	OrderRepository orderRepository;
	@Autowired
	OrderDetailRepository orderDetailRepository;

	@Override
	public int addOrder(Order order) {
		orderRepository.save(order);
		List<Order> listOrder = orderRepository.findAll();
		return listOrder.size();

	}

	@Override
	public void addOrderDetail(HashMap<Long, CartDto> carts) {
		long idOrder = orderRepository.getIdMaxOrder();
		List<Order> listOrder = orderRepository.findAll();
		Order o = new Order();
		for (Order order : listOrder) {
			if (order.getId() == idOrder) {
				o = new Order(idOrder, o.getUser(), o.getTotal(), o.getQuantity(), o.getNote());
			}
		}
		for (Map.Entry<Long, CartDto> itemCart : carts.entrySet()) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setSize(itemCart.getValue().getSize());
			orderDetail.setColor(itemCart.getValue().getColor());
			orderDetail.setQuantity(itemCart.getValue().getQuantity());
			orderDetail.setTotal(itemCart.getValue().getTotalPrice());

			orderDetail.setOrder(o);
			orderDetail.setProduct(itemCart.getValue().getProduct());
			orderDetailRepository.save(orderDetail);
			System.out.println("order detail: " + orderDetail);
		}
	}

	@Override
	public List<Order> listAll() {
		return (List<Order>) orderRepository.findAll();
	}

	@Override
	public List<OrderDetail> listAllOrderDetail() {
		return (List<OrderDetail>) orderDetailRepository.findAll();
	}

	@Override
	public void delete(Long id) {
		orderRepository.deleteById(id);

	}
}
