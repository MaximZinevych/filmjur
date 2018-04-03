import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AwardsContainerComponent } from './awards-container.component';

describe('AwardsContainerComponent', () => {
  let component: AwardsContainerComponent;
  let fixture: ComponentFixture<AwardsContainerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AwardsContainerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AwardsContainerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
