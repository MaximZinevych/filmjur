import {ChangeDetectorRef, Component, OnInit, ViewChild} from '@angular/core';
import {ToastrService} from 'ngx-toastr';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {CompanyService} from '../../../share/service/company.service';
import {Company} from '../../../share/model/company.model';

@Component({
  selector: 'app-production-list',
  templateUrl: './production-list.component.html',
  styleUrls: ['./production-list.component.css']
})
export class ProductionListComponent implements OnInit {

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  constructor(public companyService: CompanyService,
              private toastr: ToastrService,
              private changeDetectorRefs: ChangeDetectorRef) { }

  dataSource;
  displayedColumns = ['id', 'title', 'country', 'action'];


  ngOnInit() {
    this.companyService.getCompaniesList().subscribe(
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


  showForEdit(company: Company) {
    this.companyService.selectedCompany = Object.assign({}, company);
  }

  onDelete(id: number) {
    if (confirm('Are you sure ?') === true) {
      this.companyService.deleteCompany(id)
        .subscribe(x => {
          this.toastr.warning('Deleted successfully!', 'Production company has been deleted!');
          this.refresh();
        });
    }
  }

  refresh() {
    this.companyService.getCompaniesList().subscribe((res) => {
      this.dataSource = new MatTableDataSource(res);
      this.changeDetectorRefs.detectChanges();
    });

  }


}
