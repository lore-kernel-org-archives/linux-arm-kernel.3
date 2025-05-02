Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE21C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qk+v0jhMD2KmExjmJEoVpbm7V4O6TnoUAkevB7RJxtY=; b=Fg8PeCdj/cyQE8NPvF9R5kdab0
	MFNusBW12TUUPQ5c7q5+YyoXapUoCTrbeqRK5Z/BU5KJ1aerKs+KLME/jW7vF4/aVZWNDwh4G/mwn
	kJu94B14FjT78ne7yz5vAUnL4xsX/njVWxBVcRGASTCjx69XBj1w002FuKHOL6X7Qd/lV8DADUnZ5
	0HtwhOHYpvOlBGY9R5AMzRYSvA27tpX/Qa8IDnbGSUhhcaawpPFH1vpqJt8i6pffgr/ZN1MVRvjj3
	xJJlE+Pbrmh6u/imVQcgIdzXrru3LYMl3gpufo02TByETYzWuCwOrizBHh2rLRVkVS4ckrx4hKF2w
	2eb9Om7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6V-00000002eD0-3YvK;
	Fri, 02 May 2025 17:23:15 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAteU-00000002aIb-1hip
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 16:54:19 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAteA-00065d-2h; Fri, 02 May 2025 18:53:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAte9-000mLr-0c;
	Fri, 02 May 2025 18:53:57 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uAte9-00GahR-07;
	Fri, 02 May 2025 18:53:57 +0200
Date: Fri, 2 May 2025 18:53:57 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Adam Ford <aford173@gmail.com>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paulk@sys-base.io, hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com, sebastian.fricke@collabora.com,
	ming.qian@nxp.com, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 05/11] arm64: dts: imx8mp: drop gpcv2 vpu
 power-domains and clocks
Message-ID: <20250502165357.ncuve25xwvydhxz3@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-6-m.felsch@pengutronix.de>
 <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_095418_438568_F4C9EB45 
X-CRM114-Status: GOOD (  20.08  )
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

On 25-05-02, Adam Ford wrote:
> On Fri, May 2, 2025 at 10:10 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> > VPUMIX power-domain nor their module clocks since the power and reset
> > handling is done by the VPUMIX blkctrl driver.
> >
> It was my understanding that having this dependency ensures the order
> of the bring-up, but maybe I am wrong.  Do you know if the 8MP

If that is true, the 8MM should be broken.

> suspend-resume works properly?

No I didn't test suspend/resume.

> Should this get a fixes tag?

It's just a cleanup, therefore I didn't add the fixes-tag.

Regards,
  Marco


> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > index e0d3b8cba221..cf9b6c487bd5 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > @@ -879,24 +879,17 @@ pgc_mediamix: power-domain@10 {
> >
> >                                         pgc_vpu_g1: power-domain@11 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> >                                         };
> >
> >                                         pgc_vpu_g2: power-domain@12 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> > -
> >                                         };
> >
> >                                         pgc_vpu_vc8000e: power-domain@13 {
> >                                                 #power-domain-cells = <0>;
> > -                                               power-domains = <&pgc_vpumix>;
> >                                                 reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
> > -                                               clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> >                                         };
> >
> >                                         pgc_hdmimix: power-domain@14 {
> > --
> > 2.39.5
> >
> >
> 

