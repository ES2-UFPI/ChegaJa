package com.tech.chegaJa.domain.form;

import com.tech.chegaJa.service.Note;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NotificacaoForm {

    private String subject;
    private String content;
    private Map<String, String> data;
    private String image;

    private String token;

    public Note toEntity() {
        Note note = new Note();
        note.setSubject(this.subject);
        note.setContent(this.content);
        note.setData(this.data);
        note.setImage(this.image);
        return note;
    }
    //comentario

}
