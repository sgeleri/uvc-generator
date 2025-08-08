import os
import re
import sys

def process_file(template_path, header, footer, name, out_fname):
    with open(template_path, 'r') as f:
        content = f.read()
    # Replace <name> and <NAME>
    content = re.sub(r'<name>', name.lower(), content)
    content = re.sub(r'<NAME>', name.upper(), content)

    # Add header and footer
    return header + '\n' + content + '\n' + footer

def main(name=None):
    if name is None:
        if len(sys.argv) > 1:
            name = sys.argv[1]
        else:
            name = input("Enter UVC name: ").strip()
    workspace = os.path.dirname(os.path.abspath(__file__))
    out_dir = os.path.join(workspace, f"{name.lower()}_uvc")
    os.makedirs(out_dir, exist_ok=True)

    # Read header and footer
    with open(os.path.join(workspace, "header_footer.txt"), 'r') as f:
        header_footer = f.read()
    header, footer = header_footer.split('// FOOTER', 1)

    # Process all *_template.svh files
    for fname in os.listdir(workspace):
        if fname.endswith("_template.svh"):
            in_path = os.path.join(workspace, fname)
            base = fname.replace("_template.svh", "")
            out_fname = f"{name.lower()}_{base}.svh"
            out_path = os.path.join(out_dir, out_fname)
            processed = process_file(in_path, header.strip(), footer.strip(), name, out_fname)
            with open(out_path, 'w') as out_f:
                out_f.write(processed)
            print(f"Generated: {out_path}")

if __name__ == "__main__":
    main()