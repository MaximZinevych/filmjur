import {Component, OnInit} from '@angular/core';
import {ToastrService} from 'ngx-toastr';
import {CountryService} from '../../../share/service/country.service';
import {AwardsService} from '../../../share/service/awards.service';
import {NgForm} from '@angular/forms';
import {AwardsListComponent} from '../awards-list/awards-list.component';

@Component({
  selector: 'app-awards-control',
  templateUrl: './awards-control.component.html',
  styleUrls: ['./awards-control.component.css']
})
export class AwardsControlComponent implements OnInit {

  countries;

  constructor(private toastr: ToastrService,
              public awardService: AwardsService,
              public countryService: CountryService,
              public awardListComponent: AwardsListComponent) {
  }

  ngOnInit() {
    this.resetForm();
    this.initAwardList();
  }

  resetForm(form?: NgForm) {
    if (form != null) {
      form.reset();
    }
    this.awardService.selectedAward = {
      title: ''
    };
  }

  onSubmit(form: NgForm) {
    if (form.value.id == null) {
      this.awardService.postAward(form.value)
        .subscribe(data => {
          console.log(form.value);
          this.resetForm(form);
          this.awardService.getAwardsList();
          this.toastr.success('New award has been added successfully!', 'Award Added!');
        });
    } else {
      this.awardService.updateAward(form.value.id, form.value)
        .subscribe(data => {
          this.resetForm(form);
          this.awardService.getAwardsList();
          this.toastr.info('Award has been updated successfully!', 'Award Updated!');
        });
    }
    this.awardListComponent.refresh();
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
