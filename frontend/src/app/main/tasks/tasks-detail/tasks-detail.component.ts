import { Component, OnInit, ViewChild} from '@angular/core';
import { OTextInputComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-tasks-detail',
  templateUrl: './tasks-detail.component.html',
  styleUrls: ['./tasks-detail.component.scss']
})

export class TasksDetailComponent implements OnInit {

  @ViewChild ('userTime' , {static : true}) userTime : OTextInputComponent;
  @ViewChild ('userTotal' , {static : true}) userTotal : OTextInputComponent;
  
  ngOnInit() {
  }

  print(data) {

    let userTaskTime = data.USER_TASK_TIME;
    let userTotalTime = data.TOTAL_TASK_TIME;

    let hoursUT;
    let minutesUT;
    let daysUT;

    let hoursTT;
    let minutesTT;
    let daysTT;

    if (userTaskTime == null) {
      hoursUT = "00";
      minutesUT = "00";
    } else {
      daysUT = userTaskTime["days"] * 24;
      hoursUT = this.addZero(userTaskTime["hours"] + daysUT);
      minutesUT = this.addZero(userTaskTime["minutes"]);
    }

    if (userTotalTime == null) {
      hoursTT = "00";
      minutesTT = "00";
    } else {
      daysTT = userTotalTime["days"] * 24;
      hoursTT = this.addZero(userTotalTime["hours"] + daysTT);
      minutesTT = this.addZero(userTotalTime["minutes"]);
    }

    this.userTime.setValue(`${hoursUT}:${minutesUT}`);
    this.userTotal.setValue(`${hoursTT}:${minutesTT}`);
  }

  addZero(num) {
    if (num < 10) {
      return "0" + num;
    }
    return num;
  }
}
