import { Component, OnInit } from '@angular/core';
import {ToastrService} from 'ngx-toastr';
import {CountryService} from '../../../share/service/country.service';
import {NgForm} from '@angular/forms';
import {CompanyService} from '../../../share/service/company.service';

@Component({
  selector: 'app-production-control',
  templateUrl: './production-control.component.html',
  styleUrls: ['./production-control.component.css']
})
export class ProductionControlComponent implements OnInit {

  countries;

  constructor(private toastr: ToastrService,
              public companyService: CompanyService,
              public countryService: CountryService) {
  }

  ngOnInit() {
    this.resetForm();
    this.initAwardList();
  }

  resetForm(form?: NgForm) {
    if (form != null) {
      form.reset();
    }
    this.companyService.selectedCompany = {
      title: ''
    };
  }

  onSubmit(form: NgForm) {
    if (form.value.id == null) {
      this.companyService.postCompany(form.value)
        .subscribe(data => {
          console.log(form.value);
          this.resetForm(form);
          this.companyService.getCompaniesList();
          this.toastr.success('New production company has been added successfully!', 'Production company added!');
        });
    } else {
      this.companyService.updateCompany(form.value.id, form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.companyService.getCompaniesList();
          this.toastr.info('Production company has been updated successfully!', 'Production company updated!');
        });
    }
  }

  initAwardList() {
    this.countryService.getCountriesList().subscribe(
      result => {
        if (!result) {
          return;
        }
        this.countries = result;
      });
  }
}
