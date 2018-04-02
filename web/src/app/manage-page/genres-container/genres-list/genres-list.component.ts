import { Component, OnInit } from '@angular/core';
import { GenresService} from '../../../share/service/genres.service';
import { Genres } from '../../../share/model/genres.model';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-genres-list',
  templateUrl: './genres-list.component.html',
  styleUrls: ['./genres-list.component.css']
})
export class GenresListComponent implements OnInit {

  constructor(public genresService: GenresService,
              private toastr: ToastrService) { }

  ngOnInit() {
    this.genresService.getGenresList();
  }

  showForEdit(genre: Genres) {
    this.genresService.selectedGenre = Object.assign({}, genre);
  }

  onDelete(id: number) {
    if (confirm('Are you sure ?') == true) {
      this.genresService.deleteGenre(id)
        .subscribe(x => {
          this.genresService.getGenresList();
          this.toastr.warning('Deleted successfully!', 'Genre deleted!');
        });
    }
  }

}
