Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E88606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 06:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=goD5xkLv;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Pk9KJj6N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b28PeOVx01PEPWf7+OjZT39YwbUWJM0RbZunVa/5h6c=; b=goD5xkLvCqbylNVY88UugghoSE
	1UP+sNNLlZT3oCfy1tEIFkhecFvH01fxok+N6ZNx16Mi33YfVEaTohptnnru9v5HBkehRsGhEMUJd
	JNyxj2H8HiukktzvMMZpHNKyZzTJclY3GEi9vcz3lTA8RtpPi8dOXRfIqvEegpL6ZD1RT+fOmh2K4
	3mkPPC0aJyjtP1f0Yh3IOVTcRqc+vcehmbDVBpfPj0V9eoJlKelFHBds5HNyEMmyTkL4ApLMWqUWI
	WhF/d40LbAb/P+VAFgmhAFyeAtBT+LJfv2GY2NwzKzEgg7cQMDGdVQRRozv7MwvLhHkdrX37qlO0q
	fKLvw75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQA2-0000000BCvO-1AMZ;
	Wed, 21 Oct 2026 06:50:54 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQ9y-0000000BCut-42aD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 06:50:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D17DC201EFE;
	Wed, 21 Oct 2026 08:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792565447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b28PeOVx01PEPWf7+OjZT39YwbUWJM0RbZunVa/5h6c=;
	b=Pk9KJj6NNTAyBumlBwrGQFh3IwFu/KUMFkVLpCocWI45So8ANtmvL1qpI/3Nzlgk78jgsN
	XUyJDYOSlUQ6/Cx5BLlsHQgK2fBmdpMCJcqxEgrxn+Z8XN7YTzYNI39jALrqSdaW2JGXHp
	M0V7WV/gV1y/zdhj2uJonptmzAKLR+GOsEK+S69JONbfW8XFp/9m5VKTZi4HVLIc9SYMBQ
	1i0af+u4KaY07Ixiym8So6G+kGlvLfG/ChR6lp5yk4YJBvOIXIgfwaulNF6SDKpMExJPoM
	JAjmbVjFJizGGrK2x6ck/eYyykNXan1GoOiBpOkGF7P7J8Cow+nqjYKM06aBGw==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792565447; a=rsa-sha256;
	cv=none;
	b=R7f1MoC+ztM8Xe0ZhyAqK6v9lhBzvumacSn6+vnFdkTuQvdfO1KMdczao588PvAfT0pG/m
	mWalfb/llEk4plY6vEUJs9zuI4vCtqbwhVAbh40loO3MOz22pii7C4IRakqlkfLIEK/FKj
	8odS/5ZwnYjl6QLEE/LlTIlXJJE+4W4Q/2ch7QV6G7kETcfnao9/36kYvA0Z6oBjlex7Ku
	HwAZwOg5a2DP4gPldK9iFfUMFCvEeGt7Ovc/TO4X8HftMs3t2YFwOs2KCu21pX8tlPXNg9
	xPS3QhYTQHGdXrFgHhM7Hd43cIleJ3Yey9y1SwFD5oFqa70CI1zL18Key+vwqA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792565447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b28PeOVx01PEPWf7+OjZT39YwbUWJM0RbZunVa/5h6c=;
	b=LLi20wFyflKJ8hKz9Z41kxY804TAFuBpx16hva2N+MpiUIvd7tPUTM/EqhpQwKY6QjI8Si
	yGgpfmNlllt6TM9bJyPSTKGoOMb/9cqHoFLTt2x0Wr+JeJUU2pBPdaOyW2uVysxgsdBpn5
	HygSNQhP7fRC3qVpmIqenZwZfDTn0lwQVJY7/cFkZCbpjY/WHo+503ENAcIEfcWkmcy7Ew
	ACtY8LWZnhBLzAMkZcQJXCMSaVvLmFqgjAu52Ty42uw9C2LhvZgDi6FlSu2hQxsNr7+axo
	ZdrkPIkdmXo+13TxxrRXEm2GouW3g7fNR78Esfy/cHawuvSkvTYJ1WJC8us6eQ==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xJQ9v-000WDb-2R;
	Wed, 21 Oct 2026 08:50:47 +0200
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 6995A5CAC6F;
	Wed, 21 Oct 2026 06:50:47 +0000 (UTC)
Date: Wed, 21 Oct 2026 08:50:47 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Ian Rogers <irogers@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Stefan Kerkmann <s.kerkmann@pengutronix.de>, 
	Christophe Leroy <chleroy@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Eric Biggers <ebiggers@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for
 ARMv5
Message-ID: <20261020-orthodox-positive-heron-e20628-mkl@pengutronix.de>
References: <20261019201257.3805356-1-irogers@google.com>
 <31fe09f6-0a14-40fc-8ad8-c03998fb1f5c@app.fastmail.com>
 <20261020-succinct-zebu-of-vigor-6cb2cd-mkl@pengutronix.de>
 <d2afb4cb-145e-488b-8f6e-c83e38735526@app.fastmail.com>
 <20261020-nice-turquoise-dinosaur-3079bc-mkl@pengutronix.de>
 <20261020165101.5e74ab2d@pumpkin>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nxslrybgurijn4zy"
Content-Disposition: inline
In-Reply-To: <20261020165101.5e74ab2d@pumpkin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_235051_319543_FE543789 
X-CRM114-Status: GOOD (  32.14  )
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


--nxslrybgurijn4zy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/2] vdso: Add VDSO_UNALIGNED_PACKED config option for
 ARMv5
MIME-Version: 1.0

On 20.10.2026 16:51:01, David Laight wrote:
> On Tue, 20 Oct 2026 16:56:40 +0200
> Marc Kleine-Budde <mkl@pengutronix.de> wrote:
>
> > On 20.10.2026 10:24:51, Arnd Bergmann wrote:
> > > > FYI: there is the kconfig Symbol HAVE_EFFICIENT_UNALIGNED_ACCESS. C=
an we
> > > > make use of it?
> >
> > Just noticed that sashiko's review contained the same remark, but the
> > bot only posts to the linux-perf-users@vger.kernel.org list, where I'm
> > not subscribed:
> >
> > https://lore.kernel.org/all/sashiko-outbox-178182@kernel.org/
> >
> > > That would be better, but I still hope we can just get back to the
> > > portable code across all architectures for the in-kernel version.
> > >
> > > I have one more request for you: can you check /proc/cpu/alignment
> > > on the system that shows the performance regression with and without
> > > the patch?
> >
> > When booted via NFS-root to the login prompt, we have about 570k System
> > alignment fixups, all in the IP stack: :/
> >
> > __udp4_lib_rcv+0x78/0xc6c
> > icmpv6_echo_reply+0x160/0x504
> > ip_send_unicast_reply+0xf0/0x3f8
> > ndisc_send_skb+0x15c/0x40c
> > rawv6_recvmsg+0x114/0x3b4
> > tcp_rcv_established+0x3ec/0xba0
> > tcp_v4_fill_cb+0x70/0xec
> > tcp_validate_incoming+0x540/0x868
> >
> > Comparing v7.0.12 with mainline "unaligned.h" and reverting commit
> > a339671db64b ("vdso: Switch get/put_unaligned() from packed struct to
> > memcpy()") brings no difference with respect to alignment problems. But
> > I see the increase in I/O performance (measured with "fio" [1]) on a
> > UBIFS/NAND file system:
>
> So the nand fs is hit by the memcpy() but there are misaligned transfers
> in the network stack.

Yes, I came to the same conclusion.

> > - v7.0.12 NFS root
> >   User:           0
> >   System:         573956 (tcp_measure_rcv_mss+0xe4/0x1e0)
>
> I can't find __udp_lib_rcv(), but that looks like it could be from expand=
ing
> tcp_flag_word(tcp_hdr(skb)).

yes

> Which would rather imply that the network driver isn't correctly aligning
> all receive packets (honouring NET_IP_ALIGN).

ACK

> When I were a lad the kernel just paniced and userspace core dumped :-)

I still remember the good old days with OABI, without driver model, nptl
and git :)

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--nxslrybgurijn4zy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCathgxQAKCRDMOmT6rpmt
0jDRAQDdKivpD4Ek6H8Y5pc2nAnk6NZG0qLUVYsEy7vIcCQVnQD/bUYp632Mtjg0
/gMM5WjrAcuwtNLp9usZ6SRndk/o7QE=
=Ktqs
-----END PGP SIGNATURE-----

--nxslrybgurijn4zy--

