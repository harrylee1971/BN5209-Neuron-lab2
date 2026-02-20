# BN5209 蚯蚓神經傳導電生理紀錄 (ENG Earthworm Nerve Conduction)

## 🎯 實驗目標
[cite_start]本專案的主要目的是透過紀錄蚯蚓的動作電位 (Action Potential, AP)，來進行基礎的電生理訊號分析 [cite: 4]。
* [cite_start]**生理測量**：利用蚯蚓筆直的解剖結構，直接且輕易地測量軸突長度並計算動作電位的神經傳導速度 (Conduction Velocity) [cite: 5]。
* [cite_start]**訊號處理實作**：練習基礎的訊號處理流程與程式編寫（推薦使用 MATLAB），從紀錄到的原始訊號中挖掘出有用的數據特徵 [cite: 13, 121]。

## 🛠️ 我做了哪些事 (實驗與處理步驟)

### 1. 數據採集 (Data Acquisition)
[cite_start]實驗使用雙通道 Neuron SpikerBox Pro 擷取神經訊號，並儲存為 `.wav` 音檔 [cite: 44, 48]。
* **實驗一：機械性刺激 (常溫)**
  * [cite_start]將蚯蚓浸泡在 10% 乙醇中麻醉約 4 分鐘 [cite: 64]。
  * [cite_start]將蚯蚓放置於輕木上，插入三根電極（避開神經索與腸道），並使用法拉第籠 (Faraday cage) 包覆以減少雜訊干擾 [cite: 67, 69]。
  * [cite_start]使用塑膠探針輕敲蚯蚓的前端 (Anterior) 與後端 (Posterior)，分別紀錄 30 秒至 1 分鐘的訊號 [cite: 72, 73]。
* **實驗二：溫度對傳導速度的影響 (低溫)**
  * [cite_start]將蚯蚓浸泡於冰水中 30 秒 [cite: 79]。
  * [cite_start]隨著蚯蚓體溫下降，重複測量其神經傳導速度，並與常溫下的結果進行比較 [cite: 80, 81]。

### 2. 訊號處理與數據分析 (Signal Processing)
撰寫程式對錄製的 `.wav` 檔進行後處理：
* [cite_start]**讀取訊號**：將音頻檔案載入程式環境 [cite: 124]。
* [cite_start]**數位濾波 (Digital Filter)**：設計並應用巴特沃斯濾波器 (Butterworth filter) 去除不需要的頻段與雜訊 [cite: 126, 128]。
* [cite_start]**頻域分析**：利用快速傅立葉轉換 (FFT) 計算各個電極的功率譜密度 (Power Spectral Density, PSD) [cite: 115, 130]。
* [cite_start]**速度計算**：透過交叉相關圖 (Cross-correlogram) 等方法找出訊號時間差，進而計算傳導速度 [cite: 131, 132]。

## 💡 實驗理想結果 (Expected Results)
* [cite_start]**傳導速度差異**：中央巨大軸突 (Median giant axon) 的體積較大，其神經傳導速度理應比兩側的側邊巨大軸突 (Lateral giants) 更快 [cite: 9]。
* [cite_start]**溫度效應**：根據已知的生理學原理，神經傳導速度會受到溫度影響；理想情況下，冰水浴（低溫）會導致神經傳導速度顯著下降 [cite: 117]。
* [cite_start]**法拉第籠的降噪效果**：有無使用法拉第籠的訊號品質應有明顯落差，法拉第籠能有效屏蔽外界電磁干擾，提升訊號雜訊比 (SNR) [cite: 96, 118, 119]。

## 🗣️ 實驗討論 (Discussion & Report Requirements)
未來的實驗報告或回顧時，需要針對以下幾點進行探討與圖表呈現：
1. [cite_start]**傳導速度統整**：列出表格比較不同條件（常溫 vs. 冰浴；前端刺激 vs. 後端刺激）下的神經傳導速度 [cite: 110]。
2. [cite_start]**時域訊號圖**：繪製常溫下前端刺激的代表性原始 ENG 訊號，並將兩個電極的訊號放在同一張圖中對比 [cite: 116]。
3. [cite_start]**頻域特徵圖**：繪製每個電極訊號的 PSD (功率譜密度) 圖表 [cite: 115]。
4. **原理解釋**：
   * [cite_start]實驗數據是否符合「溫度影響神經傳導速度」的生理學預期？ [cite: 117]
   * [cite_start]結合繪製出的圖表與數據，解釋法拉第籠為何必要以及它的實際功能 [cite: 118, 119]。

## 📂 專案架構
```text
BN5209-Earthworm-ENG/
│
├── raw_data/           # 存放 BYB Spike Recorder 錄製的 .wav 原始音檔
├── scripts/            # 存放 MATLAB 或 Python 訊號處理程式碼
│   ├── filter.m        # 數位濾波器設定
│   ├── psd_plot.m      # 計算與繪製 PSD
│   └── velocity.m      # 交叉相關與神經傳導速度計算
├── figures/            # 存放程式生成的時域波形圖與 PSD 頻譜圖
└── README.md           # 專案說明文件
