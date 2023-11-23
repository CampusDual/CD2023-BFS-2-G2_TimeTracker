import { TemplateBinding } from '@angular/compiler';
import { Component, OnInit, Injector, ViewChild, ElementRef } from '@angular/core';
import { MatTabChangeEvent } from '@angular/material';
import { Router } from '@angular/router';
import { OIntegerInputComponent, OPercentInputComponent, OTableComponent, OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';
import { OChartComponent, PieChartConfiguration } from 'ontimize-web-ngx-charts';

@Component({
  selector: 'app-projects-detail',
  templateUrl: './projects-detail.component.html',
  styleUrls: ['./projects-detail.component.scss']
})
export class ProjectsDetailComponent implements OnInit {

  @ViewChild('tasksTable', { static: false }) tasksTable: OTableComponent;
  @ViewChild('projectTime', { static: true }) projectTime: OTextInputComponent;
  @ViewChild('maxHours', { static: true }) maxHours: OIntegerInputComponent;
  @ViewChild('projectNameHeader', { static: true }) projectNameHeader: ElementRef;
  @ViewChild('totalTimeHeader', { static: true }) totalTimeHeader: ElementRef;
  @ViewChild('progressPercentHeader', { static: true }) progressPercentHeader: ElementRef;
  @ViewChild('tasksChart', { static: true }) tasksChart: OChartComponent;
  @ViewChild('usersChart', { static: true }) usersChart: OChartComponent;

  p_id: any;
  tasksChartParameters: PieChartConfiguration;
  usersChartParameters: PieChartConfiguration;
  totaltime: number;


  constructor(private router: Router) {
    this.tasksChartParameters = new PieChartConfiguration;
    this.tasksChartParameters.labelSunbeamLayout = false;
    this.tasksChartParameters.labelType = "percent";
    this.tasksChartParameters.legend.expanded = true;
    this.tasksChartParameters.legendPosition = "bottom";

    this.usersChartParameters = new PieChartConfiguration;
    this.usersChartParameters.legendPosition = "bottom";
  }

  ngOnInit() { }

  public openTasksDetailsSelected() {
    let selectedItem = this.tasksTable.getSelectedItems();
    if (selectedItem.length === 1) {
      let taskId = selectedItem[0]['T_ID'];
      this.router.navigate(['main/tasks/' + taskId]);
    }
  }

  viewData(dataPT) {
    this.p_id = dataPT.P_ID;
    this.totaltime = dataPT.PROJECT_TOTAL_TIME;
    this.projectNameHeader.nativeElement.innerText = dataPT.P_NAME;
    this.totalTimeHeader.nativeElement.innerText = this.addZero(Math.floor(this.totaltime / 60)) + ":" + this.addZero(this.totaltime % 60);
    this.progressPercentHeader.nativeElement.innerText = this.getProgress();

    let minutes = this.addZero(this.totaltime % 60);
    let hours = this.addZero(Math.floor(this.totaltime / 60));

    this.projectTime.setValue(`${hours}:${minutes}`);
  }

  setNullMax() {
    if (this.maxHours.getValue() == "") {
      this.maxHours.setValue(null);
    }
  }

  getProgress() {
    let progress = ((this.totaltime / 60) * 100 / this.maxHours.getValue());
    if (progress > 100) {
      this.progressPercentHeader.nativeElement.style.color = "red";
    } else {
      this.progressPercentHeader.nativeElement.style.color = "#333";
    }

    if (this.maxHours.getValue() === 0 || this.maxHours.getValue() == null) {
      this.progressPercentHeader.nativeElement.parentElement.style.display = "none";
    } else {
      this.progressPercentHeader.nativeElement.parentElement.style.display = "flex";
    }

    return progress.toFixed(2) + "%";
  }

  addZero(num) {
    if (num < 10) {
      return "0" + num;
    }
    return num;
  }

  onTabChange(event: MatTabChangeEvent) {
    this.tasksChart.updateOptions(this.tasksChartParameters);
    this.usersChart.updateOptions(this.usersChartParameters)
  }


}

