# Elite Digital Hub — Working Starter

## Run it now on Windows
1. Download and extract this ZIP.
2. Open the folder in VS Code.
3. Install the VS Code extension **Live Server** if needed.
4. Right-click `index.html` → **Open with Live Server**.
5. Use Login/Register to create a Student, Teacher or Guest account.
6. Demo admin: `admin@elitedigitalhub.test` / `DemoAdmin123!`.
7. Submit a contact request from the homepage and check it in Dashboard.

## What works in demo mode
Responsive home page, service cards that fill the request form, contact request storage, account registration/login, profile editing, student/teacher/guest dashboards, admin user list, demo role changes, demo user deletion, request status updates, and logout.

## Important limitations
Demo data uses browser `localStorage`: it is only visible in the same browser profile and is NOT secure enough for public production accounts or real customer data. It does not send emails, process M-Pesa payments, or share data across devices.

## Production setup
Create a Supabase project, review/run `sql/schema.sql`, configure Supabase Auth, replace demo login/storage with Supabase Auth/database calls, and create carefully scoped RLS policies. Never put a service-role key in browser JavaScript. Admin privileges must be assigned through a trusted owner-controlled process, never from public signup.

Publish the static frontend with GitHub Pages, Netlify or Vercel after testing. GitHub Pages alone is not a backend. For M-Pesa payments, a server-side Safaricom Daraja integration is required.

## Customize
Set business contact details in `index.html` and WhatsApp number in `js/config.js`. Keep customer passwords, PINs and government portal credentials private.
