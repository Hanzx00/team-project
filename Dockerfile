# Gunakan image Python ringan
FROM python:3.9-slim

# Set folder kerja di dalam container
WORKDIR /app

# Install git dan perl untuk update_index.sh
RUN apt-get update && \
    apt-get install -y git perl && \
    apt-get clean

# Salin seluruh isi folder lokal ke dalam container
COPY . .

# Pastikan entrypoint.sh bisa dieksekusi
RUN chmod +x entrypoint.sh

# Jalankan entrypoint.sh saat container dijalankan
ENTRYPOINT ["./entrypoint.sh"]
