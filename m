Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FA5E94622
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 23:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To8fpHA5QmaUt0wEdcMLXlOsAdcxub1o80jFdn77OnI=; b=JUegd6rNvTg4beJlLlmJ94La8v
	HUPVoUv5IKy91IPy5uziefwPL4Qe1luswi8Le5y8mRsh1A3PB3naLYruqHn7bgJR8YWy2ZtLNOvcH
	Qn9bq0wwE5PiJPClSm2SPx8n8B8+DBAVgS1GIegm8vv7489z74sYZ9t5wPCelsmhzRO9MlWtX3xKL
	UCja36XUKG/aky9cRq1JS9PjlyfjxxbhF5Fu3hVzjsqGnNCyaRAixR7WlB11UxQL5nzC0aTfxdUYy
	y93eougH13TnGLjpwNq6Ugbb2jlV0dEr5IF8i4aNe067KdpbNQI9WZocBvoW/TxaZ/XCYrQWtS3Cy
	pxicIhYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpaUv-0000000GAtQ-2pdF;
	Mon, 09 Feb 2026 23:16:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpaUs-0000000GAt1-1dqt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 23:16:51 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id ACA1C1574;
	Tue, 10 Feb 2026 00:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770678962;
	bh=dXrwEM29xURyXIg24GFEWZchD3kfoQKyDFv9qfhxcTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBR5TsfBDfJs3BI9H2JX3RG7Tzznbmo6/9EdwM8MFCQymNSPA6bncUUOC4bMYRop8
	 TGB4m4Qq2hKRznZwW1qqvE37KKR6C2YDq5wox5vDQoxioFlaVdv8ufjTy0TKfAuNob
	 YZCyCGtyz9jwN0TFT6QGXzckK7X4yz/iEHyG/QAM=
Date: Tue, 10 Feb 2026 01:16:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Antoine Bouyer <antoine.bouyer@nxp.com>, julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com, daniel.baluta@nxp.com, peng.fan@nxp.com,
	frank.li@nxp.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC v1 03/11] media: Documentation: uapi: Update V4L2 ISP for
 extensible stats
Message-ID: <20260209231647.GG2405149@killaraus.ideasonboard.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-4-antoine.bouyer@nxp.com>
 <aYIguNosvsnnraZO@zed>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aYIguNosvsnnraZO@zed>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_151650_595880_C152B638 
X-CRM114-Status: GOOD (  32.07  )
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

On Tue, Feb 03, 2026 at 05:58:25PM +0100, Jacopo Mondi wrote:
> Hi Antoine
> 
> On Fri, Jan 23, 2026 at 09:09:30AM +0100, Antoine Bouyer wrote:
> > Add driver documentation for V4L2 ISP generic statistics format, mainly
> > copied from the generic parameters one.
> >
> > Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
> > ---
> >  .../userspace-api/media/v4l/v4l2-isp.rst      | 42 +++++++++++++++++--
> >  1 file changed, 39 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/media/v4l/v4l2-isp.rst b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> > index facf6dba1ca7..9024c6998b2c 100644
> > --- a/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> > +++ b/Documentation/userspace-api/media/v4l/v4l2-isp.rst
> > @@ -32,8 +32,8 @@ types.
> >  Userspace applications are responsible for correctly populating each block's
> >  header fields (type, flags and size) and the block-specific parameters.
> >
> > -ISP block enabling, disabling and configuration
> > ------------------------------------------------
> > +ISP parameters block enabling, disabling and configuration
> > +----------------------------------------------------------
> >
> >  When userspace wants to configure and enable an ISP block it shall fully
> >  populate the block configuration and set the V4L2_ISP_PARAMS_FL_BLOCK_ENABLE
> > @@ -59,7 +59,43 @@ definition without invalidating the existing ones.
> >  ISP statistics
> >  ==============
> >
> > -Support for generic statistics format is not yet implemented in Video4Linux2.
> > +The generic ISP statistics format is similar to the generic ISP configuration
> > +parameters format. It is realized by defineing a C structure that contains a

s/defineing/defining/

> > +header, followed by binary buffer where the ISP driver copies a variable number
> > +of ISP statistics block.
> > +
> > +The :c:type:`v4l2_isp_stats_buffer` structure defines the buffer header which
> > +is followed by a binary buffer of ISP statistics data. ISP driver shall

s/driver/drivers/

> > +correctly populate the buffer header with the generic statistics format version
> > +and with the size (in bytes) of the binary data buffer where it will store the
> > +ISP statistics data.
> > +
> > +Each *ISP statistics block* is preceded by a header implemented by the
> > +:c:type:`v4l2_isp_stats_block_header` structure, followed by the statistics
> > +data for that specific block, defined by the ISP driver specific data types.
> > +
> > +Driver is responsible for correctly populating each block's header fields

s/Driver is/Drivers are/

> > +(type, flags and size) and the block-specific statistics data.
> > +
> > +ISP statistics block configuration
> > +----------------------------------
> > +
> > +When ISP driver wants to share statistics from an ISP block, it shall fully

s/ISP driver/an ISP driver/

> > +populate the block statistics and set the V4L2_ISP_STATS_FL_BLOCK_VALID
> > +bit in the block header's `flags` field.
> > +
> > +When ISP driver wants userspace to ignore statistics from an ISP block, it can
> 
> What would be the use case here ?
> 
> I checked a few datasheet and drivers and I haven't found any "failed
> to read stats" bits, and even if that would be a thing, isn't it easier to
> simply overwrite the header of the failed stat block instead of
> marking it invalid ?

It seems simpler to just omit the block completely indeed. The only case
where I could imagine this being useful is if the hardware writes the
statistics data to memory through DMA, with different stats engines
writing to different parts of the buffer concurrently.

In that case though, we will need to ensure the buffer format can
accommodate DMA alignment requirements of different devices, which is
likely not the case of the format proposed in this series. The size of
the top-level header and of the block headers are fixed, we would likely
need to make them configurable by the driver.

> > +simply omit the full block, or set the V4L2_ISP_STATS_FL_BLOCK_INVALID bit in
> > +the block headers's `flags` field. Then driver can omit the additional data
> > +after header, and set block header's `size` to the header structure's size only
> > +in such case.
> > +
> > +Setting both the V4L2_ISP_STATS_FL_BLOCK_VALID and
> > +V4L2_ISP_STATS_FL_BLOCK_INVALID  bits in the flags field is not allowed and
> > +userspace shall not handle it.
> > +
> > +Extension to the statistics format can be implemented by adding new blocks
> > +definition without invalidating the existing ones.
> >
> >  V4L2 ISP uAPI data types
> >  ========================

-- 
Regards,

Laurent Pinchart

