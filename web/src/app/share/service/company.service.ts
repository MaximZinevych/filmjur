import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';
import {Company} from '../model/company.model';

@Injectable()
export class CompanyService {

  private url = '/api/production/company/';
  private httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
  };

  selectedCompany: Company = null;

  constructor(private http: HttpClient) { }

  postCompany(company: Company) {
    return this.http.post(this.url, JSON.stringify(company), this.httpOptions);
  }

  getCompaniesList(): Observable<Company[]> {
    return this.http.get<Company[]>(this.url);
  }

  updateCompany(id: number, company: Company) {
    return this.http.put(this.url + id, JSON.stringify(company), this.httpOptions);
  }

  deleteCompany(id: number) {
    return this.http.delete(this.url + id);
  }
}
