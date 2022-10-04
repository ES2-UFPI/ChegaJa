package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EntregaDto;
import com.tech.chegaJa.domain.dto.EntregadorDto;
import com.tech.chegaJa.domain.dto.EntregadorLocDto;
import com.tech.chegaJa.domain.form.EntregadorForm;
import com.tech.chegaJa.domain.form.EntregadorLocForm;
import com.tech.chegaJa.domain.model.Entregador;
import com.tech.chegaJa.service.EntregadorService;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.math.BigDecimal;
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
    @GetMapping
    public ResponseEntity<Page<EntregadorDto>> listar(@ParameterObject @PageableDefault(sort = "id") Pageable pageable){
        return ResponseEntity.ok(service.listar(pageable));
    }
    @GetMapping("/{id}")
    public ResponseEntity<EntregadorDto> visualizar(@PathVariable Long id){
        return ResponseEntity.ok(service.visualizar(id));
    }
    @PutMapping("/{id}")
    public ResponseEntity<EntregadorLocDto> alterarLocalizacao(@PathVariable Long id, @RequestBody EntregadorLocForm form){
        return ResponseEntity.ok(service.atualizarLoc(id,form));
    }
    @GetMapping("/proximos")
    public ResponseEntity<Page<EntregadorDto>> listarProximos(@ParameterObject @PageableDefault(sort = "id") Pageable pageable
            , @RequestParam(value = "latitude")BigDecimal latitude, @RequestParam(value="longitude")BigDecimal longitude){
        return ResponseEntity.ok(service.listarProximos(pageable,latitude,longitude));
    }
}
