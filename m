Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B50C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 01:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWJkZA3lovYlrfOOXADq4dia+O8jwG9XD6HUM1kSDa0=; b=qddnesxSBUS1MzCTJ+wbUcnoZv
	YkLrRodFIMmRKilittksyeKis7NnqOaA3sPCuimgCeEaEJC/go3+cVfXDILjUj08DJ3lofcuJ2QtX
	ZnjmfFERdZB4lxt+U2aRzHKMYxqlIHkHaov+8YQaT06j8KgvGsAV19SBiWVFAQdi3hnp4RTY+94eo
	FnSf2Q75GEINXAARoKhapXhl7SxnOr2mqLAGk1C4GCwl22AfsoQv8dWLwdkPUEYqmkSrhYXg4B29l
	zXxfZ/768VKUxi9AguIdTDghLxo+HpzZyMU1qWxV1xivj+ntTr8JbGIv8v3Fprm52epyc2cWnPArA
	kzEJQM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukBpM-00000001mhv-388v;
	Fri, 08 Aug 2025 01:23:24 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukBmo-00000001mUv-0nPW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 01:20:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4bymLM5xB7z14MC1;
	Fri,  8 Aug 2025 09:15:39 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id CC83F180080;
	Fri,  8 Aug 2025 09:20:36 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 8 Aug 2025 09:20:30 +0800
Message-ID: <c8e3dc2c-617b-2988-10ff-88082370e787@huawei.com>
Date: Fri, 8 Aug 2025 09:20:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v7 22/31] irqchip/gic-v5: Add GICv5 LPI/IPI support
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
	<sascha.bischoff@arm.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Maydell
	<peter.maydell@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Jiri Slaby
	<jirislaby@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-pci@vger.kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703-gicv5-host-v7-22-12e71f1b3528@kernel.org>
 <cc611dda-d1e4-4793-9bb2-0eaa47277584@huawei.com>
 <aJSvUWRqLEiARDIW@lpieralisi>
Content-Language: en-US
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aJSvUWRqLEiARDIW@lpieralisi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_182046_934687_D3C3E503 
X-CRM114-Status: GOOD (  22.40  )
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



On 2025/8/7 21:51, Lorenzo Pieralisi wrote:
> On Thu, Aug 07, 2025 at 07:52:58PM +0800, Jinjie Ruan wrote:
>>
>>
>> On 2025/7/3 18:25, Lorenzo Pieralisi wrote:
>>> An IRS supports Logical Peripheral Interrupts (LPIs) and implement
>>> Linux IPIs on top of it.
>>>

[...]

>>> +static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data,
>>> +					    unsigned int lpi_id_bits,
>>> +					    unsigned int istsz)
>>> +{
>>> +	size_t l2istsz;
>>> +	u32 n, cfgr;
>>> +	void *ist;
>>> +	u64 baser;
>>> +	int ret;
>>> +
>>> +	/* Taken from GICv5 specifications 10.2.1.13 IRS_IST_BASER */
>>> +	n = max(5, lpi_id_bits + 1 + istsz);
>>> +
>>> +	l2istsz = BIT(n + 1);
>>> +	/*
>>> +	 * Check memory requirements. For a linear IST we cap the
>>> +	 * number of ID bits to a value that should never exceed
>>> +	 * kmalloc interface memory allocation limits, so this
>>> +	 * check is really belt and braces.
>>> +	 */
>>> +	if (l2istsz > KMALLOC_MAX_SIZE) {
>>> +		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
>>> +
>>> +		pr_warn("Limiting LPI ID bits from %u to %u\n",
>>> +			lpi_id_bits, lpi_id_cap);
>>> +		lpi_id_bits = lpi_id_cap;
>>> +		l2istsz = KMALLOC_MAX_SIZE;
>>> +	}
>>> +
>>> +	ist = kzalloc(l2istsz, GFP_KERNEL);
>>
>>
>> When kmemleak is on, There is a memory leak occurring as below:
>>
>>
>> unreferenced object 0xffff00080039a000 (size 4096):
>>   comm "swapper/0", pid 0, jiffies 4294892296
>>   hex dump (first 32 bytes):
>>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>>   backtrace (crc 0):
>>     kmemleak_alloc+0x34/0x40
>>     __kmalloc_noprof+0x320/0x464
>>     gicv5_irs_iste_alloc+0x1a4/0x484
>>     gicv5_irq_lpi_domain_alloc+0xe4/0x194
>>     irq_domain_alloc_irqs_parent+0x78/0xd8
>>     gicv5_irq_ipi_domain_alloc+0x180/0x238
>>     irq_domain_alloc_irqs_locked+0x238/0x7d4
>>     __irq_domain_alloc_irqs+0x88/0x114
>>     gicv5_of_init+0x284/0x37c
>>     of_irq_init+0x3b8/0xb18
>>     irqchip_init+0x18/0x40
>>     init_IRQ+0x104/0x164
>>     start_kernel+0x1a4/0x3d4
>>     __primary_switched+0x8c/0x94
> 
> Thank you for reporting it.
> 
> It should be a false positive, we hand over the memory to the GIC but
> never store the pointer anywhere (only its PA).
> 
> Patch below should "fix" it - well, it is obvious, we are telling
> kmemleak to ignore the pointer value:

I also did not see any place in the code where these pointers are
accessed, nor did I see in section "L2_ISTE, Level 2 interrupt state
table entry" that L2_ISTE can be accessed by software. So, are these
states of the LPI interrupt maintained by the GIC hardware itself?

> 
> -- >8 --
> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> index ad1435a858a4..e8a576f66366 100644
> --- a/drivers/irqchip/irq-gic-v5-irs.c
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -5,6 +5,7 @@
>  
>  #define pr_fmt(fmt)	"GICv5 IRS: " fmt
>  
> +#include <linux/kmemleak.h>
>  #include <linux/log2.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -117,6 +118,7 @@ static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data
>  		kfree(ist);
>  		return ret;
>  	}
> +	kmemleak_ignore(ist);
>  
>  	return 0;
>  }
> @@ -232,6 +234,7 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>  		kfree(l2ist);
>  		return ret;
>  	}
> +	kmemleak_ignore(l2ist);
>  
>  	/*
>  	 * Make sure we invalidate the cache line pulled before the IRS
> 

