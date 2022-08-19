package com.tech.chegaJa.controller;

import com.tech.chegaJa.domain.dto.EnderecoDto;
import com.tech.chegaJa.domain.dto.FormaPagamentoDto;
import com.tech.chegaJa.domain.form.EnderecoForm;
import com.tech.chegaJa.domain.form.FormaPagamentoForm;
import com.tech.chegaJa.service.EnderecoService;
import com.tech.chegaJa.service.FormaPagamentoService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
@RestController
@RequestMapping("/forma-pagamento")
@RequiredArgsConstructor
public class FormaPagamentoController {
    private final FormaPagamentoService service;

    @PostMapping
    public ResponseEntity<FormaPagamentoDto> cadastrar(@RequestBody FormaPagamentoForm form, UriComponentsBuilder uriBuilder){
        FormaPagamentoDto dto = service.cadastrar(form);
        URI uri = uriBuilder.path("/forma-pagamento/{id}").buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }
}
