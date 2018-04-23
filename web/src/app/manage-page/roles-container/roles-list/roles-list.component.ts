import {ChangeDetectorRef, Component, OnInit, ViewChild} from '@angular/core';
import {ToastrService} from 'ngx-toastr';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {RoleService} from '../../../share/service/role.service';
import {Role} from '../../../share/model/role.model';

@Component({
  selector: 'app-roles-list',
  templateUrl: './roles-list.component.html',
  styleUrls: ['./roles-list.component.css']
})
export class RolesListComponent implements OnInit {

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  constructor(public roleService: RoleService,
              private toastr: ToastrService,
              private changeDetectorRefs: ChangeDetectorRef) { }

  dataSource;
  displayedColumns = ['id', 'title', 'action'];


  ngOnInit() {
    this.roleService.getRolesList().subscribe(
      result => {
        if (!result) {
          return;
        }
        this.dataSource = new MatTableDataSource(result);
        this.dataSource.sort = this.sort;
        this.dataSource.paginator = this.paginator;
      });
  }

  applyFilter(filterValue: string) {
    filterValue = filterValue.trim();
    filterValue = filterValue.toLowerCase();
    this.dataSource.filter = filterValue;
  }


  showForEdit(role: Role) {
    this.roleService.selectedRole = Object.assign({}, role);
  }

  onDelete(id: number) {
    if (confirm('Are you sure ?') === true) {
      this.roleService.deleteRole(id)
        .subscribe(x => {
          this.toastr.warning('Deleted successfully!', 'Role deleted!');
          this.refresh();
        });
    }
  }

  refresh() {
    this.ngOnInit();
  }
}
