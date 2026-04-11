from playwright.sync_api import sync_playwright, expect
import time
import os

def capture_preview():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page(viewport={"width": 390, "height": 844}) # Mobile view

        # Wait for dev server
        max_retries = 15
        for i in range(max_retries):
            try:
                page.goto("http://localhost:8080")
                break
            except Exception:
                print(f"Waiting for server (attempt {i+1})...")
                time.sleep(5)

        # 1. Splash Screen
        expect(page.get_by_text("SOLO LEVELING")).to_be_visible(timeout=30000)
        page.screenshot(path="verification/1_splash.png")

        # 2. Login Screen
        time.sleep(5) # Wait for splash transition
        expect(page.get_by_text("HUNTER EMAIL")).to_be_visible()
        page.screenshot(path="verification/2_login.png")

        # 3. Onboarding
        page.get_by_role("button", name="LOGIN").click()
        expect(page.get_by_text("PHYSICAL PARAMETERS")).to_be_visible()
        page.screenshot(path="verification/3_onboarding.png")

        # 4. Dashboard (Home)
        page.get_by_role("button", name="NEXT").click() # Move past physical
        page.get_by_role("button", name="NEXT").click() # Move past psych
        page.get_by_role("button", name="AWAKEN").click() # Complete onboarding
        expect(page.get_by_text("STATUS BOARD")).to_be_visible()
        page.screenshot(path="verification/4_dashboard.png")

        browser.close()

if __name__ == "__main__":
    capture_preview()
