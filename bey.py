# -*- coding: utf-8 -*-
from lxml import html
import requests
import os

page = requests.get("https://www.vagalume.com.br/beyonce/")
tree = html.fromstring(page.content)
songs = tree.xpath("//*[@id='artSongs']/ul//li/a/span/text()")
songs_link = tree.xpath("//*[@id='artSongs']/ul/li/a[not(contains(text(), 'Tradu'))]/@href")

print ("name;#words;#words_unique;lyric")
for link in songs_link:
	link_page = "https://www.vagalume.com.br" + link
	song_page = requests.get(link_page, allow_redirects=False)
	
	if song_page.status_code == 200:
		song_tree = html.fromstring(song_page.content)
		song_lyrics = song_tree.xpath("//*[@id='lyr_original']/div/text()")
		lyric = (' '.join (song_lyrics)).replace('\n', '').encode("utf-8")
		words = lyric.split()
		words_unique = set(words)
		
		print (str(link) + ";" + str(len(words)) + ";" + str(len(words_unique)) + ";" + str(lyric).replace(';', ','))