import { Component, OnInit } from '@angular/core';
import { Injector, ViewChild } from '@angular/core';
import { OComboComponent, OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-timer-controls',
  templateUrl: './timer-controls.component.html',
  styleUrls: ['./timer-controls.component.scss']
})
export class TimerControlsComponent implements OnInit {

  isStarted: boolean = false;
  selectedTaskValue: any;

  protected service: OntimizeService;

  @ViewChild('taskCombo', {static: true})taskCombo : OComboComponent;

  constructor(protected injector: Injector) {
    this.service = this.injector.get(OntimizeService);
  }
  
  ngAfterViewInit(): void {
  }
  
  ngOnInit() {
    this.configureService();
    this.getLastOpen();

    const timerStatus = localStorage.getItem('timerStatus');
    if (timerStatus === 'true') {
      const storedValue = localStorage.getItem('selectedTaskValue');
      if (storedValue) {
        this.selectedTaskValue = JSON.parse(storedValue);
        this.taskCombo.setValue(this.selectedTaskValue);
      }
    }
    this.isStarted = timerStatus === 'true';
    console.log(this.isStarted)
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration("timers");
    this.service.configureService(conf);
  }

  startTimer() {
    if (this.service !== null) {
      const values = {T_ID: this.getComboValue()};
      this.service.insert(values, "timer").subscribe(resp => {
        if (resp.code === 0) {
          this.selectedTaskValue = this.getComboValue();
          localStorage.setItem('timerStatus', 'true');
          localStorage.setItem('selectedTaskValue', JSON.stringify(this.selectedTaskValue));
          this.iniciarJornada();
        } else {
          //TODO: Mostrar error
        }
      });
    }
  }


  stopTimer(){
    if (this.service !== null) {
      const values = {};
      const filter = {};
      this.service.update(filter, values, "close").subscribe(resp => {
        if (resp.code === 0) {
        } else {
          //TODO: Mostrar error
        }
      });
      localStorage.setItem('timerStatus', 'false');
      this.finalizarJornada();
    }
  }

  getLastOpen() {
    if (this.service !== null) {
      const filter = {};
      const columns = ['T_ID'];
      this.service.query(filter, columns, 'openTimer').subscribe(resp => {
        if (resp.code === 0) {
          if (resp.data.length > 0) {
            this.iniciarJornada();
          }
        } else {
          //TODO: Mostrar error
        }
      });
    }
  }
  
  getComboValue() {
    return this.taskCombo.getValue();
  }

  iniciarJornada(): void {
    this.isStarted = true;
  }  

  finalizarJornada(): void {
    this.isStarted = false;
  }
}
