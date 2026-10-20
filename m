Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDD2606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hXgIS0YI;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fdGRaKLZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tny7OvfZ4AK+HPdIJjo94ed1DATTmzr6+AAk0DzJzv4=; b=hXgIS0YIRMmd3jjvo4+eZ6qbry
	AA0SVLISPd3zzqxWn+AyiPg7N7ZA13a192U6Gh/ErKwourWkBEH1GF4VMkDDt3rOZb4Y578V8IM2Q
	88NatWtEogy3gi5Onrr+ii7j68NwoNRuSKAbgxMVBUiARnggR7kVBeV4AcgrDnv/QhKNqwzRvdqEk
	zPKKsPCno3gJ63q776W6XHlo7UQ8JT323amcaVYsSFP2RYwBGPmxkJWiECSCkMKqFvY+X8sNtFFjk
	MbbY10+QxQYwzPzJ0Rpn7rwnqXp14a2k41SVRWhvOEjA76wNm4HzyJEjHDl2pZlUuBKwnzByzFfmA
	YmFPYmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5PP-00000009DHE-1Pvt;
	Tue, 20 Oct 2026 08:41:23 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5PL-00000009DGq-3o1N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:41:22 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 1AC7C201709;
	Tue, 20 Oct 2026 10:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792485678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tny7OvfZ4AK+HPdIJjo94ed1DATTmzr6+AAk0DzJzv4=;
	b=fdGRaKLZ6XOADB8b8o9cx4rzIVtnPYghbZk4dNCqkx6R0YkXgDde1n6d78TjZDHKUUgi22
	LFUS0a2JZH+s6PtSPx82aaHQsKoL33e6XQltVtT4ER+ZshH6xJqQe7h9bRWzvLIb6Oa5AK
	IxcqkPM8hPrjcZgqc1ozVP3ZV8lB1RlqKtm+SNeoHY2fOo/ZIA6EcUgVBtBsl2CBNCvsBF
	SmbkzkRjbBMAynHEEsFLhmTAtYA0mb3HJRBEmTMK4ivWL3irWN3Jvze14o/C9c/AhY/X7y
	hOmmxz4ALfhAKeOEAdkbCJY3kozizepIvQ5JRon9oGp14Hm4pDmADdiwMuKHXg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792485678; a=rsa-sha256;
	cv=none;
	b=hFUNyD65mMEE+FOmodiZBgkaZHMprqM+4OIEI6LAkfjBAutgQqhANkleskyPmuNJ8fYx7r
	lHf2J8wNOQDjgfpO4FGXHFlSLH361LN2GgYOouw+bM0WzcouDsi3ZAWqxVt1YeG8zdHoKo
	X7iv9B4X5QF5auAYPvTUQPMUrMOVYbFJKMiAI9OBT85eGuFx6izdQ0WQNdB0C0zppJJYKJ
	N6PfB2HhwzxkO/Vc/eZVEMIQHrK00nDQGsBY+ou18eyZiSykSBpdB9D90fVR+7Vv1lHV1r
	y+itxyJKGM0Iq2j7IgWV1XftO8s660GAEndKY3uAnjxlyHi34w8mCxwxT2gvrg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792485678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tny7OvfZ4AK+HPdIJjo94ed1DATTmzr6+AAk0DzJzv4=;
	b=XR4AFpiwrrHyYm13m4QucfD+w10YFL4/aZEJBSmS/6RqSAvftoOqdBqJktL89IFTOf4kn8
	ZmWr5YXrr+93EJ1kWyZqwLCeb88SZUpiGZBX7idcbn/RKQTCcdgGmo51KCJTUSm6GG7A6u
	1FzaTx0GmHFQi4aMQXowWwPBHTF5tSs0cmk6f4xkyyWJUlCzkva2w8jfBG/KYaOa1C2JW7
	dXM1Fia0V2ruqvTCHBpY33aaXb4tdiQBanCjRaRW7Ubav4wZM9aUMNIAGX7JnOVl7V8Sn+
	ac9htn+70QbN6d9jOc18qwAj4WhP5P5B+Wp/2X9wQYaiMSmhwzqlrV7obSiPOw==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xJ5PJ-000LTr-3C;
	Tue, 20 Oct 2026 10:41:18 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 9ECCA5C9D1B;
	Tue, 20 Oct 2026 08:41:17 +0000 (UTC)
Date: Tue, 20 Oct 2026 10:41:17 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ian Rogers <irogers@google.com>, Thomas Gleixner <tglx@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Stefan Kerkmann <s.kerkmann@pengutronix.de>, Christophe Leroy <chleroy@kernel.org>, 
	David Laight <david.laight.linux@gmail.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for
 ARMv5
Message-ID: <20261020-zealous-warping-quetzal-84479a-mkl@pengutronix.de>
References: <20261019201257.3805356-1-irogers@google.com>
 <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
 <20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
 <d2afb4cb-145e-488b-8f6e-c83e38735526@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2a3snsm4elpgfy3"
Content-Disposition: inline
In-Reply-To: <d2afb4cb-145e-488b-8f6e-c83e38735526@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_014120_171791_5A95D6FD 
X-CRM114-Status: GOOD (  35.48  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--j2a3snsm4elpgfy3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for
 ARMv5
MIME-Version: 1.0

On 20.10.2026 10:24:51, Arnd Bergmann wrote:
> On Tue, Oct 20, 2026, at 08:44, Marc Kleine-Budde wrote:
> > On 20.10.2026 00:12:57, Arnd Bergmann wrote:
> >> On Mon, Oct 19, 2026, at 22:12, Ian Rogers wrote:
> >> > +
> >> > +config VDSO_UNALIGNED_PACKED
> >> > +	bool
> >> > +	default CPU_32v5
> >> > +	help
> >> > +	  Use packed structs rather than memcpy() in include/vdso/unaligne=
d.h
> >> > +	  for unaligned memory accesses. Enabled on ARMv5 where GCC may em=
it
> >> > +	  out-of-line memcpy() calls instead of inlining byte accesses.
> >>
> >> As explained, I think this misrepresents the problem as Arm specific a=
nd
> >> isn't the correct method for -munaligned-access targets on Arm, which
> >> include CPU_32v3, CPU_32v4 and CPU_32v4T along with CPU_32v5.
> >>
> >> I still hope we can use a version that just produces the intended code
> >> on both -munaligned-access and -mno-unaligned-access targets like the
> >> old version did.
> >
> > FYI: there is the kconfig Symbol HAVE_EFFICIENT_UNALIGNED_ACCESS. Can we
> > make use of it?
>
> That would be better, but I still hope we can just get back to the
> portable code across all architectures for the in-kernel version.
>
> I have one more request for you: can you check /proc/cpu/alignment
> on the system that shows the performance regression with and without
> the patch?

I asked Stefan Kerkmann (who wrote the original regression report) the
same question, but we haven't had time for it yet. We'll get around to
it.

> In your original report, you have shown that Ian's patch
> caused the drop in performance and that it caused the added function
> calls, but I don't see any sufficiently hot code path that would
> actually explain the scale of the regression,

Don't underestimate the overhead of function calls on those old CPUs
with tiny I-caches.

Little side note: IIRC, even on ARMv7 you can measure the performance
overhead of the built-in, but disabled, function tracer.

> unless there is now
> also a case where get_unaligned() ends up doing the wrong case and
> running into a fixup handler. If this happens, you should see a
> nontrivial number of fixups listed in /proc/cpu/alignment. On
> a working system, the numbers should all be low but likely nonzero
> because there tend to be callers that still lack get_unaligned()
> wrappers and just access misaligned pointers directly.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--j2a3snsm4elpgfy3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCatcpKwAKCRDMOmT6rpmt
0vmOAP0Qt0ZaQ78TlzcyWX3vd+q7p7QlUCACekRD8ry/9YvhAQEAs7/KzykzEHyi
2B+oU1GLoe1YHj2GBOq7Xs8gulmVxgk=
=ODz3
-----END PGP SIGNATURE-----

--j2a3snsm4elpgfy3--

