import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Country} from '../model/country.model';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class CountryService {

  private url = '/api/countries/';
  private httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
  };

  selectedCountry: Country;

  constructor(private http: HttpClient) { }

  postCountry(country: Country) {
    return this.http.post(this.url, JSON.stringify(country), this.httpOptions);
  }

  getCountriesList(): Observable<Country[]> {
    return this.http.get<Country[]>(this.url);

  }

  updateCountry(id: number, country: Country) {
    return this.http.put(this.url + id, JSON.stringify(country), this.httpOptions);
  }

  deleteCountry(id: number) {
    return this.http.delete(this.url + id);
  }

}
