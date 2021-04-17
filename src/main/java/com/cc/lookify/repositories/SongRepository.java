package com.cc.lookify.repositories;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cc.lookify.models.Song;

@Repository
public interface SongRepository extends CrudRepository<Song, Long>{
	
	ArrayList<Song> findAll();
	
	Optional<Song> findByArtistContaining(String search);
	
	Optional<Song> findById(Integer Id);
   
	ArrayList<Song> findTop10SongsByRatingOrderByRatingDesc(Integer rating);

	void deleteById(Long id);

}
