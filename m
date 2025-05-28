Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80036C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRu1EOn3q8+EU57x4bsM/urqoopcUXdyeT7rdu2xDbw=; b=wtrq1vz+D/qGUX9Q8s7alGcYFy
	SFQ7GppVl+GigK7Aue5s/ywpVbvWxTGz4X9N5lbEjcHqROaplVRyhP1FJNzA7ba2di2qISy8NISgY
	SBzK7TVqXPKdTEiaFzElkqPs9Ai+KfD5eWY12bNsR1twp95en5GuJhkrDp9ruRCwZ2DPSbGJJA2ih
	oYDVOKjjzhCApFzb2FRTFs308lYZE+4hSCenoxe/dsE7GKHshI6FuSo2nbcaI8CcMUuTpbUtZHU6f
	mVm1Q7KvlD8yKA1BbsyCIbMBS5q3GSkapcn2BhzDQ1TD7ahnZXQkcgWXJvCCCtz/mXVJksP+MPwzv
	u7GAfzNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHhg-0000000DOXI-08RR;
	Wed, 28 May 2025 14:24:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKHXv-0000000DLHM-1BbG;
	Wed, 28 May 2025 14:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748441656;
	bh=Xck/nwOYiqy1ZVp9Sss2kWwcLSvKVmGgOkD7OBgsZBA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=lVVoA1jctbfwewW2KGob5hfTDoq2NQRzQk9gxJCzi1YcEl/+KT9lpM1mZDY7EpwAz
	 C01gp7g9uaW3/+R4aPvO6wDfW5R1enrQHhY17Rc4ZbwusXt7h3uDWywQzwv3+uHrrJ
	 eyXVnqTow726pX7uJU1Zh9KVXNThuEmBMg///ei+djpn3Olt5z7LlLIGYfjVzSUyVS
	 Cob+tignic8jH9R0rI61lG5DM3Ej2AQt6cNGR2LAloGMo6fvEbUWpg5GqiDbnM6mLF
	 WDNyYPavHzBqZqlWkUbSY/zfiMhnakM4/8bZ+WN4gDOyZVH9dAF3IHgby93SQWFHEg
	 LI1+Pb7C4IL6Q==
Received: from [IPv6:2606:6d00:17:b2fc::5ac] (unknown [IPv6:2606:6d00:17:b2fc::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 524C317E3700;
	Wed, 28 May 2025 16:14:14 +0200 (CEST)
Message-ID: <7cf3e219758a67d08137ebea5e52a1abad835e65.camel@collabora.com>
Subject: Re: [RFC PATCH 07/11] arm64: dts: imx8mp: fix VPU_BUS clock setting
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Adam Ford <aford173@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: benjamin.gaignard@collabora.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, 	shawnguo@kernel.org, Sascha Hauer
 <s.hauer@pengutronix.de>, 	kernel@pengutronix.de, festevam@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, 	conor+dt@kernel.org,
 paulk@sys-base.io, hverkuil@xs4all.nl, 	laurent.pinchart@ideasonboard.com,
 sebastian.fricke@collabora.com, 	ming.qian@nxp.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Date: Wed, 28 May 2025 10:14:12 -0400
In-Reply-To: <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
	 <20250502150513.4169098-8-m.felsch@pengutronix.de>
	 <CAHCN7x+Lu9momgX3Vwp+Yu+Tet5Q=k2vCL83SMLuad24SDchEg@mail.gmail.com>
	 <20250502165535.aeb2osq2vnxsudmq@pengutronix.de>
	 <CAHCN7xLecU12XtXFuwfNP+eee+9RLCSB9iErNmk7VFV+WrozJA@mail.gmail.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_071419_493631_5BF884A5 
X-CRM114-Status: GOOD (  28.98  )
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

Hi,

Le mardi 27 mai 2025 à 22:05 -0500, Adam Ford a écrit :
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

This reminded me of: 

https://patchwork.linuxtv.org/project/linux-media/patch/20250217-b4-hantro-av1-clock-rate-v2-1-e179fad52641@collabora.com/

Which also made me discover that this patch wasn't picked despite being mark accepted. We
will favour DT clock settings from here, since its not really managable otherwise, old board
will stay like this, otherwise we face backward compatibility issues.

Note that G2 and VC8K can be run at higher rate, but to be stable, you need
to also control voltage and proper cooling, not something we want "by default".

Nicolas

> 
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > index 97b09b647ec7..7f4bdefb3480 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > > @@ -2289,8 +2289,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > > >                                  <&clk IMX8MP_CLK_VPU_G2_ROOT>,
> > > >                                  <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > > >                         clock-names = "g1", "g2", "vc8000e";
> > > > -                       assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
> > > > -                       assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
> > > > +                       assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
> > > > +                       assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
> > > >                         assigned-clock-rates = <600000000>, <600000000>;
> > > 
> > > I think there was a move to make the default be overdrive [1]  and [2]
> > > and use a 'nominal' device tree for those who are not in overdrive
> > > mode.  According to the TRM, the VPU_BUS_CLK_ROOT, the nominal is
> > > 600MHz and the overdrive is 800MHz.  Based on that, I wonder if the
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
> Ran 57/61 tests successfully               in 5.922 secs
> (vs 7.059 secs at nominal speed)
> 
> ./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
> Ran 129/135 tests successfully               in 40.107 secs
> (vs 45.741 secs at nominal speed)
> 
> If you want, I can submit the clock updates I have for overdrive or
> send them to you to save you some time.
> 
> adam
> 
> > 
> > Regards,
> >   Marco

