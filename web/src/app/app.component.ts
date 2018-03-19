import {Component, OnInit} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs/Observable';


interface Country {
  countryName: string;
  countryCode: string;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  title = 'Filmjur';
  url = '/api/getAllCountries';
  countries: Observable<Country[]>;
  theDataSource: Observable<any>;

  constructor(private http: HttpClient) {
    this.theDataSource = this.http.get(this.url);
  }

  ngOnInit() {
    this.theDataSource.subscribe(
      data => {
        this.countries = data;
        console.log(this.countries);
      });
  }

  public getLength(): number {
    return 244;
  }
}
