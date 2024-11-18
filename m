Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1976D10F40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWNzwbRaKIzV03tTKJpAP3yBX5oltq2Ru1IZagBZ2uw=; b=VaxvpYAO83MC+S4oZpC/F7nL85
	aixcEyByKebBOqS4bLvAce35Mi2v0YufmUr7SnW6M+ZpHD1rcGDbzVvg4h82iL2lVdyck5FcAac/L
	CHl/PQCYvSSIG2xGnDNLQlu6I59bUD2EF88dBYSlAfu6RN/RJH3xANziM9c7Mc2Qlq9ja/le3vulm
	O5CYG2i4WBT3PH/ef4mk5IYhHDEqBgJ1w3CafW6gTQffRMGYEDJupwsWxJJr6ANbjD7A++NvJfXjp
	3m4Eymc6hjFtbDNzyRx7TJjB2V3MwMO32ZKp1j91c/jG9H+vVSX1K0XX7pPJ9BLYa9fXVsDHG2faD
	3mzaXq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCrCC-000000088Sv-1ZRx;
	Mon, 18 Nov 2024 02:08:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCrBE-000000088N2-47m1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 02:07:58 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A46588FA;
	Mon, 18 Nov 2024 03:07:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1731895658;
	bh=9x7X+M06z6cwyNpbaG8A6rhUsdRKKZYT+MTu06m7R9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e5uygLIMopKLfS4kXdTaymi4OpPsHmge5iA0zitm0omCF+7+7It7IqwZuOexVcoX4
	 goTMDq0OFejzfP9CKTeo94cI5EN3r1uOehhqC8y6CzbcqBwi+d2pFht3KBeWyO6vZ0
	 wYny+dCQGMUcQ6aDG1II2Q/OifCl0ffgbwqShBAs=
Date: Mon, 18 Nov 2024 04:07:45 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] media: i2c: imx290: Add configuration for IMX462
Message-ID: <20241118020745.GI31681@pendragon.ideasonboard.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
 <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com>
 <20241115000637.GK26171@pendragon.ideasonboard.com>
 <CAPY8ntBJu+mA3BcYkkVpr1L0jf2hp6e3kbpyGkB7mwbiDQDGzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntBJu+mA3BcYkkVpr1L0jf2hp6e3kbpyGkB7mwbiDQDGzQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_180757_183777_682D46E5 
X-CRM114-Status: GOOD (  33.43  )
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

Hi Dave,

On Fri, Nov 15, 2024 at 08:51:55AM +0000, Dave Stevenson wrote:
> On Fri, 15 Nov 2024 at 00:06, Laurent Pinchart wrote:
> > On Thu, Nov 14, 2024 at 04:01:15PM +0000, Dave Stevenson wrote:
> > > IMX462 is the successor to IMX290, and wants very minor
> > > changes to the register setup.
> > >
> > > Add the relevant configuration to support it.
> > >
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > >  drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 66 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > index da654deb444a..f1780cc5d7cc 100644
> > > --- a/drivers/media/i2c/imx290.c
> > > +++ b/drivers/media/i2c/imx290.c
> > > @@ -170,6 +170,8 @@ enum imx290_model {
> > >       IMX290_MODEL_IMX290LQR,
> > >       IMX290_MODEL_IMX290LLR,
> > >       IMX290_MODEL_IMX327LQR,
> > > +     IMX290_MODEL_IMX462LQR,
> > > +     IMX290_MODEL_IMX462LLR,
> > >  };
> > >
> > >  struct imx290_model_info {
> > > @@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
> > >       { CCI_REG8(0x33b3), 0x04 },
> > >  };
> > >
> > > +static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
> > > +     { CCI_REG8(0x300f), 0x00 },
> > > +     { CCI_REG8(0x3010), 0x21 },
> > > +     { CCI_REG8(0x3011), 0x02 },
> >
> > As far as I can tell, the only difference in the init sequence between
> > imx290_global_init_settings_290 and imx290_global_init_settings_462 is
> > 0x3011 register which is not present in imx290_global_init_settings_290.
> > It is however included in imx290_global_init_settings, and set to 0x02.
> > Could we therefore use imx290_global_init_settings_290 for the imx462 ?
> 
> I'd done a comparison of the datasheets, and register 0x3011 was the
> only one that changed. I'd missed that it was in
> imx290_global_init_settings.
> 
> My datasheets:
> IMX327LQR-C rev E17Z06B93 2019/03/25. 3011h "Set to 02h" (value
> changed in doc rev 0.3 from 0Ah)
> IMX290LQR-C rev E15510G82 2018/02/09. 3011h "Fixed to 00h" (always
> been that value).
> IMX462LQR-C rev E19Y13C13 2021/03/19. 3011h "Set to 02h" (value
> changed in doc rev 0.2 from 00h)
> The default value stated in all of them is 00h. In true Sony fashion,
> there's no description for that register functionality.
> 
> So actually it looks like it was the addition of IMX327 in [1] should
> have changed that setting, unless someone else has a more recent
> datasheet for IMX290 that updates that.

I agree with this analysis. It may be that setting the register to 0x02
would be fine, but it's hard to tell. Maybe it could be worth asking
Sony ?

> cc Alexander as the author of that patch. I'll find any discussion on it later.
> 
>   Dave
> 
> [1] https://github.com/torvalds/linux/commit/2d41947ec2c0140c65783982692c2e3d89853c47
> 
> > > +     { CCI_REG8(0x3016), 0x09 },
> > > +     { CCI_REG8(0x3070), 0x02 },
> > > +     { CCI_REG8(0x3071), 0x11 },
> > > +     { CCI_REG8(0x309b), 0x10 },
> > > +     { CCI_REG8(0x309c), 0x22 },
> > > +     { CCI_REG8(0x30a2), 0x02 },
> > > +     { CCI_REG8(0x30a6), 0x20 },
> > > +     { CCI_REG8(0x30a8), 0x20 },
> > > +     { CCI_REG8(0x30aa), 0x20 },
> > > +     { CCI_REG8(0x30ac), 0x20 },
> > > +     { CCI_REG8(0x30b0), 0x43 },
> > > +     { CCI_REG8(0x3119), 0x9e },
> > > +     { CCI_REG8(0x311c), 0x1e },
> > > +     { CCI_REG8(0x311e), 0x08 },
> > > +     { CCI_REG8(0x3128), 0x05 },
> > > +     { CCI_REG8(0x313d), 0x83 },
> > > +     { CCI_REG8(0x3150), 0x03 },
> > > +     { CCI_REG8(0x317e), 0x00 },
> > > +     { CCI_REG8(0x32b8), 0x50 },
> > > +     { CCI_REG8(0x32b9), 0x10 },
> > > +     { CCI_REG8(0x32ba), 0x00 },
> > > +     { CCI_REG8(0x32bb), 0x04 },
> > > +     { CCI_REG8(0x32c8), 0x50 },
> > > +     { CCI_REG8(0x32c9), 0x10 },
> > > +     { CCI_REG8(0x32ca), 0x00 },
> > > +     { CCI_REG8(0x32cb), 0x04 },
> > > +     { CCI_REG8(0x332c), 0xd3 },
> > > +     { CCI_REG8(0x332d), 0x10 },
> > > +     { CCI_REG8(0x332e), 0x0d },
> > > +     { CCI_REG8(0x3358), 0x06 },
> > > +     { CCI_REG8(0x3359), 0xe1 },
> > > +     { CCI_REG8(0x335a), 0x11 },
> > > +     { CCI_REG8(0x3360), 0x1e },
> > > +     { CCI_REG8(0x3361), 0x61 },
> > > +     { CCI_REG8(0x3362), 0x10 },
> > > +     { CCI_REG8(0x33b0), 0x50 },
> > > +     { CCI_REG8(0x33b2), 0x1a },
> > > +     { CCI_REG8(0x33b3), 0x04 },
> > > +};
> > > +
> > >  #define IMX290_NUM_CLK_REGS  2
> > >  static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
> > >       [IMX290_CLK_37_125] = {
> > > @@ -1455,6 +1501,20 @@ static const struct imx290_model_info imx290_models[] = {
> > >               .max_analog_gain = 98,
> > >               .name = "imx327",
> > >       },
> > > +     [IMX290_MODEL_IMX462LQR] = {
> > > +             .colour_variant = IMX290_VARIANT_COLOUR,
> > > +             .init_regs = imx290_global_init_settings_462,
> > > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > > +             .max_analog_gain = 98,
> > > +             .name = "imx462",
> > > +     },
> > > +     [IMX290_MODEL_IMX462LLR] = {
> > > +             .colour_variant = IMX290_VARIANT_MONO,
> > > +             .init_regs = imx290_global_init_settings_462,
> > > +             .init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
> > > +             .max_analog_gain = 98,
> > > +             .name = "imx462",
> > > +     },
> > >  };
> > >
> > >  static int imx290_parse_dt(struct imx290 *imx290)
> > > @@ -1653,6 +1713,12 @@ static const struct of_device_id imx290_of_match[] = {
> > >       }, {
> > >               .compatible = "sony,imx327lqr",
> > >               .data = &imx290_models[IMX290_MODEL_IMX327LQR],
> > > +     }, {
> > > +             .compatible = "sony,imx462lqr",
> > > +             .data = &imx290_models[IMX290_MODEL_IMX462LQR],
> > > +     }, {
> > > +             .compatible = "sony,imx462llr",
> > > +             .data = &imx290_models[IMX290_MODEL_IMX462LLR],
> > >       },
> > >       { /* sentinel */ },
> > >  };

-- 
Regards,

Laurent Pinchart

