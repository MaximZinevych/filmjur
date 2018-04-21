import {Component, ElementRef, OnInit, Renderer2, ViewChild} from '@angular/core';
import {DragScrollDirective} from 'ngx-drag-scroll';
import {DomSanitizer} from '@angular/platform-browser';

@Component({
  selector: 'app-main-page',
  templateUrl: './main-page.component.html',
  styleUrls: ['./main-page.component.css']
})
export class MainPageComponent implements OnInit {

  leftNavDisabled = false;
  rightNavDisabled = false;

  dragScrollDom: any;
  dragScrollRef: ElementRef;
  dragScroll: DragScrollDirective;

  @ViewChild('nav', {read: DragScrollDirective}) ds: DragScrollDirective;

  constructor(
    sanitizer: DomSanitizer,
    private element: ElementRef,
    private renderer: Renderer2
  ) { }

  ngOnInit() {
  }

  moveLeft() {
    this.ds.moveLeft();
  }

  moveRight() {
    this.ds.moveRight();
  }

  leftBoundStat(reachesLeftBound: boolean) {
    this.leftNavDisabled = reachesLeftBound;
  }

  rightBoundStat(reachesRightBound: boolean) {
    this.rightNavDisabled = reachesRightBound;
  }
}
