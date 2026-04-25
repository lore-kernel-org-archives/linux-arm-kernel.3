Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C225FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 23:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6r2b2jMlnyEbHw3lQ5dPAKKOJP18qt0SqafBNS79kw=; b=ZaNTvZ2L+3UYu15YbTrFHA3Cg5
	/evts78XRxwSCho+vGXjbxk0oJP5LCCcaibGyLHNABNgQYrfsPQ2CQGkhNwWK7fbg5cQWm7Us3XUX
	fZl6jF50e0DBbe89IvNwFNBhheruSC6oiolQpO5yVgW4i4XshfkF/dEGC7oIRKtiZ/mQNo2rWhtLm
	b+QtpsU36fIuyAOdYafmNIIoJ8WKuVL2BTRxXD+1r/HNGU7//F3kWtYgH3gdEfCCpI5/8Uh9SEI7o
	Zr6/c3Oca8IS1nXW3g9b2f2la1EJ3ecXndPP50uc8JPkc+vViGaUpCJuv82pX8P+dHCsuM628yRpW
	wa0evK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGmk4-0000000F5H7-0iVD;
	Sat, 25 Apr 2026 23:48:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGmk1-0000000F5Ge-1H61;
	Sat, 25 Apr 2026 23:48:54 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A956F1544;
	Sun, 26 Apr 2026 01:47:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777160826;
	bh=Bp8RyEnQL0UxPw7eElHX5mckH3F8+ELKhrN2JVsixec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBosJ+CPRWpbzNhjnEakqNIWx8v6lvj20KVcTdhjJHN+Ndm/UNWPtYyXx6WQQbise
	 L8hXN5SGvJ/awHLT9vgqFhYtYGLwhcvKW6IpH+xHcG2egbT8THwrLcbcNhFYgXfQdc
	 j4ji2Tag7R41Gax3AEIZ/M90dRFcVrQECrMOoRD0=
Date: Sun, 26 Apr 2026 02:48:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dennis Gilmore <dennis@ausil.us>, Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <20260425234845.GC2964234@killaraus.ideasonboard.com>
References: <20260425031011.2529364-1-dennis@ausil.us>
 <20260425031011.2529364-4-dennis@ausil.us>
 <20260425112844.GB2964234@killaraus.ideasonboard.com>
 <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
 <CAABkxwt1=n=CnrVfCcw+EHjqjfsLkp67POk451fV8Gqw4vdnQw@mail.gmail.com>
 <ur7mow4lw47ylxj3uigwwasrfywe6n42zb2to7ygeyjlkcgfkf@guzkembyy5hc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ur7mow4lw47ylxj3uigwwasrfywe6n42zb2to7ygeyjlkcgfkf@guzkembyy5hc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_164853_798352_D48A59F5 
X-CRM114-Status: GOOD (  38.33  )
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

On Sun, Apr 26, 2026 at 12:44:59AM +0300, Dmitry Baryshkov wrote:
> On Sat, Apr 25, 2026 at 01:10:02PM -0500, Dennis Gilmore wrote:
> > On Sat, Apr 25, 2026 at 9:24 AM Dmitry Baryshkov wrote:
> > > On Sat, Apr 25, 2026 at 02:28:44PM +0300, Laurent Pinchart wrote:
> > > > Hi Dennis,
> > > >
> > > > Thank you for the patch.
> > > >
> > > > On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> > > > > The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> > > > > to HDMI2.0 converter, designed to connect a USB Type-C source or
> > > > > a DP1.4 source to an HDMI2.0 sink.
> > > >
> > > > As far as I can tell, the LT8711UXD has an I2C control interface.
> > > > Shouldn't it be an I2C device ?
> > >
> > > From the datasheet:
> > >
> > > The device is capable of automatic operation which is
> > > enabled by an integrated microprocessor that uses an
> > > embedded SPI flash for firmware storage. System control
> > > is also available through the use of a dedicated
> > > configuration I2C slave interface.
> > >
> > > My guess was that it can either be an I2C device or it can function as a
> > > simple platdev with no I2C controls. Please correct me if my
> > > understanding was wrong.
> > >
> > > But now looking at the schematics, it seems to be connected to I2C6.
> > > Which means that it should be desribed (and bound) as such.
> > 
> > Hi Dmitry and Laurent,
> > 
> > While the schematic shows that it can use I2C and has been wired up,
> > it also shows that both MODE_SEL and I2C_ADDR have unpopulated 10k
> > resistors; as a result, MODE_SEL is connected directly to GND, putting
> > the bridge in autonomous mode. I confirmed this by running `i2cdetect
> > -r -y 6`, with the only device on the bus being the HYM8563 RTC at
> > 0x51. Without reworking the board, the device is not directly
> > controllable and just runs autonomously.
> 
> I think it would be nice to mention:
> - In the commit for the bindings, that the device can be running
>   uncontrolled or it can be attached over I2C, bindings describe the
>   uncontrolled mode.
> - In this commit message, the same.
> - In the commit message for the board DT mention your findings about the
>   board, mention soldering R9 or R17 (which one?) and R27.

Additionally, how are we going to handle boards where the device
operates in I2C mode ? Will we use a different compatible string (maybe
"lontium,lt8711uxd-i2c") ? If DT maintainers are fine with that, I have
no objection to this patch.

> > > > > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > > > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > > > > index 8aa31ca3c72d..42c1f3d5ba0c 100644
> > > > > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > > > > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > > > > @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
> > > > >             .data = &(const struct simple_bridge_info) {
> > > > >                     .connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > > > >             },
> > > > > +   }, {
> > > > > +           .compatible = "lontium,lt8711uxd",
> > > > > +           .data = &(const struct simple_bridge_info) {
> > > > > +                   .connector_type = DRM_MODE_CONNECTOR_HDMIA,
> > > > > +           },
> > > > >     }, {
> > > > >             .compatible = "parade,ps185hdm",
> > > > >             .data = &(const struct simple_bridge_info) {

-- 
Regards,

Laurent Pinchart

