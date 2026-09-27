Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A1FC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 14:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r64dufVmVhn/Dj9g44P0J/Y0d/WhqSN95lx5ctN2MVA=; b=dzOdSJk/IojMJdUbwS4BBSleEa
	yCLsuXNSE4IMtS7M96P3AOOrU7bfMqOE1Ls6oYHqbtrmdOy1BdVHaj8O+2ayVZN7w7v5xnH1U9DKY
	W9ilIx0oyGqtEHLKdn/61m+EWnJSLqTQv99QosA4qxdAC+Q5imXMJJksOMahqYUTQZocRq/yO+KKD
	KcRsawrwBcDmMzXAjo7NbqjFQA3TYH2lQI74aNQMuRni4ECiuH0qdJAYH1rXNlYtTUs9bjvHuCAO6
	vJfAsQiUCshUoJdXrTs77arAIf0u6lRa/ZuOdKAZ7DWO3MQ8+sRpIRqHVv9P4pbr28SIvlr+FodZG
	Msou+7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApiq-0000000GR2k-4B54;
	Sun, 27 Sep 2026 14:19:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xApin-0000000GR2E-02WF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 14:19:19 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CA75FBE;
	Sun, 27 Sep 2026 16:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790518644;
	bh=XuV1pUSSKMp45rUiY7+W9cj7hDLqz3FCd/AFGxCjcKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmX4gfNuT1kMtkv1BJjzUol4CGIpJX8+OyjH+SP2ichnX7Ziz3RLC7YjAbSCkKoi/
	 w7U536Qw7zDaZwUjagSV0ECUl4S5c56QTZMxVKTwZ17IZ4ky7TsMUK1lBbpbMTsQy2
	 sVn+m52iSpsMceuB5mLlunK1n/GBAoa2tqgB7SK4=
Date: Sun, 27 Sep 2026 17:19:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	tomi.valkeinen@ideasonboard.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
	vigneshr@ti.com, kristo@kernel.org, sakari.ailus@linux.intel.com,
	mripard@kernel.org, jai.luthra@linux.dev,
	jai.luthra@ideasonboard.com, devarsht@ti.com,
	y-abhilashchandra@ti.com, mirela.rabulea@nxp.com
Subject: Re: [RFC PATCH 4/8] media: cadence: csi2rx: Add RAW10 RGBIr formats
Message-ID: <20260927141912.GA4406@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-5-r-donadkar@ti.com>
 <20260926145242.GD764757@killaraus.ideasonboard.com>
 <7e6eff37-832c-4a40-a4f5-4e3699bf3a5b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e6eff37-832c-4a40-a4f5-4e3699bf3a5b@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_071917_216267_9425FCE7 
X-CRM114-Status: GOOD (  21.29  )
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

On Sun, Sep 27, 2026 at 10:50:30AM +0530, Rishikesh Donadkar wrote:
> On 26/09/26 20:22, Laurent Pinchart wrote:
> > On Fri, Sep 25, 2026 at 06:59:57PM +0530, Rishikesh Donadkar wrote:
> >> From: Jai Luthra <j-luthra@ti.com>
> >>
> >> Add 10-bit RGBIr formats to the table to allow capturing them.
> >>
> >> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> >> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> >> ---
> >>   drivers/media/platform/cadence/cdns-csi2rx.c | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> >> index de7cce76397a..8ed730452d3c 100644
> >> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> >> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> >> @@ -173,6 +173,14 @@ static const struct csi2rx_fmt formats[] = {
> >>   	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
> >>   	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
> >>   	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
> >> +	{ .code	= MEDIA_BUS_FMT_SRGGI10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SGRIG10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SBGGI10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SGBIG10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SGIRG10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SIGGR10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SGIBG10_1X10, .bpp = 10, .max_pixels = 2 },
> >> +	{ .code	= MEDIA_BUS_FMT_SIGGB10_1X10, .bpp = 10, .max_pixels = 2 },
> > 
> > Raw formats will allow supporting all possible CFA patterns without
> > having to extend each driver every time a new pattern is added.
> 
> Yes, makes sense !
> 
> I noticed that patches for RAW format support are present here
> 
> https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata
> 
> Is there a plan to merge these into media tree in the near future?
> If they are still under review and need more time to get merged, I’ll 
> plan to cherry-pick them and rebase my work on top of them.

Jai is working on the userspace implementation in libcamera to test out
the API. Once that completes, we'll update the API is issues are found,
and then merge it.

> >>   };
> >>   
> >>   static void csi2rx_configure_error_irq_mask(void __iomem *base,

-- 
Regards,

Laurent Pinchart

