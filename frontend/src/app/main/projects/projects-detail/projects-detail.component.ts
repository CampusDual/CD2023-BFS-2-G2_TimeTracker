import { TemplateBinding } from '@angular/compiler';
import { Component, OnInit, Injector, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OIntegerInputComponent, OPercentInputComponent, OTableComponent, OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';
import { PieChartConfiguration } from 'ontimize-web-ngx-charts';

@Component({
  selector: 'app-projects-detail',
  templateUrl: './projects-detail.component.html',
  styleUrls: ['./projects-detail.component.scss']
})
export class ProjectsDetailComponent implements OnInit {

  @ViewChild('tasksTable', { static: false }) tasksTable: OTableComponent;
  @ViewChild('projectTime', { static: true }) projectTime: OTextInputComponent;
  @ViewChild('maxHours', { static: true }) maxHours: OIntegerInputComponent;
  @ViewChild('progressPercent', { static: true }) progressPercent: OPercentInputComponent;

  p_id: any;
  tasksChartParameters: PieChartConfiguration;
  totaltime: number;


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
    this.totaltime = dataPT.PROJECT_TOTAL_TIME;

    let minutes = this.addZero(this.totaltime % 60);
    let hours =  this.addZero(Math.floor(this.totaltime / 60));

    this.projectTime.setValue(`${hours}:${minutes}`);
  }

  getProgress(){
    let progress = ((this.totaltime/60) * 100 / this.maxHours.getValue())/100;
    if (progress > 1){
      this.progressPercent.elementRef.nativeElement.style.color = "red";
    } else {
      this.progressPercent.elementRef.nativeElement.style.color = "#333";
    }

    return progress;
  }


  addZero(num) {
    if (num < 10) {
      return "0" + num;
    }
    return num;
  }
}

