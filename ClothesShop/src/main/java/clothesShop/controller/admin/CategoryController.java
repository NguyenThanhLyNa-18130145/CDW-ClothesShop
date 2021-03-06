package clothesShop.controller.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import clothesShop.entity.Category;
import clothesShop.service.ICategorieService;

@Controller
public class CategoryController {
	@Autowired
	private ICategorieService categorieService;
	
	@RequestMapping("/quan-tri/loai-sp")
	public ModelAndView category() {
		List<Category> categories = categorieService.listAll();
		ModelAndView mav = new ModelAndView("admin/adminCategories");
		mav.addObject("listCategory", categories);
		Category category = new Category();
		mav.addObject("category", category);
		return mav;
	}
	
	@RequestMapping("/quan-tri/loai-sp/new")
	public ModelAndView newCategoryForm(Map<String, Object> model) {
		ModelAndView mav = new ModelAndView("admin/actionCategories/newCategory");
		Category category = new Category();
		model.put("category", category);
		return mav;
	}

	@RequestMapping(value = "/quan-tri/loai-sp/save", method = RequestMethod.POST)
	public String saveCategory(@ModelAttribute("category") Category category) {
		categorieService.save(category);
		return "redirect:/quan-tri/loai-sp";
	}

	@RequestMapping("/quan-tri/loai-sp/edit")
	public ModelAndView editCategoryForm(@RequestParam long id) {
		ModelAndView mav = new ModelAndView("admin/actionCategories/editCategory");
		Category category = categorieService.get(id);
		mav.addObject("category", category);
		return mav;
	}

	@RequestMapping("/loai-sp/delete")
	public String deleteCategoryForm(@RequestParam long id) {
		categorieService.delete(id);
		return "redirect:/quan-tri/loai-sp";
	}

}
