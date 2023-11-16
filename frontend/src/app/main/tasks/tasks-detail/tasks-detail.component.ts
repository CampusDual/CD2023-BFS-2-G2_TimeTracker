import { Component, ElementRef, OnInit, ViewChild} from '@angular/core';
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
  @ViewChild('taskNameHeader', { static: true }) taskNameHeader: ElementRef;
  @ViewChild('projectNameHeader', { static: true }) projectNameHeader: ElementRef;
  @ViewChild('taskOwnerHeader', { static: true }) taskOwnerHeader: ElementRef;
  
  ngOnInit() {
  }

  print(data) {

    let userTaskTime = data.USER_TASK_TIME;
    let userTotalTime = data.TOTAL_TASK_TIME;

    this.userTime.setValue(this.formatTime(userTaskTime));
    this.userTotal.setValue(this.formatTime(userTotalTime));
    this.taskNameHeader.nativeElement.innerText = data.T_NAME;
    this.projectNameHeader.nativeElement.innerText = data.P_NAME;
    this.taskOwnerHeader.nativeElement.innerText = data.T_OWNER;
  }

  formatTime(TimeBD){
    let minutes = this.addZero(TimeBD % 60);
    let hours =  this.addZero(Math.floor(TimeBD / 60));

    return `${hours}:${minutes}`;
  }

  addZero(num) {
    if (num < 10) {
      return "0" + num;
    }
    return num;
  }
}
