Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C24C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CrWiXdAIPuhzM4jCU4TBe6zxzkcqYp/yT6qASAmbw8=; b=IU2vml9D/GeCAN9PXbNO/BKzPe
	Ih5KeJqlL8EauL/+xuGuJX4u+ffGQQGrt7UsR+9Y1Wt1XKnqO9sHorVAl7jqS8rTrH6RqCGGTFr6w
	fvXwAPph8aC34yNG2GHd2wX7phWnINtlV/M/RlRaaPUTlFZLHAjeZVe3TzAwiyygAderJNNBM05yr
	x6wO77dob3afObME+vrwkwZ8dZ2jwOWmyznJQvFiKfjJo4wcuI00lzMPOI+OLl/DOdVGJDvaNS4ie
	YIry8zK8Nq9oINi2aD1Djs+IyMmLpj2peXkgxwgxgur0WEkDnKdiYA8/IMhzLsFeuiT6EUZ30m0/P
	WaOIs8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4E3-00000009xPd-2llk;
	Mon, 19 May 2025 17:24:31 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3JW-00000009nx5-0IDk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2CrW
	iXdAIPuhzM4jCU4TBe6zxzkcqYp/yT6qASAmbw8=; b=K3EU6ruFL/OpOWC/fUjh
	0gep71xq7UoPKETKLKH+dksyga+hRyN4tg4mGEPMVCz4Ty4WWbR4VP9QAGh2zXv2
	xWNyhBRF6VAlfEXo5hY6WAJ7i3iK08AZhey/jzjXA9GwsD8wShQlO3+zAUHTU6hW
	1oDYNIzCsvrmy6UTiIP1qdWPOO0/lYpePUvviM89KWaA3zX+m1BNBU9p0TIUoIwi
	R65ivy4C2HutHv6+GCqnCxi9EcAgXiAa5sBnVRbJATwxpz1l4jHnTqM2b/lj3WJv
	T/ZlbmSxuzcgPGsSwlzprt7PK08+SgjJDaZDbGlsQTIndntqOSMtLdiHPVlNB2W2
	vQ==
Received: (qmail 2560263 invoked from network); 19 May 2025 18:25:51 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 18:25:51 +0200
X-UD-Smtp-Session: l3s3148p1@RCBBlX81auZZz6uL
Date: Mon, 19 May 2025 18:25:39 +0200
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
Message-ID: <aCtbg0_vD07g394k@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
 <20250519121512.5657-2-wsa+renesas@sang-engineering.com>
 <006ee7d6-1289-4f4a-819d-9a5e5120db99@kernel.org>
 <aCtD7BH5N_uPGkq7@shikoro>
 <3f6e1b74-5d19-4194-b98b-91ab6f10446c@kernel.org>
 <aCtK1-Yn6u8-n8mU@shikoro>
 <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+a1bYfx2W27PjWcS"
Content-Disposition: inline
In-Reply-To: <e5a3ce2b-4ebe-44c9-9bf5-9f460d5e7fe8@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_092606_380721_D2868EB2 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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


--+a1bYfx2W27PjWcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think either we use i2c-X or commit 57138f5b8c92 ("schemas: i2c: Avoid
> extra characters in i2c nodename pattern") from Herve was not correct
> and needs to be fixed.

I will look if I can fix dt-schema instead. Thanks for the pointer!


--+a1bYfx2W27PjWcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrW38ACgkQFA3kzBSg
KbZh0Q/8DbOiOYPUo59X0oBswFavthsQBOuU9J18hLuCfgXpPyrkdzst3DHS1JbA
WWXljzVNmqqrooJf430r+Zw/jYzEn2AvnspnZKcFsrwpIXETEsrWWg6dsObXCEIt
wwkryPMmaXV/KgNEmaQfc7ijeNRYk1ulnp2jC0cK4rbaqn/6MSMzudwl5iXxFH7D
11axYicOsttAD212QJK+Y2ElfUPGfhEiWryGmkCmDezabV90XB7+SfqtXJ9U2Dyg
zVdlvACzqS+zniyon08c1NmGXI5N4AymoFUOdjZXw4ckqkTaLaWLchm/9t4PWLwa
qZuoeUWXJ5tuoXCKPga0a+E8v4CWP497xyUbdHJjtgjymF+ZCgVcLFBbw2mfxHKJ
zpdjl7h1hYiTueI6W9QGuAfrtq4oWMALdmWIQZyf+XAVbdX+Bw/7R0p7cx7tXR/j
ojyDDJTpNkD8Qw0xb4gt5kypL0XSXG6N5NBwKUZcdHZF6ALI2q6IZ1INAbah2mq/
D4xaoTq4uE5/BPJOCP4NrUJymvBblbyUpulCbA25Lk4ZV8DWyDxCPBF4ME47dMXG
EA21znickLZsnqQod0J7UjJd+4TnAWuXa9y8kfK/dU/ftmS9VBULRPLz0vXLNAE1
7liA4wl/HGJ/Yyq/edPygXFuq0Uxi+0u5x+n+34ZaDKTMZfAQLM=
=gMRk
-----END PGP SIGNATURE-----

--+a1bYfx2W27PjWcS--

