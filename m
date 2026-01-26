Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1741D19503
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZi0QvA5ePpkOU2f7nqESzC+PSd6amUcTrkS7svcEis=; b=vNY4dSpqKX8uV2Mdk9XNg9Rn1t
	PQ4iR+F5F9F2RyJFH0u3x6ogGpAvYJSXbNBTTIUHY/zV4sy5RmILtS2MF48vr9em5CwqQN5LTLEDl
	c9XBWqFGFtukO+kJmBs6L8orEzvWmux6s8g76emghZFvWXw+sJN2u8JDWzOHNMN50YadfULC7m2wA
	TQIvmYingEq1y2WGYLy/BH90iPzfW1p7+aYSm0BGTH0HW2lSC3Emmup6uBAAmOQ6Scy7Rt/d+x5HP
	wS99Hkeuxp8D/G25QIcHHLvBkTPqidCg5Swkq++pjkmvhlTg7qkm8tKNlan9Zy/rTsFykv01jrNrl
	EF+JHl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ64-0000000Cw3L-2KPH;
	Mon, 26 Jan 2026 17:09:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ62-0000000Cw2O-1FoV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:09:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5874339;
	Mon, 26 Jan 2026 09:09:41 -0800 (PST)
Received: from [10.57.51.176] (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B1803F5CA;
	Mon, 26 Jan 2026 09:09:46 -0800 (PST)
Message-ID: <5f260792-40f2-4a54-a5d1-45644bc9012b@arm.com>
Date: Mon, 26 Jan 2026 17:09:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings/perf: Drop irqs for clock domains without
 a PMU instance
To: Baisheng Gao <baisheng.gao@unisoc.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: cixi.geng@linux.dev, hao_hao.wang@unisoc.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260126033029.7923-1-baisheng.gao@unisoc.com>
 <20260126033029.7923-3-baisheng.gao@unisoc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260126033029.7923-3-baisheng.gao@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_090950_384377_21776E5A 
X-CRM114-Status: GOOD (  18.42  )
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

On 2026-01-26 3:30 am, Baisheng Gao wrote:
> No need to specify the interrupts for the clock domains without a
> PMU instance.

Yes there is a need, because it's what the binding has already defined 
and systems are already implementing, so breaking compatibility at this 
point more than a year after its introduction is not really acceptable. 
And although there's no strict requirement for the DT and ACPI bindings 
to be equivalent, in this case they currently are, and it doesn't seem 
like you've accounted for ACPI here either.

Fact is, the Arm NI-700, NI-710AE, NoC S3 and SI L1 designs do all 
define <CLKNAME>_nPMUINTERRUPT outputs for each <CLKNAME> domain, and 
the intent of the binding was always to describe the hardware. If it's 
the case that one or more of those interrupts are not wired up at all 
(and presumably the corresponding PMU is never exposed to Non-Secure, 
since it's unlikely to be useful), then at worst it's reasonable to use 
dummy entries to pad the array.

If on the other hand you really have got something that is mangled to 
the point of not being compatible with the stock Arm designs, then it 
most likely warrants its own binding.

Thanks,
Robin.

> Signed-off-by: Baisheng Gao <baisheng.gao@unisoc.com>
> ---
>   Documentation/devicetree/bindings/perf/arm,ni.yaml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/perf/arm,ni.yaml b/Documentation/devicetree/bindings/perf/arm,ni.yaml
> index d66fffa256d5..40a5b8929ef2 100644
> --- a/Documentation/devicetree/bindings/perf/arm,ni.yaml
> +++ b/Documentation/devicetree/bindings/perf/arm,ni.yaml
> @@ -20,7 +20,8 @@ properties:
>     interrupts:
>       minItems: 1
>       maxItems: 32
> -    description: Overflow interrupts, one per clock domain, in order of domain ID
> +    description: Overflow interrupts, one per clock domain which has a PMU
> +      instance, in order of domain ID.
>   
>   required:
>     - compatible


