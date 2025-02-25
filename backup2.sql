PGDMP  +    1                |            ogmabilling    16.2    16.2 J    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    24576    ogmabilling    DATABASE     �   CREATE DATABASE ogmabilling WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE ogmabilling;
                postgres    false            �            1259    24587    Discount    TABLE     �   CREATE TABLE public."Discount" (
    discountid integer NOT NULL,
    discountname text NOT NULL,
    discountvalue numeric(5,2) NOT NULL
);
    DROP TABLE public."Discount";
       public         heap    postgres    false            �            1259    24611    Invoicedetails    TABLE     �   CREATE TABLE public."Invoicedetails" (
    products_productid integer,
    invoiceid integer,
    productid integer,
    quantity integer,
    taxid integer,
    discountid integer,
    linetotal numeric(10,2),
    invoices_invoiceid integer
);
 $   DROP TABLE public."Invoicedetails";
       public         heap    postgres    false            �            1259    24596    Invoices    TABLE     �   CREATE TABLE public."Invoices" (
    invoiceid integer NOT NULL,
    customerid integer NOT NULL,
    invoicedate date NOT NULL,
    duedate date,
    totalamount numeric(10,2) NOT NULL,
    customers_customerid integer
);
    DROP TABLE public."Invoices";
       public         heap    postgres    false            �            1259    24578    Products    TABLE     �   CREATE TABLE public."Products" (
    productid integer NOT NULL,
    productname text NOT NULL,
    productdescription text,
    productprice numeric(10,2) NOT NULL,
    productmanufacturer text,
    productversion character varying(20)
);
    DROP TABLE public."Products";
       public         heap    postgres    false            �            1259    24620 	   customers    TABLE     I  CREATE TABLE public.customers (
    customerid integer NOT NULL,
    customername character varying(50) NOT NULL,
    address character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    customerdomain character varying(50),
    customercity character varying(50),
    customercityarea character varying(50)
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    24619    customers_customerid_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.customers_customerid_seq;
       public          postgres    false    223            E           0    0    customers_customerid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.customers_customerid_seq OWNED BY public.customers.customerid;
          public          postgres    false    222            �            1259    24586    discount_discountid_seq    SEQUENCE     �   CREATE SEQUENCE public.discount_discountid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.discount_discountid_seq;
       public          postgres    false    218            F           0    0    discount_discountid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.discount_discountid_seq OWNED BY public."Discount".discountid;
          public          postgres    false    217            �            1259    24595    invoices_invoiceid_seq    SEQUENCE     �   CREATE SEQUENCE public.invoices_invoiceid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.invoices_invoiceid_seq;
       public          postgres    false    220            G           0    0    invoices_invoiceid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.invoices_invoiceid_seq OWNED BY public."Invoices".invoiceid;
          public          postgres    false    219            �            1259    24643    paymentmethods    TABLE     u   CREATE TABLE public.paymentmethods (
    methodid integer NOT NULL,
    methodname character varying(50) NOT NULL
);
 "   DROP TABLE public.paymentmethods;
       public         heap    postgres    false            �            1259    24642    paymentmethods_methodid_seq    SEQUENCE     �   CREATE SEQUENCE public.paymentmethods_methodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.paymentmethods_methodid_seq;
       public          postgres    false    229            H           0    0    paymentmethods_methodid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.paymentmethods_methodid_seq OWNED BY public.paymentmethods.methodid;
          public          postgres    false    228            �            1259    24629    payments    TABLE     �   CREATE TABLE public.payments (
    paymentid integer NOT NULL,
    paymentdate date NOT NULL,
    paymentamount numeric(10,2) NOT NULL,
    customerid integer
);
    DROP TABLE public.payments;
       public         heap    postgres    false            �            1259    24628    payments_paymentid_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_paymentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payments_paymentid_seq;
       public          postgres    false    225            I           0    0    payments_paymentid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payments_paymentid_seq OWNED BY public.payments.paymentid;
          public          postgres    false    224            �            1259    24636    paymentsstatus    TABLE     �   CREATE TABLE public.paymentsstatus (
    statusid integer NOT NULL,
    statusname character varying(50) NOT NULL,
    description character varying(255)
);
 "   DROP TABLE public.paymentsstatus;
       public         heap    postgres    false            �            1259    24635    paymentsstatus_statusid_seq    SEQUENCE     �   CREATE SEQUENCE public.paymentsstatus_statusid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.paymentsstatus_statusid_seq;
       public          postgres    false    227            J           0    0    paymentsstatus_statusid_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.paymentsstatus_statusid_seq OWNED BY public.paymentsstatus.statusid;
          public          postgres    false    226            �            1259    24577    products_productid_seq    SEQUENCE     �   CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.products_productid_seq;
       public          postgres    false    216            K           0    0    products_productid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_productid_seq OWNED BY public."Products".productid;
          public          postgres    false    215            �            1259    24659    shippingdetails    TABLE     �   CREATE TABLE public.shippingdetails (
    shippingid integer NOT NULL,
    shippingdate date NOT NULL,
    shippingaddress text,
    trackingnumber character varying(50),
    estimatedarrival date NOT NULL
);
 #   DROP TABLE public.shippingdetails;
       public         heap    postgres    false            �            1259    24658    shippingdetails_shippingid_seq    SEQUENCE     �   CREATE SEQUENCE public.shippingdetails_shippingid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.shippingdetails_shippingid_seq;
       public          postgres    false    231            L           0    0    shippingdetails_shippingid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.shippingdetails_shippingid_seq OWNED BY public.shippingdetails.shippingid;
          public          postgres    false    230            �            1259    24669    taxes    TABLE     �   CREATE TABLE public.taxes (
    taxid integer NOT NULL,
    tax_name character varying(255) NOT NULL,
    tax_rate numeric(5,2) NOT NULL
);
    DROP TABLE public.taxes;
       public         heap    postgres    false            �            1259    24668    taxes_taxid_seq    SEQUENCE     �   CREATE SEQUENCE public.taxes_taxid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.taxes_taxid_seq;
       public          postgres    false    233            M           0    0    taxes_taxid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.taxes_taxid_seq OWNED BY public.taxes.taxid;
          public          postgres    false    232            }           2604    24590    Discount discountid    DEFAULT     |   ALTER TABLE ONLY public."Discount" ALTER COLUMN discountid SET DEFAULT nextval('public.discount_discountid_seq'::regclass);
 D   ALTER TABLE public."Discount" ALTER COLUMN discountid DROP DEFAULT;
       public          postgres    false    218    217    218            ~           2604    24599    Invoices invoiceid    DEFAULT     z   ALTER TABLE ONLY public."Invoices" ALTER COLUMN invoiceid SET DEFAULT nextval('public.invoices_invoiceid_seq'::regclass);
 C   ALTER TABLE public."Invoices" ALTER COLUMN invoiceid DROP DEFAULT;
       public          postgres    false    220    219    220            |           2604    24581    Products productid    DEFAULT     z   ALTER TABLE ONLY public."Products" ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);
 C   ALTER TABLE public."Products" ALTER COLUMN productid DROP DEFAULT;
       public          postgres    false    216    215    216                       2604    24623    customers customerid    DEFAULT     |   ALTER TABLE ONLY public.customers ALTER COLUMN customerid SET DEFAULT nextval('public.customers_customerid_seq'::regclass);
 C   ALTER TABLE public.customers ALTER COLUMN customerid DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    24646    paymentmethods methodid    DEFAULT     �   ALTER TABLE ONLY public.paymentmethods ALTER COLUMN methodid SET DEFAULT nextval('public.paymentmethods_methodid_seq'::regclass);
 F   ALTER TABLE public.paymentmethods ALTER COLUMN methodid DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    24632    payments paymentid    DEFAULT     x   ALTER TABLE ONLY public.payments ALTER COLUMN paymentid SET DEFAULT nextval('public.payments_paymentid_seq'::regclass);
 A   ALTER TABLE public.payments ALTER COLUMN paymentid DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    24639    paymentsstatus statusid    DEFAULT     �   ALTER TABLE ONLY public.paymentsstatus ALTER COLUMN statusid SET DEFAULT nextval('public.paymentsstatus_statusid_seq'::regclass);
 F   ALTER TABLE public.paymentsstatus ALTER COLUMN statusid DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    24662    shippingdetails shippingid    DEFAULT     �   ALTER TABLE ONLY public.shippingdetails ALTER COLUMN shippingid SET DEFAULT nextval('public.shippingdetails_shippingid_seq'::regclass);
 I   ALTER TABLE public.shippingdetails ALTER COLUMN shippingid DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    24672    taxes taxid    DEFAULT     j   ALTER TABLE ONLY public.taxes ALTER COLUMN taxid SET DEFAULT nextval('public.taxes_taxid_seq'::regclass);
 :   ALTER TABLE public.taxes ALTER COLUMN taxid DROP DEFAULT;
       public          postgres    false    232    233    233            /          0    24587    Discount 
   TABLE DATA           M   COPY public."Discount" (discountid, discountname, discountvalue) FROM stdin;
    public          postgres    false    218   �W       2          0    24611    Invoicedetails 
   TABLE DATA           �   COPY public."Invoicedetails" (products_productid, invoiceid, productid, quantity, taxid, discountid, linetotal, invoices_invoiceid) FROM stdin;
    public          postgres    false    221   �W       1          0    24596    Invoices 
   TABLE DATA           t   COPY public."Invoices" (invoiceid, customerid, invoicedate, duedate, totalamount, customers_customerid) FROM stdin;
    public          postgres    false    220   �W       -          0    24578    Products 
   TABLE DATA           �   COPY public."Products" (productid, productname, productdescription, productprice, productmanufacturer, productversion) FROM stdin;
    public          postgres    false    216   X       4          0    24620 	   customers 
   TABLE DATA           }   COPY public.customers (customerid, customername, address, email, customerdomain, customercity, customercityarea) FROM stdin;
    public          postgres    false    223   /X       :          0    24643    paymentmethods 
   TABLE DATA           >   COPY public.paymentmethods (methodid, methodname) FROM stdin;
    public          postgres    false    229   LX       6          0    24629    payments 
   TABLE DATA           U   COPY public.payments (paymentid, paymentdate, paymentamount, customerid) FROM stdin;
    public          postgres    false    225   iX       8          0    24636    paymentsstatus 
   TABLE DATA           K   COPY public.paymentsstatus (statusid, statusname, description) FROM stdin;
    public          postgres    false    227   �X       <          0    24659    shippingdetails 
   TABLE DATA           v   COPY public.shippingdetails (shippingid, shippingdate, shippingaddress, trackingnumber, estimatedarrival) FROM stdin;
    public          postgres    false    231   �X       >          0    24669    taxes 
   TABLE DATA           :   COPY public.taxes (taxid, tax_name, tax_rate) FROM stdin;
    public          postgres    false    233   �X       N           0    0    customers_customerid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customers_customerid_seq', 1, false);
          public          postgres    false    222            O           0    0    discount_discountid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.discount_discountid_seq', 1, false);
          public          postgres    false    217            P           0    0    invoices_invoiceid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.invoices_invoiceid_seq', 1, false);
          public          postgres    false    219            Q           0    0    paymentmethods_methodid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.paymentmethods_methodid_seq', 1, false);
          public          postgres    false    228            R           0    0    payments_paymentid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payments_paymentid_seq', 1, false);
          public          postgres    false    224            S           0    0    paymentsstatus_statusid_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.paymentsstatus_statusid_seq', 1, false);
          public          postgres    false    226            T           0    0    products_productid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_productid_seq', 1, false);
          public          postgres    false    215            U           0    0    shippingdetails_shippingid_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.shippingdetails_shippingid_seq', 1, false);
          public          postgres    false    230            V           0    0    taxes_taxid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.taxes_taxid_seq', 1, false);
          public          postgres    false    232            �           2606    24627    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    223            �           2606    24625    customers customers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    223            �           2606    24594    Discount discount_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Discount"
    ADD CONSTRAINT discount_pkey PRIMARY KEY (discountid);
 B   ALTER TABLE ONLY public."Discount" DROP CONSTRAINT discount_pkey;
       public            postgres    false    218            �           2606    24601    Invoices invoices_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (invoiceid);
 B   ALTER TABLE ONLY public."Invoices" DROP CONSTRAINT invoices_pkey;
       public            postgres    false    220            �           2606    24648 "   paymentmethods paymentmethods_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.paymentmethods
    ADD CONSTRAINT paymentmethods_pkey PRIMARY KEY (methodid);
 L   ALTER TABLE ONLY public.paymentmethods DROP CONSTRAINT paymentmethods_pkey;
       public            postgres    false    229            �           2606    24634    payments payments_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (paymentid);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public            postgres    false    225            �           2606    24641 "   paymentsstatus paymentsstatus_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.paymentsstatus
    ADD CONSTRAINT paymentsstatus_pkey PRIMARY KEY (statusid);
 L   ALTER TABLE ONLY public.paymentsstatus DROP CONSTRAINT paymentsstatus_pkey;
       public            postgres    false    227            �           2606    24585    Products products_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);
 B   ALTER TABLE ONLY public."Products" DROP CONSTRAINT products_pkey;
       public            postgres    false    216            �           2606    24666 $   shippingdetails shippingdetails_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.shippingdetails
    ADD CONSTRAINT shippingdetails_pkey PRIMARY KEY (shippingid);
 N   ALTER TABLE ONLY public.shippingdetails DROP CONSTRAINT shippingdetails_pkey;
       public            postgres    false    231            �           2606    24674    taxes taxes_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (taxid);
 :   ALTER TABLE ONLY public.taxes DROP CONSTRAINT taxes_pkey;
       public            postgres    false    233            �           2606    24680 -   Invoicedetails Invoicedetails_discountid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Invoicedetails"
    ADD CONSTRAINT "Invoicedetails_discountid_fkey" FOREIGN KEY (discountid) REFERENCES public."Discount"(discountid);
 [   ALTER TABLE ONLY public."Invoicedetails" DROP CONSTRAINT "Invoicedetails_discountid_fkey";
       public          postgres    false    221    218    4744            �           2606    24675 (   Invoicedetails Invoicedetails_taxid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Invoicedetails"
    ADD CONSTRAINT "Invoicedetails_taxid_fkey" FOREIGN KEY (taxid) REFERENCES public.taxes(taxid);
 V   ALTER TABLE ONLY public."Invoicedetails" DROP CONSTRAINT "Invoicedetails_taxid_fkey";
       public          postgres    false    221    4760    233            �           2606    24685 !   Invoices Invoices_customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_customerid_fkey" FOREIGN KEY (customerid) REFERENCES public.customers(customerid);
 O   ALTER TABLE ONLY public."Invoices" DROP CONSTRAINT "Invoices_customerid_fkey";
       public          postgres    false    223    4750    220            �           2606    24614 5   Invoicedetails invoicedetails_invoices_invoiceid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Invoicedetails"
    ADD CONSTRAINT invoicedetails_invoices_invoiceid_fkey FOREIGN KEY (invoices_invoiceid) REFERENCES public."Invoices"(invoiceid);
 a   ALTER TABLE ONLY public."Invoicedetails" DROP CONSTRAINT invoicedetails_invoices_invoiceid_fkey;
       public          postgres    false    220    221    4746            /      x������ � �      2      x������ � �      1      x������ � �      -      x������ � �      4      x������ � �      :      x������ � �      6      x������ � �      8      x������ � �      <      x������ � �      >      x������ � �     