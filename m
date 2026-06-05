Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6E6CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 14:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z5wlGlbLMs2uzuD7sOTN2a9w+e+hOQmGkAI8f7il6pI=; b=iQIbu409rKdd3VolgbjFUOlgqE
	eUvikm7bgVdMeE4fzc/u3oAGwJkTlgC1JhvowndhAvtbtIpXacA1azD2SZXPYi/cbzA53i0ucZVKK
	STP8BVdTdDTTpY4qvwIkK7fJTWZc5Z/TO8Ug9/kfjOrw0BkbkKBbH/68Uqa/vXcD8m0SzuYt200+i
	iQuvmiiU3qbk6+go9HttDRdmOIoIZz54W1xx6WKoMoYgk3PgcB7ioR1Jg895B2rWYoBAZ3mupttU8
	YuyU9r+7AeBg4vVbu40xpCySGzngHfyE+HjFWAjQ+XxT6BKe0O2cBA9Y1RH9rq+lGuBpQy3UECjgp
	s1faav+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVViQ-00000000ji8-0A5A;
	Fri, 05 Jun 2026 14:40:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVViM-00000000jgc-1ouL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 14:40:04 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46D0B1B9A;
	Fri,  5 Jun 2026 16:39:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780670371;
	bh=tDZ3hiX/oKDZ+nndl+HlZnWJH6Q3BfBWFOloRazSSKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgVLdvz1nt4G1JdL67df42iBR3RRkfnCW148FwWk+sSfSPfn6FcCtgX7hPuVuyGFO
	 +6Zj2MwmsNVxVsMxIBnrUVPFLMk9kMfbN4gcZbAaejLyXHeB/4XldnIc4Si+9YsGhU
	 8R+Ppu5KIc4PH6/YhNxY7N4coCLz6pKORgjV2AUw=
Date: Fri, 5 Jun 2026 17:39:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 71/76] drm/xlnx: zynqmp_dp: Switch to atomic_create_state
Message-ID: <20260605143955.GN84912@killaraus.ideasonboard.com>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-71-875d828d31bc@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-71-875d828d31bc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_074002_633922_602B0B9D 
X-CRM114-Status: GOOD (  15.45  )
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

On Sat, May 30, 2026 at 04:00:16PM +0200, Maxime Ripard wrote:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
> 
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Michal Simek <michal.simek@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> index 7fb11b0a44f0..b209582bc130 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> @@ -2278,11 +2278,11 @@ static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
>  	.mode_valid = zynqmp_dp_bridge_mode_valid,
>  	.atomic_enable = zynqmp_dp_bridge_atomic_enable,
>  	.atomic_disable = zynqmp_dp_bridge_atomic_disable,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.atomic_create_state = drm_atomic_helper_bridge_create_state,
>  	.atomic_check = zynqmp_dp_bridge_atomic_check,
>  	.detect = zynqmp_dp_bridge_detect,
>  	.edid_read = zynqmp_dp_bridge_edid_read,
>  	.atomic_get_input_bus_fmts = zynqmp_dp_bridge_get_input_bus_fmts,
>  	.debugfs_init = zynqmp_dp_bridge_debugfs_init,

-- 
Regards,

Laurent Pinchart

