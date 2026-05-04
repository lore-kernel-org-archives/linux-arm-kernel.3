Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191C2CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UmPOT5KJqOC8YmuvJo/yPAOOR/jmZTXRcBb0ww8ROU=; b=uBYbrpQth70lCPRE21o1pmeMkG
	VUYH0Pc+xMvJstAtj7YqmDiQGrqV5MeSHayv7L+P2b6ZEo5KMZxzdYBfbhX8JDOyE8lFSVRSIOiWj
	iZ4OK5yzOBt8As9kLCEgRPT6DJ7Ieszd5pSDKMqC7fLsX8tXmCb3GILTKXzX2VRoNi9Xz5rjGQ294
	+/zzJnqjnWU0lQO3dCcfhd+fi60fs0xCeT43WHEezjDqX/dde8UW/ypNDyI2bYmPEFwEYTGAXNcPp
	D8sxW+ZZySsdHmzss1MiOJbSmwlNxzbi0UM02j3LDINVTxsrD6YOPkh/BnYH9hyeCEWqYNzsWAaWn
	VvtOADpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwHX-0000000DjVG-14Zn;
	Mon, 04 May 2026 16:36:31 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJwHU-0000000DjU0-2Epa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 16:36:29 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAC319C;
	Mon,  4 May 2026 18:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777912584;
	bh=1EJqZzRZKr0O2+ZK+UwE6c4ahhtTRCZZ2gf3ylP/+Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t5xVo43WK/DZuGnNw5dwo2Lb5Ceoc2zGDTrfDDiBBbAntPEsGW1ttAXPCZHUUJmW8
	 8D44iUJbBQQvexGBda7xP7p80qwhLjJG8zNYyZknz2g0VlltE3y41+HDutUtNu6Z+A
	 tZHRnbLPfIAmXBPDZiDWQt444WwCofNaunY7oFv8=
Date: Mon, 4 May 2026 19:36:25 +0300
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
Subject: Re: [PATCH v3 06/20] drm/colorop: Rename __drm_colorop_state_reset()
Message-ID: <20260504163625.GJ1344263@killaraus.ideasonboard.com>
References: <20260424-drm-mode-config-init-v3-0-8b68d9db0d8b@kernel.org>
 <20260424-drm-mode-config-init-v3-6-8b68d9db0d8b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424-drm-mode-config-init-v3-6-8b68d9db0d8b@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_093628_717549_95409836 
X-CRM114-Status: GOOD (  21.77  )
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

On Fri, Apr 24, 2026 at 12:18:46PM +0200, Maxime Ripard wrote:
> __drm_colorop_state_reset() is used to initialize a newly allocated
> drm_colorop_state, and is being typically called by drm_colorop_reset().
> 
> Since we want to consolidate DRM objects state allocation around the
> atomic_create_state callback that will only allocate and initialize a
> new drm_colorop_state instance, we will need to call
> __drm_colorop_state_reset() from both the reset and atomic_create paths.
> 
> To avoid any confusion, we can thus rename __drm_colorop_state_reset()
> to __drm_colorop_state_init().
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_colorop.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 48d0b7ae3fc9..4c4d0a953e35 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -498,19 +498,19 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>  	__drm_atomic_helper_colorop_destroy_state(state);
>  	kfree(state);
>  }
>  
>  /**
> - * __drm_colorop_state_reset - resets colorop state to default values
> + * __drm_colorop_state_init - Initializes colorop state to default values
>   * @colorop_state: atomic colorop state, must not be NULL
>   * @colorop: colorop object, must not be NULL
>   *
>   * Initializes the newly allocated @colorop_state with default
>   * values. This is useful for drivers that subclass the colorop state.
>   */
> -static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
> -				      struct drm_colorop *colorop)
> +static void __drm_colorop_state_init(struct drm_colorop_state *colorop_state,
> +				     struct drm_colorop *colorop)
>  {
>  	u64 val;
>  
>  	colorop_state->colorop = colorop;
>  	colorop_state->bypass = true;
> @@ -537,11 +537,11 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
>   */
>  static void __drm_colorop_reset(struct drm_colorop *colorop,
>  				struct drm_colorop_state *colorop_state)
>  {
>  	if (colorop_state)
> -		__drm_colorop_state_reset(colorop_state, colorop);
> +		__drm_colorop_state_init(colorop_state, colorop);
>  
>  	colorop->state = colorop_state;
>  }
>  
>  void drm_colorop_reset(struct drm_colorop *colorop)

-- 
Regards,

Laurent Pinchart

