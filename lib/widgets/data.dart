import 'package:flutter/material.dart';

class OnboardContent {
  String image;
  String text;
  String descripcion;

  OnboardContent({
    required this.image,
    required this.text,
    required this.descripcion,
  });
}

List<OnboardContent> contents = [
  OnboardContent(
    image: "assets/1.png",
    text: "Bienvenido/a",
    descripcion:
        "Socialitec es una aplicacion para poder conectarte con tus amigos del tec y explorar un nuevo mundo donde hacer amistades, compartir tus ideas o si lo prefieres, integrarte a alguno de los diferentes clubes que tenemos para ti.",
  ),
  OnboardContent(
    image: "assets/3.png",
    text: "¿No Sabes por donde empezar?",
    descripcion:
        "Nosotros te daremos unas cuantas opciones de que puedes hacer en nuestra aplicacion.",
  ),
  OnboardContent(
    image: "assets/4.png",
    text: "Publicaciones",
    descripcion:
        "Puedes inicar buscando y agragando a tus amigos, puedes tambien ver sus publicaciones o postear las tuyas, ademas de dejar comentarios e interaccionar para hacerle saber a ese amigo cuanta risa te da.",
  ),
  OnboardContent(
    image: "assets/5.png",
    text: "Perfiles",
    descripcion:
        "Tambien puedes entrar a sus perfiles y ver que han hecho recientemente, como que se fueron de fiesta...(y no te invitaron).",
  ),
];
