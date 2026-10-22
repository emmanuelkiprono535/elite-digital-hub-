-- Starter Supabase schema. Review before running in Supabase SQL Editor.
create type public.edh_role as enum ('student','teacher','guest','admin');
create type public.request_status as enum ('New','In Progress','Completed','Cancelled');
create table public.profiles(id uuid primary key references auth.users(id) on delete cascade,full_name text not null check(char_length(full_name) between 1 and 80),phone text,role public.edh_role not null default 'guest',created_at timestamptz not null default now());
create table public.service_requests(id uuid primary key default gen_random_uuid(),user_id uuid references auth.users(id) on delete set null,customer_name text not null,customer_contact text not null,service text not null,message text not null check(char_length(message) between 1 and 1500),status public.request_status not null default 'New',created_at timestamptz not null default now());
alter table public.profiles enable row level security;
alter table public.service_requests enable row level security;
create policy "Users read own profile" on public.profiles for select to authenticated using(id=auth.uid());
create policy "Users update own profile" on public.profiles for update to authenticated using(id=auth.uid()) with check(id=auth.uid());
create policy "Users create own requests" on public.service_requests for insert to authenticated with check(user_id=auth.uid());
create policy "Users read own requests" on public.service_requests for select to authenticated using(user_id=auth.uid());
-- Add admin policies only after implementing a trusted server-verified admin role strategy.
-- Never expose the Supabase service-role key in frontend code.
