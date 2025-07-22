Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C9BC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juq2LsaB2ZlgXJfLDxNWAXy+l+g+CamQA/55GYnNXGQ=; b=oBUaa5yLObYzFeDVPzehNLoEgL
	+cIMYbJrbTwZcepvESC4sCMv8E3Ce6ZUpgm/3YQOEzyH7kcmJ+OocG6eSGYn7CKCD/SNsPLKUH1cN
	fFmGJlgO1s07MjO141P1Df/pO+aOQIsxGAwTRK1FOM7I+4RYHJLjguvhjSCSyd7a+MgEOO7Jy0Nny
	LK/QN/RRO/4f9MHz6ioWvGitdU++PhahSowD1CgrC5qjG5lmwt7gJlx8GvT6pI/4MoFC3Hesn1lRy
	wVWmFNOlYa8hUBRX2dvn7WkrY1u2zGUP+8107Z0n1Lc8IqHkXQbm5sH/DQeCxRTduC7Fsv0X213gw
	t+XfGlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDvs-00000002h8E-3MoH;
	Tue, 22 Jul 2025 14:25:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueDU5-00000002c82-2F1J;
	Tue, 22 Jul 2025 13:56:46 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d54214adso39886545e9.3;
        Tue, 22 Jul 2025 06:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753192604; x=1753797404; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=juq2LsaB2ZlgXJfLDxNWAXy+l+g+CamQA/55GYnNXGQ=;
        b=FNwAe4uRZr0FWkfWXjEyFO2ivL8aQld0BfABoowu6KQgqSi4fKSZNqhHjELRxAO89O
         ykYAPrCMRXyv7ssnTb91DZ+qx7BtMUS5Gf0owY3hH/ssby42czj5wHQUDIOCSVMi7iG2
         Om2tdNfk71jBC2/FIbymTTpg2D8OIGDSJsNWeFpmZ4MMUrozisEjYcLzaVVy5dP+WHEn
         cG5ulDNMz6syUjBUP58bg5mvz6Prv9sgKapgAdDKoUP8BzPOsdhTdbguJ6FO0e4BXGpk
         77Isst8MCErRWQ72+8HCvNVi7mDORUK4eu/65XzfTnG6XUUj4uYaeJImYRTo+RItfDZU
         yepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192604; x=1753797404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juq2LsaB2ZlgXJfLDxNWAXy+l+g+CamQA/55GYnNXGQ=;
        b=Nbc2cpfmjcETqBTtxCA8f/Ok4lTcBZC9Co9YZp5Rnwz3F2FV4A6uSFudyqWzZCBwyv
         n3pdVub7sigpNl/cKwmHVt39+IQMsVec6CY4AWTmArUkpnmr9nBgZYJvi7ypcYzn3xyH
         IZkiFq1VoGZnqFYti3W8jaTGCxcGAFFBBKB+JzoySyGIgVygZWWod2TtmVaECyibO4iG
         El6qG9Ieve4hzvCixarl4e/rm+lssIXdi12BjI2uxQJSrB2kLMDGEn49zIZBpXfLf6CL
         NlDj2FHdYeItTtUtz01+2VUG6h1Z8TvxPZ7Ltiqn2TB261ypg1cZ79Pu61vOrlk1Yy4n
         FodA==
X-Forwarded-Encrypted: i=1; AJvYcCUckvjpAqr2o3Fdy9CUGnvJkh1dkF4E5pFDVajCL3SxbL8ykZeLaP8i/Fec/crN5UqNbZ2EM71jRy2uTZiWk1uD@lists.infradead.org, AJvYcCVUfS5BuaEx0APMDfENeOgUg6zOMEz1LTAsnXO1GTpAjEy679P0EAr0A8ddbgJy3CcKdkzQY4xUIPic1q8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy32TB0ZUQ385gN1UEw/o5qVmRw3IyxCeoDEhRkNTvcnWmqeE0/
	OArCA83p5etL03hBLqE5l4a0sNbKXFZpkW8RyRCHnE5E2zMoQmZwHmaC
X-Gm-Gg: ASbGncu1JGoK30TSPJs5c3eRtDomeftPP46ssw9xNZQG0Orz5vnoCbuUsbiZMaKxJ19
	s1WMaQqqUjkolCc/WI1IG0SNkfoPZiNTcirsitrWDYze/nfRWiTqm3/CTzZp1Lm6WF7LxyhSWOE
	s7dAPij4Hl7xhww6K3Hbrh+Aho+arkCBf8u8OU37x0sZnegE2H7cJqLQAsWEWhnMqo7GYgTwu6r
	lPLIJ7BXljfXOCKN0zoSOPRkyFSXRV9iFUCiMPwsbOsJwhcrv4ghB2VYb0XsJQRK+P5/7+anNHy
	ZRTKM0Au2EUNQOmlixIObgjHb0oAxqrtlMjajXd3egwcQ45/VlNnLje8eycDngM2hiA/l/TZzYt
	srsWEDu9Sj6vCiphovOOGXDkRfcbKb5McB6VuF+rXwO31r6oT6RGgtOd1ssJMJSOAck92LgR/jH
	wkc5mbX1Ky
X-Google-Smtp-Source: AGHT+IEXfV5AQDvaaCQOegEyKdsH0umt5I9YjBYWNMUwcatDOEmZLLM8MRQ3Lk0kGHyWW+MsfUSbDg==
X-Received: by 2002:a05:600c:c16d:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-456352d0b70mr190106725e9.5.1753192603600;
        Tue, 22 Jul 2025 06:56:43 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4562e7f2d4fsm197624025e9.4.2025.07.22.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 06:56:42 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:56:40 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sm7baow4ljogvsjb"
Content-Disposition: inline
In-Reply-To: <2025071919-patience-cattishly-cf7c@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_065645_574711_F6FCB7F4 
X-CRM114-Status: GOOD (  16.00  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--sm7baow4ljogvsjb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
[...]
> > 	struct syscore;
> >=20
> > 	struct syscore_ops {
> > 		int (*suspend)(struct syscore *syscore);
> > 		void (*resume)(struct syscore *syscore);
> > 		void (*shutdown)(struct syscore *syscore);
> > 	};
> >=20
> > 	struct syscore {
> > 		const struct syscore_ops *ops;
> > 		struct list_head node;
> > 	};
> >=20
> > Is that what you had in mind?
>=20
> I missed the list_head, so yes, this would be better, but don't pass
> back the syscore structure, how about just a void * instead, making the
> whole container_of() stuff go away?

Yeah, that's a possibility. I personally don't like passing the void *
around because it's easier to make mistakes that way. I also find it
unintuitive because it doesn't immediately show you what the functions
expect.

My understanding is that the container_of() should get optimized away
most of the time, so there aren't any obvious downsides that I can see.

But I don't feel very strongly, so if you have a strong preference for
void pointers, I can do that.

Thierry

--sm7baow4ljogvsjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh/mJUACgkQ3SOs138+
s6FyzhAAq8z/gI18SVH4qmKTQkcFaPuXBegHTP2dgId1CA1dad3cmBj4tcAz1+Ng
liio3geyWrxKqZSJTrQOYYYloM4s9UhkY3AvXvDB+L4/DZC/HBgAGnL5dMKte/WQ
sNUniNOWw1gW2tluO+vi9saSGE4Test34XaIWpBaItJYO9uhuiAC57jJw9Uutl0h
wkjvwyxaOXSleKiCSwlnSBx31PCz7k5nhb8pIeptnxbxw+Q7+IsDzK/cH2PrV979
7AzVNifmqUfpO9Xy0FsSrYU0SrUCM7I8WU6elGSeuswDL7+Mlsh9kn/KfVyL86ed
0jP2iQRyzteg2ATh6dQJLM7KEPK8DnGZqaLDLJlzn3af7Mv5MvRGO1cx7dVGhcTA
ADto5YN6dKXC63ijHppnQ2xjZ725T1zuVpj1z5OTlXpKtlGvYiIejh+B5tjFMMrr
zTNbjIBbykgIZXvIvn52ttFRDrLgpnh2mQPzI8VWp9Bv0DaBH6Q1jfxUlWXQiSaQ
bWrFys6N7IBy5+o83FiAGZvQ//IFZhyF8T/6HD+6OuoX26vTOa5vwrPgs5qru2/s
T5iJf9UOqnHAuzssCGk2OZcqcVn17seSpXcJScckVPt/HhegIgcgxoVTCOBQ0K7J
xUhlsns/ZnbEGVKtLr2T/t7UTeCDZIkqo0pEloVCu9UGfeAI16c=
=Cczj
-----END PGP SIGNATURE-----

--sm7baow4ljogvsjb--

