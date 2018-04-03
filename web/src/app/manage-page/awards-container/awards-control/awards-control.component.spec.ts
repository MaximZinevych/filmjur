import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AwardsControlComponent } from './awards-control.component';

describe('AwardsControlComponent', () => {
  let component: AwardsControlComponent;
  let fixture: ComponentFixture<AwardsControlComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AwardsControlComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AwardsControlComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
