Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B06E6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zbsuj8XK0ar8Pz/7GuW4gTqLG+EZTOznTOFJr9y4/uY=; b=I4eKdGjd6nUnPf2duUDBxJzJAA
	cRTshyYjzPv6ZbrkSErhMBciLlVf+6BPZdAMNDZjUrxfzdNYWQqH/B1l7vhKj/eREtQb4nA1CoOzi
	xQLxa2/sOudGDWyvWASeLBsdObo+quScj6+ZAFD7d6/ejSLyzOeFLN+WhtX28n5jpy+e35hOgA/gY
	JenS08R5uRhpYe2uXLPXG/xj41eIY2ZfgGBcYlm1UenEz2marCR3KapQ7ffRl5GoB4/0+AsbfRSOE
	DMZ0iP/clfQgr+JiuGM0GWbCYt6iVGEpN9UkLWg8BJnlNtcJTkljZPwW7T5rFvRkSyWXCx2So6P9l
	8hR+GZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uWs-00000007gEf-2uIC;
	Fri, 01 Nov 2024 16:29:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uUt-00000007fw0-1TbD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5004A4472D;
	Fri,  1 Nov 2024 16:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7D2C4CECD;
	Fri,  1 Nov 2024 16:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730478458;
	bh=kJqFcsvQINdidT98+YNnLof9J1GKlvt9L8buCuMsEtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sl8BgwcwXkDpC76XnctTpLrhDP+mSRqYETjfbM1UA5+8kI2Tu+SjqUw0bVQd8+nwh
	 u+6SaLasKcLMdvxgiafbTqYANY03f+frzcUtYQS8iHWY+jhd5/VenwNIipiUFtav9x
	 +LSrAOWO9sqokkZbHz0/W2pvEtXOGRacCwjJMZEgqGEthKKvqAj9r2eZzHBLbV1JTf
	 Xy9HiY8jqSYtJXuz3hNEAhL2Vgcz857CwP1LqsI2y6s7kRVh5moCZFlcaWzjfWGqo8
	 wO1cf/hsOhe09GBvvGrpm9fyAkUa7J7WZBLE9xIlDhct3+N20bG7TtvG2Evoj/eez2
	 kva02sLNcG4ag==
Date: Fri, 1 Nov 2024 16:27:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] spi: apple: Add driver for Apple SPI controller
Message-ID: <0b4901b4-8cb7-49e2-a411-a6c57b9edd97@sirena.org.uk>
References: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
 <20241101-asahi-spi-v2-2-763a8a84d834@jannau.net>
 <e3008c6b-ba71-46cf-810b-053dbafe2cfb@sirena.org.uk>
 <20241101161905.GB194146@robin.jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mRv77eGBnhX9W2oC"
Content-Disposition: inline
In-Reply-To: <20241101161905.GB194146@robin.jannau.net>
X-Cookie: We read to say that we have read.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_092739_478790_3926C367 
X-CRM114-Status: GOOD (  17.85  )
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


--mRv77eGBnhX9W2oC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 01, 2024 at 05:19:05PM +0100, Janne Grunau wrote:
> On Fri, Nov 01, 2024 at 04:08:20PM +0000, Mark Brown wrote:
> > On Fri, Nov 01, 2024 at 03:25:04PM +0100, Janne Grunau via B4 Relay wrote:

> > > +++ b/drivers/spi/spi-apple.c
> > > @@ -0,0 +1,531 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Apple SoC SPI device driver

> > Please make the entire comment block a C++ one so things look more
> > intentional.

> I did after your the same comment in v1 but reverted that since
> checkpatch.pl complained. See

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?id=a674fefd1732#n3742

> The inconsistency between *.h and *.c is surprising. I'll change it and
> ignore checkpatch.pl for v3. I'll address the other comemnts as well.

Did you make the comment block a C++ one or a C one?  The SPDX header
does need to be a C++ comment (//) for the SPDX parsers so I'm saying
make everything else also use //.  There's some constraints from tools
that consume C headers but don't support the C++ syntax.

--mRv77eGBnhX9W2oC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmclAXMACgkQJNaLcl1U
h9CKEAgAgU3tdPmqQKdOXiFwpZBujNpETg0Fgi0njVkztO2Zp9Wk4RNoW6rfq2Kj
L4izInHsvBx+vaOZoym2NKgYrrjTMiETjR8u4K+5NP0X0FCqOS7jKAl+Zzoh5m9p
l15LtYap0VAv5Ac10zoLbvPX1GtzC6R36fPMvxAXQ36OlI4cPevqk8IAo5KhAis7
NPe8+92HTdTYnAkV+m3fqJHgJXF3UaQyWSFElHJO7CpCC0XtN9Gu8dJ5Qf5lpR7P
y9Pgm23VUmIHKTX6EQXWwooHGme2PxqjIoPxV2/evnFJ2XOukZYe96S33saXLJHC
rRqkV1jhePyVNP4tSN4KGHSOjtLH6Q==
=GRtA
-----END PGP SIGNATURE-----

--mRv77eGBnhX9W2oC--

