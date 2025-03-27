Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247D4C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 23:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvQOzFC4J/lZ1ny0eCOc+JKFdGK3+g/grkoYm5vet9Y=; b=ZlW6gcDyTR8xrAp5BGV1DByDrq
	gFSEXLASPZiIK9uakw6ipPrjLOLVSxrYQxvZL1yED4A3xa4JaXTYM0tACVJl/lXaK6aSqq5RIGO3Q
	RLhnmpi01Zi/5S+gos2nmisLl+AIPtj+/l4UC0gWZD3lWl0ymyPm8enx5nhZ/S2xCxR55BltiIUfc
	iEGcUjECwLb8c5zFXQY9nPomxnZCJHumLfpQ1dVas79QdTNj7gyQ+RCVp8gUEe53grA+ZGaGsMwhj
	gMABNOJswBW89lCeWJ6+aMix4bhHhXY0AjkcjzIuzgwudbyu/pLmxycjZqtxEqdfH6qgCXbEZ5l08
	K2VSUPJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwDv-0000000CCBh-2m82;
	Thu, 27 Mar 2025 23:01:19 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwCC-0000000CBxD-0V4I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 22:59:33 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C90B1446;
	Thu, 27 Mar 2025 23:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743116262;
	bh=ce43ubclLYVDVVwz6u4lLxtqmLE2iNCLrwoRsYmtNqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSO4KggaskYagYGaS9JPISt/OXxyWcHuUf9/lOddzr5svUzDfUbLeuCNPtT8wg6S7
	 lU/8YckBbsiPSlaX/lnHmfgO1AuhQFlzdrCnGLoycgDP9TAnBoHIScf3mE4dw0tYm5
	 D/A3qA6KZ5JPCBUELgM4emeqbnsUD6WJKC/aa5RQ=
Date: Fri, 28 Mar 2025 00:59:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 10/11] drm: xlnx: zynqmp: Add support for X403
Message-ID: <20250327225906.GE16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-10-322a300c6d72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-10-322a300c6d72@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_155932_298641_B2A78E6B 
X-CRM114-Status: GOOD (  14.84  )
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

Hi Tomi,

Thank you for the patch.

On Wed, Mar 26, 2025 at 03:22:53PM +0200, Tomi Valkeinen wrote:
> Add support for X403 format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index ae8b4073edf6..ce685dfbf31f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -317,6 +317,11 @@ static const struct zynqmp_disp_format avbuf_vid_fmts[] = {
>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YONLY_10,
>  		.swap		= false,
>  		.sf		= scaling_factors_101010,
> +	}, {
> +		.drm_fmt	= DRM_FORMAT_X403,
> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_VID_YV24_10,
> +		.swap		= false,
> +		.sf		= scaling_factors_101010,
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

