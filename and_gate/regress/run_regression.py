import os
import subprocess

TESTS = [
    "tb_and_gate"
]

def compile():
    print("Compiling RTL + TB...")
    os.system("make -C ../sim compile")

def run_test(test):
    print(f"Running {test}")
    cmd = f'vsim -c {test} -do "log -r /*; run -all; quit"'
    subprocess.run(cmd, shell=True)

if __name__ == "__main__":
    compile()

    for t in TESTS:
        run_test(t)

    print("Regression finished")