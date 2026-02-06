Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E03EE20A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 14:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d70krws98qMbryfn/12Zb3xwhE2iiVZ6JA0PmydolRU=; b=yR1n5M7cdOr3vZ5O+p5FgCjfWD
	PkrK6V52cJcV/12YMyEImHQhjCEKf7B2/pAcZzGG00J6GlX3e42LbD3tNJ7bMNWPwl0XSzLW1VI4P
	6uA+bhHq1KDmf2/jhgMvIFGpJNd6JfJcki43/ZX074w/kTGDRP6b946vW99lTpeIo05QyiYk3USq0
	iKiTQcQDrqTa1Jvjb/5cKYBpmo+dDJHt6Tcl+xwoUXUmmXC9GJ7K/0MFWeofajSMR7ceI5/VMQhze
	EGkh95X3Lmybz0Gz8/fZdIm2bIMeKIDJhxpmmR2tbW4D3HDJpCjNTdWCO907WblneHdH9KHp/x9cq
	yfJGGUzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMRr-0000000BPH7-2s2h;
	Fri, 06 Feb 2026 14:04:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMRn-0000000BPGS-3bx6;
	Fri, 06 Feb 2026 14:04:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BEC9DC243B8;
	Fri,  6 Feb 2026 14:04:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F7B160729;
	Fri,  6 Feb 2026 14:04:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50438119D1929;
	Fri,  6 Feb 2026 15:04:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770386669; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=d70krws98qMbryfn/12Zb3xwhE2iiVZ6JA0PmydolRU=;
	b=qPCZ4GhbgSvh7oc+x3hfb/WxEKcrK6O2VtHn9ZUnKHIWbmuwpDPS+JVzXwRZvJjY52JV/q
	jRFNs9CU0xQoxAmTuVScqUmJr3RhJksmzPmC2iDxOIGOKozVtX3K0+pFhuAw87JTmlzOzO
	Mx7asUoldGGsbCO1CxidWKqAh6wVT4SkqjyaR14D4D/lxH/+TnRz846TduWs57dgblA7K2
	qq8aj5PKT39GkueFiEWEvJOcmHo1rod8gM8pqXd1pJ+UJU/zVu6F/+Oy2EP5MnYL2KIUVh
	AJXEPBPb7T4XHikvoDSeE/Goj7h2+A7djgwt/yvu7WKYngnH526TrWO6uKX5cQ==
Message-ID: <e6dd0f45-1d64-48b8-bc76-43cc29fabec2@bootlin.com>
Date: Fri, 6 Feb 2026 15:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] drm/vkms: Support setting custom background color
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260204-rk3588-bgcolor-v7-0-78d1d01c5ca1@collabora.com>
 <20260204-rk3588-bgcolor-v7-3-78d1d01c5ca1@collabora.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260204-rk3588-bgcolor-v7-3-78d1d01c5ca1@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_060436_043718_83BB57D3 
X-CRM114-Status: GOOD (  17.03  )
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



On 2/4/26 21:02, Cristian Ciocaltea wrote:
> Make use of the BACKGROUND_COLOR CRTC property when filling the
> background during blending.  It already defaults to solid black.
> 
> Since the internal representation of the pixel color in VKMS relies on
> 16 bits of precision, use the newly introduced DRM_ARGB64_GET{R|G|B}()
> helpers to access the individual components of the background color
> property, which is compliant with DRM_FORMAT_ARGB16161616.
> 
> It's worth noting the alpha component is ignored, hence non-opaque
> background colors are not supported.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   drivers/gpu/drm/vkms/vkms_composer.c | 10 ++++++++--
>   drivers/gpu/drm/vkms/vkms_crtc.c     |  3 +++
>   2 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index cd85de4ffd03..83d217085ad0 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -475,8 +475,14 @@ static void blend(struct vkms_writeback_job *wb,
>   {
>   	struct vkms_plane_state **plane = crtc_state->active_planes;
>   	u32 n_active_planes = crtc_state->num_active_planes;
> -
> -	const struct pixel_argb_u16 background_color = { .a = 0xffff };
> +	u64 bgcolor = crtc_state->base.background_color;
> +
> +	const struct pixel_argb_u16 background_color = {
> +		.a = 0xffff,
> +		.r = DRM_ARGB64_GETR(bgcolor),
> +		.g = DRM_ARGB64_GETG(bgcolor),
> +		.b = DRM_ARGB64_GETB(bgcolor),
> +	};
>   
>   	int crtc_y_limit = crtc_state->base.mode.vdisplay;
>   	int crtc_x_limit = crtc_state->base.mode.hdisplay;
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index 9a7db1d51022..2514c367f710 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -4,6 +4,7 @@
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_blend.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_probe_helper.h>
> @@ -228,6 +229,8 @@ struct vkms_output *vkms_crtc_init(struct drm_device *dev, struct drm_plane *pri
>   
>   	drm_crtc_enable_color_mgmt(crtc, 0, false, VKMS_LUT_SIZE);
>   
> +	drm_crtc_attach_background_color_property(crtc);
> +
>   	spin_lock_init(&vkms_out->lock);
>   	spin_lock_init(&vkms_out->composer_lock);
>   
> 


