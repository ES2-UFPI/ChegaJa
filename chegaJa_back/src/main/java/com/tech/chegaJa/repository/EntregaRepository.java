package com.tech.chegaJa.repository;

import com.tech.chegaJa.domain.model.Entrega;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EntregaRepository extends JpaRepository<Entrega, Long> {
    List<Entrega> findAllByEmpresa_Id(Long idEmpresa);

    List<Entrega> findAllByEntregador_Id(Long idEntregador);
}
