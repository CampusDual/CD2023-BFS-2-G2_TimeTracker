import { Component, ElementRef, OnInit } from '@angular/core';
import { Injector, ViewChild } from '@angular/core';
import { OComboComponent, OntimizeService } from 'ontimize-web-ngx';
import { TIMEOUT_TIMER } from '../definitions';

@Component({
  selector: 'app-timer-controls',
  templateUrl: './timer-controls.component.html',
  styleUrls: ['./timer-controls.component.scss']
})
export class TimerControlsComponent implements OnInit {
  isStarted: boolean = false;
  selectedTaskValue: any;
  startTime: number;
  temporizadorInterval: any;
  isFirstTask: boolean = false;
  cancelTaskCountdown: any;
  isCancelled: boolean = false;

  protected service: OntimizeService;

  @ViewChild('taskCombo', { static: true }) taskCombo: OComboComponent;
  @ViewChild('crono', { static: true }) crono: ElementRef;
  @ViewChild('countdown', { static: true }) countdown: ElementRef;

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
    this.taskCombo.onValueChange.subscribe(() => {
      if(this.isStarted && !this.isCancelled){
         this.changeTask();
         this.isFirstTask = true;
      } else {
        this.isCancelled = false;
      }
    })
  }

  protected configureService() {
    const conf = this.service.getDefaultServiceConfiguration("timers");
    this.service.configureService(conf);
  }

  refreshCombo() {
    this.taskCombo.refresh();
  }

  changeTask(){
      this.taskCombo.elementRef.nativeElement.style.enabled = true;
      this.cancelTaskCountdown = setTimeout(() => {
      this.stopTimer();
      this.startTimer();
    }, 15000)

    let i = TIMEOUT_TIMER;

    const printCountdown = () => {
      this.countdown.nativeElement.innerHTML = `${i}`;
      i--;

      if (i >= 0 && this.cancelTaskCountdown !== 0) {
        this.countdown.nativeElement.style.visibility = 'visible';
        setTimeout(printCountdown, 1000);
      }
    }
    printCountdown();
  }

  cancelTaskChange() {
    if (this.cancelTaskCountdown) {
      clearTimeout(this.cancelTaskCountdown);
      this.cancelTaskCountdown = 0;
      this.isFirstTask = false;
      this.isCancelled = true;
      this.countdown.nativeElement.style.visibility = 'hidden';
      this.taskCombo.setValue(this.selectedTaskValue);
    }
  }

  startTimer() {
    if (this.service !== null) {
      const values = { T_ID: this.getComboValue() };
      this.service.insert(values, "timer").subscribe(resp => {
        if (resp.code === 0) {
          this.selectedTaskValue = this.getComboValue();
          localStorage.setItem('timerStatus', 'true');
          localStorage.setItem('selectedTaskValue', JSON.stringify(this.selectedTaskValue));
          this.iniciarJornada();
          this.getLastOpen();
        } else {
          //TODO: Mostrar error
        }
      });
    }
  }
  
  stopTimer() {
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
      this.isFirstTask = false;
      clearInterval(this.temporizadorInterval);
    }
  }

  iniciarContador() {

    let self = this;

    const actualizarTiempo = () => {

      let currentDate = new Date().getTime();
      let diff = currentDate - self.startTime;
      let segundos = Math.floor(diff / 1000) % 60;
      let minutos = Math.floor((diff/1000)/ 60);

    
      const tiempoFormateado = `${String(minutos).padStart(2, "0")}:${String(segundos).padStart(2, "0")}`;

      self.crono.nativeElement.style.border = '2px solid #676bd2';
      self.crono.nativeElement.innerHTML = `${tiempoFormateado}`;
    }
    
    this.temporizadorInterval = setInterval(actualizarTiempo, 1000);
  }

  getLastOpen() {
    if (this.service !== null) {
      const filter = {};
      const columns = ['T_ID','TM_START_TIME'];
      this.service.query(filter, columns, 'openTimer').subscribe(resp => {
        if (resp.code === 0) {
          if (resp.data.length > 0) {
            this.startTime = resp.data[0].TM_START_TIME;
            this.iniciarContador();
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