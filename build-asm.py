import subprocess

subprocess.run(["mkdir", "-p", "firstiso/"])

subprocess.run([
    "nasm",
    "-f",
    "bin",
    "-o",
    "first.bin",
    "firstiso/first.flp"
])
