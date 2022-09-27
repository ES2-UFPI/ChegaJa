package com.tech.chegaJa.controller;

import com.google.firebase.messaging.FirebaseMessagingException;
import com.tech.chegaJa.domain.dto.ClienteDto;
import com.tech.chegaJa.domain.form.ClienteForm;
import com.tech.chegaJa.domain.form.NotificacaoForm;
import com.tech.chegaJa.service.FirebaseMessagingService;
import com.tech.chegaJa.service.Note;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/notificacoes")
@RequiredArgsConstructor
public class NotificationsController {

    FirebaseMessagingService service;

    @PostMapping
    public ResponseEntity<ClienteDto> solicitarEntrega(@RequestBody NotificacaoForm form, UriComponentsBuilder uriBuilder){
        //ClienteDto dto = service.cadastrar(form);
        Note note = new Note();

        try {
            service.sendNotification(note, form.getToken());
        } catch (FirebaseMessagingException e) {

        }

        URI uri = uriBuilder.path("/notificacoes/solicitacao/entrega").buildAndExpand(dto.getId()).toUri();
        return ResponseEntity.created(uri).body(dto);
    }

}
