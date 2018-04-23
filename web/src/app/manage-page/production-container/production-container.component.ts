import { Component, OnInit } from '@angular/core';
import {CompanyService} from '../../share/service/company.service';
import {CountryService} from '../../share/service/country.service';

@Component({
  selector: 'app-production-container',
  templateUrl: './production-container.component.html',
  styleUrls: ['./production-container.component.css'],
  providers: [CompanyService, CountryService]
})
export class ProductionContainerComponent implements OnInit {

  constructor(private companyService: CompanyService) { }

  ngOnInit() {
  }

}
