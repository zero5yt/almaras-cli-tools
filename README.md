<h1 align="center">
  <span style="color: cyan; text-shadow: 0 0 10px cyan, 0 0 20px cyan;">
    ALMARAS CLI TOOLS
  </span>
</h1>

<p align="center">
  <em>Automated Scene Detection & Reels Clipping for Termux</em>
</p>

---

## 🚀 Overview
**Almaras CLI Tools** ay isang collection ng automation scripts na binuo para sa Termux. Ang focus nito ay ang mabilisang pag-cut ng mga pelikula para gawing vertical (9:16) clips na ready na para sa Reels o TikTok.

## ✨ Features
- **Smart Scene Detection**: Awtomatikong hinahanap ang bawat cut ng movie.
- **Vertical Ready**: Awtomatikong crop sa 9:16 aspect ratio (1080x1920).
- **Lightning Fast**: Optimized encoding gamit ang FFmpeg.

---

## 🛠️ Tutorial: Setup sa Termux

Siguraduhin na ang iyong Termux ay updated bago magsimula.

### Step 1: Install Required Tools
I-copy at i-paste ang command na ito:
```bash
pkg update && pkg upgrade -y
pkg install ffmpeg python clang libffi openssl -y
pip install scenedetect
