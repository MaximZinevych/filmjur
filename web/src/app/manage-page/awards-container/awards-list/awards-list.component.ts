import {ChangeDetectorRef, Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator, MatSort, MatTableDataSource} from '@angular/material';
import {ToastrService} from 'ngx-toastr';
import {AwardsService} from '../../../share/service/awards.service';
import {Award} from '../../../share/model/award.model';

@Component({
  selector: 'app-awards-list',
  templateUrl: './awards-list.component.html',
  styleUrls: ['./awards-list.component.css']
})
export class AwardsListComponent implements OnInit {

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  constructor(public awardService: AwardsService,
              private toastr: ToastrService,
              private changeDetectorRefs: ChangeDetectorRef) { }

  dataSource;
  displayedColumns = ['id', 'title', 'country', 'action'];

  ngOnInit() {
    this.awardService.getAwardsList().subscribe(
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


  showForEdit(award: Award) {
    this.awardService.selectedAward = Object.assign({}, award);
    console.log(this.awardService.selectedAward.title + ' ' + this.awardService.selectedAward.id + ' ' + this.awardService.selectedAward.country.title);
  }

  onDelete(id: number) {
    if (confirm('Are you sure ?') === true) {
      this.awardService.deleteAward(id)
        .subscribe(x => {
          this.toastr.warning('Deleted successfully!', 'Country deleted!');
          this.refresh();
        });
    }
  }

  refresh() {
    this.ngOnInit();
  }
}
