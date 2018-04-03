import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PeopleControlComponent } from './people-control.component';

describe('PeopleControlComponent', () => {
  let component: PeopleControlComponent;
  let fixture: ComponentFixture<PeopleControlComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PeopleControlComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PeopleControlComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
