Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261F5CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DK8eA9/GN7NzLuxBx/GTovhK/apGoGFfUGeCC5d5iyI=; b=d8obQYudvx+//ObK56sXlr2Dnf
	aTKmdWx3R3kDBIcF7IsAC/h2nMB1xzqOOMdn7c0Wgxcj8gkl4TCvamYJSk2AjE3F5fERTKsuXlGhe
	UMHe0TS2rE3buwT9jS89moYTdGkonumK8ghXpmtTJhySaR9fAChXlF1bF7mdh0WaXhAJKzBJ5M1sN
	Kx6wdJHa0qZjSyrlkKSObjq8WAV58aibM9IgG1P+tNpvosHdy7a6sw5EOFj9ODEBuDPt2+aZOkMgI
	gwyC1MVGy0zbPkWTbnsFLsODSr/jW5CmeDAcr9bUcSV5mleBF56/vndTkwOEfBcfyzhnISfyP9emo
	1JXan0sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqa5-00000001sie-2z0y;
	Tue, 26 May 2026 12:08:21 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqa2-00000001shD-2xdg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:08:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC4A54E42D59;
	Tue, 26 May 2026 12:08:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 866A56011D;
	Tue, 26 May 2026 12:08:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7181C10888356;
	Tue, 26 May 2026 14:07:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779797292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DK8eA9/GN7NzLuxBx/GTovhK/apGoGFfUGeCC5d5iyI=;
	b=RNU5++s0L9bfnoxU24iB+xsMHm5P0Ae9cOJvZKPHxeM97AF368q8RuNWiwcQLO12P9CZ6o
	moU9/AUpCKd8iyFRV54iR+l+nhFxSXVFwjQn4i9RbIvM26ms7QueBOCrGZ0MMKChE14P7P
	HZ4an8aN8PC+KrEOHJu3tLBY7Zi/DIs7l3U2GzxAYnRfA3DEp2mUT0jZPfnbEJn4DAORa7
	xVj58D97QdBzzHxdheW2w2kq4sIQtzS+j2fdh6rSwYZIdd5EZ0oVBR7inInOpoANc0OCpg
	LhcQsFUfMpAh+toIhmX2aljXCS2HNweQL5NuMs0i3q0TuPvtlh6+YQ76VYqetA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/2] drm/bridge: analogix_dp: Add support for
 optional data-lanes mapping
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
In-Reply-To: <20260525094731.121380-3-damon.ding@rock-chips.com>
References: <20260525094731.121380-1-damon.ding@rock-chips.com>
 <20260525094731.121380-3-damon.ding@rock-chips.com>
Date: Tue, 26 May 2026 14:07:50 +0200
Message-Id: <177979727057.297330.10691183273720133245.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_050818_886377_EA3E8E35 
X-CRM114-Status: GOOD (  11.25  )
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

On Mon, 25 May 2026 17:47:31 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:

Hello Damon,

>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index 8cf6b73bceac..d53ab25bc57b 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1234,6 +1234,59 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
> [ ... skip 11 lines ... ]
> +	int ret, i;
> +
> +	memcpy(video_info->lane_map, map, sizeof(map));
> +
> +	num_lanes = drm_of_get_data_lanes_count_ep(dp->dev->of_node, 1, 0, 1,
> +						   video_info->max_lane_count);

Should num_lanes be > 4, the buffers could overflow. I realize it should
not happen, but analogix_dp_dt_parse_pdata() can set max_lane_count from
the device tree, so a bogus dtb could cause such overflow.

Perhaps you should just (in a separate patch) error out in
analogix_dp_dt_parse_pdata() to prevent this. And maybe even adding an
BUG_ON(lane_count > 4) here.

Otherwise LGTM.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


