import glob, os.path, subprocess, sys

asar_dir = sys.argv[1]
asm_paths = glob.glob('ASM/music2/**/*.asm' if len(sys.argv) == 2 else sys.argv[2], recursive=True)

for asm_path in asm_paths:
    if not asm_path.endswith('defines.asm') and not asm_path.endswith('music.asm'):
        nspc_path = os.path.splitext(asm_path)[0] + '.nspc'
        try:
            os.remove(nspc_path)
        except:
            pass
        subprocess.run([asar_dir, '--fix-checksum=off', asm_path, nspc_path])
