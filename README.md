# idealworks_assessment
## Robot Error Correlation Analysis

## Objective:
Analyze patterns in robot error occurrences to identify predictive relationships between different error types. The project includes exploratory data analysis, correlation analysis, time-series prediction, visualization, and optional anomaly detection.

## Project Structure

- Dockerfile – Defines the environment with Python, PySpark, and required libraries. Enables reproducible setup using Docker.
- requirements.txt – Lists all Python dependencies needed to run the project locally.
- robots_data/ – Folder containing the Parquet data files for robot states (not included in the repository; download from the provided link).
- notebook.ipynb (Jupyter notebooks) – Full code for tasks 1–5 and optional extra tasks.

## Tasks Overview
## Task 1: Load and Explore Robot State Data

- Initialize a Spark session and read Parquet files containing robot state data.
- Display the schema, total records, and sample rows for understanding the dataset.

## Task 2: Extract and Categorize All Error Messages

- Explode the errors array so each error becomes a separate row.
- Count occurrences of each error type and calculate statistics: max, min, and average.
- Store distinct error types for later analysis.

## Task 3: Calculate Co-Occurrence Probabilities Between Error Types

- Select the top-K most frequent errors.
- Group errors per timestamp and robot serial number.
- Generate unordered pairs of errors and compute conditional probabilities P(B∣A).

## Task 4: Time-Series Analysis
- Analyze whether specific errors predict other errors in the next timestamp.
- Compute predictive probabilities 𝑃(𝐵next|𝐴now)

## Task 5: Visualize Error Relationships
- Co-occurrence and predictive heatmaps for top errors.
- Network graphs:
    - Undirected for co-occurrence probabilities
    - Directed for predictive relationships

## Extra Task 1: EWMA-Based Anomaly Detection
- Apply an exponentially weighted moving average (EWMA) to detect unusual error patterns per robot.

## Extra Task 2: Calculate Error Impact on Robot Movement
- Analyze how different error types affect robot movement metrics (velocity, position, theta, localizationScore).
