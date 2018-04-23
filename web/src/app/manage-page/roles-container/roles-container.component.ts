import { Component, OnInit } from '@angular/core';
import {RoleService} from '../../share/service/role.service';

@Component({
  selector: 'app-roles-container',
  templateUrl: './roles-container.component.html',
  styleUrls: ['./roles-container.component.css'],
  providers: [ RoleService ]
})
export class RolesContainerComponent implements OnInit {

  constructor(roleService: RoleService) { }

  ngOnInit() {
  }

}
