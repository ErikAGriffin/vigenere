<h1>Vigenère Cipher</h1>
<h4>After doing the caeser cipher, I became interested in other types of ciphers and decided to give a crack at creating the Vignére Cipher in Ruby.</h4>
<p><i>From Wikipedia, the free encyclopedia</i></p>
<b>The Vigenère cipher is a method of encrypting alphabetic text by using a series of different Caesar ciphers based on the letters of a keyword. It is a simple form of polyalphabetic substitution.</b>

<p>
The idea is that you can use this encryption with only a pen and paper, and it doesn't hurt to have a <a href ="http://mysteriouswritings.com/wp-content/uploads/2012/05/600px-Vigen%C3%A8re_square_shading.svg1_.png">tabula recta</a> as well. The key will only be repeated over alphabetic and numeric characters, so spaces and punctuation are ignored.  In fact, it's better to not use any punctuation as it could give hints as to the nature of the message and the key.
Note that the message can be broken using letter frequency analysis because of the repeating nature of the key.
</p>

