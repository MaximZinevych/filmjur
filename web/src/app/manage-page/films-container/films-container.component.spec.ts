import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FilmsContainerComponent } from './films-container.component';

describe('FilmsContainerComponent', () => {
  let component: FilmsContainerComponent;
  let fixture: ComponentFixture<FilmsContainerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FilmsContainerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FilmsContainerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
