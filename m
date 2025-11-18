Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3552DCEE350
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 20:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7q0ag6kYHF6BHfpC4MCu0sY2lIhn69EeEx2rI6T7Tg=; b=dyaHmLgnLu/nnW+hDEf4r9FkGC
	F0zP/SarUXfQl462Z7At0vtgHjj86MHMeEN/BGtmJ54KVj1n4fnxMajuQ1S7MJCvci87oOCpGKqEr
	kef+b1Fgpvy9YatwF5IfcnyWlVUzo0lSWTBpOD7Jn7LbuDf3brdspcmcr+sVPFK9/sWDYb3NV+n6Y
	zUDng2DEFSNqEtczKtuBK31yHV1GP1BZJVaM5WTCwTKEIyAPdR+N/dYIobGJ211pjvwmHT3bzy28K
	EPPPF5vgqW1cMb4VXAs3q2teIkZLqkuB0wh0kTjH5Kt2koMgdsHmWyU8x7hNhWId/y7ishBGtL8Hm
	iUld+hNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLS62-000000013uS-0Oqo;
	Tue, 18 Nov 2025 20:14:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLS5z-000000013ts-3C1s;
	Tue, 18 Nov 2025 20:14:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763496872;
	bh=ntdaEV4NiE2bT4pn3tO90tYaLAWeTGwiO9iMvGVDXFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MGt3VCE35VgnXxKwFcVu+oj8XsA3gr1L1/1gC2LzuZ0trDFz0okJfjfVx9Qob+QLy
	 a+bOU/4DiNWztKlIMnbyx+E/G8lpDMrzmAiGWPaw+6AFK0cklkbq5ocmkvzWVM3mUu
	 SOcOt+su5NVsfXehJIi6QLbyEO8WrtauGkMho30RXajZodHKZFeJU+AiNMpcUvimbR
	 LUtf5g20byvWgfeJ4XhEGOpaLToS9qrY6o2+PKJuIQBtPWInz85xhDKLadmfqhSsrY
	 pBqiBB+hKG/1wOmsYGvmjytI3sxEAqUWAI/vlFoO51HZyP1DKCgAf5qHkVjGcybudO
	 +Rp4qz8/QWhZA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D94A317E0342;
	Tue, 18 Nov 2025 21:14:31 +0100 (CET)
Message-ID: <edc12051-6e50-4ef6-98cf-713abb49dd90@collabora.com>
Date: Tue, 18 Nov 2025 22:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/10] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
 <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251117-color-format-v4-6-0ded72bd1b00@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_121436_010949_5E821243 
X-CRM114-Status: GOOD (  23.08  )
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

On 11/17/25 9:11 PM, Nicolas Frattaroli wrote:
> With the introduction of the supported_formats member in the
> dw-hdmi-qp platform data struct, drivers that have access to this
> information should now set it.
> 
> Set it in the rockchip dw_hdmi_qp glue driver, where such a bitmask of
> supported color formats already exists. It just needs to be converted to
> the appropriate HDMI_COLORSPACE_ mask.
> 
> This allows this information to be passed down to the dw-hdmi-qp core,
> which sets it in the bridge it creates, and consequently will allow the
> common HDMI bridge code to act on it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index c9fe6aa3e3e3..7c294751de19 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -468,6 +468,28 @@ static const struct of_device_id dw_hdmi_qp_rockchip_dt_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(of, dw_hdmi_qp_rockchip_dt_ids);
>  
> +static const u32 supported_colorformats = DRM_COLOR_FORMAT_AUTO |
> +					  DRM_COLOR_FORMAT_RGB444 |
> +					  DRM_COLOR_FORMAT_YCBCR444;
> +
> +static unsigned int __pure drm_to_hdmi_fmts(const u32 fmt)
> +{
> +	unsigned int res = 0;
> +
> +	if (fmt & DRM_COLOR_FORMAT_AUTO)
> +		res |= BIT(HDMI_COLORSPACE_RGB);
> +	if (fmt & DRM_COLOR_FORMAT_RGB444)
> +		res |= BIT(HDMI_COLORSPACE_RGB);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR444)
> +		res |= BIT(HDMI_COLORSPACE_YUV444);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR422)
> +		res |= BIT(HDMI_COLORSPACE_YUV422);
> +	if (fmt & DRM_COLOR_FORMAT_YCBCR420)
> +		res |= BIT(HDMI_COLORSPACE_YUV420);
> +
> +	return res;
> +}
> +
>  static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  				    void *data)
>  {
> @@ -521,6 +543,8 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  	plat_data.phy_data = hdmi;
>  	plat_data.max_bpc = 10;
>  
> +	plat_data.supported_formats = drm_to_hdmi_fmts(supported_colorformats);

Any reason why this cannot be simply set as

  BIT(HDMI_COLORSPACE_RGB) | BIT(HDMI_COLORSPACE_YUV444) | BIT(HDMI_COLORSPACE_YUV422)

and get rid of the unnecessary conversion?

> +
>  	encoder = &hdmi->encoder.encoder;
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
>  
> 


