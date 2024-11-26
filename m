Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D98CD3B98A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gQdWeIQCLxHuuNWRAycUWpTxArAR51o8oVYNO6gh6w=; b=DbekRjZyNoszkHBglE7DBuZxx+
	p9Lda4Iw8344Ctnc9yODiRN94VfwtDcT22STv0z3i1za7b5pjUhv23lp3ijd4c+pjzdHRswyxqqry
	PJewloLeidYxI0dFANtphrUjOsWdixOcl89wdgwSvX+7QFA3PlxBih6dSruewmXvXbJSWDktdAvV0
	/Py11uPOzdXde+lduvP0H834vdKfZGdqVcNNUHz9/CNd0wCnDILRZLo3Bbl/SrPLgvP+/LY4Tz/Hi
	LhCVcYJMNvUqMWgJvRccSVmOZE65UlZnoAQax62g7/uvHvLXwrphCudpsBcaCIAHW5/28c9F8PyJX
	lUzfllHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuzC-0000000AbDW-2Y7w;
	Tue, 26 Nov 2024 12:48:10 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFuyE-0000000Ab94-3P7G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:47:12 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFuyC-0004Gh-85; Tue, 26 Nov 2024 13:47:08 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tFuyA-000FfK-0g;
	Tue, 26 Nov 2024 13:47:07 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 9E8CB37DA3A;
	Tue, 26 Nov 2024 12:47:06 +0000 (UTC)
Date: Tue, 26 Nov 2024 13:47:06 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,2} boards and
 add gen3 board
Message-ID: <20241126-bald-paper-ringtail-661462-mkl@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6c2nwor5larsiucg"
Content-Disposition: inline
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_044710_849720_2DD5A580 
X-CRM114-Status: GOOD (  15.96  )
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


--6c2nwor5larsiucg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] ARM: dts: stm32: lxa-tac: fix gen{1,2} boards and
 add gen3 board
MIME-Version: 1.0

Hello Alexandre,

On 19.11.2024 12:34:57, Marc Kleine-Budde wrote:
> Hello,
>=20
> this series fixes some problems found in the lxa-tac generation 1 and
> 2 boards and add support for the generation 3 board. It's based on an
> STM32MP153c, while the generation 1 and 2 are based on the
> STM32MP157c.

is there an ETA when this series will be merged, is there something
missing?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--6c2nwor5larsiucg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdFw0cACgkQKDiiPnot
vG9EKwgAi5XkzgfNgY7ixrqcwOoyuuX6KNLwCoxeHNrfzr5giHyilo0qGoi8eoOm
4gRl8j1NkMCgZl9O5lsUwqelHDQM7yx7sJ1agE2pBTC8NbjhKo/BdqfnQRYxNtST
t+wpaGLsn6/QH3v0gBrD9Ne5vvkXVEywskzPDZgfnyzBt9XAn0CNRxtdwCK9+uk1
2Jz5VfSu7MkaFIE9K6ET/oNx589yjTPj6nLpp9vwXndBlJ2v0dxybJ/Mkyf+KxbU
GtHOPzWyK3aTfdUDFn6w5ssXoErNy2v+HNSgfJt3mUtgAJEMch+URzWR6nkD4Zzi
N7zolS05uqsPqMNxoFuN1iAx5cC5Dw==
=EJkB
-----END PGP SIGNATURE-----

--6c2nwor5larsiucg--

