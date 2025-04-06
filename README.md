# 🐉 Kali Linux

A lightweight setup to run Kali Linux with a GUI using Docker and Docker Compose.

---

## 📋 Prerequisites

1. 🐳 **Docker** and **Docker Compose** must be installed on your system.
2. 🖥️ Install a VNC client:
   - **Linux**: `tigervnc-viewer` or `remmina`
   - **Windows**: `RealVNC Viewer` or `TightVNC` (`choco install tightvnc`)
   - **macOS**: `RealVNC Viewer` or `Chicken of the VNC`
3. 🔑 Create a `.env` file with the following content:
  
   ```env
   VNC_PASSWORD=your_password_here
   ```

---

## 📦 Pulling the Image

To pull the official Kali Linux image:

```bash
docker pull docker.io/kalilinux/kali-rolling
```

---

## 🛠️ Building and Running the Container

### 🔨 Using Dockerfile Only

1. Build the image:
  
   ```bash
   docker build -t kali-gui .
   ```

1. Start the service:

   ```bash
   docker-compose up -d
   ```

---

## 🖥️ Accessing the Kali Linux Desktop

The `kali-gui` service allows you to access the Kali Linux desktop environment via VNC.

### 🚀 Steps to Access

1. **Start the Docker container**:

   ```bash
   docker-compose up -d
   ```

2. **Connect to the VNC server**:
   - Open your VNC client.
   - Enter the address: `localhost:5901` (or `127.0.0.1:5901`).
   - Enter the VNC password (configured in the `.env` file).

3. **Access the desktop**:
   - Once connected, you should see the Kali Linux desktop environment.

---

## 📝 Notes

- 🌐 If running on a remote server, replace `localhost` with the server's IP address and ensure port `5901` is open in the firewall.
- 🛠️ To check container logs for troubleshooting:

  ```bash
  docker logs kali-gui
  ```

- 🔒 Ensure the `.env` file contains the `VNC_PASSWORD` variable.

---

## 🛑 Stopping the Service

To stop the `kali-gui` service:

```bash
docker-compose down
```

---

## 📖 Additional Resources

- [Kali Linux Documentation](https://www.kali.org/docs/)
- [Docker Documentation](https://docs.docker.com/)
- [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/)
