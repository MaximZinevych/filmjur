import { Component, OnInit } from '@angular/core';
import {ToastrService} from 'ngx-toastr';
import {CountryService} from '../../../share/service/country.service';
import {NgForm} from '@angular/forms';

@Component({
  selector: 'app-countries-control',
  templateUrl: './countries-control.component.html',
  styleUrls: ['./countries-control.component.css'],
  providers: [CountryService]
})
export class CountriesControlComponent implements OnInit {

  constructor(private toastr: ToastrService,
              public countryService: CountryService) { }

  ngOnInit() {
    this.resetForm();
  }

  resetForm(form?: NgForm) {
    if (form != null) {
      form.reset();
    }
    this.countryService.selectedCountry = {
      title: '',
      code: ''
    };
  }

  onSubmit(form: NgForm) {
    if (form.value.id == null) {
      this.countryService.postCountry(form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.countryService.getCountriesList();
          this.toastr.success('New country has been added successfully!', 'Country Added!');
        });
    } else {
      this.countryService.updateCountry(form.value.id, form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.countryService.getCountriesList();
          this.toastr.info('Country has been updated successfully!', 'Country Updated!');
        });
    }
  }

}
