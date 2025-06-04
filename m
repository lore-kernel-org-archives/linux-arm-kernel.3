Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FB8C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 06:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8HGAMvgvG3UZ4UC/tG4gpIAXZXxtoeUQmeefuQQdjY=; b=b40U3/6dM5+7qziGo2HkTlxdSi
	FnyvXYBVaLhmRkA/OFh/V4gzLPuJ49uiLSSjzwbKI3l4jqxVBHcXe7hunXIuAIZQ8H6yKQC2MxdVH
	7Gr3lFJTVe3hvefqWYKizE0p0bgSkv2WbJsaw/Z/lPmSTZsdvQ9HKZmNBzOA7IKT3vDAmzS1VZIJJ
	mXEM6pxW2Zjp52eFsSNpceWtlj3IQ4RJvNw63KC2/F8ldycujxVIN71Vl7N7HVk/Rbf2C6ib4dj6+
	KBNPhBfDFZUpsV1N6VULeTBCetc0FKfWMIUharvuATv4EFuEtYR7DXVP/koLwpD1UV/+4Lu81bZEY
	ykEzJWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMi5F-0000000Ciqk-0kTn;
	Wed, 04 Jun 2025 06:58:45 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMi1G-0000000CiDJ-3YGn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 06:54:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uMi1D-0001En-I2; Wed, 04 Jun 2025 08:54:35 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uMi1D-001kRj-0o;
	Wed, 04 Jun 2025 08:54:35 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uMi1D-00AV4Z-0E;
	Wed, 04 Jun 2025 08:54:35 +0200
Date: Wed, 4 Jun 2025 08:54:35 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for
 overdrive
Message-ID: <20250604065435.nl3l6h3wxrwstswl@pengutronix.de>
References: <20250530221713.54804-1-aford173@gmail.com>
 <20250530221713.54804-5-aford173@gmail.com>
 <20250601183620.npuicmipv6kv54z6@pengutronix.de>
 <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
 <CAHCN7xLr-7YQ9P8022g3SNPVgfQcEU8rSzZ-grMMom8kLm6e0Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLr-7YQ9P8022g3SNPVgfQcEU8rSzZ-grMMom8kLm6e0Q@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_235438_885752_6F898CF1 
X-CRM114-Status: GOOD (  35.72  )
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

On 25-06-03, Adam Ford wrote:
> On Mon, Jun 2, 2025 at 10:35 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Sun, Jun 1, 2025 at 1:36 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > >
> > > Hi Adam,
> > >
> > > thanks for the patch.
> > >
> > > On 25-05-30, Adam Ford wrote:
> > > > The defaults for this SoC are configured for overdrive mode, but
> > > > the VPU clocks are currently configured for nominal mode.
> > > > Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> > > > Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> > > > Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> > > >
> > > > This requires adjusting the clock parents. Since there is already
> > > > 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> > > > This frees up the VPU_PLL to be configured at 700MHz to run
> > > > the G2 clock at 700MHz.
> > > >
> > > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > index 909555a5da4b..848b25c9b752 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
> > > >                       interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > > >                       clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> > > >                       assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
> > > > -                     assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > > > -                     assigned-clock-rates = <600000000>;
> > > > +                     assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
> > > > +                     assigned-clock-rates = <800000000>;
> > > >                       power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G1>;
> > > >               };
> > > >
> > > > @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
> > > >                       interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > > >                       clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> > > >                       assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
> > > > -                     assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
> > > > -                     assigned-clock-rates = <500000000>;
> > > > +                     assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > > > +                     assigned-clock-rates = <700000000>;
> > > >                       power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
> > > >               };
> > > >
> > > > @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > > >                                <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > > >                       clock-names = "g1", "g2", "vc8000e";
> > > >                       assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> > > > -                     assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> > > > -                     assigned-clock-rates = <600000000>, <600000000>;
> > > > +                     assigned-clock-parents = <0>, <&clk IMX8MP_SYS_PLL1_800M>;
> > > > +                     assigned-clock-rates = <700000000>, <800000000>;
> > >
> > > I think we can drop the "assigned-clocks = <&clk IMX8MP_VPU_PLL>" part
> > > completely.
> > >
> > > Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
> > > the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.
> >
> > I think you're right.  I'll fix that up and do a V2.  I forgot to add
> > my own s-o-b tag, so I'll fix that too.  I'll try to do it this week.
> 
> Marco,
> 
> I tried removing the assigned-clock references to the IMX8MP_VPU_PLL,
> but i found the defaul speed was 800MHz for the PLL even when asking
> G2 to be 700MHz.  The only way that I found to set the G2 to 700MHz
> was to set the VPU_PLL to 700MHz.  I can do that either inside the G2
> node or the vpumix_blk_ctrl node. I generally like to have the
> blk_ctrl do it since it controls the G1_ROOT and G2_ROOT clocks, but
> it doesn't seem to hurt it being inside the G2 node either.  I can see
> the argument for having it insde the G2 node, since the G2 clock is
> what's requiring the VPU_PLL to be 700MHz.
> 
> Let me know your preferences, and I'll move forward accordingly.

Hi Adam,

thanks for testing. IMHO we should do the clock handling within the G2
node. This requires no comments because the code would be obvious else
you need to comment the setup of the IMX8MP_VPU_PLL within the
vpumix_blk_ctrl node because this is not obvious.

Regards,
  Marco

