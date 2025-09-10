Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F250CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnOHOg3H5ggOveS2dbAQDsJSfchqVaj8yOAiLKEOXpY=; b=WTUIi9RO2MiE+O675UvPQzpmKv
	6pRq3kedlRnwDY11G3mBmDw0F+9v5alETiKfQE+YcK1E1zwaPBi2WTfJtL2/xkcTWd/mEhx1K3STe
	mDIR0SRoJssfdb/NYUpMLbScdv3HP+yyzeLgR8uaoZ9WZD7U/uxkhe1xi/xc+EdYup4/qnWpuvG47
	LVjXikGtcq5GQk9e3ahwN8gKJuEUkZhXldj93/S5VowJ0p9SP4Ask4qeDlwfYY1LX9m7lmFivNLhx
	G/4IKSpDfVa58QCHgQ7gCJ/GrahZumauQGkDkCUADFhDW1CFio1RncqnSOOr/+2a9uU5hJv6V6y1n
	yYORE/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLUA-0000000EazB-3uky;
	Wed, 10 Sep 2025 14:07:46 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLU8-0000000EaxW-2VJd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:07:46 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58AE7feI151583;
	Wed, 10 Sep 2025 09:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757513261;
	bh=LnOHOg3H5ggOveS2dbAQDsJSfchqVaj8yOAiLKEOXpY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cWvtoQaU85ZKAlxE6OEHVGJYYDFnSeC8jsQUQnrq+4gQXJ6hD5OmIhZ0zV7QgkvW9
	 h1peqVKa2hhrJzyRtLO5ZbxD4SUbc+OGn7IPqMm9hG7qaFSd7fWOgTLBTBzHEg3PU8
	 oijAy87FG6J63zzqFaH0UunkEqcQb/c2JiSF9V24=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58AE7fT83970441
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 10 Sep 2025 09:07:41 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 10
 Sep 2025 09:07:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Sep 2025 09:07:41 -0500
Received: from [128.247.81.0] (ula0226330.dhcp.ti.com [128.247.81.0])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58AE7fmn587629;
	Wed, 10 Sep 2025 09:07:41 -0500
Message-ID: <f8844710-39a3-4d48-96b7-678894af0c76@ti.com>
Date: Wed, 10 Sep 2025 09:07:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/34] Revert "arm64: dts: ti: k3-j721e-beagleboneai64:
 Fix reversed C6x carveout locations"
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>
CC: <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>, <d-gole@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250908142826.1828676-1-b-padhi@ti.com>
 <20250908142826.1828676-23-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250908142826.1828676-23-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_070744_736451_AFCBCF1B 
X-CRM114-Status: GOOD (  18.34  )
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
> This reverts commit 1a314099b7559690fe23cdf3300dfff6e830ecb1.
> 
> The C6x carveouts are reversed intentionally. This is due to the
> requirement to keep the DMA memory region as non-cached, however the
> minimum granular cache region for C6x is 16MB. So, C66x_0 marks the
> entire C66x_1 16MB memory carveouts as non-cached, and uses the DMA
> memory region of C66x_1 as its own, and vice-versa.
> 
> This was also called out in the original commit which introduced these
> reversed carveouts:
> 	"The minimum granularity on the Cache settings on C66x DSP
> 	cores is 16MB, so the DMA memory regions are chosen such that
> 	they are in separate 16MB regions for each DSP, while reserving
> 	a total of 16 MB for each DSP and not changing the overall DSP
>          remoteproc carveouts."
> 
> Fixes: 1a314099b755 ("arm64: dts: ti: k3-j721e-beagleboneai64: Fix reversed C6x carveout locations")
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

> v4: Changelog:
> 1. Updaed node names to 'memory@addr'
> 
> Link to v3:
> https://lore.kernel.org/all/20250905051846.1189612-22-b-padhi@ti.com/
> 
> v3: Changelog:
> 1. None
> 
> Link to v2:
> https://lore.kernel.org/all/20250823160901.2177841-22-b-padhi@ti.com/
> 
> v2: Changelog:
> 1. Re-ordered patch from [PATCH 04/33] to [PATCH v2 21/33].
> 
> Link to v1:
> https://lore.kernel.org/all/20250814223839.3256046-5-b-padhi@ti.com/
> 
>   arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> index 66c4614f9e42..92f5e4a14a49 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-beagleboneai64.dts
> @@ -123,7 +123,8 @@ main_r5fss1_core1_memory_region: memory@a5100000 {
>   			no-map;
>   		};
>   
> -		c66_0_dma_memory_region: memory@a6000000 {
> +		/* Carveout locations are flipped due to caching */
> +		c66_1_dma_memory_region: memory@a6000000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0x00 0xa6000000 0x00 0x100000>;
>   			no-map;
> @@ -135,7 +136,8 @@ c66_0_memory_region: memory@a6100000 {
>   			no-map;
>   		};
>   
> -		c66_1_dma_memory_region: memory@a7000000 {
> +		/* Carveout locations are flipped due to caching */
> +		c66_0_dma_memory_region: memory@a7000000 {
>   			compatible = "shared-dma-pool";
>   			reg = <0x00 0xa7000000 0x00 0x100000>;
>   			no-map;


