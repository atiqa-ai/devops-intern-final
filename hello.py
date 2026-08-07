#!/usr/bin/env python3

import getpass
import platform
import socket
from datetime import datetime


def main():
    print("=" * 50)
    print("🚀 Welcome to the DevOps Internship Project")
    print("=" * 50)

    print(f"Message      : Hello, DevOps!")
    print(f"User         : {getpass.getuser()}")
    print(f"Hostname     : {socket.gethostname()}")
    print(f"Operating OS : {platform.system()} {platform.release()}")
    print(f"Python       : {platform.python_version()}")
    print(f"Current Time : {datetime.now()}")

    print("=" * 50)
    print("Application executed successfully.")
    print("=" * 50)


if __name__ == "__main__":
    main()
