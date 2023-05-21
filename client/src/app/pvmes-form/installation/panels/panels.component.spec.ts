import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PanelsComponent } from './panels.component';

describe('PanelsComponent', () => {
  let component: PanelsComponent;
  let fixture: ComponentFixture<PanelsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PanelsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PanelsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should have 1 input fields', () => {
    const compiled = fixture.debugElement.nativeElement;
    const simpleLines = compiled.querySelectorAll('.shared-form-number-line');
    expect(simpleLines.length).toEqual(1);
  });
});
