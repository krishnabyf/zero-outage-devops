FROM node:24-slim

WORKDIR /app
COPY app/package*.json ./
RUN npm ci --omit=dev
COPY app/index.js ./

ENV NODE_ENV=production
EXPOSE 3000

CMD ["node", "index.js"]
