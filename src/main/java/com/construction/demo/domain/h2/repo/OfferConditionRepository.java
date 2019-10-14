package com.construction.demo.domain.h2.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.construction.demo.domain.h2.entity.OfferCondition;

/**
 * @author Milivoje Nesic
 */
@Repository
public interface OfferConditionRepository extends JpaRepository<OfferCondition, Long> {

}