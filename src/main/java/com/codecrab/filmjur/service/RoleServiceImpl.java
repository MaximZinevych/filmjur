package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Role;
import com.codecrab.filmjur.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleRepository roleRepository;

    @Override
    public Role findById(Long id) {
        return roleRepository.findById(id).isPresent() ? roleRepository.findById(id).get() : null;
    }

    @Override
    public Role findByTitle(String title) {
        return roleRepository.findByTitle(title);
    }

    @Override
    public void saveRole(Role role) {
        roleRepository.save(role);
    }

    @Override
    public void updateRole(Role role) {
        roleRepository.save(role);
    }

    @Override
    public void deleteRoleById(Long id) {
        roleRepository.deleteById(id);
    }

    @Override
    public List<Role> findAllRoles() {
        return roleRepository.findAllOrderBy();
    }

    @Override
    public boolean isRoleExist(Role role) {
        return roleRepository.findByTitle(role.getTitle()) != null;
    }
}
