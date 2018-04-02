import { Injectable } from '@angular/core';
import {Genres} from '../model/genres.model';
import {HttpClient, HttpHeaders} from '@angular/common/http';

@Injectable()
export class GenresService {

  private url = '/api/genres/';
  private httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
  };

  selectedGenre: Genres;
  genresList: Genres[];

  constructor(private http: HttpClient) { }

  postGenre(genre: Genres) {
    return this.http.post(this.url, JSON.stringify(genre), this.httpOptions);
  }

  getGenresList() {
    this.http.get<Genres[]>(this.url).toPromise().then(
      data => {
        this.genresList = data;
      });
  }

  updateGenre(id: number, genre: Genres) {
    return this.http.put(this.url + id, JSON.stringify(genre), this.httpOptions);
  }

  deleteGenre(id: number) {
    return this.http.delete(this.url + id);
  }

}
