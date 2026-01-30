Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E2EE6BF3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 22:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnZFw/m5bZsRAKY9ZERafl7Y3CsJs1uufNqsiFseovs=; b=xvyKjj0+jqGoHdR72Ky/Bxz3/+
	11URLdhZGt16TLnyraegyYe2Aj9jS+UHZWRV8EabZZ8UNazg9/G3LZ8i6qPNrH+0WcTX3fKf4Nt8R
	FGpVKoH3eZC1VLi95CLQRMk6aKvwcM+6xWl36EYd/OhdaKig80DvEzazzp+VwR/g1WCS59QeGw0l9
	ZRZZskp+F8XGWsWD0JP7gywT5IYB/pX5JpPKg8JWV3aer74pHYQPty5bLrlvy05WBsgmOHiEpGMw2
	6WWLTmAGq4L8DdcdNTrX3vkUxiVa4Rj3HBEloZcPG8ccnFHxTIXm5S1+UdhzQe6jzlQi8Azw4LT3B
	rGqeonCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxCp-000000024NX-1pIa;
	Fri, 30 Jan 2026 22:43:11 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxCm-000000024Mh-27Ay;
	Fri, 30 Jan 2026 22:43:10 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 13E5F22F;
	Fri, 30 Jan 2026 23:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769812944;
	bh=9vt/KWf0ClAcghSMvVKAo3o70Sm0WkeC1kfJnzEifBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fU6RJGSPKIlbpF/tLhXT5lSMw2jEyLRVAx3JYazvkzQVZTjjn2nnLhtg9pPH303Po
	 CxdhqM9FawM8SJrtFHLdJKycX2jkGo2Fvr/DmWGqkVwiFP5bQh31do4Z3KpQQmDgB/
	 10n4n3cwuri0Wftc//KNpfdQzX63yw8c6YgLANII=
Date: Sat, 31 Jan 2026 00:43:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rkcif: Add missing MUST_CONNECT flag to
 pads
Message-ID: <20260130224301.GS3374091@killaraus>
References: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_144308_978015_D8260F4E 
X-CRM114-Status: GOOD (  17.38  )
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

On Thu, Jan 29, 2026 at 02:24:02PM +0700, Dang Huynh wrote:
> The pads missed checks for connected devices which may a null dereference
> when the stream is enabled.
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000020
> pc : rkcif_interface_enable_streams+0x48/0xf0
> lr : rkcif_interface_enable_streams+0x44/0xf0
> Call trace:
>  rkcif_interface_enable_streams+0x48/0xf0
>  v4l2_subdev_enable_streams+0x26c/0x3f0
>  rkcif_stream_start_streaming+0x140/0x278
>  vb2_start_streaming+0x74/0x188
>  vb2_core_streamon+0xe0/0x1d8
>  vb2_ioctl_streamon+0x60/0xa8
>  v4l_streamon+0x2c/0x40
>  __video_do_ioctl+0x34c/0x400
>  video_usercopy+0x2d0/0x800
>  video_ioctl2+0x20/0x60
>  v4l2_ioctl+0x48/0x78
> 
> Fixes: 501802e2ad51 ("media: rockchip: rkcif: add abstraction for dma blocks")
> Fixes: 85411d17bee9 ("media: rockchip: rkcif: add abstraction for interface and crop blocks")
> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
> ---
> The RKCIF driver missed MEDIA_PAD_FL_MUST_CONNECT, which causes a null
> dereference when the stream starts if the links are misconfigured.

The change looks fine,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I'd like a review from Michael though.

> ---
>  drivers/media/platform/rockchip/rkcif/rkcif-interface.c | 3 ++-
>  drivers/media/platform/rockchip/rkcif/rkcif-stream.c    | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> index 523103872b7a..414a9980cf2e 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> @@ -378,7 +378,8 @@ int rkcif_interface_register(struct rkcif_device *rkcif,
>  		snprintf(sd->name, sizeof(sd->name), "rkcif-mipi%d",
>  			 interface->index - RKCIF_MIPI_BASE);
>  
> -	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
> +					MEDIA_PAD_FL_MUST_CONNECT;
>  	pads[RKCIF_IF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>  	ret = media_entity_pads_init(&sd->entity, RKCIF_IF_PAD_MAX, pads);
>  	if (ret)
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index e00010a91e8b..201542b55f00 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -555,7 +555,7 @@ int rkcif_stream_register(struct rkcif_device *rkcif,
>  	vdev->vfl_dir = VFL_DIR_RX;
>  	video_set_drvdata(vdev, stream);
>  
> -	stream->pad.flags = MEDIA_PAD_FL_SINK;
> +	stream->pad.flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_MUST_CONNECT;
>  
>  	stream->pix.height = CIF_MIN_HEIGHT;
>  	stream->pix.width = CIF_MIN_WIDTH;
> 
> ---
> base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
> change-id: 20260129-rkcif-null-fbc0be41f81a

-- 
Regards,

Laurent Pinchart

