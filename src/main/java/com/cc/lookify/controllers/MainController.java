package com.cc.lookify.controllers;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cc.lookify.models.Song;
import com.cc.lookify.services.SongService;

@Controller
public class MainController {

	private SongService songServ;
	
	public MainController(SongService songServ) {
		this.songServ = songServ;
	}
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
		public String dashboard(Model model) {
			model.addAttribute("newSong", new Song());
			model.addAttribute("allSongs", songServ.getAll());
			return "dashboard.jsp";
	}
	
	@GetMapping("/songs/new")
	public String create(Model model) {
		model.addAttribute("newSong", new Song());
		return "new.jsp";
	}
	
	@PutMapping("/songs/new")
	public String create(@Valid @ModelAttribute("newSong") Song newSong, BindingResult result) {
		if (result.hasErrors()) {
			return "new.jsp";
		}
		songServ.create(newSong);
		return "redirect:/dashboard";
	}
	
	@GetMapping("/search/topTen")
	public String topTen(Model model, Integer rating) {
		ArrayList<Song> songs = songServ.topTen(rating);
		model.addAttribute("Song", songs);
		return "topsongs.jsp";
	}
	
	@GetMapping("/search/{search}")
	public String search(Model model, @PathVariable("search") String search) {
		Song songs = songServ.findSongs(search);
		model.addAttribute("song", songs);
		return "search.jsp";
	}
	
	@GetMapping("/songs/{id}")
	public String details(Model model, @PathVariable("id") Long id) {
		model.addAttribute("song", songServ.findSong(id));
		return "details.jsp";
	}
	
	@DeleteMapping("/songs/{id}")
	public String destroy(@PathVariable("id") Long id) {
		songServ.deleteSong(id);
		return "redirect:/dashboard";
	}
}
