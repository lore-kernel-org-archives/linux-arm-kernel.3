Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA541C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTjGpotOz0ah61yGha/fxfFkMtDZpqr3hXbPW6WAsUk=; b=GucAXTwXx1Da05jUEtpK3rqRcx
	7FmvgWDBVflJdkp3SuBEyT0sMF9aff9gZMyzx+R+odmwC2VEa5feVbRBYhGCM7E90yytUFxjGlhUN
	gGQColOlSZOtd4Rxs2AbSNintxu7eav5szicR1Ab7xJdhZpgWge+dezylu743hRuQJCh06xgUu6os
	P47SRQQQUpjLNLvpv23H3LGiFU5gnX5STSqUpek1+8v8KN5IkO0Pmp+vtQwOWnA13bY0w+3rieNjD
	wqQ4klG8Zcu6xXtde7oZCd/d3D1LMgCgT0xKMFCWDkmGtRdMwtby95gr1Eh4NZUGlz1Tqw3iqklcU
	EhsynhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMww-00000003bgA-2Zjw;
	Fri, 09 May 2025 12:35:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLRm-00000003MTL-2s2k;
	Fri, 09 May 2025 10:59:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DEB31595;
	Fri,  9 May 2025 03:59:07 -0700 (PDT)
Received: from [10.1.35.18] (e122027.cambridge.arm.com [10.1.35.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D9FC3F58B;
	Fri,  9 May 2025 03:59:15 -0700 (PDT)
Message-ID: <32dd077c-52db-4bef-8d76-12b7aaff2408@arm.com>
Date: Fri, 9 May 2025 11:59:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] drm/panfrost: Commonize Mediatek power domain
 array definitions
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
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
 <20250509-mt8370-enable-gpu-v6-3-2833888cb1d3@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250509-mt8370-enable-gpu-v6-3-2833888cb1d3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_035918_812402_5D1846E6 
X-CRM114-Status: GOOD (  21.36  )
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

On 09/05/2025 11:12, Louis-Alexis Eyraud wrote:
> In the panfrost driver, the platform data of several Mediatek SoC
> declares and uses several different power domains arrays according to
> GPU core number present in the SoC:
> - mediatek_mt8186_pm_domains (2 cores)
> - mediatek_mt8183_pm_domains (3 cores)
> - mediatek_mt8192_pm_domains (5 cores)
> 
> As they all are fixed arrays, starting with the same entries and the
> platform data also has a power domains array length field
> (num_pm_domains), they can be replaced by a single array, containing
> all entries, if the num_pm_domains field of the platform data is also
> set to the matching core number.
> 
> So, create a generic power domain array (mediatek_pm_domains) and use
> it in the mt8183(b), mt8186, mt8188 and mt8192 platform data instead.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 27 ++++++++++++---------------
>  1 file changed, 12 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7b899a9b2120c608e61dab9ca831ab8e907e8139..21b28bef84015793d9dba6b1e585891dc0dfcb6d 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -789,6 +789,8 @@ static const struct panfrost_compatible amlogic_data = {
>  	.vendor_quirk = panfrost_gpu_amlogic_quirk,
>  };
>  
> +static const char * const mediatek_pm_domains[] = { "core0", "core1", "core2",
> +						    "core3", "core4" };
>  /*
>   * The old data with two power supplies for MT8183 is here only to
>   * keep retro-compatibility with older devicetrees, as DVFS will
> @@ -798,48 +800,43 @@ static const struct panfrost_compatible amlogic_data = {
>   * coupled regulators instead.
>   */
>  static const char * const legacy_supplies[] = { "mali", "sram", NULL };
> -static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
>  static const struct panfrost_compatible mediatek_mt8183_data = {
>  	.num_supplies = ARRAY_SIZE(legacy_supplies) - 1,
>  	.supply_names = legacy_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  };
>  
>  static const struct panfrost_compatible mediatek_mt8183_b_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> -static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
>  static const struct panfrost_compatible mediatek_mt8186_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
> -	.pm_domain_names = mediatek_mt8186_pm_domains,
> +	.num_pm_domains = 2,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  };
>  
> -/* MT8188 uses the same power domains and power supplies as MT8183 */
>  static const struct panfrost_compatible mediatek_mt8188_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
> -	.pm_domain_names = mediatek_mt8183_pm_domains,
> +	.num_pm_domains = 3,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
> -static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
> -							   "core3", "core4" };
>  static const struct panfrost_compatible mediatek_mt8192_data = {
>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>  	.supply_names = default_supplies,
> -	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
> -	.pm_domain_names = mediatek_mt8192_pm_domains,
> +	.num_pm_domains = 5,
> +	.pm_domain_names = mediatek_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
> 


