console.log("Loading player");
var tag = document.createElement("script");

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName("script")[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

const playButton = document.getElementById("play-button");
const pauseButton = document.getElementById("pause-button");
const repeatButton = document.getElementById("repeat-button");
const videoUrl = document.getElementById("video-url");

const startMinute = document.getElementById("start-minute");
const startSecond = document.getElementById("start-second");

const endMinute = document.getElementById("end-minute");
const endSecond = document.getElementById("end-second");

const playbackRate = document.getElementById("playback-rate")
const playbackRateValue = document.getElementById("playback-rate-value")


// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
var videoId = "ZxGiEoczryg";
var startSeconds = 0;
var endSeconds = 0;

var loop = false;

var video = {
  id: videoId,
  duration: 0,
}
function onYouTubeIframeAPIReady() {
  player = new YT.Player("player", {
    height: "390",
    width: "640",
    videoId: videoId,
    playList: videoId,
    playerVars: {
      playsinline: 1,
    },
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange, 
    }
  });
}

// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
  const duration = event.target.getDuration();
  
  const minutes = (duration / 60).toFixed()
  const seconds = duration % 60
  endMinute.value = minutes
  endSecond.value = seconds

  event.target.playVideo();
}

function onPlayerStateChange(event) {
  if (event.data == YT.PlayerState.ENDED && loop) {
    event.target.seekTo(startSeconds)
    event.target.playVideo();
  }
}

// 5. The API calls this function when the player's state changes.
//    The function indicates that when playing a video (state=1),
//    the player should play for six seconds and then stop.
function stopVideo() {
  player.stopVideo();
}

function playVideo() {
  player.playVideo();
}

function setLoop(shouldLoop) {
  loop = shouldLoop
}

function toggleLoop() {
  loop = !loop
}

function setStartSeconds(newStart) {
  startSeconds = newStart
  player.seekTo(Number(newStart));
}

function setEndSeconds(newEnd) {
  endSeconds = newEnd
  player.loadVideoById({ videoId, startSeconds, endSeconds: newEnd });
}

function setPlaybackRate(rate) {
  player.setPlaybackRate(Number(rate / 100));
}

function loadVideo(newVideoId) {
  videoId = newVideoId

  player.loadVideoById({ videoId: newVideoId })
}

function urlToVideoId(url) {
  const test1 = /v\=([a-zA-Z0-9\-_]+)\b/
  const test2 = /\b([a-zA-Z0-9\-_]+)\b(?=\?)/;

  const match1 = url.match(test1);
  if (match1 !== null) {
    return match1[1];
  }

  const match2 = url.match(test2);
  if (match2 !== null) {
    return match2[1];
  }

  return undefined;
}

function toSeconds(minutes, seconds) {
  return (Number(minutes) * 60) + Number(seconds)
}


function debounce(func, timeout = 300) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => {
      func.apply(this, args);
    }, timeout);
  };
}


playButton.addEventListener("click", () => {
  playVideo();
});

pauseButton.addEventListener("click", () => {
  stopVideo();
});

repeatButton.addEventListener("click", () => {
  setLoop(true);
});

videoUrl.addEventListener("input", (evt) => {
    const newVideoId = urlToVideoId(evt.target.value)
    if (newVideoId != undefined) {
      loadVideo(newVideoId)
    }
})

const debouncedStart = debounce(() => {
  const minute = startMinute.value
  const second = startSecond.value;
  
  setStartSeconds(toSeconds(minute, second))
})

const debouncedEnd = debounce(() => {
  const minute = endMinute.value
  const second = endSecond.value;
  
  setEndSeconds(toSeconds(minute, second))
})

const debouncedRateChange = debounce(() => {
  const rate = playbackRate.value;

  console.log('changing rate to: ', rate / 100)

  setPlaybackRate(rate)
  playbackRateValue.textContent = rate 
  
})

startMinute.addEventListener("input", debouncedStart) 
startSecond.addEventListener("input", debouncedStart) 

endMinute.addEventListener("input", debouncedEnd) 
endSecond.addEventListener("input", debouncedEnd) 

playbackRate.addEventListener("input", debouncedRateChange) 
