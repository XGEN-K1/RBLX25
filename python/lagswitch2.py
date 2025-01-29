import subprocess
from pynput import keyboard

# Змінна для відстеження стану підключення
connection_status = True

def toggle_connection():
    global connection_status
    if connection_status:
        # Відключення інтернету та Wi-Fi
        subprocess.run(['netsh', 'interface', 'set', 'interface', 'name="Ethernet"', 'admin=disabled'], shell=True)
        subprocess.run(['netsh', 'wlan', 'disconnect'], shell=True)
        connection_status = False
        print("Інтернет та Wi-Fi відключені")
    else:
        # Підключення інтернету та Wi-Fi
        subprocess.run(['netsh', 'interface', 'set', 'interface', 'name="Ethernet"', 'admin=enabled'], shell=True)
        subprocess.run(['netsh', 'wlan', 'connect', 'name="Network1"'], shell=True)
        connection_status = True
        print("Інтернет та Wi-Fi підключені")

def on_press(key):
    if key == keyboard.Key.f4:  # Клавіша F4
        toggle_connection()

# Збір слухачів клавіатури
with keyboard.Listener(on_press=on_press) as listener:
    listener.join()
