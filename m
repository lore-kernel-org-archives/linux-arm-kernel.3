Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286E8606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 06:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DYVazAiC;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=A4dqaE0B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjJ6aF4EEfNV1D/BCrVjMeW97sw80s+KxqGk+wmMMMQ=; b=DYVazAiCnZNiFLXbzGsTLaveIk
	JF8Cu3KYA/K2icY1EreYpdWiHZ0xAjjICUcxfWh/5kQ7ovgegZgPaZxGD4kYwrdmKNp8lqCaEDpaa
	wx3m+IcVC8uHRwfOCq37Qtoj1CKAOQm4Q3lxMSs9lcILcX2pBQvOnE9F7YyR+SdcYnRrM4YlRw5fp
	8OoOxcysuVBJgZ0e0PFmP39WBuGIs3lCrlRhAC+j5H+tZsGLKUDjSVJWxC9KPutqhhba1QSx4GN9k
	TH2kTPaLRGODpMsMQkELcvX4OZ79I3kbw6Qj8MGaV5vGTPW8DWAbYACc5poyXWgZDV79v+c7DiBdb
	3+bxjDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3bv-00000008x44-0d7N;
	Tue, 20 Oct 2026 06:46:11 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ3br-00000008x2R-2Kso
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 06:46:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 807A62017C1;
	Tue, 20 Oct 2026 08:46:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792478763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DjJ6aF4EEfNV1D/BCrVjMeW97sw80s+KxqGk+wmMMMQ=;
	b=A4dqaE0BC406CMyqi1KhvCehlKud1+GI/NyJ4gSCPHaEMReYeqh/9h7GbancwxlmWIECcq
	8PHT5RtYEcpjavaNK9DDNpRQ4fWno2To0kXbAVvPzDYT+0W6poXflHoLlDvUyUC6xMDERq
	UiLfaCc6In6Lqnms6sOfvVrlSl0SAmEjtp+mAk8D7CMfblc5MjGU8fHG9nebqDsAnQ6mA7
	MS0u2rM+DMczgvm8bUUwy1Dn1XJsYGieqT1Q7Kai4f3OWusWXjnGVkIoGW7zwzfi8Gw/MT
	Vwh2EW9tsVl5pfPFA30QmYa2QCke6lh1SXqHJfE61KHAW2TUDfRkyW6x+77AbA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792478763; a=rsa-sha256;
	cv=none;
	b=PFNwBlpd7AofRpN/rO4FPQhyJfd3X4ew5j6h63qfWYJWXylD2TV8zgLH9vgW+5Pf7Y4D5h
	fmNZshb3XO+BySsnnzbbL7rXxBTnJ9sm6KJRySQkpHJPVt0LcPp1bWCAAcYBmYYGGNRU6t
	36F9V5kz7JGw2ItS6yhfGUgUFr/Sn2AaTWZLoBLXONlpikzPOttfBjtDIcXLTqljkpT5Ve
	FYXBZbfgwHQnOY82b9nhAObD4wut40m/p+c9AfIKFmdMVVedWWPIT7gegU/YQh0Rv03622
	LpBMwYZikROg6EMWpE0oeq0ILeP7Z2WJ2z/DMgLoyW318+PZ3/KC+8yYxJCx8w==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792478763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DjJ6aF4EEfNV1D/BCrVjMeW97sw80s+KxqGk+wmMMMQ=;
	b=QXin73Z1/KIUpy0eqj0IXU6PiO0NoTvNldx+fnhl93+gW6Jz0yThXy/6OD5HGZMPhG7PDP
	5lXwMonYyK5xdDzuKoZJBsbjq5uUZmXH9zo6vE/OHikUEmoKCZrv5LGI/gi5IaHVnU7dla
	CdRR2O2fyEId3ivxS8WDE47GQbwvt/bbA2tDdelnrHR00yvFxFZLO2NNNHOwhHlSRIc/4+
	cwgbFl6QZ44uwk1SSYiuHdSyJrqlknkgKHUEltC4MZFfmLgmPk254yuoIjvHwOQYlBpFBw
	bS2cpQPAmocby3PLh6QNKitTZcw7/OnkE5tr7rv7dW0IPvLwg6/wQJrynEi5eg==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xJ3bn-000KgQ-1G;
	Tue, 20 Oct 2026 08:46:03 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E894A5C9BBF;
	Tue, 20 Oct 2026 06:44:18 +0000 (UTC)
Date: Tue, 20 Oct 2026 08:44:18 +0200
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
Message-ID: <20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
References: <20261019201257.3805356-1-irogers@google.com>
 <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6qea3f7c45xlx244"
Content-Disposition: inline
In-Reply-To: <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_234608_059612_8D951D76 
X-CRM114-Status: GOOD (  19.02  )
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


--6qea3f7c45xlx244
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for
 ARMv5
MIME-Version: 1.0

On 20.10.2026 00:12:57, Arnd Bergmann wrote:
> On Mon, Oct 19, 2026, at 22:12, Ian Rogers wrote:
> > +
> > +config VDSO_UNALIGNED_PACKED
> > +	bool
> > +	default CPU_32v5
> > +	help
> > +	  Use packed structs rather than memcpy() in include/vdso/unaligned.h
> > +	  for unaligned memory accesses. Enabled on ARMv5 where GCC may emit
> > +	  out-of-line memcpy() calls instead of inlining byte accesses.
>
> As explained, I think this misrepresents the problem as Arm specific and
> isn't the correct method for -munaligned-access targets on Arm, which
> include CPU_32v3, CPU_32v4 and CPU_32v4T along with CPU_32v5.
>
> I still hope we can use a version that just produces the intended code
> on both -munaligned-access and -mno-unaligned-access targets like the
> old version did.

FYI: there is the kconfig Symbol HAVE_EFFICIENT_UNALIGNED_ACCESS. Can we
make use of it?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--6qea3f7c45xlx244
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCatcNvwAKCRDMOmT6rpmt
0jcxAP4+OJR4f1ri/sD2ri5ZdsCmwGcY28sq9qfO2yECm9kV/AD+LrphmAxqvEbJ
Ma0FGykZK475iITqX2YOZ1BLSUr4dAM=
=v2z9
-----END PGP SIGNATURE-----

--6qea3f7c45xlx244--

