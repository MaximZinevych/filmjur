import { Injectable } from '@angular/core';
import {Genres} from '../model/genres.model';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class GenresService {

  private url = '/api/genres/';
  private httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
  };

  selectedGenre: Genres;

  constructor(private http: HttpClient) { }

  postGenre(genre: Genres) {
    return this.http.post(this.url, JSON.stringify(genre), this.httpOptions);
  }

  getGenresList(): Observable<Genres[]> {
    return this.http.get<Genres[]>(this.url);

  }

  updateGenre(id: number, genre: Genres) {
    return this.http.put(this.url + id, JSON.stringify(genre), this.httpOptions);
  }

  deleteGenre(id: number) {
    return this.http.delete(this.url + id);
  }

}
