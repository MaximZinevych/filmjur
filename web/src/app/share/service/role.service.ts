import { Injectable } from '@angular/core';
import {Observable} from 'rxjs/Observable';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {Role} from '../model/role.model';

@Injectable()
export class RoleService {

  private url = '/api/staff/role/';
  private httpOptions = {
    headers: new HttpHeaders({'Content-Type': 'application/json'})
  };

  selectedRole: Role = null;

  constructor(private http: HttpClient) { }

  postRole(role: Role) {
    return this.http.post(this.url, JSON.stringify(role), this.httpOptions);
  }

  getRolesList(): Observable<Role[]> {
    return this.http.get<Role[]>(this.url);
  }

  updateRole(id: number, role: Role) {
    return this.http.put(this.url + id, JSON.stringify(role), this.httpOptions);
  }

  deleteRole(id: number) {
    return this.http.delete(this.url + id);
  }

}
