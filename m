Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A5ECA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 02:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D85PRfMAhEWkK4I3NT1Wt26m3JxDAXB+XgzS4gRVg7c=; b=idR/L0mV+IO22MMrWUfEy+Pn72
	qws6pnlt+rSYqx/GxhXsWYnedLXAmNRpvDjYyNyPSzKSjeHlE7ah0a/+6jRgW0n7BvxPbQFmWjL7P
	PCTt1O84EGYeou6Qs9fv/D6YcVjOwC/OrH1eXUtTZdVZojkvVRH6AdIgTbYb1bCSRkn54OW30kZKe
	xH8mYyolHmzj4KbrS7LXbpbFrD50XXQG5ytO0QwSZ+JldJfRlQDbUxiVzwfHmtwmh2viXxyjfR3gM
	j7RyuLQ9sptHI7BNf6BAi3w2ahcnlApnziHWivGVSgBdq0LAYzH3CDF98/TBHlJ3/s4D2jyQJa8f+
	A86GriFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkLy-00000001CHF-2dU7;
	Fri, 15 Aug 2025 02:39:38 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkHy-00000001BL6-1w2P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 02:35:31 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57F2ZRHi2435437;
	Thu, 14 Aug 2025 21:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755225327;
	bh=D85PRfMAhEWkK4I3NT1Wt26m3JxDAXB+XgzS4gRVg7c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QxK7eNqyuItCpXM4sEB7Zec/282Gx+sxzSkYkCBZqr+2DfGO3t1JC3OrNsXdMZpGL
	 KaceHsWRf8h+Fu0OjBY0S2fJPwG76zoiDsopNKmMpa903K5NhovCoq1OJ1NFz5ACjB
	 6DfGyZNSGmanqIK5zjpUOPP/kAysrkf+Epvk7zeE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57F2ZRu81288354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 14 Aug 2025 21:35:27 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 14
 Aug 2025 21:35:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 14 Aug 2025 21:35:26 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57F2ZLDK659070;
	Thu, 14 Aug 2025 21:35:22 -0500
Message-ID: <92e57929-a978-4d5f-97d4-b7779736d0db@ti.com>
Date: Fri, 15 Aug 2025 08:05:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/33] Revert "arm64: dts: ti: k3-j721e-sk: Fix reversed
 C6x carveout locations"
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <u-kumar1@ti.com>
References: <20250814223839.3256046-1-b-padhi@ti.com>
 <20250814223839.3256046-4-b-padhi@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250814223839.3256046-4-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_193530_609861_321FB95C 
X-CRM114-Status: GOOD (  16.83  )
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


On 8/15/2025 4:08 AM, Beleswar Padhi wrote:
> This reverts commit 9f3814a7c06b7c7296cf8c1622078ad71820454b.
>
> The C6x carveouts are reversed intentionally. This is due to the
> requirement to keep the DMA memory region as non-cached, however the
> minimum granular cache region for C6x is 16MB. So, C66x_0 marks the
> entire C66x_1 16MB memory carveouts as non-cached, and uses the DMA
> memory region of C66x_1 as its own, and vice-versa.

Sorry , but i failed to understand how this swap helps in making region 
non-cached.

16MB logic is understood.

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
>   arch/arm64/boot/dts/ti/k3-j721e-sk.dts | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> index ffef3d1cfd55..9882bb1e8097 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk.dts
> @@ -120,7 +120,8 @@ main_r5fss1_core1_memory_region: r5f-memory@a5100000 {
>   			no-map;
>   		};
>   
> -		c66_0_dma_memory_region: c66-dma-memory@a6000000 {
> +		/* Carveout locations are flipped due to caching */
> +		c66_1_dma_memory_region: c66-dma-memory@a6000000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0x00 0xa6000000 0x00 0x100000>;
>   			no-map;
> @@ -132,7 +133,8 @@ c66_0_memory_region: c66-memory@a6100000 {
>   			no-map;
>   		};
>   
> -		c66_1_dma_memory_region: c66-dma-memory@a7000000 {
> +		/* Carveout locations are flipped due to caching */
> +		c66_0_dma_memory_region: c66-dma-memory@a7000000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0x00 0xa7000000 0x00 0x100000>;
>   			no-map;

