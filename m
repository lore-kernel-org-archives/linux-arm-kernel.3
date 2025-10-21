Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39057CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 10:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuVVLdxM0un/2EVnLCzvPprS2wmsm9jt4ri10VpX44E=; b=bepX9kpcHFuPtpF+h78kyLhO/O
	DfvN/iVX0v1Ihh9OVdUH4JqzFJl/PiJiwViXbNzKUGX+DSK1NAVulg3d1QfPoOZQNd9QtthP8xkoG
	lhHZnFLYawakgFIdxWD6vx4cqbjoqUbtcCQBxwaab5TTbiUbSC3W6lKT6EyErvuhaQ1KnIKsuWaDD
	6Y9570wSi9kVQMjresvz0C0etwNXQUn8+DOwNSk7qnL4IRY9ps4M/XfXo3yCAryZT/4lFcYyloWsD
	kqFZ+SuWNwkjPNndlqfe9mef1v8+y06lePZcL/klZ/QkNseRRQWaJHDRUfgGo7tgZ4cUyZRDB4+DF
	dbm45G5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9et-0000000GdOh-2LOr;
	Tue, 21 Oct 2025 10:32:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB9eq-0000000GdMV-3EGl;
	Tue, 21 Oct 2025 10:32:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DBB56C0B88C;
	Tue, 21 Oct 2025 10:31:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FBD860680;
	Tue, 21 Oct 2025 10:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 050A6102F238A;
	Tue, 21 Oct 2025 12:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761042712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YuVVLdxM0un/2EVnLCzvPprS2wmsm9jt4ri10VpX44E=;
	b=UAKVwMh67iPoBl4NTClw0ksLV00XODy/DIHEJ+Abr2eO5IqpQcehz/93nuSEIk1KNn1Bmg
	alRZgs0hHh6R//b9Djv11rXnVg0M3E+zSIsxC47sYWAJyGtBqcFsIVJo+s20tNSMGbhOor
	eyrx4hjsFi7ZY638H2w5XkfJ2MlT/Z227QFyUd5rEkIdAeesvlToC3vmxcoH4ehhF9PII8
	zbM6HzvGFQmw1YC877GgY3McN5LwDhQmATKGTMlq8UENwmFokLOU0KtyQWXnW3mlO7fJAu
	j9PCgp7hTfzSMz4K/v7Wh0IGkXn6qFI19aHgSoubt+UeSXbN8tO7oymiMdGsUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 12:31:11 +0200
Message-Id: <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
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
Subject: Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
X-Mailer: aerc 0.20.1
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021023130.1523707-2-damon.ding@rock-chips.com>
In-Reply-To: <20251021023130.1523707-2-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_033200_985928_91A88F13 
X-CRM114-Status: GOOD (  22.46  )
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

On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:
> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
>
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
>
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
>
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> ---
>
> Changes in v7:
> - As Luca suggested, simplify the code and related comment.
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index baacd21e7341..7c2936d59517 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -673,14 +673,22 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
>  		if (!bridge->ycbcr_420_allowed)
>  			connector->ycbcr_420_allowed =3D false;
>
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			bridge_connector->bridge_edid =3D bridge;
> +		/*
> +		 * Ensure the last bridge declares OP_EDID or OP_MODES or both.
> +		 */
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MO=
DES) {
> +			bridge_connector->bridge_edid =3D NULL;
> +			bridge_connector->bridge_modes =3D NULL;
> +			if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +				bridge_connector->bridge_edid =3D bridge;
> +			if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +				bridge_connector->bridge_modes =3D bridge;
> +		}
>  		if (bridge->ops & DRM_BRIDGE_OP_HPD)
>  			bridge_connector->bridge_hpd =3D bridge;
>  		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>  			bridge_connector->bridge_detect =3D bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			bridge_connector->bridge_modes =3D bridge;
> +

This does not apply on current drm-misc-next, due to the patch I mentioned
in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/display:
bridge_connector: get/put the stored bridges").

However I'm sorry I have to mention that patch turned out being buggy, so
I've sent a series to apply a corrected version [0]. I suggest watching the
disucssion about the fix series, and if that gets approved rebase on top of
that and adapt your changes.

Sorry about the mess. :(

[0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-conne=
ctor-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

