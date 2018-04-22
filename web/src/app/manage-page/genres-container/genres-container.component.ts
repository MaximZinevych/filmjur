import { Component, OnInit } from '@angular/core';
import { GenresService } from '../../share/service/genres.service';

@Component({
  selector: 'app-genres-container',
  templateUrl: './genres-container.component.html',
  styleUrls: ['./genres-container.component.css'],
  providers: [GenresService]
})
export class GenresContainerComponent implements OnInit {

  constructor(private genresService: GenresService) { }

  ngOnInit() {
  }

}
