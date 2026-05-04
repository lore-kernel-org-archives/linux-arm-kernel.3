Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1671CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QMOnHOLGq0IryBomdyFNXjTuTKmNVukknLD0F258UY=; b=aCOaK7sIdT7Gnwdk2A8JY1uB21
	ICCZzIs8rGQsEJ0r1fJiQSERvqeEWVf2Vgh1r8G/sHKa2PYlHuHNZar1an3E2Zrk6E3mnexWzMQQu
	icX+7/SRdwTMJZfQCXxdnlW66vMw80Rbt/AtLlEyZ0IGTkmGbiBikC5j7i1dWSsthpwk8ZKJEz/Ye
	1Jj/bSLpDZG0gHwoKPePHmSt8Slr726PnUj4nvgYceuEM34d9ziXn58+0ldpeMxuCAzorngW5slT/
	xhnT1SuRtTTI/0AR5M9ES04mDelxtcKZao6gLBi9rVLDVaIe4ucYS3eb2sG6V9TYfkhTtP7GdA7BU
	bxOWahxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJw8m-0000000DiKu-2K9X;
	Mon, 04 May 2026 16:27:28 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJw8j-0000000DiJR-3DA9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:27:27 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3605B82A;
	Mon,  4 May 2026 18:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912042;
	bh=pb/tc+qet8z57KNYIbl6SB0j1yoUbSKvqYUNc/vuBQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCAf1RYTKs7xAHfxC0MRhizC0ArrveHSDdfoVakroTl6JZ5B+7FW0w1LBbEhyc4aI
	 CBWrbU/JfNPJsl//uhwdiNCNsAdRseXr60dxZpffaOkeF9oJqEmppzgIfmIaUuf37I
	 4sQIAaqoS+tGGO5Hw9Bl1jtP85PZqfBNW70G0HWM=
Date: Mon, 4 May 2026 19:27:22 +0300
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
Subject: Re: [PATCH v3 02/20] drm/colorop: Fix typos in the doc
Message-ID: <20260504162722.GG1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-2-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-2-8b68d9db0d8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_092725_961845_E62643A1 
X-CRM114-Status: GOOD (  21.89  )
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

On Fri, Apr 24, 2026 at 12:18:42PM +0200, Maxime Ripard wrote:
> In the documentation of drm_colorop introduced by commit cfc27680ee20
> ("drm/colorop: Introduce new drm_colorop mode object"), the
> documentation of __drm_colorop_state_reset() and __drm_colorop_reset()
> were mentioning CRTC when they really meant colorop, probably due to
> copy and paste.
> 
> Fixes: cfc27680ee20 ("drm/colorop: Introduce new drm_colorop mode object")
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_colorop.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 764d12060666..48d0b7ae3fc9 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -503,11 +503,11 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>   * __drm_colorop_state_reset - resets colorop state to default values
>   * @colorop_state: atomic colorop state, must not be NULL
>   * @colorop: colorop object, must not be NULL
>   *
>   * Initializes the newly allocated @colorop_state with default
> - * values. This is useful for drivers that subclass the CRTC state.
> + * values. This is useful for drivers that subclass the colorop state.
>   */
>  static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
>  				      struct drm_colorop *colorop)
>  {
>  	u64 val;
> @@ -526,14 +526,14 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
>  /**
>   * __drm_colorop_reset - reset state on colorop
>   * @colorop: drm colorop
>   * @colorop_state: colorop state to assign
>   *
> - * Initializes the newly allocated @colorop_state and assigns it to
> - * the &drm_crtc->state pointer of @colorop, usually required when
> - * initializing the drivers or when called from the &drm_colorop_funcs.reset
> - * hook.
> + * Initializes the newly allocated @colorop_state and assigns it to the
> + * &drm_colorop->state pointer of @colorop, usually required when
> + * initializing the drivers or when called from the
> + * &drm_colorop_funcs.reset hook.
>   *
>   * This is useful for drivers that subclass the colorop state.
>   */
>  static void __drm_colorop_reset(struct drm_colorop *colorop,
>  				struct drm_colorop_state *colorop_state)
> 

-- 
Regards,

Laurent Pinchart

