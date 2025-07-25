🌐 Nginx Proxy Manager with Docker Compose
This project uses Docker Compose to self-host Nginx Proxy Manager, a powerful tool to manage your reverse proxies and SSL certificates with a simple web interface.


🚀 How to Use

Start the container:

docker compose up -d


Access the admin panel:

Open http://localhost:81 in your browser.



🔐 Default Login Credentials
⚠️ Be sure to update your login credentials after the first login.


Email: admin@example.com

Password: changeme


📁 Data Storage
./data – Stores Nginx Proxy Manager’s settings, users, proxy hosts, etc.

./letsencrypt – Stores Let's Encrypt certificates for managed domains.

These folders are mapped as volumes to persist your data even if the container is removed.



📌 Notes
Make sure ports 80, 443, and 81 are available on your host.

Works great with Cloudflare DNS and Docker services on the same network.

Can be used to securely expose Dockerized services, WordPress, Nextcloud, Flask, etc.