# V.A.S.T. - Virus Analysis and Scanning Tool

<p align="center">
  <img src="./static/img/nav_logo.png" alt="VAST Logo" width="300"/>
</p>

<p align="center">
  <strong>A comprehensive cybersecurity platform for Email, URL, and File scanning</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.12-3776AB?style=for-the-badge&logo=python&logoColor=white" alt="Python"/>
  <img src="https://img.shields.io/badge/Django-5.1-092E20?style=for-the-badge&logo=django&logoColor=white" alt="Django"/>
  <img src="https://img.shields.io/badge/MySQL-Database-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
  <img src="https://img.shields.io/badge/Type-Academic%20Project-green?style=for-the-badge" alt="Academic"/>
</p>

---

## Project Overview

**V.A.S.T. (Virus Analysis and Scanning Tool)** is a user-friendly web application designed to provide online safety by offering reliable tools for digital security. The platform helps users verify the safety of email addresses, scan URLs for malicious links, and analyze files for viruses and malware.

Built with Python, Django, and MySQL, V.A.S.T. offers a stable and efficient user experience while making cybersecurity accessible for everyone - regardless of their technical knowledge.

---

## Key Features

### 1. Email Scanner
| Feature | Description |
|---------|-------------|
| **Email Validation** | Verifies email format and checks MX records |
| **Disposable Email Detection** | Identifies temporary/throwaway email addresses |
| **Domain Type Identification** | Classifies as Personal, Business, Educational, or Government |
| **Spam Score Analysis** | Evaluates email reputation based on domain age and blacklists |
| **Trust Score** | Provides an overall safety rating (0-100) |

### 2. URL Scanner  
| Feature | Description |
|---------|-------------|
| **SSL Certificate Check** | Verifies secure connection |
| **Malicious Link Detection** | Identifies phishing and harmful URLs |
| **Redirect Chain Analysis** | Follows and analyzes URL redirects |
| **Domain Age Verification** | Checks domain registration history |
| **Tracker Detection** | Identifies analytics and advertising trackers |
| **WHOIS Lookup** | Retrieves domain ownership information |

### 3. File Scanner
| Feature | Description |
|---------|-------------|
| **Malware Detection** | Scans for viruses and malicious patterns |
| **File Hash Generation** | Creates MD5, SHA1, and SHA256 hashes |
| **Metadata Extraction** | Extracts file creation, modification dates |
| **PE File Analysis** | Analyzes Windows executable characteristics |
| **Steganography Detection** | Detects hidden content in images |
| **Archive Scanning** | Extracts and scans ZIP/RAR contents |

### 4. Additional Features
- OTP-based passwordless authentication
- Guest user access with scan limits
- PDF report generation and download
- User feedback system
- Scan history tracking

---

## Technologies Used

| Category | Technologies |
|----------|--------------|
| **Backend** | Python, Django Framework |
| **Frontend** | HTML5, CSS3, JavaScript, Bootstrap |
| **Database** | MySQL |
| **Security Libraries** | pefile, python-magic, cryptography |
| **Network Analysis** | dnspython, tldextract, whois, requests |
| **File Analysis** | Pillow, PyPDF2, exifread, olefile, stegano |
| **PDF Generation** | xhtml2pdf |
| **Web Scraping** | BeautifulSoup4 |

---

## Project Structure

```
vast_project/
├── manage.py                    # Django management script
├── requirements.txt             # Python dependencies
├── vast_project/                # Main Django project settings
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
├── accounts/                    # User authentication module
│   ├── models.py               # User, OTP models
│   ├── views.py                # Login, OTP verification
│   ├── urls.py
│   └── templates/
├── services/                    # Core scanning modules
│   ├── models.py               # EmailCheck, URLCheck, FileCheck models
│   ├── email_views.py          # Email scanning logic (~85KB)
│   ├── url_views.py            # URL scanning logic (~73KB)
│   ├── file_views.py           # File scanning logic (~95KB)
│   ├── scan_limiter.py         # Guest user scan limits
│   ├── feedback.py             # User feedback handling
│   └── templates/
└── static/
    ├── img/                    # Images and logos
    └── styles/                 # CSS stylesheets
```

---

## Installation

### Prerequisites
- Python 3.8 or above
- MySQL Server
- pip (Python package manager)

### Steps

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/vast-project.git
cd vast-project
```

2. **Create and activate virtual environment**
```bash
python -m venv venv
# Windows
venv\Scripts\activate.bat
# Linux/Mac
source venv/bin/activate
```

3. **Install dependencies**
```bash
pip install -r requirements.txt
```

4. **Configure Database**
   - Create a MySQL database (e.g., `vast_db`)
   - Update `vast_project/settings.py` with your database credentials:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'vast_db',
        'USER': 'your_username',
        'PASSWORD': 'your_password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

5. **Run migrations**
```bash
python manage.py makemigrations
python manage.py migrate
```

6. **Start the development server**
```bash
python manage.py runserver
```

7. **Access the application**
   - Open browser and navigate to: `http://127.0.0.1:8000/`

---

## Usage

### Email Scanning
1. Navigate to the Email Scanner page
2. Enter an email address
3. Click "Scan" to receive validation results and safety rating

### URL Scanning
1. Navigate to the URL Scanner page
2. Enter a URL (with http:// or https://)
3. Click "Scan" to analyze the link for threats

### File Scanning
1. Navigate to the File Scanner page
2. Upload a file for analysis
3. View detailed malware scan results and file metadata

### Viewing Reports
- Click "View Report" to see detailed scan results
- Download PDF reports for documentation

---

## Database Schema

The application uses 14 database tables:

| Table | Purpose |
|-------|---------|
| `User` | User accounts and login tracking |
| `OTP` | One-time password for authentication |
| `EmailCheck` | Email scan records |
| `EmailCheckResult` | Email scan results and ratings |
| `DisposableDomain` | Known disposable email domains |
| `SpamDatabaseEntry` | Blacklisted domains/IPs |
| `URLCheck` | URL scan records |
| `URLCheckResult` | URL scan results |
| `URLRedirect` | URL redirect chain tracking |
| `TrackerDetection` | Detected web trackers |
| `FileCheck` | File scan records |
| `FileCheckResult` | File scan results and hashes |
| `FileScanMetadata` | Extracted file metadata |
| `Feedback` | User feedback submissions |

---

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/` | GET | Home page |
| `/accounts/login/` | GET/POST | User login with OTP |
| `/services/email-scan/` | POST | Scan email address |
| `/services/url-scan/` | POST | Scan URL |
| `/services/file-scan/` | POST | Scan uploaded file |
| `/services/report/<id>/` | GET | View scan report |
| `/services/download-pdf/` | GET | Download PDF report |
| `/services/feedback/` | POST | Submit feedback |

---

## Testing

The project uses Black Box Testing methodology focusing on:
- Valid and invalid input handling
- Edge cases (empty strings, malformed formats)
- Response generation and storage
- Guest user scan limits

---

## Future Enhancements

- Network Scanner - Analyze security of connected devices
- Browser Extension - Real-time URL scanning
- API Access - Integration with third-party applications
- Machine Learning - Improved threat detection accuracy

---

## Project Details

| Field | Information |
|-------|-------------|
| **Project Title** | Virus Analysis and Scanning Tool (V.A.S.T.) |
| **Course** | Capstone Project-II (2CEIT605) |
| **Academic Year** | 2024-2025 |
| **Semester** | VI (B.Tech Computer Engineering) |
| **Institution** | U.V. Patel College of Engineering, Ganpat University |
| **Project Guide** | Prof. Jyoti Srivastava |

### Team Members
- Karan Yadav (22012011052)
- Naman Shah (22012011103)
- Bhakti Munjapara (22012011071)
- Akbarhusain Bhatt (22012011055)

---

## License

This project is developed for educational purposes as part of academic coursework at Ganpat University.

---

## Acknowledgments

- Prof. Jyoti Srivastava for guidance and support
- Dr. Paresh M. Solanki, Head of Computer Engineering Department
- U.V. Patel College of Engineering, Ganpat University

---

<p align="center">
  <strong>Made with dedication for a safer digital world</strong>
</p>
