import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-manage-page',
  templateUrl: './manage-page.component.html',
  styleUrls: ['./manage-page.component.css']
})
export class ManagePageComponent implements OnInit {

  path = '../../assets/images/title/';

  tiles = [
    {cols: 2, rows: 2, image: 'films_title.svg', route: 'films'},
    {cols: 2, rows: 1, image: 'roles_title.svg', route: 'roles'},
    {cols: 2, rows: 1, image: 'production_companies_title.svg', route: 'production'},
    {cols: 2, rows: 2, image: 'people_title.svg', route: 'people'},
    {cols: 2, rows: 1, image: 'awards_title.svg', route: 'awards'},
    {cols: 2, rows: 1, image: 'genres_title.svg', route: 'genres'},
    {cols: 2, rows: 1, image: 'countries_title.svg', route: 'countries'}
  ];

  constructor() { }

  ngOnInit() {
  }

}
