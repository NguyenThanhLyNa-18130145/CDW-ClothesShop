package clothesShop.service.Implement;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import clothesShop.entity.Category;
import clothesShop.repository.CategorieRepository;
import clothesShop.service.ICategorieService;

@Service
@Transactional
public class CategorieServiceImpl implements ICategorieService {
	@Autowired
	CategorieRepository categorieRepository;

	@Override
	public void save(Category categorie) {
		categorieRepository.save(categorie);

	}

	@Override
	public List<Category> listAll() {
		return (List<Category>) categorieRepository.findAll();
	}

	@Override
	public Category get(Long id) {
		return categorieRepository.findById(id).get();
	}

	@Override
	public void delete(Long id) {
		categorieRepository.deleteById(id);

	}

	@Override
	public Map<Integer, String> listCategoryId() {
		Map<Integer, String> listCategoryId = new HashMap<>();
		for (int i = 0; i < categorieRepository.listId().size(); i++) {
			listCategoryId.put((i + 1), categorieRepository.listId().get(i));
		}
		return listCategoryId;
	}
}
