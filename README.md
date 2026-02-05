# State Feedback Controllers

## Overview

This project implements a **humanoid walking controller** based on a controller proposed in a research paper, modeled and validated using **MATLAB/Simulink**. The model is designed as an **educational and reproducible reference.**

## Motivation & Objectives

Humanoid walking is a challenging control problem due to:

- Nonlinear dynamics
- Underactuated systems
- Stability requirements (balance and ZMP/CoP constraints)

**Objectives of this project:**

- Implement the walking controller described in the reference paper
- Validate the controller in MATLAB/Simulink
- Visualize walking performance using key metrics such as CoM, CoP, and ZMP

## Reference Papers

The controllers implemented in this project are based on the following key research works:

1. **Q.-C. Zhong and D. Rees**, *Control of Uncertain LTI Systems Based on an Uncertainty and Disturbance Estimator*, ASME Journal of Dynamic Systems, Measurement, and Control, 2004.
2. **J. P. Kolhe et al.**, *Disturbance Estimation Based Robust Center of Mass Tracking Control of Humanoid Robot*, IFAC PapersOnLine, 2024.

## Controllers Implemented

This project implements and compares **two walking controllers** for humanoid CoM trajectory tracking:

1. **State Feedback Controller (SFC)** – baseline controller
2. **State Feedback Controller with Uncertainty and Disturbance Estimator (SFC + UDE)** – robust controller

Both controllers are implemented as **separate Simulink models** and evaluated under identical conditions to highlight performance differences.

---

## Theory Background

## 1. State Feedback Controller (SFC)

### Overview

The **State Feedback Controller (SFC)** is a classical control approach used as a baseline for humanoid Center of Mass (CoM) trajectory tracking. It assumes that the system dynamics are well known and that all required state variables are available for feedback.

---

### Key Assumptions

- The humanoid robot is modeled using a simplified **Linear Inverted Pendulum Model (LIPM)**.
- The Center of Mass (CoM) height remains constant during walking.
- All system states (CoM position and velocity) are measurable.
- External disturbances and model uncertainties are negligible.

---

### Control Principle

- The controller uses **state feedback** to regulate the CoM motion.
- A desired CoM trajectory is provided by a reference generator.
- The controller computes the control input such that the tracking error follows a stable second-order dynamic behavior.
- Controller gains are selected to achieve desired transient performance such as settling time and damping.

---

### Characteristics of SFC

- Simple and easy to implement.
- Computationally efficient.
- Effective when the model accurately represents the system.
- Commonly used as a **baseline controller** for comparison.

---

### Limitations of SFC

- Sensitive to external disturbances such as pushes or ground reaction forces.
- Performance degrades in the presence of modeling errors.
- Limited robustness for real-world humanoid walking scenarios.

---

## 2. State Feedback Controller with Uncertainty and Disturbance Estimator (SFC + UDE)

### Overview

The **State Feedback Controller with UDE (SFC + UDE)** is an enhanced version of the SFC designed to improve robustness. It explicitly estimates and compensates for unknown disturbances and model uncertainties affecting the humanoid robot during walking.

---

### Motivation for UDE Augmentation

- Humanoid robots operate in uncertain environments.
- External disturbances such as pushes, uneven terrain, and interaction forces cannot be avoided.
- A purely model-based controller like SFC cannot handle these uncertainties effectively.
- UDE provides a systematic way to estimate and cancel these effects in real time.

---

### Control Principle

- The nominal SFC structure is retained.
- An **Uncertainty and Disturbance Estimator (UDE)** is added to the control loop.
- The UDE observes the combined effect of disturbances and uncertainties using system states and control inputs.
- A low-pass filtering mechanism is used to estimate disturbances without amplifying noise.
- The estimated disturbance is fed back into the control input to cancel its effect.

---

### Characteristics of SFC + UDE

- Explicit estimation and compensation of disturbances.
- Improved robustness against external forces and modeling errors.
- No direct measurement of disturbances is required.
- Maintains the same desired tracking behavior as the nominal SFC.
- Produces smoother control actions compared to delay-based disturbance estimation methods.

---

### Advantages over SFC

- Significantly reduced CoM tracking error under disturbances.
- Enhanced walking stability.
- Better performance during push-recovery scenarios.
- More suitable for practical humanoid walking applications.

### Both controllers are implemented as **separate Simulink models** and evaluated under identical conditions to highlight performance differences.

---

## How to Run the Simulation

### Step 1: Open MATLAB

Set the project root directory as the MATLAB working directory.

```tsx
\State Feedback Controllers\SFC 
OR
\State Feedback Controllers\UDE_SFC
```

### Step 2: Initialize Parameters

Run the initialization script:

```tsx
 ref_data_zir.m ---file
```

### Step 3: Open Simulink Model

Open the Simulink file:

```tsx
slipm3D_zir.slx
```

### Step 4: Run Simulation

Click **Run** in Simulink

## Outputs & Results

To visualize and analyze the simulation results click on  the **Simulink scopes in model.**

Or open 

```vhdl
 State Feedback Controllers\Snapshots_SFC&SFC_UDE --Folder
```

## Comparison between Two Controllers

Open 

```vhdl
State Feedback Controllers\comp_ude_SFC -- Folder
```

Run

```vhdl
Compare_SFC_SFCude.m -- File
```
