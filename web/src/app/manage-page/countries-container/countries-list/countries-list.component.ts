import {ChangeDetectorRef, Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {ToastrService} from 'ngx-toastr';
import {CountryService} from '../../../share/service/country.service';
import {Country} from '../../../share/model/country.model';

@Component({
  selector: 'app-countries-list',
  templateUrl: './countries-list.component.html',
  styleUrls: ['./countries-list.component.css'],
  providers: [CountryService]
})
export class CountriesListComponent implements OnInit {

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  constructor(public countryService: CountryService,
              private toastr: ToastrService,
              private changeDetectorRefs: ChangeDetectorRef) { }

  dataSource;
  displayedColumns = ['id', 'title', 'code', 'action'];


  ngOnInit() {
    this.countryService.getCountriesList().subscribe(
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


  showForEdit(country: Country) {
    this.countryService.selectedCountry = Object.assign({}, country);
  }

  onDelete(id: number) {
    if (confirm('Are you sure ?') == true) {
      this.countryService.deleteCountry(id)
        .subscribe(x => {
          this.toastr.warning('Deleted successfully!', 'Country deleted!');
          this.refresh();
        });
    }
  }

  refresh() {
    this.countryService.getCountriesList().subscribe((res) => {
      this.dataSource = new MatTableDataSource(res);
      this.changeDetectorRefs.detectChanges();
    });

  }
}
