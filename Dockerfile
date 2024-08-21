# AstroJS aplikace
FROM node:22-alpine AS astrojs

# Nainstalujeme git a další potřebné nástroje
# Použijeme --no-cache, aby se nevytvářela dodatečná vrstva s cache
RUN apk update && apk add git --no-cache

# Nastavíme pracovní adresář v kontejneru
WORKDIR /app

# Nainstalujeme globálně create-astro CLI
RUN npm install -g create-astro astro

# Nainstalujeme závislosti projektu
COPY package*.json ./
RUN npm install

# Explicitně uvedeme, který port má být vystaven
EXPOSE 4321

# Příkaz pro spuštění Astro vývojového serveru
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]