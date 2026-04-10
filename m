Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D36EE99050
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHNH9UXB0cyYa0OWDg7so8oezJOoutLQTfep4KfFZOA=; b=W/A1UU8B1K+zv0gbaiBbHOaMOe
	fFixa7XMhnEK3N5Bd/072Fl3qeamxbTSHHFttobs1etVbhRpgHyI/YdT7U26g+vsOSZG2w1PvKSXW
	As9DuucQmXJl4p7pK+nRF9uVMZ7xdOyDK1xbXQIjGZXvaX5lMaTYn/OoOeqBz53qe1s6mFKjtiD/B
	2ijLeOKVpi2UFVgWM0u5PSxWpEKw7E8IREISmVfy70h8kmpEXWmImUd/REOWQMFlyFS6nCSrrvUVp
	1sIvK6B4S8d0oWEc49xrwOxh99jwjpOB3/RYVVshzd8LD9Dimptz0rtrC4xr1tFh6En3hcP30q9tT
	qzHQJbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6VR-0000000Bm5q-1pR2;
	Fri, 10 Apr 2026 07:42:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6VN-0000000Bm4x-2KoY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:42:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 525981A325A;
	Fri, 10 Apr 2026 07:42:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 165CE603F0;
	Fri, 10 Apr 2026 07:42:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D03FF1045001D;
	Fri, 10 Apr 2026 09:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775806932; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MHNH9UXB0cyYa0OWDg7so8oezJOoutLQTfep4KfFZOA=;
	b=fb6SynIsvC1cwH9UKMqmu4ZqdazkS5hj4bRDu9pSaGAYro1/prY1xJlayMW0oVjkSSaa8u
	X2jxQ54EkZg+y6nChj6kz3mRVp7dNOtBI28A4cBrBEtqEN66r3BmY9QrxKOkp0HxY4tu2C
	uwVKIKo6SUQzn0KW5PgsgF6hoSux+egTxZbMMxHUHhai10afej68DxjClWB2HDRxFaz3yJ
	WlpUgceB2XIpYBiD3OIddnvBOoBsQJ7GRfS2x0EE84QrzerRTDZJwP+0vyblHujmoMcsKt
	8LphUmAUnRscmt/LZ4XLaCBeKy45DwJF+Zm9WA3ObZBdXzaPWXpynlPIi53/wg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 09:41:58 +0200
Message-Id: <DHPB0K9AHVR3.33XQ35I1GV96N@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <victor.liu@nxp.com>, <Frank.Li@nxp.com>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <inki.dae@samsung.com>, <sw0312.kim@samsung.com>,
 <kyungmin.park@samsung.com>, <krzk@kernel.org>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v13 11/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <alim.akhtar@samsung.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <nicolas.frattaroli@collabora.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-12-damon.ding@rock-chips.com>
In-Reply-To: <20260409065301.446670-12-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_004217_764478_2BED6CFA 
X-CRM114-Status: GOOD (  15.14  )
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

Hello Damon,

On Thu Apr 9, 2026 at 8:52 AM CEST, Damon Ding wrote:
> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
> side, as the private &drm_connector is no longer created.
>
> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
> are replaced by the corresponding &drm_bridge_funcs APIs:
>
> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
> analogix_dp_detect()       -> analogix_dp_bridge_detect()
> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>                               analogix_dp_bridge_edid_read()
>
> Additionally, the compatibilities of Analogix DP bridge based on whether
> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
> supported; If not (the next bridge is a 'monitor' or a bridge chip),
> OP_EDID and OP_DETECT are supported.
>
> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
> analogix_dp_probe(), because the type of next bridge (the panel, monitor
> or bridge chip) can only be determined after the probe process has fully
> completed.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588

I noticed two issues, sorry I haven't catched them before...

> @@ -1580,7 +1533,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
>
>  int analogix_dp_start_crc(struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp =3D to_dp(connector);
> +	struct analogix_dp_device *dp;
> +	struct drm_bridge *bridge;
>
>  	if (!connector->state->crtc) {
>  		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
> @@ -1588,13 +1542,26 @@ int analogix_dp_start_crc(struct drm_connector *c=
onnector)
>  		return -EINVAL;
>  	}
>
> +	bridge =3D drm_bridge_chain_get_first_bridge(connector->encoder);
> +	if (bridge->type !=3D DRM_MODE_CONNECTOR_eDP)
> +		return -EINVAL;
> +
> +	dp =3D to_dp(bridge);
> +
>  	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
>  }

drm_bridge_chain_get_first_bridge() takes a reference, you must call
drm_bridge_put(bridge) before returning. Given there are two return paths I
suggest:

-	struct drm_bridge *bridge;

-	bridge =3D drm_bridge_chain_get_first_bridge(connector->encoder);
+	struct drm_bridge *bridge __free(drm_bridge_put) =3D
+		drm_bridge_chain_get_first_bridge(connector->encoder);

>  EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
>
>  int analogix_dp_stop_crc(struct drm_connector *connector)
>  {
> -	struct analogix_dp_device *dp =3D to_dp(connector);
> +	struct analogix_dp_device *dp;
> +	struct drm_bridge *bridge;
> +
> +	bridge =3D drm_bridge_chain_get_first_bridge(connector->encoder);
> +	if (bridge->type !=3D DRM_MODE_CONNECTOR_eDP)
> +		return -EINVAL;
> +
> +	dp =3D to_dp(bridge);
>
>  	return drm_dp_stop_crc(&dp->aux);
>  }

Same here:

-	struct drm_bridge *bridge;

-	bridge =3D drm_bridge_chain_get_first_bridge(connector->encoder);
+	struct drm_bridge *bridge __free(drm-bridge_put) =3D
+		drm_bridge_chain_get_first_bridge(connector->encoder);

With the above two changes you can add to v14:

+Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

