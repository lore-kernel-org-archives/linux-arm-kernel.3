Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F788CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3XUQODgJUlUZGDzuB0yakMqd+cHyjZMO7Z5DyUKCZi8=; b=23C06OoMmZuV14CmGwvyIXqRaS
	dvIe3P7KPoKETZj+5GdHo9NiGcS906Knwnhkr3uoHGWSGpdi9S6klk7ALos1GWvz8Ge7e9CAsHCuN
	jXVTmhUQQzI/5trvx78jhZY6Orn8iKOw0eWR2K2kwcaJHrpT77b8uGjzFzRGg+Op/La3/QEEtAlYi
	kldnzUOyI0a4LY29NQ/HO1AItTGyCpueeshfxdwuj/JrH3q7XFx2YywGdgu7VwCiWogvQ/XeqW7yY
	71NNoDmhP27v+sgpuNfDimI6bT1h9Xa/kenDmXwpnb3wufUV83enUSwT0ynCRdLG9/Q42n5rULwiN
	Mo0FSZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwMY-0000000Dk1d-2wHO;
	Mon, 04 May 2026 16:41:42 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwMV-0000000Dk0f-3hMX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:41:41 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC37D9C;
	Mon,  4 May 2026 18:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912896;
	bh=q1gQlpJfoIxy1ibk2v+LbSUU57lpISXKKiV+29GK8TI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUNDsNG8tJC/KsgdJGoEI6BDHNyr771dyng6PLE0QJK6PtreNut6ApucUb8PaBo72
	 pzi2mQln+olh4fy250zaOr0PJjnqRmtiuw3vPH6lCCYctS7yRQ4YGV0ZWBsn1YKVpO
	 7SR8Ly/gZLzjulftP4R4LxjZfzNjZmkl5mZvuF8A=
Date: Mon, 4 May 2026 19:41:36 +0300
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
Subject: Re: [PATCH v3 07/20] drm/colorop: Create
 drm_atomic_helper_colorop_create_state()
Message-ID: <20260504164136.GK1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-7-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-7-8b68d9db0d8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_094140_111280_F268D8F9 
X-CRM114-Status: GOOD (  27.87  )
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

On Fri, Apr 24, 2026 at 12:18:47PM +0200, Maxime Ripard wrote:
> Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> to drm_private_obj") introduced a new pattern for allocating drm object
> states.
> 
> Instead of relying on the reset() callback, it created a new
> atomic_create_state hook. This is helpful because reset is a bit
> overloaded: it's used to create the initial software state, reset it,
> but also reset the hardware.
> 
> It can also be used either at probe time, to create the initial state
> and possibly reset the hardware to an expected default, but also during
> suspend/resume.
> 
> Both these cases come with different expectations too: during the
> initialization, we want to initialize all states, but during
> suspend/resume, drm_private_states for example are expected to be kept
> around.
> 
> reset() also isn't fallible, which makes it harder to handle
> initialization errors properly. This is only really relevant for some
> drivers though, since all the helpers for reset only create a new
> state, and don't touch the hardware at all.
> 
> It was thus decided to create a new hook that would allocate and
> initialize a pristine state without any side effect:
> atomic_create_state to untangle a bit some of it, and to separate the
> initialization with the actual reset one might need during a
> suspend/resume.
> 
> Continue the transition to the new pattern with drm_colorop.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_colorop.c | 23 +++++++++++++++++++++++
>  include/drm/drm_colorop.h     |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 4c4d0a953e35..c0eecde8c176 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -521,10 +521,33 @@ static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
>  							   &val))
>  			colorop_state->curve_1d_type = val;
>  	}
>  }
>  
> +/**
> + * drm_atomic_helper_colorop_create_state - Allocates and initializes colorop atomic state
> + * @colorop: drm colorop
> + *
> + * Initializes a pristine @drm_colorop_state.
> + *
> + * RETURNS:
> + * Pointer to new colorop state, or ERR_PTR on failure.
> + */
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop)
> +{
> +	struct drm_colorop_state *state;
> +
> +	state = kzalloc_obj(*state);
> +	if (!state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_colorop_state_init(state, colorop);
> +
> +	return state;
> +}
> +
>  /**
>   * __drm_colorop_reset - reset state on colorop
>   * @colorop: drm colorop
>   * @colorop_state: colorop state to assign
>   *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index bd082854ca74..874ed693329c 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -423,10 +423,12 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
>  				 struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
>  				 uint32_t lut_size,
>  				 enum drm_colorop_lut3d_interpolation_type interpolation,
>  				 uint32_t flags);
>  
> +struct drm_colorop_state *
> +drm_atomic_helper_colorop_create_state(struct drm_colorop *colorop);
>  struct drm_colorop_state *
>  drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
>  
>  void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>  				      struct drm_colorop_state *state);
> 

-- 
Regards,

Laurent Pinchart

