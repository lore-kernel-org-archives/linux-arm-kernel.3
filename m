Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663EFCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS6WTCwBtZ6Bk9dnRI9ny6OxcWxL/lUNYunUz4/mcPI=; b=oWODLBC4ThQCvZsKsqY/DX8SX2
	YIVhhjc5K5ahUDbSRt1QAEY1CL69N46M/7gh23Qq7lnizgGJ9xM4olxUqQjbafLWPy4goia+dRBXO
	sffrNt3K9lSyeoPZN4nqWS3db6g9Ak2XLZE9cFk8N7+RjJpbaQexBDc0OgSc1fRwpn7sCOtlkhrvT
	Fhg4jwLFHAbb2hQ8QBHoxFIVaB1zxPdK+YrPR1EwDOw5tnk1TkDhvAld4FzOLJsRGspNbm8IC5kql
	A62BgqhshiYltSHZEXWSgMkz5CHpUxlJqCwoqX4ose8K2j5nNVJzB/vxnxAb4YRLCGXTyd3AQmQ++
	ca7zcEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urztc-00000005zOV-17uN;
	Fri, 29 Aug 2025 14:16:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwyM-00000005RLd-1Xyy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:08:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AC8519F0;
	Fri, 29 Aug 2025 04:08:37 -0700 (PDT)
Received: from [10.57.2.173] (unknown [10.57.2.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B8C53F738;
	Fri, 29 Aug 2025 04:08:44 -0700 (PDT)
Message-ID: <7230cb2a-2a66-49d4-bb37-b0df2a79f7d0@arm.com>
Date: Fri, 29 Aug 2025 12:08:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] dt-bindings: dma: dma350: Document interrupt-names
To: Jisheng Zhang <jszhang@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250823154009.25992-1-jszhang@kernel.org>
 <20250823154009.25992-9-jszhang@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250823154009.25992-9-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_040846_455856_BF3E3BB4 
X-CRM114-Status: GOOD (  16.76  )
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

On 2025-08-23 4:40 pm, Jisheng Zhang wrote:
> Currently, the dma350 driver assumes all channels are available to
> linux,

No, it doesn't - the CH_CFG_HAS_CMDLINK check is designed to safely skip 
channels reserved for Secure world (or that don't exist due to an FVP 
bug...), since their CH_BUILDCFG1 will as zero.

> this may not be true on some platforms, so it's possible no
> irq(s) for the unavailable channel(s). What's more, the available
> channels may not be continuous. To handle this case, we'd better
> get the irq of each channel by name.

Unless you're suggesting these channels physically do not have their 
IRQs wired up to anything at all, what's wrong with describing the 
hardware in DT? Linux won't request IRQs for channels it isn't actually 
using, and nor should any other reasonable DT consumer - precisely 
because channels *can* be arbitrarily taken by the Secure world, and 
that can be entirely dynamic based on firmware configuration even for a 
single hardware platform.

And even in the weird case that some channel literally has no IRQ, my 
thought was we'd just have a placeholder entry in the array, such that 
attempting to request it would fail.

Thanks,
Robin.

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   Documentation/devicetree/bindings/dma/arm,dma-350.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..94752516e51a 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -32,6 +32,10 @@ properties:
>         - description: Channel 6 interrupt
>         - description: Channel 7 interrupt
>   
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 8
> +
>     "#dma-cells":
>       const: 1
>       description: The cell is the trigger input number
> @@ -40,5 +44,6 @@ required:
>     - compatible
>     - reg
>     - interrupts
> +  - interrupt-names
>   
>   unevaluatedProperties: false


