# Voxora — AI Voice Interview & Viva Examination Platform

> **Practice Out Loud. Perform with Confidence.**

Voxora is a full-stack, voice-first AI practice platform designed to simulate realistic job interviews and academic syllabus-grounded viva examinations. Featuring continuous turn-taking, speech synthesis, microphone recognition, and in-depth performance diagnostics powered by Gemini AI and ElevenLabs.

---

## 🎨 Original Clay Theme & Palette

- **Ivory background** (`#F7F3ED`): Warm, inviting, comfortable canvas.
- **Clay** (`#C8795D`): Core theme accent, subtle highlights, active states.
- **Terracotta** (`#A95740`): Primary buttons, dominant accents, brand badges.
- **Peach** (`#F0D8C9`): Warm highlights, pill tags, and soft framing.
- **Card background** (`#FFFCF7`): Rounded surfaces with 18–24px radii and layered shadows.
- **Primary text** (`#302B28`): High-contrast editorial readability.
- **Secondary text** (`#82766E`): Balanced secondary hierarchy and descriptions.

---

## 🚀 Key Features

1. **Mode A: Career Interview**
   - 13 specific engineering & technology roles (Frontend, Backend, Full-Stack, Python, Java, JavaScript, React, Software Engineer, Mobile App, Data Analyst, DevOps, QA, and Custom Role).
   - Seniority levels (*Beginner*, *Intermediate*, *Advanced*) and rigor settings (*Easy*, *Medium*, *Hard*).
   - Session lengths: *Short* (3 questions), *Standard* (5 questions), *Extended* (8 questions).
   - Optional Job Description and targeted topic inputs for specialized preparation.

2. **Mode B: Student Viva Examination**
   - Syllabus PDF text and module outline extraction via `pypdf`.
   - Automatic rejection of image-only/scanned documents without extractable digital text.
   - 100% curriculum-grounded questioning with syllabus topic mastery breakdown in the final report.

3. **3 Distinct AI Interviewer Personas**
   - **Alex (Supportive Mentor)**: Friendly, patient, and encouraging for beginners.
   - **Victor (Strict Professional)**: Serious, formal, direct, and rigorous.
   - **Morgan (Analytical Architect)**: Curious, architectural, probing systems trade-offs and first-principles.

4. **Continuous Voice Turn-Taking**
   - Natural spoken interaction with microphone listening and silence detection.
   - The microphone is kept inactive while the interviewer speaks to prevent echo feedback.
   - Real-time transcription display with Done Speaking button and optional text fallback.

5. **Diagnostic Performance Report**
   - Overall score (out of 100) based on actual answered questions.
   - Technical accuracy, relevance, and communication clarity breakdowns.
   - Demonstrated strengths, missing concepts, personalized growth feedback, and recommended next practice topics.

---

## 📂 Project Structure

```
vaxora_Project/
├── backend/
│   ├── secret.YN/                # Central API key manager (excluded from git)
│   │   ├── api_keys.json         # Paste Gemini and ElevenLabs keys here
│   │   ├── README.md             # Key rotation & replacement instructions
│   │   └── .gitkeep
│   ├── app/
│   │   ├── main.py               # FastAPI application entrypoint with CORS
│   │   ├── config.py             # Environment variable loader
│   │   ├── api/
│   │   │   └── routes.py         # REST endpoints for sessions, TTS, and PDF
│   │   ├── services/
│   │   │   ├── key_manager.py    # KeyManager for auto-rotation and quota handling
│   │   │   ├── gemini_service.py # Gemini 3.5 Flash questions, evaluations & reports
│   │   │   ├── elevenlabs_service.py # ElevenLabs TTS and voice ID management
│   │   │   ├── pdf_service.py    # Syllabus PDF extraction & topic parser
│   │   │   └── session_service.py# In-memory session tracking & turn manager
│   │   └── models/
│   │       └── schemas.py        # Pydantic schemas for requests and evaluations
│   ├── tests/
│   │   └── test_backend.py       # Pytest suite for backend logic
│   ├── .env                      # Local environment configuration (in .gitignore)
│   ├── .env.example              # Placeholder template for configuration
│   └── requirements.txt          # Python dependencies
├── frontend/
│   ├── public/
│   │   └── portraits/            # Original portraits for Alex, Victor, and Morgan
│   ├── src/
│   │   ├── components/
│   │   │   ├── LandingView.jsx       # Landing page & hero presentation
│   │   │   ├── CareerSetupView.jsx   # Role, seniority, and persona configuration
│   │   │   ├── VivaSetupView.jsx     # Syllabus PDF upload & topic extraction
│   │   │   ├── InterviewStageView.jsx# Voice loop with visualizer & transcript
│   │   │   └── ReportView.jsx        # Final diagnostic report & scores
│   │   ├── services/
│   │   │   └── api.js                # Frontend API client
│   │   ├── App.jsx                   # Main React view coordinator
│   │   └── index.css                 # Voxora design system and styling tokens
│   ├── package.json
│   └── vite.config.js
├── README.md
└── .gitignore
```

---

## 🛠️ Local Setup Instructions (Windows PowerShell)

### Prerequisites
- Python 3.10+ (Verified on Python 3.12)
- Node.js 18+ (Verified on Node.js 24)
- Modern web browser (Google Chrome, Edge, or Firefox) with microphone permissions.

---

### Step 1: Backend Setup

Open a Windows PowerShell terminal in `d:\vaxora_Project`:

```powershell
# 1. Create a Python virtual environment (if not already created)
python -m venv venv

# 2. Activate the virtual environment
.\venv\Scripts\Activate.ps1

# 3. Install backend dependencies
pip install -r backend/requirements.txt
```

#### Configure Environment Variables
Verify or edit `backend/.env` with your API keys:

```ini
GEMINI_API_KEY=your_gemini_api_key
GEMINI_MODEL=gemini-3.5-flash

ELEVENLABS_API_KEY=your_elevenlabs_api_key

# Configured Voice IDs
ELEVENLABS_VOICE_ALEX=CwhRBWXzGAHq8TQ4Fs17
ELEVENLABS_VOICE_VICTOR=onwK4e9ZLuTAKqWW03F9
ELEVENLABS_VOICE_MORGAN=EXAVITQu4vr4xnSDxMaL
```

#### Start the FastAPI Server
```powershell
$env:PYTHONPATH="d:\vaxora_Project\backend"
.\venv\Scripts\python -m uvicorn app.main:app --port 8000
```
Backend will be live at: `http://127.0.0.1:8000`  
Interactive Swagger docs available at: `http://127.0.0.1:8000/docs`

---

### Step 2: Frontend Setup

Open a second Windows PowerShell terminal in `d:\vaxora_Project\frontend`:

```powershell
# 1. Install frontend packages (including lucide-react)
npm install

# 2. Start the Vite development server
npm run dev -- --port 5173
```
Frontend will be live at: `http://localhost:5173`

---

### Step 3: Run Backend Tests

In your backend terminal:

```powershell
$env:PYTHONPATH="d:\vaxora_Project\backend"
.\venv\Scripts\pytest backend\tests\test_backend.py
```

---

## 🔒 Security & Safe Publishing

- **API Keys**: All Gemini and ElevenLabs keys remain strictly inside `backend/.env` on the server and are never sent to the browser or bundled in frontend client builds.
- **Git Protection**: `backend/.env` is included in `.gitignore` to prevent committing secrets to GitHub.
