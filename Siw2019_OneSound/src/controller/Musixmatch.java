package controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jmusixmatch.MusixMatch;
import org.jmusixmatch.MusixMatchException;
import org.jmusixmatch.entity.lyrics.Lyrics;
import org.jmusixmatch.entity.track.Track;
import org.jmusixmatch.entity.track.TrackData;
import org.json.JSONObject;

@WebServlet(urlPatterns = { "/getLyrics"})
public class Musixmatch extends HttpServlet {
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String trackName = req.getParameter("titolo");
		String artistName = req.getParameter("artista");
		String apiKey = "8e514b378525ffbc858e64ed41dab4e6";
		MusixMatch musixMatch = new MusixMatch(apiKey);
		Track track;
		String lyricsresult = "";
		try {
			track = musixMatch.getMatchingTrack(trackName, artistName);
			TrackData data = track.getTrack();
			int trackID = data.getTrackId();

			Lyrics lyrics = musixMatch.getLyrics(trackID);
			
			lyricsresult = lyrics.getLyricsBody();
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		JSONObject json = new JSONObject();
		json.put("result",lyricsresult);
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toString());
	}

	public static void main(String[] args) {
		String apiKey = "8e514b378525ffbc858e64ed41dab4e6";
		MusixMatch musixMatch = new MusixMatch(apiKey);
		String trackName = "Back In Black";
		String artistName = "AC DC";

		// Track Search [ Fuzzy ]
		Track track;
		try {
			track = musixMatch.getMatchingTrack(trackName, artistName);
			TrackData data = track.getTrack();

			System.out.println("AlbumID : "    + data.getAlbumId());
			System.out.println("Album Name : " + data.getAlbumName());
			System.out.println("Artist ID : "  + data.getArtistId());
			System.out.println("Album Name : " + data.getArtistName());
			System.out.println("Track ID : "   + data.getTrackId());
			
			int trackID = data.getTrackId();

			Lyrics lyrics = musixMatch.getLyrics(trackID);

			System.out.println("Lyrics ID       : "     + lyrics.getLyricsId());
			System.out.println("Lyrics Language : "     + lyrics.getLyricsLang());
			System.out.println("Lyrics Body     : "     + lyrics.getLyricsBody());
		} catch (MusixMatchException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
