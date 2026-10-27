Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4886606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1FmlVAsI;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Zq85cipr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=99Quot76Ew1Xga+Y6JjFMpEKhii0fTwKrTpcfefLdIc=; b=1FmlVAsIDrXV7RHtd8xPWdFj2E
	FCENaBFSLCwZeT5P9a9zIIMDArdb6gHurHOfUlDFJPi0NfgjnTNmeOGQVvqt7GgCiQmi6C69tfLf1
	NpVQxndJBa9s3lMw4o9b999Yyyj4KcYR1eKTAG+/D5FQryxAJ7nwLHAO8mNnwnk0FEaUUI45fnXBl
	durx7ZbR3Fo42gAJ6ReaUsscbCQ+xVaS6zAO7A3J53IBJsjymWJ4f+CiygC03O7c6FzyKMZu6NpTV
	VPR3hvLSIB7rl733vkxWoC3VxcyLpoEQUNFcpbnQUJ26BwMQoNeYDfjOaGCpa3/tLjiLPc66r5SCb
	bmG2pizw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdaN-00000004AlQ-24E3;
	Tue, 27 Oct 2026 09:35:15 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdaJ-00000004AkY-1fUS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 09:35:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id CA39F2022D8;
	Tue, 27 Oct 2026 10:35:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793093706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99Quot76Ew1Xga+Y6JjFMpEKhii0fTwKrTpcfefLdIc=;
	b=Zq85ciprUiBzG8awWpiriexHzGFwlu3KviMpkLQndFmDiByT8P0n07dEuQeRH3+H0V3N6G
	JaIQ50YBT3zjoRNhgOsxg3Z/M7Kw0P4I8bCkviAF51ZqsQ7HEoY+ddXQv78XNTjGYHFiG8
	a8uxXpCQTZ4UCaC+TLahNPTmVlWU6BuVz/7yKXfjyt/GTy1mE8wv+W3vxjGfq8/FFU/zHI
	07xNEsiWFx4aLW+p8xcqs1vHOvRGg7it1g5bfgCbSdfCoorEcReQxljOGVZnDQuAzVMJNP
	S/GA4y9aHsqLQXMa/uAp/l6EjHmljFkgeNDJKxaLIT80HTPnlFNol7AJMDNM/A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793093706; a=rsa-sha256;
	cv=none;
	b=JtIaUZ0IwpCGq8Q7PIpl2oVGHj5zeqIC9ItIaqKjcPfHuZ/h/uaK4oaVWv2fWIwD2Y3Q3u
	3Zkw+epEPWg8DxmxVST4Ox1P3WPIlBV1yA09IIsdhLwbjXJoCy7AhOXOnVI6kI+Amsyj77
	hNzQgAoktS659GGWtnrt/j86wZuDDafQgsVQu+4rC8L+RG2ON5tY16uPHffSoMiG/L6LbJ
	rbvCsiJSQRckmwU15Y+hlMmM5tLWppOpAR34go+rGAuxXnke6eDTT14KHBCgvvuUw668NB
	j9BLhKzQ6CjKfM66Jh5qEMWZisxWBbleu9vFgufzdUff6zhx/JFfZLOF8ntmdw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=mkl@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793093706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=99Quot76Ew1Xga+Y6JjFMpEKhii0fTwKrTpcfefLdIc=;
	b=MJg8GDPiTLlhRPniUvOMasJ8bqJUm8m/Pa64GL2YPLlEtO6f+Jl4TTbCMe3VzTGhHqgb1P
	G8lmE11AAwmUx7Cc2tXgsaybOJpB3XbF4GJ5t5drb0+N0vQ31XC2Es6v01UcH0s6Vjc8/T
	/ksKtWgNqMPGEuB/tMw5vAYa9r3hvcyQGGTk6B30dvsaWXGHLRwmisaD2BNzEJRuA931vt
	Xx3X42nL1UOjpXYX8j96VdddzzHiMMnEvgHm0Ac9CbOfUDx09qR2jFe5hJcayBjQLKutxS
	MWfFdxfwjIxIVK26D2yz8kmeox5+xec4TPHTdCbaPk5YpUpjJ6DnGOIxNht2aw==
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1xLdaE-001PRs-2M;
	Tue, 27 Oct 2026 10:35:06 +0100
Received: from pengutronix.de (p4ffb23c7.dip0.t-ipconnect.de [79.251.35.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 386F35D7AF0;
	Tue, 27 Oct 2026 09:35:06 +0000 (UTC)
Date: Tue, 27 Oct 2026 10:35:05 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>, 
	linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v5 3/3] can: gs_usb: check can_rx_offload_add_manual()
 return value
Message-ID: <20261027-arboreal-screeching-flamingo-0bb914-mkl@pengutronix.de>
References: <20260907104942.17089-1-ciprianmarian.costea@oss.nxp.com>
 <20260907104942.17089-4-ciprianmarian.costea@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="idthn2kgmfdskzon"
Content-Disposition: inline
In-Reply-To: <20260907104942.17089-4-ciprianmarian.costea@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_023511_619905_23215ED9 
X-CRM114-Status: GOOD (  14.04  )
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--idthn2kgmfdskzon
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/3] can: gs_usb: check can_rx_offload_add_manual()
 return value
MIME-Version: 1.0

On 07.09.2026 12:49:42, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> gs_make_candev() ignores the return value of can_rx_offload_add_manual().
> Once can_rx_offload's skb_irq_queue is made per-CPU, that call allocates a
> per-CPU queue and can fail with -ENOMEM, leaving offload->skb_irq_queue =
=3D=3D
> NULL.
>
> Check the return value and exit via the existing free_candev() on error
> path.
>
> Fixes: 24bc41b45583 ("can: gs_usb: convert to NAPI/rx-offload to avoid Oo=
O reception")
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Added this patch to gs_usb fixes series.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--idthn2kgmfdskzon
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCauBwRwAKCRDMOmT6rpmt
0gFAAQC0c7UT/+oEEwTK/YSBqia18aUuFU+AP3rZEWHn9gCMlgEAlDTFrIn7dn3a
RrcB2+klkNhtjso7OM1K6eEGANr/nw8=
=YQo3
-----END PGP SIGNATURE-----

--idthn2kgmfdskzon--

