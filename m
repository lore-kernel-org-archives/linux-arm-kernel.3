Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E037EF48DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WguIdB5c8rnh+wAZ/2bfMfuHTcwmB6rcYmkJqKmMwfM=; b=q106HaVPmwwFNWny1C2HfNSltB
	gp9MZqukqM9onv2TZTtn/weSjAPngkHiN/0p1osKYu1SvdWcVkpzjc7wTMKKXvB/8P3mKKaY3RE2W
	2xiKYUiOKxoxH9Qoi4S1dIZkAJ5GbJEcixqRwQUyaTnPzcP8O7AJ4LDtrRQPt8WtYjaKLpE1SOs2v
	kRoxoMrzjCdDi7q+E0xoviih86LFV3drOu5bFm03oR2Mhr5nqNQRDBp1KHC6t4/nI88xBOUn3t70f
	18HKTGJE/qKeevyhaWoGsMNws1UfHYdEG8MggmV59XB2AS5NcDGbdFpVuejAHiZ7JiBY7jzBdVoRH
	bUZsGKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoCV-000000038qR-0RMS;
	Fri, 13 Feb 2026 08:06:55 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoCS-000000038or-1DuN;
	Fri, 13 Feb 2026 08:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770970009;
	bh=tH0syY3v/uxveu3JwxMQ/PACY/0hnlHWEcq3zpvDCXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A/cP7Ldv745uuMlhry8MPypFUcisg4l611yN90R+c7fxcxaIaKYbthTdvdgLayTub
	 kVJYnkW74gBgM/mQn7/lLf4GMzU4PPzcYpZ5xcZGT/Q75SQKQuiU4tT/YXFfMhoZMQ
	 RJf+VasZ5fszTz6tNJibRqjhSlxcIR7Oo6+aAvbxPWNhf/Iqc3QH/tdVVSYqbDmFYK
	 tKiuWZp3yVWQPRLlBBc3EVxkI9zeyh4FqFphygetkfqzbHdNQ8S7q/stTKHjrAjP/x
	 ctT4ZWwQVCRR+2EYe0CmSPfBGKxAwnlj9UcPgxnwcdDvyOYKcP7cjjhs7lH3leyLFx
	 IC64udm52M3Jg==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8726F17E1301;
	Fri, 13 Feb 2026 09:06:48 +0100 (CET)
Message-ID: <9bb4eced-5710-49ac-99cf-fa0b1d1459b1@collabora.com>
Date: Fri, 13 Feb 2026 09:06:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rockchip: rkcif: Add missing MUST_CONNECT flag to
 pads
To: Dang Huynh <dang.huynh@mainlining.org>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260129-rkcif-null-v1-1-90788ec347f5@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_000652_497914_D8EA5905 
X-CRM114-Status: GOOD (  16.95  )
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

Hi Dang,

Thanks for the patch -- and sorry for the late reply.

On 1/29/26 08:24, Dang Huynh wrote:
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

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
> The RKCIF driver missed MEDIA_PAD_FL_MUST_CONNECT, which causes a null
> dereference when the stream starts if the links are misconfigured.
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
> 
> Best regards,


