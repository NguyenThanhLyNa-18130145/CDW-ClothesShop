package clothesShop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import clothesShop.entity.Category;

public interface CategorieRepository extends JpaRepository<Category, Long> {
	@Query(value = "SELECT p.name FROM Category p")
	public List<String> listId();
}
