package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.ProductionCompany;
import com.codecrab.filmjur.entity.Role;
import com.codecrab.filmjur.service.RoleService;
import com.codecrab.filmjur.util.CustomErrorType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.List;

@RestController
@RequestMapping("/api")
public class RoleController {

    private static final Logger logger = LoggerFactory.getLogger(GenreController.class);

    @Autowired
    RoleService roleService;

    @RequestMapping(value = "/staff/role/", method = RequestMethod.GET)
    public ResponseEntity<List<Role>> listAllRoles(){
        logger.info("Fetching all Roles");
        List<Role> roles = roleService.findAllRoles();
        if(roles.isEmpty()){
            logger.error("No roles has been found.");
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<>(roles, HttpStatus.OK);
    }

    @RequestMapping(value = "/staff/role/{id}", method = RequestMethod.GET)
    public ResponseEntity<?> getRole(@PathVariable("id") long id){
        logger.info("Fetching role with id {}.", id);
        Role role = roleService.findById(id);
        if(role == null){
            logger.error("Role with id {} not found.");
            return new ResponseEntity<>(new CustomErrorType("Role with id " + id
                    + " not found."), HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(role, HttpStatus.OK);
    }

    @RequestMapping(value = "/staff/role/", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<?> addRole(@RequestBody Role role,
                                                  UriComponentsBuilder ucBuilder){
        logger.info("Adding role : {}", role);

        if(roleService.isRoleExist(role)){
            logger.error("Unable to add role. A role with title {} already exists"
                    , role.getTitle());
            return new ResponseEntity<>(new CustomErrorType("Unable to add. Role with title "
                    + role.getTitle() + " already exists."), HttpStatus.CONFLICT);
        }
        roleService.saveRole(role);

        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/staff/role/{id}")
                .buildAndExpand(role.getId()).toUri());
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/staff/role/{id}", method = RequestMethod.PUT)
    public ResponseEntity<?> updateRole(@PathVariable("id") long id,
                                                     @RequestBody Role role){
        logger.info("Updating role with id {}", id);
        Role currentRole = roleService.findById(id);

        if(currentRole == null){
            logger.error("Unable to update. Production company with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to update. " +
                    "Production company with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        currentRole.setTitle(role.getTitle());
        roleService.updateRole(currentRole);
        return new ResponseEntity<>(currentRole, HttpStatus.OK);
    }

    @RequestMapping(value = "/staff/role/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<?> deleteRole(@PathVariable("id") long id){
        logger.info("Fetching & Deleting role with id {}", id);

        Role role = roleService.findById(id);
        if(role == null){
            logger.error("Unable to delete. Production company with id {} not found.", id);
            return new ResponseEntity<>(new CustomErrorType("Unable to delete. " +
                    "Production company with id" +
                    id + " not found."), HttpStatus.NOT_FOUND);
        }

        roleService.deleteRoleById(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

}
