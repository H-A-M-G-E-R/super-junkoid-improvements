import glob, hashlib, os.path, subprocess, sys

sample_paths = glob.glob('ASM/music2/**/*.brr' if len(sys.argv) == 1 else sys.argv[2], recursive=True)

checksum_2_sample = {}

for sample_path in sample_paths:
    checksum = hashlib.md5(open(sample_path, 'rb').read()).hexdigest()
    if checksum in checksum_2_sample:
        checksum_2_sample[checksum].append(sample_path)
    else:
        checksum_2_sample[checksum] = [sample_path]

for (checksum, sample_paths) in checksum_2_sample.items():
    print(checksum)
    for sample_path in sample_paths:
        print(sample_path)
    print()
