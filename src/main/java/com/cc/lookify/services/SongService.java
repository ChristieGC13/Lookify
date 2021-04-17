package com.cc.lookify.services;

import java.util.ArrayList;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.cc.lookify.models.Song;
import com.cc.lookify.repositories.SongRepository;

@Service
public class SongService {
	private SongRepository songRepo;
	
	public SongService(SongRepository songRepo) {
		this.songRepo = songRepo;
	}
	
	public ArrayList<Song> getAll() {
		return (ArrayList<Song>) songRepo.findAll();
	}
	
	public Song create(Song newSong) {
		return songRepo.save(newSong);
	}
	
	//Search for songs by artist (needs revision)
	public Song findSongs(String search) {
        Optional<Song> optionalSong = songRepo.findByArtistContaining(search);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
    }
	
	//Query for top ten songs (needs revision)
	public ArrayList<Song> topTen(Integer rating) {
        return (ArrayList<Song>) songRepo.findTop10SongsByRatingOrderByRatingDesc(rating);
    }
	
	public Song findSong(Long id) {
		Optional<Song> optionalSong = songRepo.findById(id);
		if(optionalSong.isPresent()) {
            return optionalSong.get();
        } else {
            return null;
        }
	}

	public void deleteSong(Long id) {
		songRepo.deleteById(id);		
	}


}
