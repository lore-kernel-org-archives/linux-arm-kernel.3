Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8E8C71137
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtRy5nDmui9IhCUvni82JzzyhBwjg7VAcVMPMSibp+o=; b=wHz6cHjValZEvdC9Sa5oWsx12g
	k9luJIrZHn5I0I8y75Esw8vebwOTTCFpvumJhP0RM3ot+TF+HrXnGNTNstCeaxuK21cEh7QupOeHy
	0Z9LGLWrMpyzonVYNeXq4s7vg7E8RVpfhFrhN8Qrx1ETRcVIIwqnloNtsHO/UvXb4TzPvNOamqKfT
	t78PbxVXdD4agYnx8E9ZHVpjKeTX0YRQ5cPRLYWDYyEZ3piFbxbj1J7YalgELydOP2InHmeWZ7gpC
	H9PNhBr8GYkIs36Q+4OksxIq9Nwibhj+XfY4p/God+NeNy898HQnBJPX5sWoJLYogzAHQUjJHHuhC
	i63PlRFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOweu-00000006Y28-1PqK;
	Tue, 10 Jun 2025 10:56:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvf1-00000006PU2-3vft;
	Tue, 10 Jun 2025 09:52:53 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 214AF169;
	Tue, 10 Jun 2025 11:52:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749549163;
	bh=Im5GYUCb1sxEGckIaOnAeshf/338KvZJ59zmYw//6eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYcfkAMMn6K+mvIMMfKStHcleEwEsMpB7hzK4Uas/m9rLyIes7YU38x0/mJedVKBb
	 caB2NaQvYMsZEPK6xmrYorLMaXFrM06ojzRyDabW+HtlAOOCyaWl7YOSDgbGyGGDRW
	 JUC8Rlqi98psv8LRKo/fJIvtHFGGNjRIl9u7t2jY=
Date: Tue, 10 Jun 2025 12:52:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
Message-ID: <20250610095238.GA28428@pendragon.ideasonboard.com>
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org>
 <20250609003751.GD14545@pendragon.ideasonboard.com>
 <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_025252_114130_CCCF2FC9 
X-CRM114-Status: GOOD (  37.38  )
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

On Mon, Jun 09, 2025 at 03:33:29PM +0100, Dave Stevenson wrote:
> On Mon, 9 Jun 2025 at 01:38, Laurent Pinchart wrote:
> > On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> > > The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> > > components, with the components being in the red, green, and blue order
> > > from left to right.
> > >
> > > The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> > > RGB888) with blue coming first, then green, then red. So the opposite of
> > > what V4L2 means by RGB.
> > >
> > > Since the hardware cannot reorder the components, this means that when
> > > selecting the RGB24 format, you get inverted red and blue components
> > > compared to what you'd expect.
> > >
> > > The driver already supports BGR24, so we can simply remove the RGB24
> > > format from the driver.
> >
> > The only reason I could think of to explain why the driver exposes
> > V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
> > with a non-standard order. I don't know what hardware would do that.
> > Dave, Naush, do you recall why this pixel format is supported by the
> > unicam driver ?
> 
> I've lost track of exactly what gets validated along the pipeline.
> unicam_video_link_validate [1] looks to ensure that the V4L2 pixel
> format and media bus codes match as listed in the table.
> 
> tc358743, adv7604, adv7511, and adv748x are all saying they produce
> MEDIA_BUS_FMT_RGB888_1X24
> ov5640 says it produces MEDIA_BUS_FMT_BGR888_1X24.
> 
> Is that an error in the ov5640 driver? If not, then both entries have
> to be in the table to support all those drivers.

We haven't standardized which media bus code to use for 24-bit RGB on
CSI-2, so I'm not surprised drivers didn't get it right :-( The adv7604
and adv7511 shouldn't be relevant here though, as they're not CSI-2
devices. tc358743 and adv748x are relevant.

Sakari, which media bus code would you expect ?

> Looking at alvium-csi2.c and st-mipid02.c, both mappings are included
> there (and RBG888 in the case of alvium).
> Unicam's hardware doesn't care about the ordering as it just writes
> the incoming data to memory, so having all the sensible mappings
> between MEDIA_BUS_FMT_* and V4L2_PIX_FMT_* values makes sense.
> 
> My initial reaction though is that simply removing the entry won't
> solve the problem anyway. You won't get a match between the
> MEDIA_BUS_FMT_RGB888_1X24 requested by tc358743 and a supported V4L2
> pixel format, so the link_validate will fail.
> Swapping either fourcc or code between the two entries would be the
> fix I was expecting.
> 
> [1] https://github.com/torvalds/linux/blob/master/drivers/media/platform/broadcom/bcm2835-unicam.c#L2151-L2169
> 
> > > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
> > >  1 file changed, 5 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> > > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > > @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
> > >       /* RGB Formats */
> > >               .fourcc         = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
> > >               .code           = MEDIA_BUS_FMT_RGB565_1X16,
> > >               .depth          = 16,
> > >               .csi_dt         = MIPI_CSI2_DT_RGB565,
> > > -     }, {
> > > -             .fourcc         = V4L2_PIX_FMT_RGB24, /* rgb */
> > > -             .code           = MEDIA_BUS_FMT_RGB888_1X24,
> > > -             .depth          = 24,
> > > -             .csi_dt         = MIPI_CSI2_DT_RGB888,
> > >       }, {
> > >               .fourcc         = V4L2_PIX_FMT_BGR24, /* bgr */
> > >               .code           = MEDIA_BUS_FMT_BGR888_1X24,
> > >               .depth          = 24,
> > >               .csi_dt         = MIPI_CSI2_DT_RGB888,
> > >
> > > ---
> > > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > > change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad

-- 
Regards,

Laurent Pinchart

