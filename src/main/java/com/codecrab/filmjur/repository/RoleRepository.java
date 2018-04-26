package com.codecrab.filmjur.repository;

import com.codecrab.filmjur.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByDescription(String description);
    List<Role> findAllOrderBy();
}
