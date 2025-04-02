print("Loading environment variables from .env file...")

try:
    from dotenv import load_dotenv
    import os
    
    # Load .env file from the current directory or specified location
    dotenv_path = os.path.join(os.getcwd(), '.env')
    load_dotenv(dotenv_path)
    print("Environment variables loaded successfully.")
except ImportError:
    print("python-dotenv not installed. Run: pip install python-dotenv")
except Exception as e:
    print(f"Failed to load environment variables: {e}")
