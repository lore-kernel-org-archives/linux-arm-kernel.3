Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92099CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 04:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJjbSSj5jhMk0HRinPCbRwY9CFU4h6QcLpjE9fG/CGw=; b=DJlmJ2tHNpf3MNUUiWxSH9vJ2P
	D+F9RwOIofKgYpPIGbUETrb4RYn4X9AGFYaULMuYsHmvdJzD94CxQS1J/Zx7prouGmpgsHmTzKPMI
	N7Z/Hw3Df8RgPA3AJqSd6gcl/Zyp+XvRA/aB1J0KEt2SuPcd7w8DUAY1YAOdl7XYK2K4CLnVUdAek
	YdyKPmlLtfzjqkENRJtMEXVCWqMRQl6Y5/vb8H8Z1u0WuDRJKmbW7Iy7OW7jT71SOlBH5I5zHYZ3F
	bwSVB78TNuV3Wr9AJGUozdQ2h++VDINgIIHVNE3MlIdLkTRXFK+N6Jat+4RR8rk9y2YddHqZPuQuK
	Mu3T8GSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz661-0000000GCtA-0wZQ;
	Thu, 18 Sep 2025 04:18:13 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz65x-0000000GCsh-44bF;
	Thu, 18 Sep 2025 04:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758168671; bh=NJjbSSj5jhMk0HRinPCbRwY
	9CFU4h6QcLpjE9fG/CGw=; b=ShVjJBDQtkoHl4zZviJw22Cn95HrMuMYoejLcf0xJzeQA7qKuJ
	D5qGCh0b0urde73kHsIhQh0EsyeFnt6xLrCS4Wai/5YtjmNkkyeT1cTVXMvpBVRGs6RPCbRYT5d
	KTQGQJbCq0HAA7aFbdsJbn+LX9CWR3mBsbAH5qHi+tbZeV4TPnjuZF1/f7ExusA6J2edVGY2bxx
	XVh5ikQM3M4YuTAjivkFueiiTHxKhDNx0/PTewZ1HIP9kvQNpLjdZXXG4rVFwOslOgHB/JYldjK
	OrVBQcOpVrOBMP7JPbckmUd1ygtraryn8HSnmM5jtXDJK4g7dnltryNpoL/GlzGe03Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1758168671; bh=NJjbSSj5jhMk0HRinPCbRwY
	9CFU4h6QcLpjE9fG/CGw=; b=yG/LBgVK91WyVeVJYLDzq2LIwSsiLwpyegB0yLgC8ixqUZuUMP
	oEKedmOlTd3bIbX2/d7CiHNj6juQ1b/PrEAQ==;
MIME-Version: 1.0
Date: Thu, 18 Sep 2025 11:11:10 +0700
From: Dang Huynh <dang.huynh@mainlining.org>
To: Conor Dooley <conor@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Sebastian Reichel <sre@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-mmc@vger.kernel.org
Subject: Re: [PATCH 05/25] dt-bindings: rtc: Add RDA Micro RDA8810PL RTC
In-Reply-To: <20250917-contort-sassy-df07fd7515a0@spud>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
 <20250917-rda8810pl-drivers-v1-5-74866def1fe3@mainlining.org>
 <20250917-contort-sassy-df07fd7515a0@spud>
Message-ID: <c905fb3ace281280f1ac11c7fbe8e0aa@mainlining.org>
X-Sender: dang.huynh@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_211810_159237_F7FDE077 
X-CRM114-Status: GOOD (  14.45  )
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

On 2025-09-18 03:46, Conor Dooley wrote:
> On Wed, Sep 17, 2025 at 03:07:22AM +0700, Dang Huynh wrote:
>> Add documentation describing the RTC found in RDA8810PL SoC.
>> 
>> Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
>> ---
>>  .../devicetree/bindings/rtc/rda,8810pl-rtc.yaml    | 30 
>> ++++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml 
>> b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..3ceae294921cc3211cd775d9b3890393196faf82
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/rda,8810pl-rtc.yaml
>> @@ -0,0 +1,30 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/rda,8810pl-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: RDA Micro RDA8810PL Real Time Clock
>> +
>> +maintainers:
>> +  - Dang Huynh <dang.huynh@mainlining.org>
>> +
>> +properties:
>> +  compatible:
>> +    const: rda,8810pl-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> Your driver implements functions that turn on an alarm irq, but there 
> is
> none mentioned here. What's going on there?
The RTC doesn't seem to have an AP IRQ associated. I can't find any
reference to it on downstream kernel and the docs.

> 
> Additionally, there's no clocks property? For an onboard RTC I'd have
> expected there to be a clock sourced outside of the block.
> 
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    rtc@1a06000 {
>> +      compatible = "rda,8810pl-rtc";
>> +      reg = <0x1a06000 0x1000>;
>> +    };
>> 
>> --
>> 2.51.0

