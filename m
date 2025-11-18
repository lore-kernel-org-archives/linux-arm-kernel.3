Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4274CEE34D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOpDVZsPstBORCqOcA6DXjM3Vvduq44Az4Hanh10sSQ=; b=hQxjL2NJfs+aCvuu4WXYWkrmT8
	EiXhrUsLPAWkC11h2k4sfWFLughluylwWHCVkZUNPksfqsXEH8EXb83oTBuWWJqjWg+AP5Gh4ZY1Z
	sF8ClEBwHHD/+PmBxJT9Fw6Oug/8HRVcUXpxNSXRII7AjUTSL5TIPePu/BrOwlUesubjx8V3UVN4y
	ER1JMqBWbOBtLuHyCO0o1c7Y7Ba5KAQrWifoZnTl7UfW4VAJggzIAH+dDsJJ0MN2DYxxbgR1NQkDD
	BwlZctDMDhPHml1nRtd9eJ8gqh3urbezTodWhJ2pSNofrM5kS4eu1mBA4wVNknIQ80r5aGF9RnmG2
	qRt/Zq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRs9-00000001371-0DoO;
	Tue, 18 Nov 2025 20:00:17 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRs6-0000000134b-004q;
	Tue, 18 Nov 2025 20:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763496009;
	bh=Ouz3sykA6NZWtw6Ox5elkRDV5HgOt7b0f0GP8Kov1EI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UTV8MhzGZCT6pEbkvadKMx88eRgkHh/BuJwjL7ViFkX8GYKo/Kklgll2xVBXkZlQF
	 ZBDDmOe+RdQMe08+xVVPmYlsa3GF5Lw/PjdGBsKdTsYqoZJV/wQ9Zh0YMyPvEGzo7Y
	 axSvCTEV+OYbBjghz5nybkVV2zcXM6sAxV4Umijn2BdAvXKVbgA3DCf2VDs3YT9YOT
	 LYz8OowQRHgsRHjB2iaR0yuFmK+CgnHMkfF4uwNYt4ueo9cu20LqAY4W3Y9sm4j8EH
	 Rwdm06n+iHYdq08roCIF3rHHZD3K+D9QZinZRYCgC5ADRTB0V3+J9sPvmlujWxP5QR
	 HP+nOID4xnnpQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C39BF17E0610;
	Tue, 18 Nov 2025 21:00:08 +0100 (CET)
Message-ID: <3863e0e5-677b-4225-9854-3ee420828275@collabora.com>
Date: Tue, 18 Nov 2025 22:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] drm/bridge: dw-hdmi-qp: Set bridge
 supported_formats
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
 <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251117-color-format-v4-5-0ded72bd1b00@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_120014_212769_B759913A 
X-CRM114-Status: GOOD (  17.65  )
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

Hi Nicolas,

On 11/17/25 9:11 PM, Nicolas Frattaroli wrote:
> The drm_bridge "supported_formats" member stores a bitmask of supported
> HDMI output formats if the bridge is in fact an HDMI bridge.
> 
> However, until now, the synopsys dw-hdmi-qp driver did not set this
> member in the bridge it creates.
> 
> Set it based on the platform data's supported_formats member, and
> default to BIT(HDMI_COLORSPACE_RGB) if it's absent, which preserves the
> previous behaviour.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> index fe4c026280f0..cf888236bd65 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
> @@ -1269,6 +1269,11 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
>  		dev_warn(dev, "Set ref_clk_rate to vendor default\n");
>  	}
>  
> +	if (plat_data->supported_formats)
> +		hdmi->bridge.supported_formats = plat_data->supported_formats;

This duplicates a change already introduced via commit 1ff27c5929ab
("drm/bridge: dw-hdmi-qp: Handle platform supported formats and color depth").

> +	else
> +		hdmi->bridge.supported_formats = BIT(HDMI_COLORSPACE_RGB);

And this one looks redundant as well, since RGB is supposed to be mandatory:
supported_formats defaults to RGB in drm_bridge_connector_init() if there's no
HDMI bridge in the pipeline overriding it, while drmm_connector_hdmi_init()
errors out if supported_formats is unset or doesn't advertise RGB.

Hence I think this patch can be dropped.

Regards,
Cristian


