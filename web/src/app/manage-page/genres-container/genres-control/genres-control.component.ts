import { Component, OnInit } from '@angular/core';
import { GenresService} from '../../../share/service/genres.service';
import { NgForm } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-genres-control',
  templateUrl: './genres-control.component.html',
  styleUrls: ['./genres-control.component.css']
})
export class GenresControlComponent implements OnInit {

  constructor(public genresService: GenresService,
              private toastr: ToastrService) { }

  ngOnInit() {
    this.resetForm();
  }

  resetForm(form?: NgForm) {
    if (form != null) {
      form.reset();
    }
    this.genresService.selectedGenre = {
      title: ''
    };
  }

  onSubmit(form: NgForm) {
    if (form.value.id == null) {
      this.genresService.postGenre(form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.genresService.getGenresList();
          this.toastr.success('New "genre" has been added successfully!', 'Genre Added!');
        });
    } else {
      this.genresService.updateGenre(form.value.id, form.value)
        .subscribe(data => {
          let updatedName = form.value.title;
          this.resetForm(form);
          this.genresService.getGenresList();
          this.toastr.info('Genre "' + updatedName + '" has been updated successfully!', 'Genre Updated!');
        });
    }
  }
}
