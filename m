Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A00AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCKFbTxb0crs5pS+o0yqnlFt+uXF6pSoowcsm/b3vB4=; b=KaPnq+5MyslR/3jDhyzE4WywSz
	hD29vzldja/i5ar/lB96x+yaJaM908MJ/6zxb6Pcpppbd2g6oZYyb9k7MbiZyFenxKi8n4WD191FC
	X2JtQn331p+SUVmXKYGrwMNVInnkgHI346ED6xBDJDTObWJ0Fbw8pJNJetvUh9ukt2JnQFx5F96RL
	w9ayboXuvY8+z/geodZ0TufgD2mxTKp/bFwyZCYqCqekt/wsb9UoUVSkkAFFIlR7W8J5sHb5JN4Dt
	+WYipHOrmTYmodHZ3LPq7C0zp5g8KXndPrESWWq4dRvBzl8Apgk87WVIEE6T45qV1QQR7P9BvEaFI
	5ZijS0Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLRi-0000000CcNN-0ZsQ;
	Fri, 07 Mar 2025 00:20:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLPo-0000000Cc6t-2jV6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:18:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB1A1169E;
	Thu,  6 Mar 2025 16:18:24 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 299A83F673;
	Thu,  6 Mar 2025 16:18:10 -0800 (PST)
Date: Fri, 7 Mar 2025 00:18:03 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/15] clk: sunxi-ng: Add support for update bit
Message-ID: <20250307001803.2e4887d7@minigeek.lan>
In-Reply-To: <3616088.iIbC2pHGDl@jernej-laptop>
References: <20250304012805.28594-1-andre.przywara@arm.com>
	<20250304012805.28594-4-andre.przywara@arm.com>
	<3616088.iIbC2pHGDl@jernej-laptop>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_161812_781922_51A2FE1D 
X-CRM114-Status: GOOD (  23.03  )
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

On Tue, 04 Mar 2025 16:28:48 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

Hi,

> Dne torek, 4. marec 2025 ob 02:27:53 Srednjeevropski standardni =C4=8Das =
je Andre Przywara napisal(a):
> > Some clocks in the Allwinner A523 SoC contain an "update bit" (bit 27),
> > which must be set to apply any register changes, namely the mux
> > selector, the divider and the gate bit.
> >=20
> > Add a new CCU feature bit to mark those clocks, and set bit 27 whenever
> > we are applying any changes.
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> >  drivers/clk/sunxi-ng/ccu_common.h | 4 ++++
> >  drivers/clk/sunxi-ng/ccu_div.c    | 2 ++
> >  drivers/clk/sunxi-ng/ccu_gate.c   | 4 ++++
> >  drivers/clk/sunxi-ng/ccu_mux.c    | 2 ++
> >  4 files changed, 12 insertions(+)
> >=20
> > diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/c=
cu_common.h
> > index 50fd268329671..d41d33bdff470 100644
> > --- a/drivers/clk/sunxi-ng/ccu_common.h
> > +++ b/drivers/clk/sunxi-ng/ccu_common.h
> > @@ -20,10 +20,14 @@
> >  #define CCU_FEATURE_KEY_FIELD		BIT(8)
> >  #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
> >  #define CCU_FEATURE_DUAL_DIV		BIT(10)
> > +#define CCU_FEATURE_UPDATE_BIT27	BIT(11) =20
>=20
> There is no reason to have "BIT27" in the name of the macro. This is simi=
lar
> to KEY_FIELD, which is generic name and doesn't specify either key or pos=
ition
> of this key field. Maybe just CCU_FEATURE_UPDATE_BIT or something equaly
> generic.

Sure, done. This was mostly in anticipation of the typical Allwinner
behaviour of introducing another update bit at a different location in
the future. But I guess we use a bitmask should that happen.

> With that fixed:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Many thanks!

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
> > =20
> >  /* MMC timing mode switch bit */
> >  #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
> > =20
> > +/* Some clocks need this bit to actually apply register changes */
> > +#define CCU_SUNXI_UPDATE_BIT		BIT(27)
> > +
> >  struct device_node;
> > =20
> >  struct ccu_common {
> > diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_=
div.c
> > index 7f4691f09e01f..2d8b98fe4b13a 100644
> > --- a/drivers/clk/sunxi-ng/ccu_div.c
> > +++ b/drivers/clk/sunxi-ng/ccu_div.c
> > @@ -106,6 +106,8 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsi=
gned long rate,
> > =20
> >  	reg =3D readl(cd->common.base + cd->common.reg);
> >  	reg &=3D ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
> > +	if (cd->common.features & CCU_FEATURE_UPDATE_BIT27)
> > +		reg |=3D CCU_SUNXI_UPDATE_BIT;
> > =20
> >  	writel(reg | (val << cd->div.shift),
> >  	       cd->common.base + cd->common.reg);
> > diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu=
_gate.c
> > index ac52fd6bff677..0490f95781361 100644
> > --- a/drivers/clk/sunxi-ng/ccu_gate.c
> > +++ b/drivers/clk/sunxi-ng/ccu_gate.c
> > @@ -20,6 +20,8 @@ void ccu_gate_helper_disable(struct ccu_common *commo=
n, u32 gate)
> >  	spin_lock_irqsave(common->lock, flags);
> > =20
> >  	reg =3D readl(common->base + common->reg);
> > +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> > +		reg |=3D CCU_SUNXI_UPDATE_BIT;
> >  	writel(reg & ~gate, common->base + common->reg);
> > =20
> >  	spin_unlock_irqrestore(common->lock, flags);
> > @@ -44,6 +46,8 @@ int ccu_gate_helper_enable(struct ccu_common *common,=
 u32 gate)
> >  	spin_lock_irqsave(common->lock, flags);
> > =20
> >  	reg =3D readl(common->base + common->reg);
> > +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> > +		reg |=3D CCU_SUNXI_UPDATE_BIT;
> >  	writel(reg | gate, common->base + common->reg);
> > =20
> >  	spin_unlock_irqrestore(common->lock, flags);
> > diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_=
mux.c
> > index d7ffbdeee9e04..82ee21e0d3a68 100644
> > --- a/drivers/clk/sunxi-ng/ccu_mux.c
> > +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> > @@ -197,6 +197,8 @@ int ccu_mux_helper_set_parent(struct ccu_common *co=
mmon,
> >  	/* The key field always reads as zero. */
> >  	if (common->features & CCU_FEATURE_KEY_FIELD)
> >  		reg |=3D CCU_MUX_KEY_VALUE;
> > +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> > +		reg |=3D CCU_SUNXI_UPDATE_BIT;
> > =20
> >  	reg &=3D ~GENMASK(cm->width + cm->shift - 1, cm->shift);
> >  	writel(reg | (index << cm->shift), common->base + common->reg);
> >  =20
>=20
>=20
>=20
>=20
>=20


