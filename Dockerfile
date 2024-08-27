# Gebruik een officiële Node.js runtime als een basis image
FROM node:18

# Zet de werkdirectory
WORKDIR /usr/src/app

# Kopieer package.json en package-lock.json
COPY package*.json ./

# Installeer dependencies
RUN npm install
RUN npm install dotenv

# Kopieer de rest van de applicatie code
COPY . .

# Installeer pm2
RUN npm install pm2 -g

# Expose poorten indien nodig
EXPOSE 3000

# Start de applicatie met pm2
CMD ["pm2-runtime", "ecosystem.config.js"]
