import tkinter as tk
from tkinter import messagebox
import subprocess
import sys
import os

def run_script(event=None):
    uvc_name = name_entry.get().strip()
    if not uvc_name:
        messagebox.showwarning("Input Error", "Please enter a UVC name.")
        return
    # Call uvc_gen.py with the entered name
    subprocess.run([sys.executable, os.path.join(os.path.dirname(__file__), "uvc_gen.py"), uvc_name])
    messagebox.showinfo("Done", f"UVC files generated for: {uvc_name}")
    root.destroy()

def cancel(event=None):
    root.destroy()

root = tk.Tk("UVC Generator")
root.title("UVC Generator")
root.geometry("450x120")

frame = tk.Frame(root, padx=25, pady=25)
frame.pack(expand=True, fill="both")

label = tk.Label(frame, text="UVC Name", font=("Tahoma", 12))
label.place(x=20, y=20)

name_entry = tk.Entry(frame, width=30, font=("Tahoma", 12))
name_entry.place(x=100, y=20)
name_entry.focus()

generate_btn = tk.Button(frame, text="Generate", font=("Tahoma", 12), bd=4, bg='green', command=run_script)
generate_btn.place(x=100, y=60, width=100, height=30)
cancel_btn = tk.Button(frame, text="Cancel", font=("Tahoma", 12), bd=4, command=cancel)
cancel_btn.place(x=200, y=60, width=100, height=30)

root.bind('<Return>', run_script)
root.bind('<Escape>', cancel)

root.mainloop()