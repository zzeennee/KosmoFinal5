package com.example.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.domain.ImgVO;
@Repository
public interface ImgRepository extends CrudRepository<ImgVO, Integer> {

}
