package com.vgam.user.service;

import com.vgam.user.dao.UserDao;
import com.vgam.user.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void saveOrUpdate(User user) {

        if (findById(user.getId()) == null) {
            userDao.save(user);
        } else {
            userDao.update(user);
        }
    }

    @Override
    public void delete(int id) {
        userDao.delete(id);
    }
}