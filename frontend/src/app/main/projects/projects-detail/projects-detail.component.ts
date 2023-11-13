import { Component, OnInit, Injector, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OTableComponent, OTextInputComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-projects-detail',
  templateUrl: './projects-detail.component.html',
  styleUrls: ['./projects-detail.component.scss']
})
export class ProjectsDetailComponent implements OnInit {

  @ViewChild('tasksTable', { static: false }) tasksTable: OTableComponent;
  @ViewChild ('projectTime' , {static : true}) projectTime : OTextInputComponent;
  protected service: OntimizeService;
  hours: number[] = [];

  constructor(private router: Router, protected injector: Injector) {
    this.service = this.injector.get(OntimizeService);
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration("tasks");
    this.service.configureService(conf);
  }

  ngOnInit() {
    this.configureService();
   }

  public openTasksDetailsSelected() {
    let selectedItem = this.tasksTable.getSelectedItems();
    if (selectedItem.length === 1) {
      let taskId = selectedItem[0]['T_ID'];
      this.router.navigate(['main/tasks/' + taskId]);
    }
  }

  getTaskTotalTimeValue() {

    if (this.service !== null) {
      const filter = {};
      const columns = ['TOTAL_TASK_TIME'];
      this.service.query(filter, columns, 'projectSummaryTasks').subscribe(resp => {
        if (resp.code === 0) {
          if (resp.data.length > 0) {
            for (let i=0; i<resp.data.length; i++){
              this.hours.push(resp.data[i])
            }
            return this.hours;
          }
        } else {
          //TODO: Mostrar error
        }
      });
    }
  }


  print(data){
    console.log(data);
  }
 
  viewData(dataPT) {

    let projectTotalTime = dataPT.PROJECT_TOTAL_TIME;

    let hours;
    let minutes;
    let days;
    if(projectTotalTime == null){
      hours =  "00";
      minutes =  "00";
    }else{
      days = projectTotalTime["days"]*24;
      hours = this.addZero(projectTotalTime["hours"]+days);
      minutes = this.addZero(projectTotalTime["minutes"]);
    }

    this.projectTime.setValue(`${hours}:${minutes}`);
  }

  addZero(num) {
    if (num < 10) {
      return "0" + num;
    }
    return num;
  }
}

