Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6196DC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/5yH86xsu//oeNJeut1I4traXhSlmHdb3iC2ghKsiA=; b=i1RqY+Gqndeb7aw9BauVckCymA
	TBH/m4dAF8YXNAZt73z7leA362Mw0oppabB3f744h4Cog5ygL3YSp0vYv/GSjz7yCwII+eESAlIWS
	O9PTVC6nvfKUyfIyNAXprOCXVVn2VfRLIlNuZDrt1W/TCEAE4j5RXsq9wLJzVX21lIQfSppHW1B7K
	+plhL99TUI3w2stHO65Ox4rGdZpEB6XdoEKwgjHGc3El9eEHuOiOtoBfQvKxx6snZSLtA9Nta9E/g
	4VepC9sNvXhwM34FvoHias215lHdVF4XY0fCiCJIETKtl/3cGfX1lnyxo+tbSnFLvSGtvIMFU3zDN
	HXX9tE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqTV-0000000HNSN-2kGq;
	Mon, 21 Jul 2025 13:22:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udosv-0000000H9RK-3tMC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:40:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DD54153B;
	Mon, 21 Jul 2025 04:40:34 -0700 (PDT)
Received: from [10.57.30.25] (unknown [10.57.30.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 265A13F6A8;
	Mon, 21 Jul 2025 04:40:39 -0700 (PDT)
Message-ID: <607c03a2-267c-46e6-a7fa-e733c1970e60@arm.com>
Date: Mon, 21 Jul 2025 12:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] coresight: Appropriately disable programming
 clocks
Content-Language: en-GB
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-4-0ce0009c38f8@arm.com>
 <5a5f1355-563d-498a-9dec-3479a257b3e6@arm.com>
 <20250721104834.GC3137075@e132581.arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250721104834.GC3137075@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_044046_018444_BFDBEE5A 
X-CRM114-Status: GOOD (  13.45  )
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

On 21/07/2025 11:48, Leo Yan wrote:
> On Mon, Jul 21, 2025 at 10:15:22AM +0100, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>> index 4ac65c68bbf44b98db22c3dad2d83a224ce5278e..dd2b4cc7a2b70cf060a3207548fe80e3824c489f 100644
>>> --- a/include/linux/coresight.h
>>> +++ b/include/linux/coresight.h
>>> @@ -480,26 +480,16 @@ static inline bool is_coresight_device(void __iomem *base)
>>>     * Returns:
>>>     *
>>>     * clk   - Clock is found and enabled
>>> - * NULL  - clock is not found
>>
>> This is still valid, right ?
> 
> No. Since this patch uses devm_clk_get_enabled() to get a clock, if the
> pclk is not found, it returns -ENOENT (see of_parse_clkspec()).
> 
> Only the optional clock APIs (e.g., devm_clk_get_optional_enabled())
> return a NULL pointer instead of -ENOENT when the clock is not found.

This will break ACPI based systems, as we may not have a "pclk" 
described for them. We should be able to tolerate "no pclk"

Suzuki


> 
> Thanks,
> Leo


