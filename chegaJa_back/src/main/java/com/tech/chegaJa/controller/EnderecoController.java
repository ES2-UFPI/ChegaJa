package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.EmpresaDto;
import com.tech.chegaJa.domain.dto.EnderecoDto;
import com.tech.chegaJa.domain.form.EmpresaForm;
import com.tech.chegaJa.domain.form.EnderecoForm;
import com.tech.chegaJa.service.EmpresaService;
import com.tech.chegaJa.service.EnderecoService;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/endereco")
@RequiredArgsConstructor
public class EnderecoController {
    private final EnderecoService service;

    @PostMapping
    public ResponseEntity<EnderecoDto> cadastrar(@RequestBody EnderecoForm form, UriComponentsBuilder uriBuilder){
        EnderecoDto dto = service.cadastrar(form);
        URI uri = uriBuilder.path("/endereco/{id}").buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
    @GetMapping
    public ResponseEntity<Page<EnderecoDto>> listar(@ParameterObject @PageableDefault(sort = "id") Pageable pageable){
        return ResponseEntity.ok(service.listar(pageable));
    }
    @GetMapping("/{id}")
    public ResponseEntity<EnderecoDto> visualizar(@PathVariable Long id){
        return ResponseEntity.ok(service.visualizar(id));
    }
}
