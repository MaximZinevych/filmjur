import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CountriesControlComponent } from './countries-control.component';

describe('CountriesControlComponent', () => {
  let component: CountriesControlComponent;
  let fixture: ComponentFixture<CountriesControlComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CountriesControlComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CountriesControlComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
