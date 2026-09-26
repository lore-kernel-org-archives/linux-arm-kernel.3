Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDE7C98332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eExyfgyGvnSwGZZv3x3RB39koM5ueuCo752RubzSJvo=; b=pimtu0KW+CjGDjDLZZ6ak+Z6z+
	/ZMM6JNAjuL8mTwqHL4naKP8FYVcXDJVqZcjBXWd+7vn/p2LKUhNexk7z1ygJy6W8PIDhKXhMNOIF
	J4PSd+41lcuXtvHyfrfZVlIvAmlXjWegcEe2U9jUDUxGnJiGJXsjoQu/NKfZHJbAKal88zDtIZnBP
	+7RZNQp6molfVNHg7Z0cgjq5cgRciHCE3dJVKHrWWyAACK42CqmPktmjXdVBQIofdHpJk9GeBsjxR
	mVOZdDqy07BrES8nsIs4l7T3GAdXUzH949eeJGaKw5BBzycedl/lpOYFFY7i3sCR2KQ5I8VVLrcxP
	QNtjwOUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATlf-0000000FYFA-3obx;
	Sat, 26 Sep 2026 14:52:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xATld-0000000FYED-30RC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 14:52:46 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C2F3B5;
	Sat, 26 Sep 2026 16:50:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790434255;
	bh=5nYPgDSdmjoHrFmhSCM6PMGjRbRiiimao5/hFbMD5hE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p51V39gZ8aT6M5NNgPyVe2RExP7bZxkQ98ATLfBsk1wddDV9on8MHphIsy22g7KZc
	 uytzvVMpV6Nn1HFTxchYHaPrAqoPqLE4o43RI7eF/+9R+4VPrxNZ823B7DmRwNBnB1
	 tEUefqY2UvLDkLrN7q5a4jgyLaeTepvg3daU3XFU=
Date: Sat, 26 Sep 2026 17:52:42 +0300
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
Message-ID: <20260926145242.GD764757@killaraus.ideasonboard.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-5-r-donadkar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925133001.2780868-5-r-donadkar@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_075245_900262_F569EDA6 
X-CRM114-Status: GOOD (  13.60  )
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

On Fri, Sep 25, 2026 at 06:59:57PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Add 10-bit RGBIr formats to the table to allow capturing them.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index de7cce76397a..8ed730452d3c 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -173,6 +173,14 @@ static const struct csi2rx_fmt formats[] = {
>  	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
>  	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
>  	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
> +	{ .code	= MEDIA_BUS_FMT_SRGGI10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SGRIG10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SBGGI10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SGBIG10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SGIRG10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SIGGR10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SGIBG10_1X10, .bpp = 10, .max_pixels = 2 },
> +	{ .code	= MEDIA_BUS_FMT_SIGGB10_1X10, .bpp = 10, .max_pixels = 2 },

Raw formats will allow supporting all possible CFA patterns without
having to extend each driver every time a new pattern is added.

>  };
>  
>  static void csi2rx_configure_error_irq_mask(void __iomem *base,

-- 
Regards,

Laurent Pinchart

