import subprocess
import json
import os
from pynput import keyboard
import tkinter as tk
import webbrowser
from io import BytesIO
from PIL import Image, ImageTk

# Шлях до файлу конфігурації
CONFIG_FILE = "config.json"

# Завантаження конфігурації або встановлення значень за замовчуванням
def load_config():
    if os.path.exists(CONFIG_FILE):
        with open(CONFIG_FILE, "r") as file:
            return json.load(file)
    return {"hotkey": "f4", "last_connected_ssid": None}  # За замовчуванням F4

def save_config(config):
    with open(CONFIG_FILE, "w") as file:
        json.dump(config, file)

# Отримання списку доступних Wi-Fi мереж
def get_wifi_networks():
    result = subprocess.run(['netsh', 'wlan', 'show', 'networks'], capture_output=True, text=True, shell=True)
    networks = []
    for line in result.stdout.splitlines():
        if "SSID" in line:
            networks.append(line.split(':')[1].strip())
    return networks

# Змінна для відстеження стану підключення
connection_status = True
config = load_config()
selected_hotkey = config["hotkey"]
last_connected_ssid = config.get("last_connected_ssid")

def toggle_connection():
    global connection_status, last_connected_ssid
    if connection_status:
        # Відключення інтернету та Wi-Fi
        current_network = subprocess.run(['netsh', 'wlan', 'show', 'interfaces'], capture_output=True, text=True, shell=True)
        for line in current_network.stdout.splitlines():
            if "SSID" in line and not line.strip().startswith("BSSID"):
                last_connected_ssid = line.split(':')[1].strip()
                config["last_connected_ssid"] = last_connected_ssid
                save_config(config)
                break

        subprocess.run(['netsh', 'interface', 'set', 'interface', 'name="Ethernet"', 'admin=disabled'], shell=True)
        subprocess.run(['netsh', 'wlan', 'disconnect'], shell=True)
        connection_status = False
        status_label.config(text="Disconnected", fg="red")
        print("Інтернет та Wi-Fi відключені")
    else:
        # Підключення до збереженої мережі
        if last_connected_ssid:
            subprocess.run(['netsh', 'interface', 'set', 'interface', 'name="Ethernet"', 'admin=enabled'], shell=True)
            subprocess.run(['netsh', 'wlan', 'connect', f'name="{last_connected_ssid}"'], shell=True)
            print(f"Інтернет та Wi-Fi підключені до мережі: {last_connected_ssid}")
        else:
            print("Немає збереженої мережі для підключення")
        connection_status = True
        status_label.config(text="Connected", fg="green")

# Запуск GUI
root = tk.Tk()
root.title("Wifi lagswitch")
root.geometry("300x250")

# Завантаження іконки у правильному форматі з обробкою винятків
def get_icon():
    try:
        with open('ico.ico', 'rb') as f:
            img_data = f.read()
            icon = Image.open(BytesIO(img_data))
            return ImageTk.PhotoImage(icon)
    except FileNotFoundError:
        print("Іконка не знайдена, використовуємо стандартну.")
        return None

icon = get_icon()

if icon:
    root.iconphoto(False, icon)  # Використовуємо іконку, якщо вона знайдена
else:
    # Якщо іконка не знайдена, то залишаємо програму без іконки
    print("Іконка не була встановлена.")

hotkey_label = tk.Label(root, text=f"Hotkey: {selected_hotkey}")
hotkey_label.pack(pady=10)

status_label = tk.Label(root, text="Connected" if connection_status else "Disconnected", fg="green" if connection_status else "red")
status_label.pack(pady=10)

# Поле для введення нової гарячої клавіші
tk.Label(root, text="Enter new hotkey:").pack(pady=5)
hotkey_entry = tk.Entry(root)
hotkey_entry.pack(pady=5)

def save_hotkey():
    global selected_hotkey
    new_hotkey = hotkey_entry.get()
    if new_hotkey:
        selected_hotkey = new_hotkey
        config["hotkey"] = selected_hotkey
        save_config(config)
        hotkey_label.config(text=f"Hotkey: {selected_hotkey}")

bind_button = tk.Button(root, text="Bind", command=save_hotkey)
bind_button.pack(pady=10)

# Додавання гіперпосилання
def open_link(event):
    webbrowser.open("https://pynput.readthedocs.io/en/latest/keyboard.html#pynput.keyboard.Key")

link_label = tk.Label(root, text="About key names", fg="blue", cursor="hand2")
link_label.pack(pady=5)
link_label.bind("<Button-1>", open_link)

# Налаштування гарячої клавіші
listener = keyboard.Listener(
    on_press=lambda key: toggle_connection() if hasattr(key, 'name') and key.name == selected_hotkey else None
)
listener.start()

root.mainloop()
listener.stop()
