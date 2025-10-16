FROM evolutionapi/evolution-api:latest

ENV SERVER_URL=https://evolution-api-whatsapp.onrender.com
ENV LOG_LEVEL=ERROR
ENV CORS_ORIGIN=*

EXPOSE 8080

CMD ["node", "/evolution/dist/src/main.js"]
