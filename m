Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8ABC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 21:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWBpOvs6sVOpFwHE44plD7/cTALPK6x9/0CXgUz0dS8=; b=GSUmCDfBU3KlfN41OpJ1t/BOVO
	y3FymjgOTaZFqoeOQzveUa0OJCL0ZN/oeRd4pm4ZSZMYsBAKAaVVpNFUcE3+x3qdpa+NwJwS92yLl
	F3cqwYob0rpqQ4cT5iTSKWRxrpNbsVAZesdds1vFo+V+UJr0RB0ZnysIyfRD4/+cLcm5inRYa8Sug
	FNV1KUKCJHQUYURkJWGmAPr+icxONwPg3oiH+27HFpBrl2JfMaGAFN8BvCN60SIpiFqwmqynCtN/+
	pYM2GupKxdpg5z5/eFyQOBHijswPhGebxT9KX8EygZydveD1icBUBjgfa0eqlIT6gSLmZNKJT86Gf
	zkqfzTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzj3B-00000004RTp-47Ip;
	Tue, 01 Apr 2025 21:21:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tziuV-00000004QF4-0OKR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 21:12:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F31212FC
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Apr 2025 14:12:40 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BCD683F694
	for <linux-arm-kernel@lists.infradead.org>; Tue,  1 Apr 2025 14:12:36 -0700 (PDT)
Date: Tue, 1 Apr 2025 22:12:17 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: shao.mingyin@zte.com.cn
Cc: j@jannau.net, chunkuang.hu@kernel.org, fnkl.kernel@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, yang.yang29@zte.com.cn,
	xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn,
	tang.dongxing@zte.com.cn
Subject: Re: [PATCH 3/4] drm: malidp: =?utf-8?Q?Rep?=
 =?utf-8?Q?lace_custom_compare=5Fdev_with=C2=A0component=5Fcompare=5Fof?=
Message-ID: <Z-xWsbM2fh8TPmhO@e110455-lin.cambridge.arm.com>
References: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
 <20250331173124559aCNI8BfX0ay0U5wryryME@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250331173124559aCNI8BfX0ay0U5wryryME@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_141239_173893_AB591F92 
X-CRM114-Status: GOOD (  17.67  )
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

On Mon, Mar 31, 2025 at 05:31:24PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Tang Dongxing <tang.dongxing@zte.com.cn>
> 
> Remove the custom device comparison function compare_dev and replace it
> with the existing kernel helper component_compare_of
> 
> Signed-off-by: Tang Dongxing <tang.dongxing@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/malidp_drv.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index e083021e9e99..e2e6fd1f64b0 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -910,13 +910,6 @@ static const struct component_master_ops malidp_master_ops = {
>  	.unbind = malidp_unbind,
>  };
> 
> -static int malidp_compare_dev(struct device *dev, void *data)
> -{
> -	struct device_node *np = data;
> -
> -	return dev->of_node == np;
> -}
> -
>  static int malidp_platform_probe(struct platform_device *pdev)
>  {
>  	struct device_node *port;
> @@ -930,7 +923,7 @@ static int malidp_platform_probe(struct platform_device *pdev)
>  	if (!port)
>  		return -ENODEV;
> 
> -	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
> +	drm_of_component_match_add(&pdev->dev, &match, component_compare_of,
>  				   port);
>  	of_node_put(port);
>  	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
> -- 
> 2.25.1

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

