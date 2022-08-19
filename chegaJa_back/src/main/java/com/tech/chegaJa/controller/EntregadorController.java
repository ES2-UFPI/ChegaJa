package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.form.EntregadorForm;
import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.service.EntregadorService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
@RestController
@RequestMapping("/entregadores")
@RequiredArgsConstructor
public class EntregadorController{
    private final EntregadorService service;

    @PostMapping
    public ResponseEntity<EntregadorDto> cadastrar(@RequestBody EntregadorForm form, UriComponentsBuilder uriBuilder){
        EntregadorDto entregador = service.cadastrar(form);
        URI uri = uriBuilder.path("/entregadores/{id}").buildAndExpand(entregador.getId()).toUri();
        return ResponseEntity.created(uri).body(entregador);
    }
}
