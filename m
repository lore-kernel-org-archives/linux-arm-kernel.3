Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3941C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1NbxQ3NjkbkS3b+tER0/V/TTtVdvsyE4Uw7iAKKd+c=; b=Lp01guQrLwjvNNJ627Hk3SkM20
	ESEdSjfgBoQ2r5dpQx5QTcjKTTXMHp0Lc7oGw4pwkLGwy1j0uV/VSWd4WudjqsXveplHXRWAvxwdb
	dQhXriy22vpIMTkDxI0/CMzC6UH/syqBEvH6voQcEBkRs1gJ72zh9ul56nJuApchPznOo4ykDMYlE
	kkC7BKEccWGzn6fli7qopNzX6MvFMh+ZeoetiwakjE3yrcRtRqg1O5CATbg1qLDi1SmCN/hvixYWc
	8Ar45Imf7LaC8qQVlScsa9lnOHaeDEO7dBrC0RZBi6RHz+kXxkXhYKvLkbSbH6HTk3z9OtAPUkdtf
	NsRmONhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMv0-00000003bXG-3ycm;
	Fri, 09 May 2025 12:33:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLRk-00000003MSQ-0atY;
	Fri, 09 May 2025 10:59:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 469351595;
	Fri,  9 May 2025 03:59:02 -0700 (PDT)
Received: from [10.1.35.18] (e122027.cambridge.arm.com [10.1.35.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB863F58B;
	Fri,  9 May 2025 03:59:09 -0700 (PDT)
Message-ID: <124b8718-1a8e-4cf2-99e2-604fe63ae132@arm.com>
Date: Fri, 9 May 2025 11:59:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] drm/panfrost: Drop duplicated Mediatek supplies
 arrays
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
 <20250509-mt8370-enable-gpu-v6-2-2833888cb1d3@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250509-mt8370-enable-gpu-v6-2-2833888cb1d3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_035916_271282_9FBA4597 
X-CRM114-Status: GOOD (  16.82  )
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
> declares and uses custom supplies array definitions
> (mediatek_mt8192_supplies, mediatek_mt8183_b_supplies), that are the
> same as default_supplies (used by default platform data).
> 
> So drop these duplicated definitions and use default_supplies instead.
> Also, rename mediatek_mt8183_supplies to a more generic name too
> (legacy_supplies).
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Thanks for doing this.

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index f1ec3b02f15a0029d20c7d81046ded59854e885c..7b899a9b2120c608e61dab9ca831ab8e907e8139 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -797,19 +797,18 @@ static const struct panfrost_compatible amlogic_data = {
>   * On new devicetrees please use the _b variant with a single and
>   * coupled regulators instead.
>   */
> -static const char * const mediatek_mt8183_supplies[] = { "mali", "sram", NULL };
> +static const char * const legacy_supplies[] = { "mali", "sram", NULL };
>  static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
>  static const struct panfrost_compatible mediatek_mt8183_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_supplies) - 1,
> -	.supply_names = mediatek_mt8183_supplies,
> +	.num_supplies = ARRAY_SIZE(legacy_supplies) - 1,
> +	.supply_names = legacy_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  };
>  
> -static const char * const mediatek_mt8183_b_supplies[] = { "mali", NULL };
>  static const struct panfrost_compatible mediatek_mt8183_b_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> -	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> @@ -817,8 +816,8 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
>  
>  static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
>  static const struct panfrost_compatible mediatek_mt8186_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> -	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
>  	.pm_domain_names = mediatek_mt8186_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> @@ -826,20 +825,19 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
>  
>  /* MT8188 uses the same power domains and power supplies as MT8183 */
>  static const struct panfrost_compatible mediatek_mt8188_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
> -	.supply_names = mediatek_mt8183_b_supplies,
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
>  	.pm_domain_names = mediatek_mt8183_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
>  	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
>  };
>  
> -static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
>  static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
>  							   "core3", "core4" };
>  static const struct panfrost_compatible mediatek_mt8192_data = {
> -	.num_supplies = ARRAY_SIZE(mediatek_mt8192_supplies) - 1,
> -	.supply_names = mediatek_mt8192_supplies,
> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
> +	.supply_names = default_supplies,
>  	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
>  	.pm_domain_names = mediatek_mt8192_pm_domains,
>  	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
> 


