package com.codecrab.filmjur.service;

import com.codecrab.filmjur.entity.Role;

import java.util.List;

public interface RoleService {
    Role findById(Long id);
    Role findByTitle(String title);
    void saveRole(Role role);
    void updateRole(Role role);
    void deleteRoleById(Long id);
    List<Role> findAllRoles();
    boolean isRoleExist(Role role);
}
