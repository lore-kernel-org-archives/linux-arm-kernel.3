Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C76C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 11:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mer6qGMAyp8EPWtGukSzsuJDZTrkYf5FnFWHqQ9ONuo=; b=MElGPQ8ETExdfgxlPzTNVUafer
	ixrM9fQGd+2C3fU18OX1nG/wdEG0eRSn59kR0urzRzzVzzCnrAncNiaqSsmAWSP3SICoC9LYloFdK
	DLfFpDmfVPQ8a5pXnpi1kWO4N9ysZeWEPoig8AGn/d3wnSgr4T57vDL+vTmp8XVJhmFJ13fbRAF7a
	YyzMIcMCwtKTJpITDZpXj0VfcHFQ3PRcEM8SKkKIAbQPWCzl5yrmHpO4nf3RMwOJLJD5PjzXKjsvS
	M6/XOHGDOYTyMoPYUhQZNjtiufS6qUphQzP3sJ6JRJ8SgRsDqcGaPZgxbTuF96qjqBJMHv6dFSQ/1
	6jDsirMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPflJ-0000000D63P-42Xv;
	Thu, 12 Jun 2025 11:06:26 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPedv-0000000CsfK-081c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Mer6
	qGMAyp8EPWtGukSzsuJDZTrkYf5FnFWHqQ9ONuo=; b=RlPFGNvfMPgncelkj25I
	qs3/7isR9NSt1VjTlfOcMicbj9GlJCRQdolbZo4N6pvDbZEvcQ3eRlON/kTRIPot
	4KvvmCFYd11wjqg7vDgNCA5f+/eHQveyyNJiPijgnTKJYd7Slk9DkYKYncDu3X07
	IxsXn0ArHFElnhIOM42bg1qYFPKmmwrB2WyYUdKHqgi37eA5xpxTyeBMC+mh+3Vg
	m7ZtLlKel38jBr3x2nidl7BTHJ/Hbs07skrAi5P9FxzRq8DPAQ4Gu5SdjlBQ3GLP
	tb+MXwSun8QiCBmcW5V/wMs4t+CwUdpIplSCwU7zCzuowqKZoXnIQdWr1Vx6yYg4
	Sw==
Received: (qmail 3578304 invoked from network); 12 Jun 2025 11:54:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jun 2025 11:54:36 +0200
X-UD-Smtp-Session: l3s3148p1@SrHL6lw3DMUgAwDPXy2/ACpZfVCNKldR
Date: Thu, 12 Jun 2025 11:54:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/7] arm64: dts: exynos: use proper node names for GPIO
 based I2C busses
Message-ID: <aEqj2wS7DyGrOyY8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
References: <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
 <aCtK1-Yn6u8-n8mU@shikoro>
 <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
 <aCtbg0_vD07g394k@shikoro>
 <aCt9e-rrOOR0C5HI@shikoro>
 <1cea4f55-752f-4581-a003-1c9d31a36039@kernel.org>
 <aEqGtjc7F8vvY4ph@shikoro>
 <b7d4272d-c08a-4c5b-814e-9367bf858ca9@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BMGydgXgrD79q+F7"
Content-Disposition: inline
In-Reply-To: <b7d4272d-c08a-4c5b-814e-9367bf858ca9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_025443_341448_1B692923 
X-CRM114-Status: GOOD (  10.23  )
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


--BMGydgXgrD79q+F7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > https://lore.kernel.org/r/20250519184530.21845-1-wsa+renesas@sang-engin=
eering.com
>=20
> I see my approach of using generic i2c-X was also preferred by Rob, so I
> guess it won't get it.

Okay, if you guys say so...

> I sent patch for Samsung, with reported-by credits for you (it's also
> reported now by my tests and earlier by Rob's as well, though).

I will fix the AT91-based Calao boards somewhen, and then I
consider this case closed for me. Thank you both for guidance!


--BMGydgXgrD79q+F7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhKo9gACgkQFA3kzBSg
KbZ38w/+Pgyysh+5Rz9SxTN1/5OcN6oGorrscECqMPM1RTIqYe1tp0eucb1rQUTd
g++TSOgXe9g5MBko5wyGbEDKTFda00FcmFAYJhdVjb//xbNncxB4YB+UKmgqqpRe
Q0cEUKVl+2DOTjTv7phant58+H8f3fa72Y70SYQsdbZW117LxWZ1RGY/zMoNoY9k
wOiGxaUm7EjG3mPh9cyCyG694h8pV9vsq+3B/xgkLiPo8tR9vR+azwZAd0Uo/3AG
q4JaRyC4VlxQ2oSy5+5uaDwwkaWONylQIck6AhmVgf/dFksx4IPjOpKxSfvp5C/Q
vc5nxE4Vi0UAFTxoDTB9w7Dp4AokqUsGiFXGzmPCamor8dETqCFGfzkHwzSk+Bmj
sWPnpa+T6g6L3oPx4LsAKn+Jq9KJCF+Ms+loXSOQjoq0gxbLXM8/vC+K2a19TVFj
ucCcgZQM0/WuX9Q4N7cSGQCHgoyuiiMdzel7i1PEVBtJ8ZZ+QGc+96d8YUPuPlpN
aXdI7zGpmPFcsvwwMkt8KSclfZqYNoLx2rDXI52q1ERfQEPLt6TH8zVHohu/Hh4n
hJZVco+mIvlUv2panmH6tP5qbYOilaevnyFa4ugnecpt8YfzvxknWwhdpbxwtXTw
IjcWfwh0bshNPv8vzSt+XPRaiW1QFLH5Lipc7m/Jr4IxbRNOEXs=
=IiEt
-----END PGP SIGNATURE-----

--BMGydgXgrD79q+F7--

