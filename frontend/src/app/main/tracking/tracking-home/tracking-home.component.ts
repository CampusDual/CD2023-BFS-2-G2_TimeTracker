import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-tracking-home',
  templateUrl: './tracking-home.component.html',
  styleUrls: ['./tracking-home.component.css']
})
export class TrackingHomeComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }



  jornadaEstado: 'iniciar' | 'pausar' | 'reanudar' | 'finalizar' = 'iniciar';

  mostrarIniciarJornada: boolean = true;

  iniciarJornada(): void {
    this.jornadaEstado = 'pausar';
    this.mostrarIniciarJornada = false;
  }

  pausarJornada(): void {
    this.jornadaEstado = 'reanudar';
  }

  reanudarJornada(): void {
    this.jornadaEstado = 'pausar';
  }

  finalizarJornada(): void {
    this.jornadaEstado = 'iniciar';
    this.mostrarIniciarJornada = true;
  }



}
