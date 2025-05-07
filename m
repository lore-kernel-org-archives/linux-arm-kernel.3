Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A7C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHSt8PLTyIztOhz0Nh5K4ab8OFZURXhjGHzDAo03P0Y=; b=m9I2mDl+NN6ncAnVnr/TckfPrz
	orPSo35h9q8NYZEc60Krr8Q2JKBBDdCO1dZLIrzRlf8CO34mXt5solqpX9HSm05Aq6yjUNS2BDQq0
	Eywgdi+JCkhSS051oxUZm6MFNDA/cJEkQKQP2A9icefYMridVYKiZiZHXMCfN/BR1AcgAs7WvAPM9
	HVLm3HHqbHfwEYyZwpks98OcZbFx657/otT9zQIE8lD8GjLUFEahM+UdEqxumLujFaBWLrCTqtkqt
	w2fHu/6cPTkSIPjF2ZOOLXxVIYA/i4xBaXdiXHqfm/AU9MgG7srgsHrJ+3PH9jtO2QXFlcky6Z6cr
	2xy4nvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfzM-0000000Fpnp-0Qc9;
	Wed, 07 May 2025 14:43:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfQR-0000000FhQG-3ZeT;
	Wed, 07 May 2025 14:07:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6F09339;
	Wed,  7 May 2025 07:06:54 -0700 (PDT)
Received: from [10.57.20.214] (unknown [10.57.20.214])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB1AF3F5A1;
	Wed,  7 May 2025 07:07:00 -0700 (PDT)
Message-ID: <2b85071a-e3e7-4cfc-a471-e81e463b7c37@arm.com>
Date: Wed, 7 May 2025 15:06:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
 <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250502-mt8370-enable-gpu-v5-2-98e247b30151@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_070708_022273_38B7FDC9 
X-CRM114-Status: GOOD (  22.53  )
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

On 02/05/2025 13:17, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an integrated ARM
> Mali G57 MC2 GPU (Valhall-JM, dual core), with new platform data for
> its support in the panfrost driver.
> It uses the same data as MT8186 for the power management features to
> describe power supplies, pm_domains and enablement (one regulator, two
> power domains) but also sets the FORCE_AARCH64_PGTABLE flag in the GPU
> configuration quirks bitfield to enable AARCH64 4K page table format
> mode.
> As MT8186 and MT8370 SoC have different GPU architecture (Mali G52 2EE
> MC2 for MT8186), making them not compatible, and this mode is only
> enabled for Mediatek SoC that are Mali G57 based (compatible with
> mediatek,mali-mt8188 or mediatek,mali-8192), having specific platform
> data allows to set this flag for MT8370 without modifying MT8186
> configuration and behaviour.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

With one minor comment fixed below:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index f1ec3b02f15a0029d20c7d81046ded59854e885c..8e0a1ae6940c73b7b60233950ae3abdfa843cc8e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -846,6 +846,16 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
> +/* MT8370 uses the same power domains and power supplies as MT8186 */

This comment is not correct - you've got the power domains of MT8186, 
but the supplies of MT8183. The comment doesn't actually add much so you 
could just drop it.

If you're feeling adventurous then one option here is to actually clean 
up the mediatek entries a little. Instead of referring to particular 
part numbers we could have:

static const char * const mediatek_2_pm_domains[] = { "core0", "core1" };
static const char * const mediatek_3_pm_domains[] = { "core0", "core1", "core2" };
static const char * const mediatek_5_pm_domains[] = { "core0", "core1", "core2",
                                                      "core3", "core4" };

Or even just have the mediatek_5_domains[] array (dropping the '5' in
the name) and not use ARRAY_SIZE().

Equally the supplies arrays could be renamed. We have the one with 
"sram" for legacy and everything else uses {"mali", NULL} but we have 
two definitions for it (mt8183_b and mt8192).

Thanks,
Steve

> +static const struct panfrost_compatible mediatek_mt8370_data = {
> +	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> +	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
> +	.pm_domain_names = mediatek_mt8186_pm_domains,
> +	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> +	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
> +};
> +
>  static const struct of_device_id dt_match[] = {
>  	/* Set first to probe before the generic compatibles */
>  	{ .compatible = "amlogic,meson-gxm-mali",
> @@ -868,6 +878,7 @@ static const struct of_device_id dt_match[] = {
>  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
>  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
> +	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
>  	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
>  	{}
>  };
> 


