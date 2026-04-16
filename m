Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31322F8D759
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4WZaxG1fEkAWFHy6pQUBEmVvWmVwiU42yXOGl7cFeSk=; b=RICHaxMRoSBdFckgonrJa+v15P
	9SzcwC5BLIq9IT4b5XwodFwAt+V4JlLCFk5XTCLCDYIrPmrxK8Zt204nl/TbnZ7coE4EcmcjFrnhn
	7akpQMs9TsGpneMLedQ9wzNt9IDWAa20QDQHmF6VSBMID3aKZpE7PMWQWu0sqjXG0wLPQ24tm6Bq0
	2sexb1BPWA9mV2qqS3XMR2QHFbxvG3vfhiQmCYSqHhZoUOzw4oQnWV+aFqQLGhq+BGyQj30gsZ4zY
	Hoxa2JtCjdNR+xY9lLQdW2HcyRF+xDZuH62F2Glj/vcC/bd/W7UUJ/o/ElFOp1fV/ad4GyXwk/29V
	pim3gdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOde-00000002cda-2j4N;
	Thu, 16 Apr 2026 15:28:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDOdc-00000002cdC-0ZiA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 15:28:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E29E43870;
	Thu, 16 Apr 2026 15:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4E4C2BCAF;
	Thu, 16 Apr 2026 15:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776353294;
	bh=4WZaxG1fEkAWFHy6pQUBEmVvWmVwiU42yXOGl7cFeSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HmgbCebd2RitIoCeB7ERlNcoigI2gcNXIffpcWBwxmLR/49fdBOVNJt43biViZruQ
	 SUxGBh7k0G0+wUXdh9iAWP2GMgN6StMoLwDDS5LGh5Br1Cnwm33Q/GStVLVjEZOIlQ
	 w4hkE+GR/0jbKoJ4US5vFm4g4MEeg+Xs6V5PrgCcI/qnLLqTpeTaFSF5XPdoBUlHQ2
	 OjpamUayO88WsFM/TR5a+osY+4ti1WMJ2OCRkJZrcPFP9f4h0m23q9sY1PQ1TMJ4kC
	 cgEcCgwOlRGZnDk/Yrr1KZlHj28bd1M2LC6/jqPfz6Y+HbJ6veLochyGSMDRZYe4RG
	 lXhGLPSAhcYRw==
Date: Thu, 16 Apr 2026 17:28:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Richard Genoud <richard.genoud@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] MAINTAINERS: Add entry on Allwinner sun8i/H616
 PWM driver
Message-ID: <aeD-BA95CGZ9lWLv@monoceros>
References: <20260416131419.3152419-1-richard.genoud@bootlin.com>
 <20260416131419.3152419-5-richard.genoud@bootlin.com>
 <e9904440-b08d-4f9d-8d66-121633289695@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fqfb3daydof4iavs"
Content-Disposition: inline
In-Reply-To: <e9904440-b08d-4f9d-8d66-121633289695@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_082816_212535_EB1A4E85 
X-CRM114-Status: GOOD (  14.14  )
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


--fqfb3daydof4iavs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 4/4] MAINTAINERS: Add entry on Allwinner sun8i/H616
 PWM driver
MIME-Version: 1.0

Hello,

On Thu, Apr 16, 2026 at 03:23:49PM +0200, Krzysztof Kozlowski wrote:
> On 16/04/2026 15:14, Richard Genoud wrote:
> > Add myself as maintainer of Allwinner SUN8I PWM driver.
> >=20
> > Tested-by: John Stultz <jstultz@google.com>
>=20
> Please drop or help me understand how one can test maintainers change?
> Build process tools are not testing.

For me that is fine. This is the only way we have to record that John
tested the series. Also if I applied the original series I would have
let b4 add it to all patches in reply to a "tested-by" send in reply to
the cover letter.

My feedback here would be more: Don't send a new revision for such
comments within 30 min, also not for

> And you have commit msg trailing junk.

=2E Maintainers differ, but if this is the only concern and the series is
fine otherwise, I'd just fix that when applying. (But I think the "don't
send a new iteration on the same day" is more universal, also for more
fundamental feedback.) There is no need to bother all subscribers of 5
mailing lists with a new thread in such quick sequence.

Best regards
Uwe

--fqfb3daydof4iavs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnhAAIACgkQj4D7WH0S
/k6omQf/fppjti0PwQfUvki6ep25HnMUxzrIDQixXrcONd4YKG2bL+/sxUnYrLwY
ukm9qWvvJw9leMaHqxnuRqIHxgTB0tKN0R364W6nr9xyBHfbXER9NK25QzUB4USM
W8+vyaRHiUXAiahSIN59lgCVGsJW54KtAIrLsNFS0Z1ce6pF6ArOsMPEhE4kPGHd
GADqRwF1yFAZrshePxLacCVXaGLm31vyApgbxlfPAWdKJkedr4QkSehLup7d0Bwz
AvW4lFK0BziW4LQv3p7l9ad/5BnaXSEdAIxbnqLzt0HRJmKBwBNBgY9+BlEMsTOP
S8f8Grt1iBVpX1llaBvN2D7db1Ipng==
=55Kz
-----END PGP SIGNATURE-----

--fqfb3daydof4iavs--

