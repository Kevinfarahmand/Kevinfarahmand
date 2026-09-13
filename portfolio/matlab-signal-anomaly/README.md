# MATLAB Signal Analysis and Anomaly Detection

A compact engineering portfolio project demonstrating practical MATLAB skills in time-series analysis, signal processing, visualization, and robust anomaly detection.

## Project goal

The script simulates a noisy sensor signal containing normal periodic behavior plus several short fault-like events. It then:

- generates synthetic sensor data,
- estimates the local baseline using a moving median,
- computes a robust anomaly score using a moving MAD,
- detects transient anomalies,
- performs FFT-based frequency analysis,
- visualizes both time-domain and frequency-domain behavior,
- exports the complete analysis to CSV.

## Why this project is useful

This workflow is representative of real engineering tasks involving condition monitoring, vibration or sensor analysis, electrical measurements, industrial fault detection, noisy time-series data, and exploratory signal analysis.

## Files

- `signal_anomaly_analysis.m` — main MATLAB script
- `UPWORK_PORTFOLIO_TEXT.md` — ready-to-use portfolio description

## MATLAB skills demonstrated

MATLAB scripting, vectorized calculations, moving statistics, robust statistics, FFT analysis, table export, plotting, engineering interpretation, and reproducible analysis.

## How to run

Open `signal_anomaly_analysis.m` in MATLAB and run the script. No external data files are required. The script writes `signal_analysis_results.csv` to the current MATLAB folder.

## Notes

The dataset is synthetic and intentionally includes transient anomalies so that the analysis can be reproduced without exposing any client or proprietary data.
