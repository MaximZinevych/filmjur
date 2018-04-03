import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FilmsControlComponent } from './films-control.component';

describe('FilmsControlComponent', () => {
  let component: FilmsControlComponent;
  let fixture: ComponentFixture<FilmsControlComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FilmsControlComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FilmsControlComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
