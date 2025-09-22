Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81875CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCPMg1p1zkwljeNkPwl3mMFL5efKTDrIKP2InPCuHHg=; b=19t+oHAUwrv0yZ+CsVDLobcN3T
	EFDQ8G4JAiv9lCkZbnXdqvw63G5dqK0tpsi4FsA9UyM8HMLMgO9IAwds/zI1T8KN2gGp0opgZBt2T
	1lGBb6E/Dy/K4V2TY1zzy7i8e819r7k7P8qFIPcCjwNZmwV96yo29TF79oFEzCQqxNT9dswxV/8X5
	9TUq1QnQRv8WSDvw+Dt/gFyJpn9MS7LtTTKIW3awWwUWx/Cp+5FjqNE/kjf17Zmw7KMf1LBp5jOjk
	N3rDc5BhqQQpLm5Ub4SDTH33GHaKgbvrxzG07XvK/IZbZmmDG5fCEAg90YGP/TGyGdluMJNFQv2j0
	zmclbQTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0atB-00000009Fvp-1HMA;
	Mon, 22 Sep 2025 07:23:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0at8-00000009FtE-1Ssq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:23:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A8498403A2;
	Mon, 22 Sep 2025 07:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDCDC4CEF5;
	Mon, 22 Sep 2025 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758525785;
	bh=2FntwlF7Qmhm52NdX37IlJIx8sKgGdOwIqEh4HcAK7U=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=uheiXmte5EO1l2O/1Bxl/0OvKSM8fmL9SyKJs+63bxigNYJ5vChAhHIPR4QUVyVlc
	 IwexTSRYnB3IyLET0ymbxZ9oYJDQrRvMkQsw21jRe+CskQtyREvK3b/01p2YbHFuYx
	 KJH3vz1E7b/liWq6qlgHXm8+OlSLVtvyK6KfvsIssskvrdqy+4ZasvhAKB5ki4LzS9
	 mCaF9fC23GEHKd6FRl6Xm3LCv2DdjrBaSAewIvG32rfGbUj64bAwrAd+SL0HouQUuY
	 kzCGqBRGpTBEMYZrzAAG1qZiAU9dyyGVY/TxmMnSB+EnCgvzMQNAhxE9Ye7IcxogI3
	 AK4+3wd4wlKkA==
Content-Type: multipart/signed;
 boundary=466225747a6c8626ee1778d558a8e4327766c754704dd9ef85670e13e3ed;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 22 Sep 2025 09:23:01 +0200
Message-Id: <DCZ5D3DB786G.3JANU1P578TCY@kernel.org>
Cc: "Andrew Davis" <afd@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Randolph Sapp" <rs@ti.com>, "Frank Binns" <frank.binns@imgtec.com>,
 "Matt Coster" <matt.coster@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Nishanth Menon" <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Tero Kristo" <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
X-Mailer: aerc 0.16.0
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org>
 <DCX03UL17R3K.1MRUGNR4PUIDL@ti.com>
In-Reply-To: <DCX03UL17R3K.1MRUGNR4PUIDL@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_002306_445092_0AFFBB07 
X-CRM114-Status: GOOD (  38.84  )
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

--466225747a6c8626ee1778d558a8e4327766c754704dd9ef85670e13e3ed
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > The TISCI firmware will return 0 if the clock or consumer is not
> > enabled although there is a stored value in the firmware. IOW a call to
> > set rate will work but at get rate will always return 0 if the clock is
> > disabled.
> > The clk framework will try to cache the clock rate when it's requested
> > by a consumer. If the clock or consumer is not enabled at that point,
> > the cached value is 0, which is wrong. Thus, disable the cache
> > altogether.
> >
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > I guess to make it work correctly with the caching of the linux
> > subsystem a new flag to query the real clock rate is needed. That
> > way, one could also query the default value without having to turn
> > the clock and consumer on first. That can be retrofitted later and
> > the driver could query the firmware capabilities.
> >
> > Regarding a Fixes: tag. I didn't include one because it might have a
> > slight performance impact because the firmware has to be queried
> > every time now and it doesn't have been a problem for now. OTOH I've
> > enabled tracing during boot and there were just a handful
> > clock_{get/set}_rate() calls.
> > ---
> >  drivers/clk/keystone/sci-clk.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-=
clk.c
> > index c5894fc9395e..d73858b5ca7a 100644
> > --- a/drivers/clk/keystone/sci-clk.c
> > +++ b/drivers/clk/keystone/sci-clk.c
> > @@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider =
*provider,
> > =20
> >  	init.ops =3D &sci_clk_ops;
> >  	init.num_parents =3D sci_clk->num_parents;
> > +
> > +	/*
> > +	 * A clock rate query to the SCI firmware will return 0 if either the
> > +	 * clock itself is disabled or the attached device/consumer is disabl=
ed.
> > +	 * This makes it inherently unsuitable for the caching of the clk
> > +	 * framework.
> > +	 */
> > +	init.flags =3D CLK_GET_RATE_NOCACHE;
> >  	sci_clk->hw.init =3D &init;
> > =20
> >  	ret =3D devm_clk_hw_register(provider->dev, &sci_clk->hw);
>
>
> Thanks for looking into this Michael. I'm still convinced that it's unusu=
al to
> report 0 for a clock rate when the device is powered down. In most cases =
it's
> not actually 0 and is actually just in bypass mode.

Yeah. And you can't query the clock rate you've just set if the
clock is off (and if enabled the clock will have the frequency of
the last set_rate). I still think that is a gap in the firmware
interface.

> I was told it's a way to indicate clock status and probably won't be chan=
ging
> any time soon though. Ignore the fact that we also already have a separat=
e way
> to query clock status. :)
>
> This series looks good, but won't quite result in a functional GPU withou=
t the
> following patch: https://lore.kernel.org/all/20250808232522.1296240-1-rs@=
ti.com/

Ahh, I was puzzled why it was working for me. But then I've noticed
that your patch is for the am62p. I'm working with the am67a and
there the ranges are correct for the GPU.

> I suppose I'll submit that again on it's own.
>
> Reviewed-by: Randolph Sapp <rs@ti.com>

Thanks.

-michael

--466225747a6c8626ee1778d558a8e4327766c754704dd9ef85670e13e3ed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaND5VRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hNrgF8CV5l++iJea0s6PucENw5DUZkbZSEGMn1
ZR8wnSzoN5SGQWqUOPXJvYmYWYcM4qs7AXwMCOBuHIVVjx5DeIm2+8kPY6IAMzxH
hc3PYUqyvo1MwSaREzSwn7SHKZ0vrp6ZvB0=
=0WRH
-----END PGP SIGNATURE-----

--466225747a6c8626ee1778d558a8e4327766c754704dd9ef85670e13e3ed--

