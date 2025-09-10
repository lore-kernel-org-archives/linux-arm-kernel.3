Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdZlHFK/6K/TmCYzSQpqjrtYzY6SgIuXxYFGBmHGVpk=; b=iysCGFIZ5tYvhRbgNqw80iOZo7
	4nBh+rlBMypU3+R3yjLqRC0SFwCidUCIl8pFM1kFgqlVuezbT6GXCpYavQlQIllK98MGvwBDRIZwA
	gXFBWQmKTZDMLPeQBDRo/AMwGAeh2fJlNXJj5P9/fiiI7U9VzOYqZ7lRsDm7GaV2D55ADEf5ta02U
	1qV+nKWgAbp9HkEgPNxz0DL9RP8M9UbfFfGLt9NxHtgux6kSgpAa0snY2fopJT1PRfGaHeCcKdC/8
	cBvSPRbZPnthCCiRWIVQ+1b8sGG8G89nAeW7kaXheH5mg8gnuL8590aZu2BfF7xllZmNltwjklpm3
	XhM0fpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLU6-0000000EawW-2fFQ;
	Wed, 10 Sep 2025 14:07:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLU4-0000000EauD-0O3x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:07:41 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58AE7W12151567;
	Wed, 10 Sep 2025 09:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757513252;
	bh=hdZlHFK/6K/TmCYzSQpqjrtYzY6SgIuXxYFGBmHGVpk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QivxaOUEpObFrdT1mYUud+D90j10dYpkVQ1yXqqUCKcS6g9p5FPDv2E+Bw4yDOG3U
	 qk1lq8YOOhGUGXTEIPXwgE+GBPTixoKLZkYPZq0dE+9kNhve+HK7KeVqKUGysaED7X
	 JDGKPzob2vVjLEPzA3zponvWsIB9bz4PMEHcJKxw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58AE7Wum420570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 10 Sep 2025 09:07:32 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 10
 Sep 2025 09:07:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Sep 2025 09:07:32 -0500
Received: from [128.247.81.0] (ula0226330.dhcp.ti.com [128.247.81.0])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58AE7WLp288106;
	Wed, 10 Sep 2025 09:07:32 -0500
Message-ID: <4c9750c3-ba75-46ec-8398-0691d385d0d2@ti.com>
Date: Wed, 10 Sep 2025 09:07:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/34] Revert "arm64: dts: ti: k3-j721e-sk: Fix
 reversed C6x carveout locations"
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <d-gole@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250908142826.1828676-1-b-padhi@ti.com>
 <20250908142826.1828676-22-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250908142826.1828676-22-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_070740_339931_BA268B0E 
X-CRM114-Status: GOOD (  20.84  )
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

On 9/8/25 9:28 AM, Beleswar Padhi wrote:
> This reverts commit 9f3814a7c06b7c7296cf8c1622078ad71820454b.
> 
> The C6x carveouts are reversed intentionally. This is due to the
> requirement to keep the DMA memory region as non-cached, however the
> minimum granular cache region for C6x is 16MB. So, C66x_0 marks the
> entire C66x_1 16MB memory carveouts as non-cached, and uses the DMA
> memory region of C66x_1 as its own, and vice-versa.
> 
> This was also called out in the original commit which introduced these
> reversed carveouts:
> 	"The minimum granularity on the Cache settings on C66x DSP cores
> 	is 16MB, so the DMA memory regions are chosen such that they are
> 	in separate 16MB regions for each DSP, while reserving a total
> 	of 16 MB for each DSP and not changing the overall DSP
> 	remoteproc carveouts."
> 
> Fixes: 9f3814a7c06b ("arm64: dts: ti: k3-j721e-sk: Fix reversed C6x carveout locations")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

Still feels like something we should have fixed on the firmware side,
but since the firmware is out there already we can live with it.

Acked-by: Andrew Davis <afd@ti.com>

> v4: Changelog:
> 1. Updated carveout node names to generic 'memory@addr'
> 
> Link to v3:
> https://lore.kernel.org/all/20250905051846.1189612-21-b-padhi@ti.com/
> 
> v3: Changelog:
> 1. None
> 
> Link to v2:
> https://lore.kernel.org/all/20250823160901.2177841-21-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Re-ordered patch from [PATCH 03/33] to [PATCH v2 20/33].
> 
> Link to v1:
> https://lore.kernel.org/all/20250814223839.3256046-4-b-padhi@ti.com/
>   arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> index 0f05e65f7bf7..37bc33f2cc26 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> @@ -120,7 +120,8 @@ main_r5fss1_core1_memory_region: memory@a5100000 {
>   			no-map;
>   		};
>   
> -		c66_0_dma_memory_region: memory@a6000000 {
> +		/* Carveout locations are flipped due to caching */
> +		c66_1_dma_memory_region: memory@a6000000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0x00 0xa6000000 0x00 0x100000>;
>   			no-map;
> @@ -132,7 +133,8 @@ c66_0_memory_region: memory@a6100000 {
>   			no-map;
>   		};
>   
> -		c66_1_dma_memory_region: memory@a7000000 {
> +		/* Carveout locations are flipped due to caching */
> +		c66_0_dma_memory_region: memory@a7000000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0x00 0xa7000000 0x00 0x100000>;
>   			no-map;


