import subprocess

subprocess.run([
    "mkisofs",
    "-o",
    "first.iso",
    "-b",
    "first.flp",
    "firstiso/"
])
