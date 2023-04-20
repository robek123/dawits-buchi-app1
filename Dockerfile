
                FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

                COPY ./app /app

                RUN pip install -r /app/requirements.txt
                 

File_operation : NEW_FILE 
      filepath : docker-compose.yml 
      Content : 
                  version: '3.8'

                  services:
                    web:
                      build: .
                      command: uvicorn app.main:app --host 0.0.0.0 --port 3000
                      volumes:
                        - .:/app
                      ports:
                        - "3000:3000"
                  

File_operation : NEW_FILE 
      filepath : ./app/__init__.py 
      Content : 

                  

File_operation : NEW_FILE 
      filepath : ./app/main.py 
      Content : 
                from fastapi import FastAPI

                app = FastAPI()

                @app.get("/")
                async def read_root():
                    return {"Hello": "World"} 

                  

File_operation : NEW_FILE 
      filepath : ./app/requirements.txt 
      Content : 
                  fastapi==0.63.0
                  uvicorn==0.13.4
                  