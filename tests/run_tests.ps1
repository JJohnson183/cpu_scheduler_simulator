# Windows version of the input1 tests: runs schsim on each scheduler and compares to the expected csv
$root = Split-Path $PSScriptRoot # Project folder, so this works from anywhere
$out = "$env:TEMP\schsim_out.csv"

foreach ($name in 'FF', 'SP', 'SR', 'HR', 'RR-q1', 'RR-q4') {
    # Split names like RR-q4 into the scheduler (RR) and the time quantum args (-q 4)
    $scheduler, $quantum = $name -split '-q'
    $quantumArgs = if ($quantum) { '-q', $quantum } else { @() }

    python "$root\schsim" -v -s $scheduler @quantumArgs "$root\tests\input1\in.csv" $out | Out-Null
    if ($LASTEXITCODE -ne 0) { "$name  FAIL (program error)"; continue }

    # Compare line by line so Windows vs Linux line endings don't matter
    $actual = (Get-Content $out) -join "`n"
    $expected = (Get-Content "$root\tests\input1\$name.csv") -join "`n"
    if ($actual -ceq $expected) { "$name  PASS" } else { "$name  FAIL (wrong output)" }
}
