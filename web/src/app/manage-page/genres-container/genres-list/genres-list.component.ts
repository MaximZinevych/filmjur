import { ChangeDetectorRef, Component, OnInit, ViewChild} from '@angular/core';
import { GenresService} from '../../../share/service/genres.service';
import { Genres } from '../../../share/model/genres.model';
import { ToastrService } from 'ngx-toastr';
import {MatSort, MatPaginator, MatTableDataSource} from '@angular/material';

@Component({
  selector: 'app-genres-list',
  templateUrl: './genres-list.component.html',
  styleUrls: ['./genres-list.component.css']
})
export class GenresListComponent implements OnInit {

  @ViewChild(MatSort) sort: MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;

  constructor(public genresService: GenresService,
              private toastr: ToastrService,
              private changeDetectorRefs: ChangeDetectorRef) { }

  dataSource;
  displayedColumns = ['id', 'title', 'action'];


  ngOnInit() {
    this.genresService.getGenresList().subscribe(
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


  showForEdit(genre: Genres) {
    this.genresService.selectedGenre = Object.assign({}, genre);
  }

  onDelete(id: number) {
    if (confirm('Are you sure ?') === true) {
      this.genresService.deleteGenre(id)
        .subscribe(x => {
          this.toastr.warning('Deleted successfully!', 'Genre deleted!');
          this.refresh();
        });
    }
  }

  refresh() {
    this.genresService.getGenresList().subscribe((res) => {
      this.dataSource = new MatTableDataSource(res);
      this.changeDetectorRefs.detectChanges();
    });

  }

}
