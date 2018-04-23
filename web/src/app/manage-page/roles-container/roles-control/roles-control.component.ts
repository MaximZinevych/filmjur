import { Component, OnInit } from '@angular/core';
import {ToastrService} from 'ngx-toastr';
import {NgForm} from '@angular/forms';
import {RoleService} from '../../../share/service/role.service';

@Component({
  selector: 'app-roles-control',
  templateUrl: './roles-control.component.html',
  styleUrls: ['./roles-control.component.css']
})
export class RolesControlComponent implements OnInit {

  constructor(private toastr: ToastrService,
              public roleService: RoleService) {
  }

  ngOnInit() {
    this.resetForm();
  }

  resetForm(form?: NgForm) {
    if (form != null) {
      form.reset();
    }
    this.roleService.selectedRole = {
      title: ''
    };
  }

  onSubmit(form: NgForm) {
    if (form.value.id == null) {
      this.roleService.postRole(form.value)
        .subscribe(data => {
          console.log(form.value);
          this.resetForm(form);
          this.roleService.getRolesList();
          this.toastr.success('New role has been added successfully!', 'Role Added!');
        });
    } else {
      this.roleService.updateRole(form.value.id, form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.roleService.getRolesList();
          this.toastr.info('Role has been updated successfully!', 'Role Updated!');
        });
    }
  }
}
