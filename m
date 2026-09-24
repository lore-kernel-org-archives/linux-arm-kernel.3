Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC93C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPST8MJ8TSeF9sY6hxKTYUf6ipTLK8bGEw9EmCQ4rxc=; b=I2MdcrByE2PJpZmZX6cv0G25mi
	YTFHBnEAcmrlLLgayi413AXUl7MpAGalHg65vYPc7Si0Es1b6DSjbgWpcxSn5R6YNGiqCxX/ezETL
	ieivU31wZpqESnHEZCwSxiNmzrRJOIj/zFZhHhLQGjnmlzxaNu0dqs/VJDE+pqUgsp+Wi3waJafIn
	Pt4Uw+ZvGVCPrAv6IVZiST6AcAIFhAyBLsRmVbFXNuG7+arPMAWuQYtINbsVMYIMThEMpj1Vj3cgi
	ael16Kzn6C9vGslOg0zsGdF8HIZ211W9lEMPpjSZ5lQhJjJB82J9AVBGDkQwBQtO7M3CX3zdMEO/z
	uaDN7S2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iOU-0000000AxST-4Ar3;
	Thu, 24 Sep 2026 12:17:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iOT-0000000AxSF-1WA4;
	Thu, 24 Sep 2026 12:17:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1521D4136F;
	Thu, 24 Sep 2026 12:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88CE51F000FF;
	Thu, 24 Sep 2026 12:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790252261;
	bh=cPST8MJ8TSeF9sY6hxKTYUf6ipTLK8bGEw9EmCQ4rxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fMA8CxqwudWuPG0E5ZdCROfZrhpZq/XSp9/Lt9Q1RaCjs5rQaJ7KDPucalqvCr1cV
	 ECYVS2CL3hGU8ncfQZwdWRNcHxlAMY+Ep6JstbwXixQLa6+bT0t2DX+C7j4kxDRC4K
	 OZVjaIxhCC2+i5ViQagcWtrA4cfs7diqgwcFyH22rFyhyZUWgD4lS5sMZ4q5H7jmZy
	 E1atClSu+dtDj4hS3nqNQ8yET1UoQJxIqdr1iHUAWBdRVzva+PEYcARIWBWrdPK5yd
	 Wf/j63ZYMCOyd6KuI3xxGX46bXUl9S5LJaqL1Fj4s1cXfbcJOpnY3efdP2K7joxlAR
	 T4yS97EycaYNA==
Date: Thu, 24 Sep 2026 13:17:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Tim Kuo <Tim.Kuo@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>,
	Sky Huang <Skylake.Huang@mediatek.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: mediatek: add mediatek,spi-ipm-v59
 compatible
Message-ID: <44a113b8-1ce0-4a17-bc07-b22f15665ef2@sirena.org.uk>
References: <20260924031211.2199921-1-Tim.Kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tI8QpB5ulHks/lh1"
Content-Disposition: inline
In-Reply-To: <20260924031211.2199921-1-Tim.Kuo@mediatek.com>
X-Cookie: Oh, so there you are!
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


--tI8QpB5ulHks/lh1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 24, 2026 at 11:12:10AM +0800, Tim Kuo wrote:
> The IPM v59 SPI IP differs from earlier IPM designs, most visibly in the
> tick delay field of SPI_CMD_REG, so it needs its own fallback compatible
> rather than reusing "mediatek,spi-ipm".

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--tI8QpB5ulHks/lh1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmq1FN8ACgkQJNaLcl1U
h9Dkxwf+JLiki44QczCJPdR7+T+U9+ImnKHa4QgCTBVGtu3Eyic2dwfep5sTkxd+
slZAs0royqIPXTRPtZmJnSrT2THSkvnSJ2YKQ6Oe5i/JbHDDIYxBoA5jqrX0hqUJ
wAID5faIFg1aNzFABtragm00EcLB+tD4j3J/uDQQfm+52mFNW89HCIaSAYT3SvZB
0tJGgE9qxYFTscyEpluvYGy+T6zl1zwWxd4ejiLBslNDW9rkfMycAcP43DL18TzE
Kp5PX+i+djEYoo/j/e+w/bA0yxdRmvflbCsAFPFFvgWfK5PUtBcm3mS6t7JTCbvf
AmTWpvf0CKPjopPgQv+uvXJZHePGzQ==
=Mwwx
-----END PGP SIGNATURE-----

--tI8QpB5ulHks/lh1--

