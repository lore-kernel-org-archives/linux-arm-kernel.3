Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4669DC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw/IfC3wobFt9qX3FBVU86+0qiNNf0+31qnnu+9pyMc=; b=glVQKbf2feLekgx5RKAUcaF6GG
	ROgbQholhfutIiQWVHDg28xPMWkVT7shbu7hMDLcOH/0y35dxcBoehs7IYh/G7cZe1qzC9Ua5XGsQ
	ySSL/d96YmTy8oEBpLZ/9g+WSrvjKntNihqh9Xjw3UpjCOw9ts8VaaaQ0tNOjRPWSbDEcMw3NKGmX
	xjCo3rxYDJ4m9cgAEcHc12i+5qOGhOOGo2ezIW8PnRxaCcYb13W3M5qFhhMx0oeLkQWVr2XAsHU2t
	eF1wp/RfkpCRc1YStLFDc2n/tvDviODZsgZaNVAIur+5zWsXdXaDr79/1vGqV5FhUCpXtTj9GSdN9
	qWSe7c6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEfu-0000000Fcj4-3FUI;
	Fri, 27 Jun 2025 19:23:50 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDfp-0000000FUa0-2bvL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 18:19:42 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C5B137E1;
	Fri, 27 Jun 2025 20:19:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751048355;
	bh=L/+t4B4UqPiFs6T06MKpbhooF8vPcuC8n5LJInGuFco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJbrk4P66V18UpgBMooaWv0cZM4+Zdhe7sgeSwp88RQwWuNBkJ5xgn4X7P9MfZcKi
	 5n20lyYZCTqd2I3sLszoEl5mv8MLCusU2QsRdbokim1Gal6xtSrzdvrIZk93KmptB/
	 aHX62hVwhA97ZmoPRiXhfBzpKa8vzFTxwOwD1Vmg=
Date: Fri, 27 Jun 2025 21:19:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
Message-ID: <20250627181911.GF24912@pendragon.ideasonboard.com>
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627145058.6880-1-mike.looijmans@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_111941_791828_CB3DEB4A 
X-CRM114-Status: GOOD (  18.36  )
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

Hi Mike,

Thank you for the patch.

On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
> XRGB8888 is the default mode that Xorg will want to use. Add support
> for this to the Zynqmp DisplayPort driver, so that applications can use
> 32-bit framebuffers. This solves that the X server would fail to start
> unless one provided an xorg.conf that sets DefaultDepth to 16.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> 
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 80d1e499a18d..501428437000 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>  		.swap		= true,
>  		.sf		= scaling_factors_888,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_XRGB8888,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
> +		.swap		= true,
> +		.sf		= scaling_factors_888,

I'm afraid that's not enough. There's a crucial difference between
DRM_FORMAT_ARGB8888 (already supported by this driver) and
DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignored.
The graphics layer is blended on top of the video layer, and the blender
uses both a global alpha parameter and the alpha channel of the graphics
layer for 32-bit RGB formats. This will lead to incorrect operation when
the 'X' component is not set to full opacity.

>  	}, {
>  		.drm_fmt	= DRM_FORMAT_RGBA8888,
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,

-- 
Regards,

Laurent Pinchart

