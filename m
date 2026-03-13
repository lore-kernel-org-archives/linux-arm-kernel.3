Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79CE107BCD0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWN7mR8hhlLflSgSx7L+rGxa42YNgcjhiWs/sTnP90E=; b=Z0J2yjro7Zy4UUisKuaoDnamf3
	wOHwkTI3Q7lCKAltm+hvGNrggW3+UnoBaqdc6mWJ+QoIGZ5Q5ViCxAx0HLsoVlr8a6+EJXbZUEh3S
	CCRyfhfjcZtfhZZFZDN7mRsDJs5WhzqYEwqpCBkfrrD3BgYO7+ms18JaYkJXdpLVuR4wySncFsjbB
	EHBzGUv58r0NAJHo3pnBXIW5+mWps95Js/rAVBbKdTZ0U8saR29568WCJIT2gDR+8mFZmrdnNmKYQ
	wNCe1yEpUO3M+WypxuscG+I6iLTjkPVICB1AnkJXPeGI7W819I+68ZYcPRD05PJSHCy5/M6xrJ/0v
	8FRcAC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w162h-00000000jdC-1pJl;
	Fri, 13 Mar 2026 17:11:19 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w162d-00000000jbu-0Fgr;
	Fri, 13 Mar 2026 17:11:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D18C31A2E1B;
	Fri, 13 Mar 2026 17:11:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 950A860027;
	Fri, 13 Mar 2026 17:11:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AD9410369EB3;
	Fri, 13 Mar 2026 18:10:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773421865; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sWN7mR8hhlLflSgSx7L+rGxa42YNgcjhiWs/sTnP90E=;
	b=SE3yhlFsKqX9la54BlcGeTn3MbBSNhgAE46gJLM27etqIvuJoPv9/huZfYVMW9pJmUUM2Q
	FK9x+xCgx11jgA0B8RK5PNYAeKOy4tN4YMJ26mysbNs219sWH8ILr2es0HoYp4AGtPOFIi
	7neL84Yhwo+TROshQ9GT2AiKVhcXsiX3ACnixqrzBvIqlMVggFLBEgI7yLaJh0QcT88wXI
	8AOpDresz7XivMX1Vq3EFLAM12STKTbvq3103ljKKe0iyb4Ekmp0Zhv+IqdsHCAdD9qzPF
	S9/buoMATnkXLmNmm+smfAzx4PLH5AUIGlwlmguOS/TZJj0OUyN8h3Z0ZRfaCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 18:10:54 +0100
Message-Id: <DH1TKWREZMFK.3BY4NY36BXLXG@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v10 11/18] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
X-Mailer: aerc 0.20.1
References: <20260310012458.169272-1-damon.ding@rock-chips.com>
 <20260310012458.169272-12-damon.ding@rock-chips.com>
In-Reply-To: <20260310012458.169272-12-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_101115_229947_80EB45AD 
X-CRM114-Status: GOOD (  13.35  )
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

On Tue Mar 10, 2026 at 2:24 AM CET, Damon Ding wrote:
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
> Tested-by: Heiko Stuebner <heiko@sntech.de> (on rk3588)

...

> @@ -73,15 +72,12 @@ static int exynos_dp_bridge_attach(struct analogix_dp=
_plat_data *plat_data,
>  				   struct drm_bridge *bridge)
>  {
>  	struct exynos_dp_device *dp =3D to_dp(plat_data);
> -	enum drm_bridge_attach_flags flags =3D 0;
>  	int ret;
>
>  	/* Pre-empt DP connector creation if there's a bridge */
>  	if (plat_data->next_bridge) {
> -		if (dp->has_of_bridge)
> -			flags =3D DRM_BRIDGE_ATTACH_NO_CONNECTOR;
> -
> -		ret =3D drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge=
, flags);
> +		ret =3D drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge=
,
> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);

Should this be 'flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR' to be future-proof?

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

