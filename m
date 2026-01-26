Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0080FD19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiBIYwmI4m+KmIlj8iUhqchZH2TC9f1VVtL2vAwrbLM=; b=F+IsF++thkorSJpmPtrOzm2z+P
	St9hf/YZ4tMdiYFYGo7NAtdkATKGJoXzAxiOpXnee5gc7TCThKX17yQYQUCvgfezZ6U6o1ZUKVb9f
	FvRldDQqe/P7MHRyxed0WXF6g5o9KkaL2MR/3EUL+x2hGo/InRfdoF1gTJTDkRNf/7WskYX9vzH+o
	ioFiXnh11IqcJyOlnt2aLU/bzK97hMqSB2xx3K0+kCv9ztWuX3/FAbkFzZwAbODgRGGAo1u8oF8ok
	PNEAceIEbI7aJXSbjYHCnOZ1uNmiwKKEGc7OGPg1IF/AteU+29gTY5ssENNUoXLZWtB+Dc7Yy4KqJ
	jTdg3X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPXq-0000000Cs1F-2bzS;
	Mon, 26 Jan 2026 16:34:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPXo-0000000Cs0r-2HgW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:34:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1965339;
	Mon, 26 Jan 2026 08:34:20 -0800 (PST)
Received: from [10.57.51.176] (unknown [10.57.51.176])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02A783F5CA;
	Mon, 26 Jan 2026 08:34:24 -0800 (PST)
Message-ID: <b5f268cb-f9b9-4880-9fb5-b5f3a8eb9251@arm.com>
Date: Mon, 26 Jan 2026 16:34:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf/arm-ni: Don't crash in probing clock domains
 without a PMU instance
To: Baisheng Gao <baisheng.gao@unisoc.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: cixi.geng@linux.dev, hao_hao.wang@unisoc.com,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260126033029.7923-1-baisheng.gao@unisoc.com>
 <20260126033029.7923-2-baisheng.gao@unisoc.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260126033029.7923-2-baisheng.gao@unisoc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_083428_715584_E8059A6B 
X-CRM114-Status: GOOD (  20.75  )
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
> The NULL pmusela pointer implies that current clock domain doesn't have
> a PMU instance. Return 0 for probing the next clock domain. Otherwise a
> kernel crash will happen.

Sorry, this doesn't add up with the diff below. All of the documentation 
says that the PMU is in integral part of the clock domain, and I can 
find no mention of any configuration parameter allowing it to be 
omitted. It is possible for the PMU registers to be inaccessible because 
Non-Secure access has not been enabled, but we account for that already.

> Signed-off-by: Baisheng Gao <baisheng.gao@unisoc.com>
> ---
>   drivers/perf/arm-ni.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index 66858c65215d..53b656983da1 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -526,6 +526,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   {
>   	struct arm_ni_cd *cd = ni->cds + node->id;
>   	const char *name;
> +	static atomic_t id;
>   
>   	cd->id = node->id;
>   	cd->num_units = node->num_components;
> @@ -562,6 +563,11 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   		case NI_TMNI:
>   		case NI_CMNI:
>   			unit->pmusela = arm_ni_get_pmusel(ni, unit_base);
> +			if (!unit->pmusela) {

...However this is not about the PMU node anyway; this would represent 
the FCU at an interface node being missing. Again, it's possible for 
access to the FCU itself to be restricted, per the test below, but the 
subfeature ID registers should always be readable, and per the "Should 
be impossible" comment in arm_ni_get_pmusel(), the nodes that can 
generate PMU events should always include an FCU.

Could you please clarify some more details of what the exact situation 
is that you're trying to deal with here?

> +				dev_info(ni->dev, "No have PMU %d\n", cd->id);
> +				devm_kfree(ni->dev, cd->units);
> +				return 0;
> +			}
>   			writel_relaxed(1, unit->pmusela);
>   			if (readl_relaxed(unit->pmusela) != 1)
>   				dev_info(ni->dev, "No access to node 0x%04x%04x\n", unit->id, unit->type);
> @@ -591,7 +597,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
>   	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMCNTENCLR);
>   	writel_relaxed(U32_MAX, cd->pmu_base + NI_PMOVSCLR);
>   
> -	cd->irq = platform_get_irq(to_platform_device(ni->dev), cd->id);
> +	cd->irq = platform_get_irq(to_platform_device(ni->dev), atomic_fetch_inc(&id));

This is clearly wrong. Disregarding how badly it would go with multiple 
NI instances, even within a single instance I don';t think there's any 
obvious guarantee of a stable order. The firmware bindings are already 
defined, and that definition is not "the order in which a particular 
version of the Linux driver happens to parse things".

Thanks,
Robin.

>   	if (cd->irq < 0)
>   		return cd->irq;
>   


