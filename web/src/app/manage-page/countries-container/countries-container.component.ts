import { Component, OnInit } from '@angular/core';
import {CountryService} from '../../share/service/country.service';

@Component({
  selector: 'app-countries-container',
  templateUrl: './countries-container.component.html',
  styleUrls: ['./countries-container.component.css'],
  providers: [CountryService]
})
export class CountriesContainerComponent implements OnInit {

  constructor(private countryService: CountryService) { }

  ngOnInit() {
  }

}
