# Gunakan Node.js versi 18
FROM node:18-alpine

# Tentukan folder kerja di dalam server
WORKDIR /app

# Copy package.json dan install dulu (biar cepat)
COPY package*.json ./
RUN npm install

# Copy semua kodingan kamu
COPY . .

# Proses build aplikasi Vite/React menjadi folder 'dist'
RUN npm run build

# Install server 'serve' untuk menjalankan folder dist
RUN npm install -g serve

# Beritahu Google Cloud untuk buka pintu 8080
EXPOSE 8080

# Perintah untuk menyalakan aplikasi
CMD ["serve", "-s", "dist", "-l", "8080"]