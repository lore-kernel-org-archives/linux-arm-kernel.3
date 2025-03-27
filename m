Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94652C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 22:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXT6scdYetLno/egB7O7DBmUUvkGazNuNMxh9E7QHvk=; b=3hWgZtTlzOwl94sBlrgjWXW9Sb
	5fYftQ4S2mHxgy5Vm6ewqbRX6y9p2EDJBR+80ilZdNV9u6prNvt67ph8p2mP7UEXDL0Y3auaW+sOZ
	bQxVrS9hsh/IBgPZdnsN/qVSFUQk2D/Fyxfb/+WRSBD/SAqiN2sk88HFwbyWhhsqAW8QYFuaJcGjY
	UsohMA/kzF3Sga+EOnm6h09rwTw77t9LdnyHcbN/XWKvV4nk3uyFdd/DljLQUHvXmTrDg9eyQGGlh
	02W/cYySXphAoqZTCOgIF3CIFhYUuttrG36Yh7W8fqo2xzcKkE/wUVn+b7kuOTUJi0/z9k6qJX7/q
	ByXbnLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txwAc-0000000CBiQ-3MVl;
	Thu, 27 Mar 2025 22:57:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txw8g-0000000CBWe-3nIV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 22:55:56 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF13D446;
	Thu, 27 Mar 2025 23:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743116044;
	bh=5dcJ6twb0oWsmBHIlhgdwYsyHCMN1hm7TsGSl/bOP6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q594SFK98lcwolGilpPbFx8WmfRPeHs/Yum6qAGR6florz+BR5Z6D1IjMOwfKqURb
	 9JlKAudv8NVL3JliDbBfmpqvBRkoFrJEf6EGHvWNG5V1vdjvTC3Zgbfi3+948UD1o3
	 GxcmHAaDnPo6ERZUxG5SXR5Sk8odCrE7nFBvpGaY=
Date: Fri, 28 Mar 2025 00:55:29 +0200
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
Subject: Re: [PATCH v4 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <20250327225529.GD16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-5-322a300c6d72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-5-322a300c6d72@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_155555_084541_B76C1506 
X-CRM114-Status: GOOD (  15.84  )
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

On Wed, Mar 26, 2025 at 03:22:48PM +0200, Tomi Valkeinen wrote:
> Add X403, a 3 plane non-subsampled YCbCr format.

I'd add 10-bpp somewhere in there.

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index e5f04f7ec164..60684f99f4a7 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -356,6 +356,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
>  		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
>  		  .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true },
>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index f6316adbeb97..10d77f6f6e95 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -385,6 +385,14 @@ extern "C" {
>   */
>  #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
>  
> +/* 3 plane non-subsampled (444) YCbCr

/*
 * 3 plane non-subsampled (444) YCbCr

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
> + * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
> + * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
> + * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
> + */
> +#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
> +
>  /*
>   * 3 plane YCbCr
>   * index 0: Y plane, [7:0] Y

-- 
Regards,

Laurent Pinchart

