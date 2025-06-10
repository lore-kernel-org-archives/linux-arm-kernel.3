Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D3EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBLPiWnO9uNKawNvP06Zsj18SKgG4bUyQKJLE9C1e20=; b=d6beri7wYskrEDuVYukxAWjKZY
	lvtL2IiMWfSHNKUoYHOiLvC/gUyvT4Uhe0p1awYUeiryomnPV1oEGaUaNcP/2jewa/spe5VroqOa9
	8s8XzKPIIhgOyDz51ZekUXRt8x5zxnXtpS3BxkzAdUXy0WxTGzHPbCH+tBSV0/EXuJZ5ceU39WicX
	yMx26kiGkUb/oBZhK8xK+qBLUtkmDoVlfbJJMiFf0cBXFKNU4C2p+h87itGbcI0gfZOtbdFG42H/u
	UBHGXZRHFvdZeb4Py+3cy1uLUqumAykpmwnkG4RPs0xRhEN9XyQgBhf6y7qWDAgnGsDSvC6928g1S
	8ItDKINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOy8x-00000006m4W-40Nm;
	Tue, 10 Jun 2025 12:31:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxTf-00000006h36-1T8C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 11:49:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 38F9661127;
	Tue, 10 Jun 2025 11:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADCFC4CEED;
	Tue, 10 Jun 2025 11:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749556152;
	bh=fBLPiWnO9uNKawNvP06Zsj18SKgG4bUyQKJLE9C1e20=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDx0CSXhosb1MCwmMMLVBJhw4RHs2iH3RBVbfKPFLyKIkg0CJg5XzcmINGrTRkAz6
	 E5OcUYaz7jKYEuQYZCwxhq61G13i5C0uwczEzl8xIHTMRjCm7S0UMlRCYNoqTXOv4T
	 hrUoqkNpRQXUTmLEHSAAAlUSYW7NUu7IjoFtvE/YCZeSMzbJTYUUnnoSmF93KM/RAf
	 DtoMizdrcON0V0PwX7k0WZrQ95efyP33dD8PkvqrJ/W9K+CHNTAMpznuAdUWBHhWyw
	 9owOzHGckHx2s4htkjDtZeJvsLrGUrsckNsHlSl90arLujT34IiH3CreHRyRo3vp3A
	 tZ6oIom7ul+nA==
Date: Tue, 10 Jun 2025 12:49:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v7 0/2] Add `devm_dma_request_chan()` to simplify probe
 path in atmel-quadspi.c
Message-ID: <f21f9aa5-974a-4326-88e0-cd29fd24555f@sirena.org.uk>
References: <20250610082256.400492-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zJq1f6WaSVUF1DVa"
Content-Disposition: inline
In-Reply-To: <20250610082256.400492-1-csokas.bence@prolan.hu>
X-Cookie: When in doubt, follow your heart.
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


--zJq1f6WaSVUF1DVa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 10:22:52AM +0200, Bence Cs=F3k=E1s wrote:

> to their devm_ managed counterparts. Patch 1/2 adds the new
> `devm_dma_request_chan()` function. Patch 2/2 then uses this APIs to
> simplify the probe() function.

I'm not copied on patch 1, please let me know if/when there's some
progress there.

--zJq1f6WaSVUF1DVa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhIG7MACgkQJNaLcl1U
h9AQeAf9FV6h6KezO9cviLoW3oxs2kOWvPhEC1ccqhMicpP9/H8QcdXTjPyjz48a
WEqp9J7VeP5ztmAotBI1XkQE+gweqge9iPCwwCOPsb8kefWHnjqpwbJtfK2MKRBX
JIYzW2fX/SGLCqwGrPARhh86CQgMsyyTDPN2tKDojFafQi5a3XzinXkaxQ0p7Pfy
GEIwa3+ABIcBOXHYwQ/ldFfolpWhEArjfPW0JYfpUFvquRzfwL8gfsrKq46VrpDu
2RlD/s5/qV8ZOyVaSL0PLbReZWmPWpH5FKgtWrE4FdxulCPOrEocQhDwfd8fRch7
96FfsCyTEaMYv51GWyK8Ivng7C5XcA==
=eUzF
-----END PGP SIGNATURE-----

--zJq1f6WaSVUF1DVa--

