Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2CEE6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcWAo8DCegf5+YElB2UgGTanyPHIANpyD3nTBJJLdD0=; b=LuuT60ovoyeq7oUGMXqiFRCZf4
	x8jrO4Gl2gGopkQjSqf+xgFBddpFv0e8fkkHBvWzBercFWo/TkPqPVxG8vsADGP0bphDa5hdKqehu
	jdaXWEimn1k7WiVLS12ohb1Q0HcjiixdUz2qmRVLg7KmyOiKL3eSopIU3tlkHoy6OCSHAXgdMjp8c
	eNwdfKTdd6K4hFl8t4FU0hi7TNk1GPbtCeQA9wYaeFSDSAyNddK/0zCyQAwUPZTMFKRSfLculViro
	hRdr1AlQrVbn2sWFcck2HrksDYszLkdmtpQH0IbhwS1UsLOAHSc1KzWK6tYt1JK2cHXTEDTepsn5w
	W8H6/vmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uHr-00000007czw-3DX6;
	Fri, 01 Nov 2024 16:14:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uCJ-00000007bvI-26eR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:08:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7DC96A44568;
	Fri,  1 Nov 2024 16:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB14C4CECD;
	Fri,  1 Nov 2024 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730477305;
	bh=z/zU3VAMR7o1s5ellyeBMQGSOHuJK6e1Il8p5hmq1A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igi+83t82Hxt0inVEK7BtwfHMIYxT7T1W/IF8Lvn318KNmubbGWJJ070eXK7h+SPM
	 yQSd01WFJ6aPtEcz65508SDUNran5bN8aPnIxXn2SFiDrMtFrpBUJYagZ4KzgVj3jh
	 7Lls0s+1Ih5eZ4rn9zLCeIsUgUR/opOa9sP7r1D/ubbn7O5fZ6oaDBaWvc96uSZ1wR
	 UY3MG11aCzlzeBhawuAswUYPM2fT58m4IMaYxKkNZAxEZdTl/cYZ7cnx2yrq0wgmIe
	 P+CvxUvbmmMqES7bZu/YzvkJnLlKsYWre7ATT8FGCzcWFAXWY5j/2VAtF6sIAg1Ap9
	 Wf3b/tyZUslAg==
Date: Fri, 1 Nov 2024 16:08:20 +0000
From: Mark Brown <broonie@kernel.org>
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] spi: apple: Add driver for Apple SPI controller
Message-ID: <e3008c6b-ba71-46cf-810b-053dbafe2cfb@sirena.org.uk>
References: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
 <20241101-asahi-spi-v2-2-763a8a84d834@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vxQmEEN76lEDPmLk"
Content-Disposition: inline
In-Reply-To: <20241101-asahi-spi-v2-2-763a8a84d834@jannau.net>
X-Cookie: We read to say that we have read.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_090827_647929_686EDDDA 
X-CRM114-Status: GOOD (  15.42  )
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


--vxQmEEN76lEDPmLk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 03:25:04PM +0100, Janne Grunau via B4 Relay wrote:

> transfer, most of which we do not use right now. Hardware CS control
> is available, but we haven't found a way to make it stay low across
> multiple logical transfers, so we just use software CS control for now.

It is extremely common for hardware CS control to not support multiple
transfers, I wouldn't be surprised if it's simply not possible.  We
could potentially use it with compatible messages it seems dubious that
it'd be worth the time/effort of checking and using it only some of the
time.

> +++ b/drivers/spi/spi-apple.c
> @@ -0,0 +1,531 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple SoC SPI device driver
> + *

Please make the entire comment block a C++ one so things look more
intentional.

--vxQmEEN76lEDPmLk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmck/PMACgkQJNaLcl1U
h9BaDQgAgY0Tgn8A8AUWpa6rhj7aN09cctz9vhkmDJR8/ez7hwonJ4BpUrS1RES8
ERU9g7IS5n2nnmq4Fw2f0G0ZlKHHprCkmj/rfCWFd5CX19kngP3ipq5DW0msYyfA
xip5+8iAvEuHEpOmrTKE0cMQ+UMGSj5841+b97jvCfD3n8h6r+veyZ/fwzo/6hsE
9CAYB4LimTQO+3qA8GCKTUIi4C3uvoBbpu+yM5spxtYAah8BRcfepv7BWvLUPx6U
58ZxNVMWMlkCWq/6F/+lenAafU0MfPWaQiumdqGgAlxifOyy0Qv+VS7toKAI3bol
7P5EiKWJAIC1VcGogoYW9JHOlGX2mg==
=K8jA
-----END PGP SIGNATURE-----

--vxQmEEN76lEDPmLk--

