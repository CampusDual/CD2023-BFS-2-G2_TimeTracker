import { Component, OnInit, ViewChild} from '@angular/core';
import { OCheckboxComponent, OFormComponent, OTextInputComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-tasks-detail',
  templateUrl: './tasks-detail.component.html',
  styleUrls: ['./tasks-detail.component.scss']
})

export class TasksDetailComponent implements OnInit {

  @ViewChild ('userTime' , {static : true}) userTime : OTextInputComponent;
  @ViewChild ('userTotal' , {static : true}) userTotal : OTextInputComponent;
  @ViewChild ('taskCheckbox' , {static : true}) taskCheckbox : OCheckboxComponent;
  @ViewChild ('taskForm' , {static : true}) taskForm : OFormComponent;
  
  ngOnInit() {
  }

  UpdateChange(){
    this.taskForm.reload();
    console.log("update");
  }

  prueba(cosa){
    console.log(cosa);
  }

  print(data) {

    let userTaskTime = data.USER_TASK_TIME;
    let userTotalTime = data.TOTAL_TASK_TIME;

    this.userTime.setValue(this.formatTime(userTaskTime));
    this.userTotal.setValue(this.formatTime(userTotalTime));
  }

  formatTime(TimeBD){
    let hours;
    let minutes;
    let days;

    if (TimeBD == null) {
      hours = "00";
      minutes = "00";
    } else {
      days = TimeBD["days"] * 24;
      hours = this.addZero(TimeBD["hours"] + days);
      minutes = this.addZero(TimeBD["minutes"]);
    }
    return `${hours}:${minutes}`;
  }

  addZero(num) {
    if (num < 10) {
      return "0" + num;
    }
    return num;
  }
}
