# Gunakan Node.js versi yang stabil
FROM node:20

# Set working directory
WORKDIR /app

# Copy package file dan install dependencies
COPY package*.json ./
RUN npm install

# Copy semua source code
COPY . .

# Build aplikasi Vue.js untuk produksi
RUN npm run build

# Gunakan server ringan untuk serve hasil build
RUN npm install -g serve

# Jalankan aplikasi
CMD ["serve", "-s", "dist", "-l", "8080"]

# Port yang diekspos (harus sesuai dengan service di OpenShift)
EXPOSE 8080
