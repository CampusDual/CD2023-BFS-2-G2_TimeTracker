import { Component, ElementRef, OnInit } from '@angular/core';
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
  startTime: number;
  temporizadorInterval: any;

  protected service: OntimizeService;

  @ViewChild('taskCombo', { static: true }) taskCombo: OComboComponent;
  @ViewChild('crono', { static: true }) crono: ElementRef;

  constructor(protected injector: Injector) {
    this.service = this.injector.get(OntimizeService);
  }

  ngAfterViewInit(): void {
  }

  ngOnInit() {
    this.configureService();
    this.getLastOpen();
    this.startCrono();

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
      const values = { T_ID: this.getComboValue() };
      this.service.insert(values, "timer").subscribe(resp => {
        if (resp.code === 0) {
          this.selectedTaskValue = this.getComboValue();
          localStorage.setItem('timerStatus', 'true');
          localStorage.setItem('selectedTaskValue', JSON.stringify(this.selectedTaskValue));
          this.iniciarJornada();
          this.startCrono();
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
      clearInterval(this.temporizadorInterval);

    }
  }

  //meter en el otro método
  startCrono() { 
    
    if (this.service != null) {
      const filter = {};
      const columns = ['TM_START_TIME'];
      this.service.query(filter, columns, 'openTimer').subscribe(resp => {
        if (resp.code === 0) {
          if (resp.data.length>0){
          this.startTime = resp.data[0].TM_START_TIME;
          this.iniciarContador();
          }
          
        } else {

        }
      });
    }
  }

  iniciarContador() {

    let self = this;

    const actualizarTiempo = () => {

      let currentDate = new Date().getTime();
      let diff = currentDate - self.startTime;
      console.log(diff);
      let segundos = Math.floor(diff / 1000) % 60;
      let minutos = Math.floor((diff/1000)/ 60);

    
      const tiempoFormateado = `${String(minutos).padStart(2, "0")}:${String(segundos).padStart(2, "0")}`;

      self.crono.nativeElement.innerHTML = `${tiempoFormateado}`;
    }

    this.temporizadorInterval = setInterval(actualizarTiempo, 1000);
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
