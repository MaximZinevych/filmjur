import { Component, OnInit } from '@angular/core';
import {AwardsService} from '../../share/service/awards.service';
import {CountryService} from '../../share/service/country.service';
import {AwardsListComponent} from './awards-list/awards-list.component';

@Component({
  selector: 'app-awards-container',
  templateUrl: './awards-container.component.html',
  styleUrls: ['./awards-container.component.css'],
  providers: [AwardsService, CountryService, AwardsListComponent]
})
export class AwardsContainerComponent implements OnInit {

  constructor(private awardsService: AwardsService,
              private countryService: CountryService) { }

  ngOnInit() {
  }

}
