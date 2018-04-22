import { Injectable } from '@angular/core';
import { Award } from '../model/award.model';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class AwardsService {

  private url = '/api/awards/';
  private httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
  };

  selectedAward: Award = null;

  constructor(private http: HttpClient) { }

  postAward(award: Award) {
    return this.http.post(this.url, JSON.stringify(award), this.httpOptions);
  }

  getAwardsList(): Observable<Award[]> {
    return this.http.get<Award[]>(this.url);

  }

  updateAward(id: number, award: Award) {
    return this.http.put(this.url + id, JSON.stringify(award), this.httpOptions);
  }

  deleteAward(id: number) {
    return this.http.delete(this.url + id);
  }


}
