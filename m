Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB1DE74915
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRtRuXbabQD7IyQpbBI6DarN0z0Jmsk7l5HsppGHiA4=; b=PkaWhlLuiGnXJ4SQ7S4kfGgJnv
	VkS8ggw27JPVn+CDWohXw4zMkc2thEvclrycL35LpYUPjpv4D6SijRi2s/0AJOs6aYCskaAzYNYoX
	3wyGHkymxL0Rx9QqiM6XyS0hTtR1NAZDsh107ylYtjj6zhmJG/315ogA8DY+zsr5hwKzGcRGQ8zrC
	qDEsl/2bpr9JW6R8jllAdkvTKTnrwF0V3TCI7U95sQWU/dC3RQCmKxAty2TzZu5R0qLHrZCLw7V/p
	0/a/ONhegjDZhIklpP11A8li8I4J51wn8+iEkwyxzaQqTQ3oLQXl+OcRn2Iob6kEBXsZraPdn1f2m
	POJJKpxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNW2-0000000Gm8B-1l8K;
	Wed, 24 Dec 2025 11:58:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNVz-0000000Gm7Z-48xt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:58:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 933C6339;
	Wed, 24 Dec 2025 03:58:41 -0800 (PST)
Received: from [10.57.11.204] (unknown [10.57.11.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D2043F5A1;
	Wed, 24 Dec 2025 03:58:46 -0800 (PST)
Message-ID: <10a089d2-4823-4406-b1a9-d38f05ba0760@arm.com>
Date: Wed, 24 Dec 2025 11:58:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: arm: Use hyphen in node names
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20251223152457.155392-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_035852_066041_744E4B60 
X-CRM114-Status: GOOD (  11.61  )
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



On 23/12/2025 15:24, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Acked-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
> 
> Patches done with sed, verified with comparing unflattened DTB and
> dtx_diff.
> ---
>  arch/arm64/boot/dts/arm/morello-fvp.dts | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/arm/morello-fvp.dts b/arch/arm64/boot/dts/arm/morello-fvp.dts
> index 2072c0b72325..4a3f217555f7 100644
> --- a/arch/arm64/boot/dts/arm/morello-fvp.dts
> +++ b/arch/arm64/boot/dts/arm/morello-fvp.dts
> @@ -25,25 +25,25 @@ bp_refclock24mhz: clock-24000000 {
>  		clock-output-names = "bp:clock24mhz";
>  	};
>  
> -	block_0: virtio_block@1c170000 {
> +	block_0: virtio-block@1c170000 {
>  		compatible = "virtio,mmio";
>  		reg = <0x0 0x1c170000 0x0 0x200>;
>  		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> -	net_0: virtio_net@1c180000 {
> +	net_0: virtio-net@1c180000 {
>  		compatible = "virtio,mmio";
>  		reg = <0x0 0x1c180000 0x0 0x200>;
>  		interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> -	rng_0: virtio_rng@1c190000 {
> +	rng_0: virtio-rng@1c190000 {
>  		compatible = "virtio,mmio";
>  		reg = <0x0 0x1c190000 0x0 0x200>;
>  		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
>  	};
>  
> -	p9_0: virtio_p9@1c1a0000 {
> +	p9_0: virtio-p9@1c1a0000 {
>  		compatible = "virtio,mmio";
>  		reg = <0x0 0x1c1a0000 0x0 0x200>;
>  		interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;

-- 
Regards,
Vincenzo


