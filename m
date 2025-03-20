Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A7CC35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQZEMk5uxu2RnQeRtrGHw5qeWTKppv7vX5kitaP2+/A=; b=JiAkNVUn1oFK78w9+dRq2EJc6t
	pcmCklCrq3v6JNTVmTgxau1UWQsdBC0+oq63VD4YRZun27VJ3HSY7Kyn3a2o7ZgyoqrRhojw78vR6
	U22NKW6Rew6wp11krRw80LMzQQnIj8hnR4MS09+h3AHx2Rwnc78ZgT16jWdHctm716CQ+DZKURX6Y
	Gs1ZcgowaaLrzU/RRl1mHo5kmuPX6VAm3/5ufAfezZIVCgHAqvavzGHwCqDWkZB946UEKXBbpetlj
	7Q4B5rtZgNWTVk0uapVVHwkphx8y6FeYCbJOz9y1aTL83Oiu0HT625M6LUe/uEGxiZOjhRhh0qAZj
	2CNZExgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFBS-0000000C8Mc-3R2C;
	Thu, 20 Mar 2025 12:39:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvF9k-0000000C8GH-2kEQ;
	Thu, 20 Mar 2025 12:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742474270;
	bh=2v6ILyqttbXUiv4liYlyocig8g6a+R2OPkWZP9wB3lI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jtWiv98fy9Al8vyV+M3JtrUh8RqEfqnXvhgoQmp8Prasqxqk4yqLbL1+t/HhBCNBT
	 mMuwSiumysP9A9M0EdPDnKyJ4x3/BS++C5CD+35NvDyJc/iCeHg5dvaUuuOvYF2MFu
	 8LLI5LdW6Jp12cSTwjwUmWCIUrIZor0i/KzZRPXtLAzfv2X3O4v2MJXhDMeGuHe47I
	 DjJmyPmSqGRN1FchXbNK/kaQo21EC6EQlYS6U3/p7XAcEpeRN6IswL8Wmb+xItvsi8
	 Wx+IoPNfaF7jNdTUkoegxHKdHO+qQifLIkRfiiC5KnsmHfjFhSfgj6Cm7JU8HXHen8
	 gJ4MNiTOhPkDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E874F17E02AF;
	Thu, 20 Mar 2025 13:37:49 +0100 (CET)
Message-ID: <d70b62f8-e24e-4a10-8c6b-18d2e19f1337@collabora.com>
Date: Thu, 20 Mar 2025 13:37:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init
 step
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_053752_885348_1DE70091 
X-CRM114-Status: GOOD (  21.19  )
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

Il 20/03/25 09:48, Alexandre Mergnat ha scritto:
> Currently, the panel set power, set gpio and enable the display link
> in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
> panel_bridge_atomic_pre_enable, pointed by
> drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
> atomic_pre_enable must not enable the display link
> 
> Since the DSI driver is properly inited by the DRM, the panel try to
> communicate with the panel before DSI is powered on.
> 

The panel driver shall still be able to send commands in the .prepare() callback
and if this is not happening anymore... well, there's a problem!

> To solve that, use stk_panel_enable to enable the display link because
> it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
> on the DSI.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> index c0c95355b7435..bc3c4038bf4f5 100644
> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
> @@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
>   	gpiod_set_value(stk->enable_gpio, 1);
>   	mdelay(20);
>   	gpiod_set_value(stk->reset_gpio, 1);
> -	mdelay(10);
> -	ret = stk_panel_init(stk);
> -	if (ret < 0)
> -		goto poweroff;

Also, you're moving both init and set_display_on to the enable callback...
this is suboptimal.

You should do the DrIC setup in .prepare() (can include SLEEP OUT), and then you
should have a .enable() callback that calls DISP ON, a .disable() callback that
calls DISP OFF, and .unprepare() that turns everything off.

Cheers,
Angelo

> -
> -	ret = stk_panel_on(stk);
> -	if (ret < 0)
> -		goto poweroff;
>   
>   	return 0;
>   
> -poweroff:
> -	regulator_disable(stk->supplies[POWER].consumer);
>   iovccoff:
>   	regulator_disable(stk->supplies[IOVCC].consumer);
>   	gpiod_set_value(stk->reset_gpio, 0);
> @@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
>   	return ret;
>   }
>   
> +static int stk_panel_enable(struct drm_panel *panel)
> +{
> +	struct stk_panel *stk = to_stk_panel(panel);
> +	int ret;
> +
> +	ret = stk_panel_init(stk);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = stk_panel_on(stk);
> +
> +	return ret;
> +}
> +
>   static const struct drm_display_mode default_mode = {
>   		.clock = 163204,
>   		.hdisplay = 1200,
> @@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
>   }
>   
>   static const struct drm_panel_funcs stk_panel_funcs = {
> +	.enable = stk_panel_enable,
>   	.unprepare = stk_panel_unprepare,
>   	.prepare = stk_panel_prepare,
>   	.get_modes = stk_panel_get_modes,
> 




