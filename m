Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0A6C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/UH1AHL+BhamZ0GmotrhNFvVncXqHpIKJvOFodTMow=; b=o5iyzp+q4ZLzNxTK2wLz4P0gQh
	ZyFC4/5A4wo+IYhhw8jwU3BvBhMLz4bPYKwH+dGMOdtplFkYnI39n+ShQhobWDZKeG7/mTwNx5VQ4
	gJwxRqACm+b2MWEfLFBZEPljbEzmS2YU+36R734U3qdVjDR7daUpJwUY/ffuwRSM7sYeI5wlFGbsY
	vJrdB6h62378/d3cgLBknhQhspqcy2hSy5YS+vuU5kTFVnKdZQNV1S/BWtRY1rRaSBCzLiIn21usK
	UPKsXcOg+9oXX+JBKfBwOSh6CZLUmKWwGpOsL4toUQG71WCzOB0a2wYA86h171QtsuSDqoMMFj4lL
	E6XRmR5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUDn-0000000BZGI-2DBn;
	Wed, 22 Jul 2026 10:30:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUDk-0000000BZFC-3yCo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:30:38 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3C0A2447;
	Wed, 22 Jul 2026 12:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784716171;
	bh=WLv1NkIuFdslnB3lO6t5E/jNo8c9nJpw4Hrm3G2sqfc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m3/QrnomGMN98IKkxI3JhTOOEPJeWtjSrGgXu8oSmMMVQpE83+JZfaezN+0OuStRO
	 UC0Zk07S3nQbm5k+9lbybLfuHAqHlmtNh2de0HMZ3GrdLO798KY3dA53WBv4ufUJr+
	 jSynp7Y952/5N1dSAKZtkxWZYLNWDz5xq1MdYnN8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com> <20260713-v1-verdin-imx8mm-dtbos-v1-6-4acd63db4504@toradex.com> <al5mDqeFE8QVbUd9@lizhi-Precision-Tower-5810> <3ak4ffamwvdrtgw3bivzvrbtkmyh7g3lvuk4xwvdiuzizi3iu3@uxqvyif7rvpx>
Subject: Re: [PATCH 6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex OV5640 CSI Cameras
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
Date: Wed, 22 Jul 2026 11:30:29 +0100
Message-ID: <178471622928.2174993.5439033710284861967@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_033037_130237_61895E5D 
X-CRM114-Status: GOOD (  22.54  )
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

Quoting Ernest Van Hoecke (2026-07-22 10:27:32)
> On Mon, Jul 20, 2026 at 02:16:46PM -0400, Frank Li wrote:
> > On Mon, Jul 13, 2026 at 05:06:27PM +0200, Ernest Van Hoecke wrote:
> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > >
> > > Add device tree overlays for the Toradex OV5640 CSI Camera on Verdin =
CSI_1.
> > >
> > > The default overlay describes the current CSI Camera Set 5MP OV5640 w=
ith a
> > > 27 MHz on-board oscillator. Add a separate 24 MHz overlay for the leg=
acy
> > > camera module.
> > >
> > > Link: https://developer.toradex.com/hardware/accessories/cameras/csi-=
camera-module-5mp-ov5640-arducam
> > > Link: https://www.toradex.com/accessories/csi-camera-ov5640
> > > Link: https://developer.toradex.com/hardware/legacy-products/other/cs=
i-camera-module-5mp-ov5640/
> > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile             |  6 ++
> > >  .../dts/freescale/imx8mm-verdin-ov5640-24mhz.dtso  | 17 +++++
> > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtsi   | 78 ++++++++++++=
++++++++++
> > >  .../boot/dts/freescale/imx8mm-verdin-ov5640.dtso   | 18 +++++
> > >  4 files changed, 119 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot=
/dts/freescale/Makefile
> > > index c465aa19e526..ed3d678e7c5e 100644
> > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > @@ -189,6 +189,8 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi=
-mallow.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-yavia-dsi-to-hdmi.=
dtb
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-yavia.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-nonwifi-zinnia.dtb
> > > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-ov5640-24mhz.dtbo
> > > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-ov5640.dtbo
> >=20
> > Need not add dtbo here,
> >=20
> > +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb can
> > auto dtbo build dtbo.
> >=20
> > check other dtbo.
> >=20
> > Frank
> >=20
>=20
> Hi Frank,
>=20
> Thanks for the review.
>=20
> Our desire is that these dtbo's are standalone targets that are shipped
> for runtime overlay application. Users might, on dev boards especially,
> want to enable or disable any combination of these overlays, and change
> the combination between boots.
>=20
> The combined dtb targets validate the overlay and in some listed cases,
> provide a ready-to-use combo. They are not intended to cover all
> possible use-cases.
>=20
> My understanding is that indeed a dtb-y targeting a combined DTB will
> build the prerequisite dtbo, but it would not be an install target.

I think with the Toradex ecosystem there would be some value in
supporting or helping with the ongoing dt-connectors or dt-addons topics
so that we can abstract the hardware which is being 'added'.

I think it's important that we tackle the problem of combinatorial
explosions of overlays when we can add a component to multiple
platforms.

For example, your OV5640 camera could be added to many different boards
- and each board could have many different cameras - in different ports.

We should not be copy/pasting overlays for each combination, or we'll
have 'thousands' of identical overlays.

--
Kieran


>=20
> Kind regards,
> Ernest
>

