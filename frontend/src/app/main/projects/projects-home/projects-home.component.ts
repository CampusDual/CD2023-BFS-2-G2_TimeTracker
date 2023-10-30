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

  getValeu(){
    return 1;
  }

  getDataArray() {
    const array: Array<Object> = [];
    array.push({
      'key': 1,
      'value': 'Todos'
    });
    array.push({
      'key': 2,
      'value': 'Finalizados'
    });
    array.push({
      'key': 3,
      'value': 'Activos'
    });
    return array;
  }

}
