import { AfterViewInit, Component, OnInit, ViewChild } from "@angular/core";
import { Injectable, Injector } from "@angular/core";
import { OComboComponent, OntimizeService } from "ontimize-web-ngx";

@Component({
  selector: "app-tracking-home",
  templateUrl: "./tracking-home.component.html",
  styleUrls: ["./tracking-home.component.scss"],
})
export class TrackingHomeComponent implements OnInit, AfterViewInit {

  // Cambiar valores (sin string)
  jornadaEstado: "iniciar" | "pausar" | "reanudar" | "finalizar" = "iniciar";

  mostrarIniciarJornada: boolean = true;

  protected service: OntimizeService;

  @ViewChild('taskCombo', {static: true})taskCombo : OComboComponent;

  constructor(protected injector: Injector) {
    this.service = this.injector.get(OntimizeService);
  }
  ngAfterViewInit(): void {
    console.log(this.taskCombo.getValue());
  }

  ngOnInit() {
    console.log(this.taskCombo);
    this.configureService();
  }

  protected configureService() {
    // Configure the service using the configuration defined in the `app.services.config.ts` file
    const conf = this.service.getDefaultServiceConfiguration("timers");
    this.service.configureService(conf);
  }

  startTimer() {
    if (this.service !== null) {
      const values = {T_ID: this.getComboValue()};
      this.service.insert(values, "timer").subscribe(resp => {
        if (resp.code === 0) {
        } else {
        }
        console.log(resp);
      });
    }
  }

  getComboValue() {
    return this.taskCombo.getValue();
  }

  iniciarJornada(): void {
    this.jornadaEstado = "pausar";
    this.mostrarIniciarJornada = false;
  }

  pausarJornada(): void {
    this.jornadaEstado = "reanudar";
  }

  reanudarJornada(): void {
    this.jornadaEstado = "pausar";
  }

  finalizarJornada(): void {
    this.jornadaEstado = "iniciar";
    this.mostrarIniciarJornada = true;
  }
}
