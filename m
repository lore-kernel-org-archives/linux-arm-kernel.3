Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F545CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VrOxiSW5B9jvWGgR4Gle73eBnm+FHHuuxp5jo91p3s=; b=STlaaMVdZJ6GduEQvMn2+hamYz
	HolH9D0hJjIRNWnSPoWqavqwspCFA8BUySFPBTao3YMJTm+kWYIIlX/8yXpcOsc9IxU5qqUjadwu3
	IxFJyGliDA0LCdngpmSuoBi8cKThTDAzFNfFCZH3mVJOixLwprR/O6yOj4fDyY/zCZ/iMlxzPC+18
	WMh5KASxldiF/AXbLZigXwqQ605t/kubh5mXsMf64eG7oFrX4J5t93BKihys2fCX/p7Np9lBS03gx
	MxfgPae0Tzsm4wgkkIN1WV20je6hDu8YZRDpQldN+osmAGCSVWcHelvcEDee42HC26EZntRaAzWjI
	9QiUYotg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfHY-00000008p1r-1lsF;
	Thu, 25 Jun 2026 08:17:56 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcfHU-00000008p0W-3cmN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 08:17:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2342A200698;
	Thu, 25 Jun 2026 10:17:50 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcfHS-004Ynh-0C;
	Thu, 25 Jun 2026 10:17:50 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wcfHR-000000002b6-46gr;
	Thu, 25 Jun 2026 10:17:49 +0200
Message-ID: <12958f10b032e6b37a83c783a261b2c184d94222.camel@pengutronix.de>
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Brian Masney	 <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 25 Jun 2026 10:17:49 +0200
In-Reply-To: <7_XKp5ZWTJeJfxJieymOJA@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
	 <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
	 <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
	 <7_XKp5ZWTJeJfxJieymOJA@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_011753_052606_BC4EC0FF 
X-CRM114-Status: GOOD (  18.23  )
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

On Mi, 2026-06-24 at 23:00 +0300, Stefan D=C3=B6singer wrote:
> Hi Philipp,
>=20
> Am Donnerstag, 18. Juni 2026, 12:24:26 Ostafrikanische Zeit schrieb Phili=
pp=20
> Zabel:
>=20
> > > +	[ZX297520V3_UART0_RESET]     =3D { .reg =3D 0x78,  .mask =3D BIT(6)=
  |=20
> BIT(7)=20
> > > },
> > Is this a single reset line controlled by two bits (do you know what
> > they are)? Or might these actually be two different reset controls that
> > are just always set together?
>=20
> I suppose I could expose both bits as separate reset controls in the bind=
ing.=20
> The lower bit is usually the one that actually resets the device, while t=
he=20
> higher one works similarly to PCLK - it disconnects the device from the b=
us,=20
> if asserted. Depending on the device it may or may not leave any residual=
=20
> effect behind after deassert.

So it's not a separate reset.
Whether bus isolation should be controlled together with the reset or
not could be argued, but exposing this as a separate reset control via
the reset API would not be correct.

> The stumbling block is the dwc2 USB driver. It only takes one reset, so I=
'd=20
> have to add another one (or abuse the dwc2-ecc reset) and presumably add =
a PHY=20
> driver for the 3rd reset or add a dwc2-phy reset.

This on the other hand sounds like there is a separate PHY reset line?
If so, I think that should be modeled as a separate control.

regards
Philipp

