# Whisper 使用教學

- [How to Install FFmpeg on CentOS 7](https://sysadminxpert.com/install-ffmpeg-on-centos-7/)
- [whisper](https://github.com/openai/whisper)
- [test-whisper](https://github.com/smallko/test-whisper)

安裝自動上字幕人工智慧。

## 安裝環境

會需要 FFmpeg 的影像處理套件與函式，因此需要安裝：

```bash
# on Ubuntu or Debian
sudo apt update && sudo apt install ffmpeg
```

使用以下指令安裝：

```bash
pip install -U openai-whisper
```

## 執行範例

```python
# Import the module
from pytube import YouTube
import whisper
import torch
import os
from whisper.utils import get_writer

# Initialize the device
device = "cuda" if torch.cuda.is_available() else "cpu"

# Load the model 
whisper_model = whisper.load_model("small", device=device)

def download_video(video_URL, destination, final_filename):
  video = YouTube(video_URL)
  progMP4 = video.streams.filter(progressive=True, file_extension='mp4')
  #print(progMP4)
  
  targetMP4 = progMP4.order_by('resolution').desc().first()
  #print(targetMP4)
  
  video_file = targetMP4.download()
  #print(video_file)
  
  _, ext = os.path.splitext(video_file)
  new_file = final_filename + '.mp4' 
  
  # Change the name of the file
  os.rename(video_file, new_file) 
 
  
# Video to Audio
video_URL = 'https://www.youtube.com/watch?v=-yLR4ynEK4I&t=91s'
destination = "."
final_filename = "p4switch1"
download_video(video_URL, destination, final_filename)
print("download is done")

mp4file = final_filename + ".mp4"
result = whisper_model.transcribe(mp4file)

# Print the final result
#print(result["text"])

# save SRT
srt_writer = get_writer("srt", destination)
srt_writer(result, final_filename)
```
