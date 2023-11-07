import { Component, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { OTextInputComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-projects-detail',
  templateUrl: './projects-detail.component.html',
  styleUrls: ['./projects-detail.component.scss']
})
export class ProjectsDetailComponent implements OnInit {

  @ViewChild('totalTime', {static: true})totalTime : OTextInputComponent;

  constructor() { }

  ngOnInit() {
    console.log(this.totalTime.getValue());
  }

}
