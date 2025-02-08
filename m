Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CF4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pniNeNbsgT9S+T9Pt34UsmcvG+0EQx1HGCZamn7sGqw=; b=ZQ2BytpV0d5esjH7cOyXXsaGLj
	jbCLP+Es5xaM+rzTO4w1nG4xe4wtCcFfcu2AlJTuA2TOMS06F2Y2S8bJVVj2nbu+v2csRMKyvkbvi
	sA1RiBmpqNscJYg1CpjfS7Ox436qZSb/QbIAW0KOlKn/ZBxS3v3+68IsNccwjasTT0Sw2MXKYX1cR
	rLuF8IvnlxTLcjO5Wd4YSsB7GtNWjmwGuni8k38c6lgXL5GYyNmRHtxFWNjBqR4MpvtDvXgIPasU9
	CPzQoF/787Q+SPxOdw7NZCdijgRFNmE4vELEARkXDJrJLLqoD5aS8QCaUQ7fUVuAWezCyit/6TPsX
	aCtD+U3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgljd-0000000D3lS-0IFe;
	Sat, 08 Feb 2025 14:23:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgliE-0000000D3bZ-2HGa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 14:21:39 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A183E82A;
	Sat,  8 Feb 2025 15:20:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739024418;
	bh=WU+sOOHT6k3K6YZ/b2hxBHd5CiMb8fuXeIQVlDyaYqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENXDSNgV2OV6z8Bh46vXfQTGd1/4d0TTteGN95QOS4Lisju1Ypra8p+rdujk3Qq6O
	 9IPuwEzFjfx9Dh6f7Z32a504X0Q3Z6PATh+To2SqdD+X1yCidysPhxMe+Qj/0FULVH
	 xoEfMavuBYbegzpFwXLVwF0qFGERRa7UcD8OnM28=
Date: Sat, 8 Feb 2025 16:21:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Charles Han <hanchunchao@inspur.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, michal.simek@amd.com, vishal.sagar@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: xlnx: zynqmp_dpsub: Add NULL check in
 zynqmp_audio_init
Message-ID: <20250208142125.GC21843@pendragon.ideasonboard.com>
References: <20250208100323.11625-1-hanchunchao@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250208100323.11625-1-hanchunchao@inspur.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_062138_901427_EF62689F 
X-CRM114-Status: GOOD (  15.64  )
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

Hi Charles,

Thank you for the patch.

On Sat, Feb 08, 2025 at 06:03:22PM +0800, Charles Han wrote:
> devm_kasprintf() can return a NULL pointer on failure,but this

s/but/ but/

> returned value in zynqmp_audio_init() is not checked.
> Add NULL check in zynqmp_audio_init(), to handle kernel NULL
> pointer dereference error.
> 
> Fixes: 3ec5c1579305 ("drm: xlnx: zynqmp_dpsub: Add DP audio support")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> index fa5f0ace6084..f07ff4eb3a6d 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> @@ -323,12 +323,16 @@ int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
>  
>  	audio->dai_name = devm_kasprintf(dev, GFP_KERNEL,
>  					 "%s-dai", dev_name(dev));
> +	if (!audio->dai_name)
> +		return -ENOMEM;
>  
>  	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
>  		audio->link_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>  						      "%s-dp-%u", dev_name(dev), i);
>  		audio->pcm_names[i] = devm_kasprintf(dev, GFP_KERNEL,
>  						     "%s-pcm-%u", dev_name(dev), i);
> +		if (!audio->link_names[i] || !audio->pcm_names[i])
> +			return -ENOMEM;
>  	}
>  
>  	audio->base = devm_platform_ioremap_resource_byname(pdev, "aud");

-- 
Regards,

Laurent Pinchart

