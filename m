Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2459C54FD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 20:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/BKoqkO4POSMF+4L2AlqfR/AF+GKC4XyR/BSvinyS0=; b=vQCD2+NyNogdSYsfB4yl9QkhP9
	QK4qlgcnYlFZAvHUwH8v5DHv+hXFP1nigmNcK2OIRJEYB97Oi8dZUTpMuTEI/1iI3Y7dCePBM5U/F
	Htjn8/J3A0iZlIYpYPeT2x9sye3lHq4EZXFiV/Y1FQcZFnZOhlLObKGoDzBN2Ochn/kNiWcmtN9S7
	bswuy8EXJJAzGFLshElGiu83UTr53rtqdCZB3VIFHHYN8tPWGNFNQG2nradLAvYyoWFzpCQbskGj8
	lPCZI7iUSIqAILd4/j0My2QufkblDeJpB0f4BA0Go3IjtuDjW8l3DKPcEmrKer1HCaYXQ2cSuGlET
	GkwCr7Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAmh-00000008wxQ-2mVM;
	Wed, 29 Jul 2026 20:21:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpAmg-00000008wxH-2iJ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 20:21:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8AB2405E2;
	Wed, 29 Jul 2026 20:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7F61F000E9;
	Wed, 29 Jul 2026 20:21:43 +0000 (UTC)
Date: Wed, 29 Jul 2026 21:21:41 +0100
From: Mark Brown <broonie@debian.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
Message-ID: <c05bb236-5aa2-4050-a030-8caed6d47a40@sirena.org.uk>
References: <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com>
 <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
 <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
 <CAAT15mMc73=cnqx7jvPXWjVUuzr-E54qh5+BR3d_G6m3NoXrng@mail.gmail.com>
 <al_ZlTkEUHj-X1YS@ashevche-desk.local>
 <CAAT15mMaZWdkp9YRKvRDRw-WCA-4nWGGo8gge=D7oBKUr1yysw@mail.gmail.com>
 <amYya_hiHM6lrxTX@wunner.de>
 <ampdJY4LcP6Qc1de@wunner.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QO978rW/zVaXg64Z"
Content-Disposition: inline
In-Reply-To: <ampdJY4LcP6Qc1de@wunner.de>
X-Cookie: Captain's Log, star date 21:34.5...
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


--QO978rW/zVaXg64Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 29, 2026 at 10:05:57PM +0200, Lukas Wunner wrote:
> On Sun, Jul 26, 2026 at 06:14:35PM +0200, Lukas Wunner wrote:

> > I'm not sure why Apple chose to keep the DMA controller in reset,
> > but have you explored enabling it on boot?

> Thinking about this some more and after taking a look at
> drivers/input/keyboards/applespi.c, I realize messages exchanged via SPI
> are always 256 bytes in size.  That's not a whole lot, and of course
> messages are only exchanged when a key is pressed or the trackpad is
> used.  So perhaps Apple determined that sending this in PIO mode is
> ultimately more efficient than keeping a DMA engine powered on all the
> time.  The CPU load saved through offloading the SPI transfer is offset
> by having to program the DMA engine for each transfer.

> So perhaps usage of PIO mode was indeed an intentional choice by Apple
> and need not be second-guessed.  I'm not sure.

DMA can also add extra latency with interrupt handling, it's possible
someone decided to trade some CPU time for minimal latency (though you
could probably arrange for shorter messages...).

--QO978rW/zVaXg64Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqYNQACgkQJNaLcl1U
h9BqEQf/Y/vxR7/K+t1UI7aKLyxQEME3eMNStgxoERmSOrRiqcMIW+tIyiXeEl1r
doZ6PIi8JZV+kKlLU/ulZukqSgrVb1cV9WsaOVqVrYyOf7x0Urglr0y9ToJEofHS
DjZrrM7/iARNi1UjdVTIQKLvjOpmJ7yIHBxKmHjiSRH0QzGt72rC9AHBmzJO4SCI
FwzNo9NEsycT2C7CjEk8Vv7q2PNww3xUdP3s0qR40huULnKJdBRaIUiJjCLvb2J3
FPQVQJ+2A3JpelotEiNiXhanyCOngwCI7vkJ7F0UlZmFkLPK/8Tw+oOHaU9hyjAa
4PDpZ/4YiXdLrt97HT4vKhHVn8ajzw==
=UPNZ
-----END PGP SIGNATURE-----

--QO978rW/zVaXg64Z--

