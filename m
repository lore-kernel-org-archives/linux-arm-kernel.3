Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B1DCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sON4h7CzqIiZs4MauHtrUPsGQLkEQCz5/f7dL0338OY=; b=BB9i4QUuiTQgP4xE+x2nerNVUP
	RDYozHq7/en0vEPiRFZ6NT/Lg55QSzq9liaqWaTNqlij80weKN61VoTVSNrAd0WSjLCSofegBGv+Q
	vpht0a5mSZvrjfak6X4z3757rZPhnKjkBa3rpUG0NeQlJ8s6Kzi2t9POQ0blVLFxbE4zXhK1goYR5
	xEPHrlzuClPgiBcrK51V0etsiuAjIbxn8GwVklQfuY3Cs5bqagahWUVYBywKXMZXfglBZN6RHe202
	P7OMUo9CiQHLz4M/bOpFGl/Eh7wVRSy9W7gOuoQKCHtr646DHOGx50xo8nfYSxVkvvP1TFuI6K1zC
	wKcld6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYTW-0000000Ay8e-0nVP;
	Fri, 02 Oct 2026 08:18:38 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYTQ-0000000Ay7d-47QD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:18:36 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 654E21FCAE;
	Fri,  2 Oct 2026 10:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790929109;
	bh=sON4h7CzqIiZs4MauHtrUPsGQLkEQCz5/f7dL0338OY=; h=From:To:Subject;
	b=GIenKlYUVzNhYHhvRD0ajo4hBCE3RANLT7YBoyN7fywSaVr62iOgWVki3nzup8Ed8
	 gexb8Yi1IaJ6FVyGUZkx642zl5mHcAIbXYDfUuvPGx8LjHARuEX1VcX/16ddNb90bJ
	 l+N4e8mbiOmN5dxGdbXDlf9U9cwI4mCLiSOhVnXQcZAAjXpCl9kYPZ5Fpdomw/DXQd
	 oXQTONJFUPhev+0NwIkafWtuo61W4p1A2kV/t3R2yfdrKatbwhxkmM0rGR3mX4YtFm
	 XgiGJTZHNItTQ0jmrxC6H8ScUps72wVnONodaM0UNr5veUnp/3WIbzKZ6yRx3X9zKL
	 fnAGJs1Yo60cA==
Date: Fri, 2 Oct 2026 10:18:24 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Leonardo Costa <leoreis.costa@gmail.com>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com, marex@nabladev.com,
	stefano.r@variscite.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch
 Display 10.1" LVDS
Message-ID: <20261002081824.GA7222@francesco-nb>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-4-leoreis.costa@gmail.com>
 <ar6JnZp1jBvlc8bx@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar6JnZp1jBvlc8bx@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_011834_083261_37D4136C 
X-CRM114-Status: GOOD (  36.53  )
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

Hello Frank,
thanks for the review

On Thu, Oct 01, 2026 at 11:26:05AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 12:52:53PM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
> > LVDS connected via the Apalis iMX6 LDB.
> >
> > The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
> > touch input is provided by an Atmel MaxTouch capacitive touch
> > controller.
> >
> > Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
> > external component that does not exist at the SoM level.
> >
> > The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
> > Board V1.2 device tree to provide a ready-to-use DTB.
> >
> > Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
> >  ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
> >  3 files changed, 59 insertions(+), 13 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> 
> similar 7" case, add panel module name in file
> 
> imx6q-apalis-lvds-panel-lt170410.dtso

This does not work, sorry, the current name is the correct one, for
various reasons:

 - the product is a display made with a specific connector, touch
   controller and display and more. The actual panel is just part of it
 - the current name wholly describe the product, it's a public product
   with an official name, all of that is clearly linked in the commit
   message and comments. there is no ambiguity.
 - the same toradex accessories are not module specific, they are used
   across multiple families/carrier board. It is a whole ecosystem that is
   building on top of standardized interfaces and connectors. The same
   overlay file is available for multiple boards and in multiple SoC
   vendor directory (as of now TI and NXP, soon we are going to have
   also QCOM). Having a consistent naming scheme is important, we cannot
   call the same things differently every time.
 - there was a situation in which we did a new product revision of a
   display, specifically the "Toradex Capacitive Touch Display 10.1"
   LVDS" there are two versions. The official product name is the same,
   apart an additional version number, one is version1, the other is
   version2. They have differences, and it's not just the panel, more
   stuff changed, so having the panel name in the filename will not
   help. v2 support is already in [1], for reference.
 - the toradex naming scheme is not encoding the actual part number used
   in the product name, for example we have apalis imx6 v1.2 that uses a
   different touch/adc than previous apalis imx v1.1. The product has a
   different schematics, different BoM and so on, and there is no
   reference of the difference touch/adc in the name. You can see this
   information from the public documentation just looking at the
   version. or you can check yourself comparing the two DTS in the linux
   kernel tree.

[1]
 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds-v2.dtso


Frank: in general the names are clearly linked to the official product
name, and this applies also to other patches in which you commented
about the names, not planning to reply to every single one.

> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> > new file mode 100644
> > index 0000000000000..a84114e1d3fba
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
> > @@ -0,0 +1,53 @@
> > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > +/*
> > + * Copyright (c) Toradex
> > + *
> > + * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
> > + * on carrier boards with a Toradex standard LVDS display connector.
> > + *
> > + * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
> > + * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
> > + * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&{/} {
> > +	panel-lvds {
> > +		compatible = "logictechno,lt170410-2whc";
> > +		backlight = <&backlight>;
> > +		power-supply = <&reg_3v3_sw>;
> 
> use name reg_lvds_panel, it help improve reusablity.

I disagree.

The regulator should be the one that is physically used on
the board. The DTS *must* describe the HW as accurately as possible, we
are not supposed to invent non existing regulator and more in general
non existing HW.

I see your need to avoid duplication, and I agree with it. But an
accurate HW description and the user experience trumps this need. 
And I insist on the user experience, what we are doing is for someone to
use, we should not make the life of people hard because we decide on
non-descriptive or inaccurate names.


Francesco


