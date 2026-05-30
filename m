Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC30CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 13:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGPssiD9Uz1z4ogF/jCPCY7so0jWtc9luglv8cyEFOk=; b=QDWaMcOJ6BxsFsQZZdVTDCIyVO
	uRH5wA8N0nSv31HC+jnqdE8pg5gstKSj9vs9Aa1ADD3XzAc39IVxgDPM3ZA3eSTpbPpkr/a2ncYn5
	5DH32tmhJjiiYf8WWWeA2Q8qaM8LbcmENK7YZWV+ntrEVvaUawtED/+BSF3keWS32qTiQKbKjtJlF
	+SBBiTO+dQPbyx1vT2jzXapx4ChGKLwPN5J5mMVYijHTtSSRVnGv/hVHYgGThFGb+dJvlorS4Mw+H
	WoBxrcnoFAv1m04heUBnesCq/W1+BuIo3JbLWuN3R0AFL3zSn9j7A9SE5zYeGPsGMWbkCw5gS0y+d
	7ty/eAcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJpb-00000008lXu-1ciZ;
	Sat, 30 May 2026 13:34:27 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTJpX-00000008lXB-3IjY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 May 2026 13:34:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4705AC6246B;
	Sat, 30 May 2026 13:34:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 04BFE6073B;
	Sat, 30 May 2026 13:34:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99C0F10888650;
	Sat, 30 May 2026 15:34:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780148057; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zGPssiD9Uz1z4ogF/jCPCY7so0jWtc9luglv8cyEFOk=;
	b=V1l1MpzxL3wkM+JGU2t+7/iNfCNyf6efAs/VsnRvqkSHXwwNu9pToPUjZKbglaFr0uxsBB
	nJhKG8wEy+TNiFJ0GIoK4VSTH4khTAh8OyfFnqp24XzRfsaJxcQHt0q7JAQOgr6szezlwG
	NzZ9O/f8rS/UVWUfMZKXQNCU3smwKKCkgaODg93HWCGdVT0S3BsRfMt12c1O5LSd8YAwC/
	YZ3KigOzbS/+pqROsWK4lEc/2TwA3KH4G8DwYWM4nLaE5SpWoZKenmaIC5OAkU4IX1NBzw
	nurq2UEGVQuvivgZ8Uoxn7A8ioUtGa5N1ww+5U2qNAahJ+SPjkeEaki74cYpig==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/3] drm/bridge: analogix_dp: Add validation for
 samsung,lane-count property
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com, 
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com, 
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com, 
 dianders@chromium.org, m.szyprowski@samsung.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260529040530.741336-3-damon.ding@rock-chips.com>
References: <20260529040530.741336-1-damon.ding@rock-chips.com>
 <20260529040530.741336-3-damon.ding@rock-chips.com>
Date: Sat, 30 May 2026 15:33:59 +0200
Message-Id: <178014803941.21632.16225608049285101452.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_063423_976842_AE19AE0D 
X-CRM114-Status: GOOD (  15.12  )
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

On Fri, 29 May 2026 12:05:29 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:

Hello Damon,

>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8cf6b73bceac..699a7f380c56 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1260,8 +1261,16 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
>  		 */
>  		of_property_read_u32(dp_node, "samsung,link-rate",
>  				     &video_info->max_link_rate);
> -		of_property_read_u32(dp_node, "samsung,lane-count",
> -				     &video_info->max_lane_count);
> +		ret = of_property_read_u32(dp_node, "samsung,lane-count",
> +					   &video_info->max_lane_count);
> +		if (!ret) {
> +			if (video_info->max_lane_count == 0 ||
> +			    video_info->max_lane_count > LANE_COUNT4) {

This sashiko report seems to me valid.

But I'n no DP expert, I have no idea whether this ther one is valid.

> +				dev_err(dp->dev, "samsung,lane-count = %d is out of range\n",
> +					video_info->max_lane_count);
> +				return -EINVAL;
> +			}
> +		}

As reported by sashiko, 'count == 0' should be 'count <= 0', being an enum.

Additionally I'd avoid the nested if, and I think using dev_err_probe() is
correct here (we are only called by probe functions), so it all could
become:

   if (ret || count <= 0 || count > LANE_COUNT0)
        return dev_err_probe(...);

There are other sashiko reports to patch 3, and at least one seems valid to
me. Can you either fix them in the next iteration or elaborate on why the
code is correct there?

Thanks!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


