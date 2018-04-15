import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductionContainerComponent } from './production-container.component';

describe('ProductionContainerComponent', () => {
  let component: ProductionContainerComponent;
  let fixture: ComponentFixture<ProductionContainerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProductionContainerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProductionContainerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
