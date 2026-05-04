Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13B7FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 17:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2T2BAbCxfNbOkzmjPGmIYHeM3AqRaqTLVL6HexL7mI=; b=p4C4b0ziHNvr4PxHfyVEuPjsOn
	w3tnWti9IrrQnVfr2h5xO2NuzMUisKtKahHd/yidgFiVW9kRAnpAhzReIcwkklo5u0M4vemcRDGBJ
	1vCT3x2SNTBDp7+jq6Hd3qyO+vV8hajyKEKsU7qGDWogCgBgmlq1RdltvJ0hNeiCTVPTmScYRTzXu
	aATL8JPOoGNpAIQl6KJ4JBSyT8pVxZDNCgI4Fa0L+RIdHEee3bHSNzJtQXZvwRDd2kmfDqt1RjaSR
	CvmQVEUB1lnlWF3YzV8pxqa4lO3TGhBUU0LX0AofPky7oqXXeRJkA10g/X/7aEtb29GwJWEdyVHio
	XaWFPDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxPt-0000000DttR-2pSg;
	Mon, 04 May 2026 17:49:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJxPq-0000000DtrS-3B1T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 17:49:12 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EDF6175;
	Mon,  4 May 2026 19:49:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777916946;
	bh=/MyttNxa7Rdujb9ZVQxRQ3bnYHx9AV0Hr8Kn7vSqiEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SVnDG4tDJpRD1pGi6dpuqWH/nt08r97IRxjdXIKnb2UDvYJy+u9wRxfrWt5nW9RBR
	 dT2wPwppgjkNrffDRzNLCpYVKDMcbO6r7r2VaAhHYvu3yOVcWfgz6f/jbWFacMmDew
	 Uy5IRB4P3h9wUMjXnpSCEVgk3nZzezGh4KMrQal0=
Date: Mon, 4 May 2026 20:49:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Simon Ser <contact@emersion.fr>,
	Harry Wentland <harry.wentland@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Alex Hung <alex.hung@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 18/20] drm/tidss: Switch to
 drm_mode_config_create_initial_state()
Message-ID: <20260504174907.GT1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-18-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-18-8b68d9db0d8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_104910_981910_883A1556 
X-CRM114-Status: GOOD (  19.79  )
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

Hi Maxime,

Thank you for the patch.

On Fri, Apr 24, 2026 at 12:18:58PM +0200, Maxime Ripard wrote:
> Now that drm_mode_config_create_initial_state() exists to create the
> initial state, use it instead of drm_mode_config_reset() during
> driver probe.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 1c8cc18bc53c..f5099d5d6e32 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -169,11 +169,15 @@ static int tidss_probe(struct platform_device *pdev)
>  		goto err_runtime_suspend;
>  	}
>  
>  	drm_kms_helper_poll_init(ddev);
>  
> -	drm_mode_config_reset(ddev);
> +	ret = drm_mode_config_create_initial_state(ddev);
> +	if (ret) {
> +		dev_err(dev, "failed to create initial state: %d\n", ret);
> +		goto err_irq_uninstall;
> +	}

There's also a call to drm_mode_config_reset() in tidss_modeset_init(),
shouldn't it be dropped ?

>  
>  	ret = drm_dev_register(ddev, 0);
>  	if (ret) {
>  		dev_err(dev, "failed to register DRM device\n");
>  		goto err_irq_uninstall;
> 

-- 
Regards,

Laurent Pinchart

