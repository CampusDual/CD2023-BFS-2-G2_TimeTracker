import { Component, OnInit, ViewChild } from '@angular/core';
import { ORadioComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-projects-home',
  templateUrl: './projects-home.component.html',
  styleUrls: ['./projects-home.component.scss']
})
export class ProjectsHomeComponent implements OnInit {

@ViewChild('radioProject', {static: true}) radioProject: ORadioComponent;

  constructor() { }

  ngOnInit() {
  }

}
