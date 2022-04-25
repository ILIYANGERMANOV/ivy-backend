create table users
(
    id                  uuid not null
        primary key,
    email               text not null
        unique,
    password_hash       text not null,
    auth_provider_type  text not null,
    first_name          text not null,
    last_name           text,
    profile_picture_url text,
    color               bigint,
    end_color           integer,
    test_user           boolean default false
);

create table sessions
(
    id            uuid      not null
        primary key,
    user_id       uuid      not null
        constraint fk_user
            references users,
    session_token text      not null
        unique,
    fcm_token     text      not null,
    initiated_on  timestamp not null,
    expires_on    timestamp not null
);


create table reset_password_records
(
    id     uuid      not null
        primary key,
    email  text      not null,
    otc    text      not null
        unique,
    expiry timestamp not null
);

create table wallet_categories
(
    id               uuid             not null
        primary key,
    name             text             not null,
    color            integer          not null,
    order_num        double precision not null,
    owner_id         uuid,
    uploaded_at      timestamp        not null,
    icon             text,
    se_category_name text
);

create table wallet_accounts
(
    id                 uuid                 not null
        primary key,
    name               text                 not null,
    color              integer              not null,
    order_num          double precision     not null,
    owner_id           uuid,
    uploaded_at        timestamp            not null,
    currency           text,
    icon               text,
    include_in_balance boolean default true not null,
    se_account_id      text
);

create table wallet_transactions
(
    id                  uuid             not null
        primary key,
    account_id          uuid             not null,
    type                text             not null,
    amount              double precision not null,
    to_account_id       uuid,
    title               text,
    description         text,
    date_time           timestamp,
    category_id         uuid,
    due_date            timestamp,
    recurring_rule_id   uuid,
    attachment_url      text,
    owner_id            uuid,
    uploaded_at         timestamp        not null,
    to_amount           double precision,
    se_transaction_id   text,
    se_auto_category_id text
);

create table wallet_planned_payment_rules
(
    id            uuid             not null
        primary key,
    account_id    uuid             not null,
    type          text             not null,
    amount        double precision not null,
    title         text,
    description   text,
    category_id   uuid,
    start_date    timestamp,
    interval_n    integer,
    interval_type text,
    one_time      boolean,
    owner_id      uuid,
    uploaded_at   timestamp        not null
);

create table wallet_analytics_evens
(
    id         uuid not null
        primary key,
    name       text not null,
    session_id uuid not null,
    owner_id   uuid,
    date_time  timestamp
);

create table wallet_budgets
(
    id                      uuid             not null
        primary key,
    name                    text,
    amount                  double precision not null,
    category_ids_serialized text,
    account_ids_serialized  text,
    uploaded_at             timestamp,
    owner_id                uuid,
    order_id                double precision not null
);

create table wallet_loans
(
    id          uuid             not null
        primary key,
    name        text             not null,
    amount      double precision not null,
    type        text             not null,
    color       integer          not null,
    icon        text,
    order_num   double precision not null,
    uploaded_at timestamp,
    owner_id    uuid
);

create table wallet_loan_records
(
    id          uuid             not null
        primary key,
    loan_id     uuid             not null,
    amount      double precision not null,
    note        text,
    date_time   timestamp        not null,
    uploaded_at timestamp,
    owner_id    uuid
);