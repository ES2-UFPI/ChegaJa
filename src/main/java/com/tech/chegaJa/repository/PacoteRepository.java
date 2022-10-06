package com.tech.chegaJa.repository;

import com.tech.chegaJa.domain.model.Pacote;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PacoteRepository extends JpaRepository<Pacote,Long> {
    List<Pacote> findAllByEntrega_Id(Long idEntrega);
}