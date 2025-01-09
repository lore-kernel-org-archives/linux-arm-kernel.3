Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1DDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 16:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fJlJq/+u5KfmcbllWehUU7PAC5CHkVx22ok1Fnsv7w=; b=PK0F21IvlU32Cp1oSHCzqMSYz9
	XzK6Z2jj2Uywbsluhm2Dfmvk946+nUB94vQVicM68FmXO6cALvGua0UsF5FE6xKV2DlTjt253NZe0
	fTIxUrVPEslYjy8HutcgWxHPjlUL8zeTpAvOFgqww9lkbHVEaxu/qLMiuWSeQNUo/wM+1GKMCe8LT
	7amvYmSxYr25SAOR88d4o+V+4GYu8OQe5WpGLDI9GOd+bbJPQw5lgnQGfeSqfOTkI+TqILEkehiqV
	eK0Zp19HbQbpImYIrI9xuMpP0bRVIIRKdcWTfmrLcjM4ls/pMo0MoPagjlzn33KjVIN/BjwYg3VQk
	2cVjLqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvcN-0000000Cj7j-1X7l;
	Thu, 09 Jan 2025 16:42:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvbA-0000000Cj0N-2hlc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 16:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 353AFA4208F;
	Thu,  9 Jan 2025 16:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F1CC4CED2;
	Thu,  9 Jan 2025 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736440891;
	bh=Pc8D12fz097vam6BOa2bLEZlROyGS0YXUsOJItiSWzA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=OXPXiH4dSwOix47DVg2CmSpZyEGxsVFEZRziGMccvL1OhNA/OcsXc61PmM+0Q5hke
	 fkoZfd9zwtW1VIWMgSpOUPzpckevoHv0qiANaEHX5ekxdw6teP8zOwyZg+c5DvIGjT
	 pN1UUV6LtLjDnZN4jSMFxmVd5wLhkhVLYqXdMBMzPni4GFbh2SqX64ejU4IdluF0Jm
	 R7r4lJE5HLS6O5P7/XZyDGKfqGr/LmkyYGw68RGHwb6tl9PVOCjorndULQEXQDtPvT
	 gq9XqtvbdpilYjEvSb/ei9MX1HxZlQhDxlS5/0cUr6e37k/QjsWsh50jzfSA2xt9tg
	 rLFMSbkyheRYw==
Date: Thu, 9 Jan 2025 16:41:26 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?B?Q3Pza+FzLA==?= Bence <csokas.bence@prolan.hu>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v3 2/2] spi: atmel-quadspi: Add support for sama7g5 QSPI
Message-ID: <1ee2ad6b-0880-4cde-85d7-dc7371cbbd8e@sirena.org.uk>
References: <20241128174316.3209354-1-csokas.bence@prolan.hu>
 <20241128174316.3209354-3-csokas.bence@prolan.hu>
 <20250109-carat-festivity-5f088e1add3c@thorsis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2HD0WHIUxspiNUHT"
Content-Disposition: inline
In-Reply-To: <20250109-carat-festivity-5f088e1add3c@thorsis.com>
X-Cookie: I'll be Grateful when they're Dead.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_084132_753670_3B7DBD1D 
X-CRM114-Status: GOOD (  12.14  )
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


--2HD0WHIUxspiNUHT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2025 at 05:27:58PM +0100, Alexander Dahl wrote:
> Hello Bence,
>=20
> I had another round of intense looking at the code, this time I
> focused on pm_runtime handling.  Although I just learned about the
> basic concepts, I think the ported patch has some mistakes.  I'll

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--2HD0WHIUxspiNUHT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd//DUACgkQJNaLcl1U
h9Dlowf/V77B8p5vMXPelljSMYFZLdf5H8msJFki55MJyDQ5NFoKoiCNj95FYBfb
7FjF4H3Adaf5PtpPI/saagNuhC2qqLg36S75VEAcqxDRYk8dyO2oi3Y6dG75xKue
sOqsuVMJQBUHnQx7OVWgqhzyMDjyMmEz7MA0rmL/Bq0+wsdOFmg55BonDD8bPIyn
ykzdY4VKDg9Z+QAUwHQw63cac8XXdpxOz9pooqninaebWa2U5B1phXL2NeBCJj1o
IH7UaK5QMAsb2aDXdVgJ+P/yvnECQhaw9mgrQAHgKBeMKNyhXNaz0o2RX34bKj+S
bKf2eibWHNHyI2HgN87Frfp5S7KCsw==
=+3aC
-----END PGP SIGNATURE-----

--2HD0WHIUxspiNUHT--

