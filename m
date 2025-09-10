Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5450CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gz3FXQu3DOFyH5Z/Yxt5ftIBimKEIJZnXppi88qYoQ=; b=MO6fNOWKidLyLMDPMGneRboqX5
	BpsTvRgwh1mmhWtlXZ/Koe21bteRdou/eLwoDFBn2m1RRxhBdJGlFVxwP8TqRiVqbzZ3cz9wVNBo2
	btxOsJTIZgsjiI6RN2kvIEz0WIO8kZoh0LnEdSTcM44CgyMgnciUzuppLJ+Y6LuMJlRSmNUgLUpNX
	uvKpOBN3HrScsgN6ACKxCPkcebcW0VqhJvQCCrZ5beEtM8e0Gjf6TmecUGLUv8TbI4LLN6BS6UJmy
	PEAqgMHYtgeOJw9ysjQ037njNXyJYBjGV14JCvV6hs/IOBObNV+87ZxbLZHFvZkgFD5oG2Bp07Yjk
	oz3JET+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQLx-0000000GEOq-3Ukh;
	Wed, 10 Sep 2025 19:19:37 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQLu-0000000GEIY-13i3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6gz3FXQu3DOFyH5Z/Yxt5ftIBimKEIJZnXppi88qYoQ=; b=S/DgMXTG9T1+Ocjo962KJ96UaF
	anWelgQmGO/UfRZPPlKdjlmpkrnpewf2mmdKcL4ZnXofMfK6ODsm6s7oh7b4M5k4RMXWCfp/XPBXH
	3MwMaQj1B/0RTfum51nzotVj5vc+982luD2HDTLjF8cIQzn1Vj0w4MDeXodebLl1aTafz+DLIzGER
	+DKZKKCIylemE0bvBATwKOZY0uaIobx1bhiUVmBdE3x0j9iXHdnloksfYoIR0No9Yrb2L8fUiMY1y
	ozK9zlaRZpU9/STU323PodgcPRhe0nOxqdYY9iyRN+/snTgZFbX4fH306Fg//Ji/s/RUcgW/GpgS1
	gZ3CSndA==;
Date: Wed, 10 Sep 2025 21:18:04 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Frank Li <Frank.li@nxp.com>
Cc: Andreas Kemnade <akemnade@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Alistair Francis <alistair@alistair23.me>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: sy7636a: Add missing gpio pins
 and supply
Message-ID: <20250910211804.5d88f12b@akair>
In-Reply-To: <aMGdH7Ab+9t/v3CB@lizhi-Precision-Tower-5810>
References: <20250909-sy7636-rsrc-v2-0-cfd9f44fd259@kernel.org>
	<20250909-sy7636-rsrc-v2-1-cfd9f44fd259@kernel.org>
	<aMGdH7Ab+9t/v3CB@lizhi-Precision-Tower-5810>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_121934_304133_7FAB972B 
X-CRM114-Status: GOOD (  26.53  )
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

Am Wed, 10 Sep 2025 11:45:35 -0400
schrieb Frank Li <Frank.li@nxp.com>:

> On Tue, Sep 09, 2025 at 10:33:02PM +0200, Andreas Kemnade wrote:
> > To be able to fully describe how the SY7636A is connected to the system,
> > add properties for the EN and VCOM_EN pins. To squeeze out every bit
> > of unused current, in many devices it is possible to power off the
> > complete chip. Add an input regulator to allow that.
> >
> > Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
> > ---
> >  .../devicetree/bindings/mfd/silergy,sy7636a.yaml         | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > index ee0be32ac0204..054b97dd0c5c7 100644
> > --- a/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/silergy,sy7636a.yaml
> > @@ -32,6 +32,22 @@ properties:
> >        Specifying the power good GPIOs.
> >      maxItems: 1
> >
> > +  enable-gpios:
> > +    description:
> > +      If EN pin is not hardwired, specify it here to have it set up.  
> 
> Need descript function of enabel-gpios, you can ref data sheet sy7636a.
> 
> "enable-gpios" is good self documented by property name, needn't
> description at all.
> 
What you are saying is contradictory. I would prefer to have a mapping
crystal clear visible between properties and pins. That is why I want
that description. I remember I have got the datasheet from the company
site with registration without acknowledging any terms. But I do not
find that site.

> > +    maxItems: 1
> > +
> > +  vcom-en-gpios:
> > +    description:
> > +      If VCOM_EN pin is not hardwired, specify it here to have it set up.
> > +    maxItems: 1
> > +
> > +  vin-supply:
> > +    description:
> > +      Supply for the chip. Some vendor kernels and devicetrees declare this
> > +      as a GPIO named "pwrall" which does not exist in the datasheet,
> > +      disabling it makes the chip disappear on the bus.
> > +  
> 
> The same here, descript function. such as power supply for whole chip.

I think it is useful what I am writing here. DT maintainers are
apparently fine with it, since it has earned a Reviewed-By.

Regards,
Andreas

