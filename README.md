<a href="https://github.com/andrewshowers/BeatBlendr/actions"><img src="https://github.com/andrewshowers/BeatBlendr/workflows/test-my-app/badge.svg" alt="Build Status"></a>
# MusicApp
An app to give users personalized music recommendations

### Made by: 
---
#### Brendan Lewis
#### Andrew Showers
---
## 1 Abstract
Welcome to the Music Recommendation App, a mobile client-server application designed to provide users with personalized song recommendations based on their input. This project utilizes the MERN stack for the backend and Flutter for the user interface. Many people are stuck listening to the same music for months to years at a time wishing that they could find something new that fits their style. This application aims to address this issue by providing simple recomendations to the user.

## 2 Introduction
The goal of this app is to help users discover music that they enjoy in a fast, easy to use form. Users will quickly input information such as: music platforms used, favorite genres, and favorite artists before getting a personalized feed of music that they might enjoy. 

## 3 Architectural Design
The app will be a Client-Server Application where the app will send a request with their song/artist of choice to the server and recieve the song recomendations back. The server will uses the database to search for known songs.

 ### 3.1 Use Case Diagram
<p align="center">
  <img src="regex/MusicApp_Use_Case.png" width="500" title="Use Case Diagram">
  <br>
  <br>
 Figure 1: Use Case Diagram for Music App
</p>

 ### 3.2 Sequence Diagram
 <p align="center">
  <img src="regex/MusicApp_Sequence.png" width="600" title="Use Case Diagram">
  <br>
  <br>
  Figure 2: Sequence Diagram for Music App
</p>

 ### 3.3 Class Diagram
 <p align="center">
  <img src="regex/MusicApp Class Diagram.png" width="600" title="Use Case Diagram">
  <br>
  <br>
  Figure 3: Class Diagram for Music App
</p>

## 4 Video

### 4.1 New Video
[https://youtu.be/RQkuuv4jIJQ](https://youtu.be/RQkuuv4jIJQ)https://youtu.be/RQkuuv4jIJQ

### 4.2 App Functionality 
[https://youtu.be/_o13jRvfNTI](https://youtu.be/_o13jRvfNTI)https://youtu.be/_o13jRvfNTI

### 4.3 Old Video for reference
[https://youtu.be/-Fo75aVzfNM](https://youtu.be/-Fo75aVzfNM)https://youtu.be/-Fo75aVzfNM


## 5 Risk Analysis and Retrospective
As this app was in development, we wanted to create a login so that the user might be able to store their information. This created the risk of losing personal information such as emails, usernames, or passwords. We decided that since the app did not need to keep a record of the users songs, there was no need for authentication. Therefore, negating this risk. 
In order to tailor the app to the needs of the client, we changed the songs recommendations to a hard-coded database, instead of using a server. This allows for the user to get a response with almost no delay, and makes it much easier for the client to upload their own song to the library.
We also encountered an issue with the 'Insert a song' page. Since the software was looking for a key specific genre, if a user input 'pop' instead of the capitalized 'Pop', the song would be lost in the library. So, in order to combat this issue there is now a drop down menu so that the input will always be consistent with spelling and only allow for proper genre inputs.
At first, the song insertion page did not refresh or allow for the user to confirm that their song was added to the database. In solving this problem, after hitting 'submit' the text boxes would be cleared, and there is not a pop up that verifies the song being inserted and relays this information back to the user. 



 
