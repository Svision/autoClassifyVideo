# autoClassifyVideos
Automatically classify your video by type: TV Shows / Movies.\
TV Shows will also be grouped by names

## Example:
### Before
```
.
├──downloads
│   └──Test.TV.Shows.S01
│   └──Test.TV.Shows.S02
│   └──Test.Movie1
│   └──Test.Movie2
├──video
│   └──TV Shows
│   └──Movies
```

### After Script
```
.
├──downloads
├──video
│   └──TV Shows
│       └──Test TV Shows
│           └──Test.TV.Shows.S01
│           └──Test.TV.Shows.S02
│   └──Movies
│     └──Test.Movie1
│     └──Test.Movie2
```

# Usage:
**IMPORTANT: Change variable and directory name before use**
```
./classify_videos.sh
```
