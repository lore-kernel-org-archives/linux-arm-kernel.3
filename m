Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306E5D5AE5F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 04:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yLSujXjZ1vWyoNhn9Q/+EnZQtwboxPDVegByiRGcUI=; b=TV3l3O4pP230SIDh9Jb3EUt4SV
	g5UuZJ9vK+fRZ10LiVRggDdW3Nm0bAVlutcYYHPABR4Bh17B63DAglGcqplJXlLUSBA+IXSaMuV9z
	yecWdPiGDu9CXGOERwnyZdMq1rhLSTUnHnfwK0Bx2rYz/yIy/XzwmY9zgp1l/g88PV0fwy/GM0pGU
	PRMFCxfWM0Rb+rAxPOe6xyfYuhBxV/BxPXnXMj20prJzCw/bJ30z7ju+Yzc3K2sRRY9UINB8H7vxC
	qhHl5ZSKnaATX3M4TeQRtpW960hH9QePGHNXmr1n8AM9fmacqOcLC5oo2apOi+lVX1XnlD8gaaTQr
	tX5f6tdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8u0O-00000005cSS-2RtK;
	Thu, 07 Nov 2024 04:20:24 +0000
Received: from omta034.useast.a.cloudfilter.net ([44.202.169.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8tyf-00000005cKE-2KHD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 04:18:39 +0000
Received: from eig-obgw-6004a.ext.cloudfilter.net ([10.0.30.197])
	by cmsmtp with ESMTPS
	id 8MFctzIyHrKrb8tyNtpPQY; Thu, 07 Nov 2024 04:18:19 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id 8tyJtBDTQWdNZ8tyKtOkiK; Thu, 07 Nov 2024 04:18:17 +0000
X-Authority-Analysis: v=2.4 cv=FtTO/Hrq c=1 sm=1 tr=0 ts=672c3f89
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=-pn6D5nKLtMA:10 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=vU9dKmh3AAAA:8 a=rQIMLdAWvKoWWgQMOJcA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=rsP06fVo5MYu2ilr0aT5:22 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1yLSujXjZ1vWyoNhn9Q/+EnZQtwboxPDVegByiRGcUI=; b=Ae+uZ+VP8cnIBy/ygVfCll2Z2h
	1Aqzf+23wPlMaOpCuvSlLqS9smUrQC9QISA+tkOzEKoLfUnU09AWYs3lIQRojNJOm3caBBIurcKzi
	iMeSsWbskf4cQIru86EXaXX1A7RaBE9mQGg26z6Buwe39AB33Sdaa+f6T0HuGIr15bWRqUYRItaQE
	la1LDTaIuFLQUzIT/mNxz+2EcJHnC9XV2H6Rak0PozS2rWtRvPPGWHDPu/JBbh9MA9E0j5E9Ky00A
	FqzPxSOgIxlWUAgcFNliQ9lCzxXHZBMnWusNWs3At6uI4iWNCwSKN3f7FV6pv1RGXMXtz1zVQ5llb
	pxjLd1yA==;
Received: from [122.165.245.213] (port=38142 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1t8tyI-0040BA-0J;
	Thu, 07 Nov 2024 09:48:14 +0530
Message-ID: <411e2025-6e2c-4755-bb44-d2388ed5058e@linumiz.com>
Date: Thu, 7 Nov 2024 09:48:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Yangtao Li <tiny.windzz@gmail.com>, Cody Eksal <masterr3c0rd@epochal.quest>,
 stable@vger.kernel.org
Subject: Re: [PATCH] mmc: sunxi-mmc: Fix A100 compatible description
To: Andre Przywara <andre.przywara@arm.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
References: <20241107014240.24669-1-andre.przywara@arm.com>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20241107014240.24669-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1t8tyI-0040BA-0J
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:38142
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 5
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOksEIrDFNMX+dibY1yY4ina3fIK1TBHI65br18HjRBBrXj2n9BUpD/u61aU6IeYtawHh12XWk/MPAlhOZxVk4FPeLnW72dVU4+Pf9ouRyj7zND/s0Kj
 lCCRZDqICHfwrSpAnyTVji4EThUzk78WcVZR9rWvJtsSJsi+f+udADPX7jn9nEeQhHDCIROQiXM03yxiJZzyJYJxaS13c7bhXEY0s2uJ4X+/GdO9z9v8+HqY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_201837_675032_E39F0A65 
X-CRM114-Status: GOOD (  16.54  )
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

On 11/7/24 7:12 AM, Andre Przywara wrote:
> It turns out that the Allwinner A100/A133 SoC only supports 8K DMA
> blocks (13 bits wide), for both the SD/SDIO and eMMC instances.
> And while this alone would make a trivial fix, the H616 falls back to
> the A100 compatible string, so we have to now match the H616 compatible
> string explicitly against the description advertising 64K DMA blocks.
> 
> As the A100 is now compatible with the D1 description, let the A100
> compatible string point to that block instead, and introduce an explicit
> match against the H616 string, pointing to the old description.
> Also remove the redundant setting of clk_delays to NULL on the way.
> 
> Fixes: 3536b82e5853 ("mmc: sunxi: add support for A100 mmc controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Tested working with SD card in mmc0.

Tested-by: Parthiban Nallathambi <parthiban@linumiz.com>

Thanks,
Parthiban

> ---
>  drivers/mmc/host/sunxi-mmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index d3bd0ac99ec46..e0ab5fd635e6c 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -1191,10 +1191,9 @@ static const struct sunxi_mmc_cfg sun50i_a64_emmc_cfg = {
>  	.needs_new_timings = true,
>  };
>  
> -static const struct sunxi_mmc_cfg sun50i_a100_cfg = {
> +static const struct sunxi_mmc_cfg sun50i_h616_cfg = {
>  	.idma_des_size_bits = 16,
>  	.idma_des_shift = 2,
> -	.clk_delays = NULL,
>  	.can_calibrate = true,
>  	.mask_data0 = true,
>  	.needs_new_timings = true,
> @@ -1217,8 +1216,9 @@ static const struct of_device_id sunxi_mmc_of_match[] = {
>  	{ .compatible = "allwinner,sun20i-d1-mmc", .data = &sun20i_d1_cfg },
>  	{ .compatible = "allwinner,sun50i-a64-mmc", .data = &sun50i_a64_cfg },
>  	{ .compatible = "allwinner,sun50i-a64-emmc", .data = &sun50i_a64_emmc_cfg },
> -	{ .compatible = "allwinner,sun50i-a100-mmc", .data = &sun50i_a100_cfg },
> +	{ .compatible = "allwinner,sun50i-a100-mmc", .data = &sun20i_d1_cfg },
>  	{ .compatible = "allwinner,sun50i-a100-emmc", .data = &sun50i_a100_emmc_cfg },
> +	{ .compatible = "allwinner,sun50i-h616-mmc", .data = &sun50i_h616_cfg },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, sunxi_mmc_of_match);


