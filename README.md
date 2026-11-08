# CPU Scheduler Simulator

A CPU scheduler simulator written in Python for my CYCS4540 Operating Systems class.

## Usage

Needs Python 3.10 or newer.

```
python schsim [-v] -s <scheduler> [-q <quantum>] <input.csv> <output.csv>
```

- `-s` scheduler to run: `FF`, `RR`, `SP`, `SR`, `HR` or `FB`
- `-q` time quantum for `RR` and `FB` (`FB` allows only 1 or 2)
- `-v` print the run tick by tick

## Schedulers

| Code | Scheduler |
|---|---|
| `FF` | First-Come-First-Served |
| `RR` | Round Robin |
| `SP` | Shortest Process Next |
| `SR` | Shortest Remaining Time |
| `HR` | Highest Response Ratio Next |
| `FB` | Feedback |
