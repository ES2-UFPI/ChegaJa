package com.tech.chegaJa.controller;

import com.google.firebase.messaging.FirebaseMessagingException;
import com.tech.chegaJa.domain.dto.ClienteDto;
import com.tech.chegaJa.domain.form.ClienteForm;
import com.tech.chegaJa.service.FirebaseMessagingService;
import com.tech.chegaJa.service.Note;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;
import lombok.RequiredArgsConstructor;

import java.net.URI;

@RestController
@RequiredArgsConstructor
public class NotificationsController {
    private final FirebaseMessagingService firebaseService;

    @RequestMapping("/notificacoes/solicitacao/entrega")
    @ResponseBody
    public String enviarSolicitarEntrega(@RequestBody Note note,
                                       @RequestParam String token) throws FirebaseMessagingException{
        return firebaseService.sendNotification(note, token);

    }

}
