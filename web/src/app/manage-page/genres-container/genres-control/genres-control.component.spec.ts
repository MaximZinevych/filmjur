import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GenresControlComponent } from './genres-control.component';

describe('GenresControlComponent', () => {
  let component: GenresControlComponent;
  let fixture: ComponentFixture<GenresControlComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GenresControlComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GenresControlComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
