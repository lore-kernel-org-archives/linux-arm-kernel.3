Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBF9C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 21:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sNO39ldE4EsdxaOOD/yrGux2vj7yQ8VzqrbnmDWO7A=; b=Ax7L9SNnwtOYC7dpEgOz38Ta1s
	0KLZrH+zi8GiC1IE801zBNKHplIIHZzD65ZqJdwfJ5D/dJUIZKNbygxeq0P9Mfe9qAEi6pdVOzEfY
	TOUH6kn8v5mdmWcvg/vkt5YNqRNs9hvOOqEmV1MR6/uk/geROuRb3nQICgRLApUYuCfkPFP+bOxW0
	I7E1xQrqXfxEEwhqAD/zOt5uoccoNLUT8PgDdNb1+qWV0lDyspjkcHoNMOWQbiYY/Lumk86bmfacB
	T8dqtRjdL1NGJksgGFMua+vWwIGEgHsE09ghgm1vmYIj+XPsVLZIOlPxsAgmejA6FYCQy+wj70Iaf
	pjWEKsbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOk65-00000005H9G-0zNM;
	Mon, 09 Jun 2025 21:32:01 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOjy9-00000005G6Q-0Tcz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 21:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/sNO39ldE4EsdxaOOD/yrGux2vj7yQ8VzqrbnmDWO7A=; b=p0yoodfAQz2AWV/pMoXJIWAzuG
	oIrj5e62g5SxqfDEpy8FWJ+Yp+OEu8ekoRHxUIghTwIPRIbfwrsPgBEwYtWadNw95cEZkSQblh9gp
	HWprtnKDKPQMmNT88fGsCA1dOTmRcaAthrXwvlE9FSxJZXWzoUROX7FIszvAoZUOool2BNt0bn4h1
	N/z7AewE42WPUfXM2aNH5NgWo7Q97f/Pv6CyeTSjFsm+nG2nFPmTVbjjC70BGEo+xwViuqmOOSRwg
	pcCQ0GxE81cqC/rJQtlXiBDfbNvX9cR3ETFDzn/v6xGbTYC8Kd0rXfkFL6MOt9bi+i/dkG+NfkvTB
	v8kUrGfg==;
Date: Mon, 9 Jun 2025 23:23:37 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Conor Dooley <conor@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin
 Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250609232337.34cef4c7@akair>
In-Reply-To: <20250609224502.1fce742c@kmaincent-XPS-13-7390>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-4-5278026b7498@bootlin.com>
	<20250609-helpful-immodest-0f195cdbcbf2@spud>
	<20250609224502.1fce742c@kmaincent-XPS-13-7390>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_142349_151533_CED510E9 
X-CRM114-Status: GOOD (  21.37  )
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

Am Mon, 9 Jun 2025 22:45:02 +0200
schrieb Kory Maincent <kory.maincent@bootlin.com>:

> Le Mon, 9 Jun 2025 18:04:01 +0100,
> Conor Dooley <conor@kernel.org> a =C3=A9crit :
>=20
> > On Mon, Jun 09, 2025 at 05:43:54PM +0200, Kory Maincent wrote: =20
> > > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone =
Green
> > > (BBG). It has minor differences from the BBG, such as a different PMI=
C,
> > > a different Ethernet PHY, and a larger eMMC.
> > >=20
> > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > > ---
> > >=20
> > > Changes in v2:
> > > - Used generic pmic node name.
> > > - Add regulator prefix to fixed regulator node name.
> > > - Add the compatible to omap.yaml binding
> > > ---
> > >  Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
> > >  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
> > >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170
> > > +++++++++++++++++++++ 3 files changed, 172 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > > c43fa4f4af81..774c13157caa 100644 ---
> > > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -145,6 +145,7=
 @@
> > > properties:
> > >        - description: TI bone green variants based on TI AM335
> > >          items:
> > >            - enum:
> > > +              - ti,am335x-bone-green-eco
> > >                - ti,am335x-bone-green-wireless
> > >            - const: ti,am335x-bone-green
> > >            - const: ti,am335x-bone   =20
> >=20
> > Why is this hunk here? =20
>=20
> Do you mean that the binding change should be in another patch?
>=20
Usually binding changes are in a separate patch. Maybe you can merge it
with Patch 2. The lonely enum looks a bit strange there, so if these
things are merged, it will look more natural.

Regards,
Andreas

