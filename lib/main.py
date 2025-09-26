# backend/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Allow Flutter app to connect
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Sample data
notes = ["Stack Notes", "Linked List Notes"]
timetable = {"Monday": ["9AM - Math", "10AM - DS"]}
assignments = [
    {"title": "Assignment 1", "status": "Due tomorrow"},
    {"title": "Assignment 2", "status": "Completed"},
]

@app.get("/")
def root():
    return {"message": "CampusMate API running!"}

@app.get("/notes")
def get_notes():
    return {"notes": notes}

@app.get("/timetable")
def get_timetable():
    return {"timetable": timetable}

@app.get("/assignments")
def get_assignments():
    return {"assignments": assignments}
