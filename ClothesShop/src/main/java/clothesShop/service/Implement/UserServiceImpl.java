package clothesShop.service.Implement;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import clothesShop.entity.User;
import clothesShop.repository.UserRepository;
import clothesShop.service.IUserService;

@Service
@Transactional
public class UserServiceImpl implements IUserService {
	@Autowired
	UserRepository userRepository;

	@Override
	public void save(User user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		userRepository.save(user);

	}

	@Override
	public void saveInf(User user) {
		userRepository.save(user);

	}

	@Override
	public User findByUser(String userName) {
		User user = new User();
		List<User> users = userRepository.findAll();
		for (User u : users) {
			if (u.getEmail().equals(userName)) {
				user = new User(u.getId(), userName, u.getPassword(), u.getDisplay_name(), u.getAddress(), u.getPhone(),
						u.isActive(), u.getUserRole());

			}

		}
		return user;
	}

	@Override
	public List<User> listAll() {
		return (List<User>) userRepository.findAll();
	}

	@Override
	public User get(Long id) {
		return userRepository.findById(id).get();
	}

	@Override
	public User getName(String name) {
		List<User> list = userRepository.findAll();
		User userDetail = new User();
		for (User user : list) {
			if (user.getEmail().equals(name)) {
				userDetail = user;
			}
		}
		return userDetail;
	}

	@Override
	public User checkAccount(User user) {
		String pass = user.getPassword();
		user = findByUser(user.getEmail());
		System.out.println("user: " + user.toString());
		if (user != null) {
			if (BCrypt.checkpw(pass, user.getPassword())) {
				return user;
			} else {
				return null;
			}
		}
		return null;

	}

	@Override
	public void saveNewPassword(User user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12)));
		userRepository.save(user);

	}

	@Override
	public boolean existsByEmail(String email) {
		return userRepository.existsByEmail(email);
	}

}
