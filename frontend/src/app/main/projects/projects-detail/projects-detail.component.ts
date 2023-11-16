import { TemplateBinding } from '@angular/compiler';
import { Component, OnInit, Injector, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OTableComponent, OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';
import { PieChartConfiguration } from 'ontimize-web-ngx-charts';

@Component({
  selector: 'app-projects-detail',
  templateUrl: './projects-detail.component.html',
  styleUrls: ['./projects-detail.component.scss']
})
export class ProjectsDetailComponent implements OnInit {

  @ViewChild('tasksTable', { static: false }) tasksTable: OTableComponent;
  @ViewChild('projectTime', { static: true }) projectTime: OTextInputComponent;
  p_id: any;
  tasksChartParameters: PieChartConfiguration;

  constructor(private router: Router) {
    this.tasksChartParameters = new PieChartConfiguration;
    this.tasksChartParameters.labelSunbeamLayout= false;
    this.tasksChartParameters.labelType="percent";
  }

  ngOnInit() {  }

  public openTasksDetailsSelected() {
    let selectedItem = this.tasksTable.getSelectedItems();
    if (selectedItem.length === 1) {
      let taskId = selectedItem[0]['T_ID'];
      this.router.navigate(['main/tasks/' + taskId]);
    }
  }

  viewData(dataPT) {
    console.log(dataPT);
    this.p_id = dataPT.P_ID;
    let projectTotalTime = dataPT.PROJECT_TOTAL_TIME;

    let minutes = this.addZero(projectTotalTime % 60);
    let hours =  this.addZero(Math.floor(projectTotalTime / 60));

    this.projectTime.setValue(`${hours}:${minutes}`);
  }

  addZero(num) {
    if (num < 10) {
      return "0" + num;
    }
    return num;
  }
}

