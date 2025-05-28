Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF4FC3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 08:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bDjKClXIhKROPigWN5zj8VjXk6gtLRgVAzPPnb9VW0=; b=c7gJH5dRJelwQrtr+khGvrqnxq
	xEgHRDfhsOMk0Sl3/L+fvV7CKytElvLGTHkOCHb+rgMQMEEx137pXivwII7uoTjlruK1oXFr60XeC
	6ThFJD9PFsNdC/ZaMy1lOnOnL0MbRd4dZYit+SOQvCNT4vHLfPz3Cb268e3rqvlffBjmpG31ZoSSd
	QGRaWf3WfAHrgG0wz71Suji+2bEodQjm71qd1F31tiHkDYjPObvCmukVpdmbPIp+tggBucHikhbYB
	AJ/CI3V9BGlB9UJvXDIiYtYpqDh8h7W4i2v8VDs86VU6/x3F3e+paQ/Wv2aRtYze3WAFWeQSV++fc
	b37iGBRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCRr-0000000Ccam-1d9G;
	Wed, 28 May 2025 08:47:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCNV-0000000Cc4t-29qr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:43:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKCN9-00033D-JK; Wed, 28 May 2025 10:42:51 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKCN8-000YbX-0F;
	Wed, 28 May 2025 10:42:50 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uKCN7-00ER89-34;
	Wed, 28 May 2025 10:42:49 +0200
Date: Wed, 28 May 2025 10:42:49 +0200
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
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
Message-ID: <20250528084249.6qn2mnu2rmrv7xhi@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
 <20250502150513.4169098-8-m.felsch@pengutronix.de>
 <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
 <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_014313_547185_16DEA8D9 
X-CRM114-Status: GOOD (  30.79  )
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

Hi Adam,

thanks for testing.

On 25-05-27, Adam Ford wrote:
> On Fri, May 2, 2025 at 11:55 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 25-05-02, Adam Ford wrote:
> > > On Fri, May 2, 2025 at 10:10 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> > > >
> > > > The VPU_PLL clock must be set before the VPU_BUS clock which is derived
> > > > from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.
> 
> I did verify the current clock rate ends up at 300MHz instead of the
> desired 600 or 800MHz, so we should do something.
> 
> > > >
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > index 97b09b647ec7..7f4bdefb3480 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > > >                         clock-names = "g1", "g2", "vc8000e";
> > > > -                       assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
> > > > -                       assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > > > +                       assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> > > > +                       assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> > > >                         assigned-clock-rates = <600000000>, <600000000>;
> > >
> > > I think there was a move to make the default be overdrive [1]  and [2]
> > > and use a 'nominal' device tree for those who are not in overdrive
> > > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
> > > values here should be 800MHz and if we should add the nominal values
> > > of 600MHz to the imx8m-nominal.dtsi file.
> >
> > You're right, Ahamd and Lucas did change this. I will adapt it later on.
> 
> I updated my device tree to run in overdrive mode and ran fluster at
> the higher rates:
> VPU_G1 - 800MHz,
> VPU-G2 - 700MHz
> VPU-Bus - 800MHz
> 
> ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
> Ran 57/61 tests successfully               in 5.922 secs
> (vs 7.059 secs at nominal speed)
> 
> ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> Ran 129/135 tests successfully               in 40.107 secs
> (vs 45.741 secs at nominal speed)
> 
> If you want, I can submit the clock updates I have for overdrive or
> send them to you to save you some time.

Sure, you can pick-up my patches or add new ones. Either way you're
right, the clock fixes can go in separately.

Regards,
  Marco

> 
> adam
> 
> >
> > Regards,
> >   Marco
> 

