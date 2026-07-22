Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BE2C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 14:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OoWM7pBOqa18SUex0sYevxYDNDoEu6I4WKgYnrqvYmU=; b=atxXudFAAVvTvj
	fG7aUMs7sgRogNItsx9vRnZR+87VCmI+qACBEFT7VPiMM+kWB579UIv4SzrWfZu0DIIBiCThW+Ifp
	q1Ihb1eccWE+XEBhDuqI2ZveKICSwnXzoDWubAEnmqjqs+h8AvNL277ysVbTzriwW1ge+OwZ2Y3dI
	RtvQ2hSyntDyOeGsg0BipvPR1cg6ZkfkZ74+gMjwjJIn1lzn6jVNvmBcndXxvoz2Z5nfsJtJKsrDd
	wjRssIzG5MbR9v+KDlQ95YqPo2Rt3wVT2mQQEPFvE1zumYmM+DO8VjKx/Rhgg9eSpfI1DE2jxeDQY
	fYqNBPlI3u74DPXo7iXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXeq-0000000Bzw3-0zhX;
	Wed, 22 Jul 2026 14:10:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXeo-0000000Bzvc-0Vyo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 14:10:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3977C1595;
	Wed, 22 Jul 2026 07:10:40 -0700 (PDT)
Received: from [10.1.34.163] (e121487-lin.cambridge.arm.com [10.1.34.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD39A3F59E;
	Wed, 22 Jul 2026 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784729444; bh=S3qDyxjCgWx/3CINJwgv8rZNPBp4TE92ksnKh5kY3JI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n97dv15VjEL6RFb+LRN5eVaXpOofHDU/53KyfAPBDSHnYb1lb8tX5roJQUHVzOL1v
	 M56fe/2IaGeYAE15vKTgU5rEDcxcz6IpCFZthadChhoLTIFTiwldxIO+5Kgutdlrof
	 w/PvS1DkWn8GICbF8q7T0YE2eXAR+UKpBCvTG3vM=
Message-ID: <343e3814-4da5-4d88-8bca-77d40089665a@arm.com>
Date: Wed, 22 Jul 2026 15:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 18/36] arm64: gicv3: remove GIC_PRIO_PSR_I_SET
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-19-vladimir.murzin@arm.com>
 <2b14daf3-576f-4b37-b233-e0e1e2c76f2d@huawei.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <2b14daf3-576f-4b37-b233-e0e1e2c76f2d@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_071046_258737_B6D177C0 
X-CRM114-Status: GOOD (  22.07  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 7/22/26 09:20, Jinjie Ruan wrote:
> 
> On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
>> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>>
>> `GIC_PRIO_PSR_I_SET` was used to keep track of sections of the kernel
>> where interrupts always need to reach the CPU and could not be masked
> Did I miss something? I have not seen this usage of GIC_PRIO_PSR_I_SET.
> In the kernel code I have observed, the use of GIC_PRIO_PSR_I_SET is
> always because the interrupt has already been masked by the DAIF.I bit.
> 

It attempts to describe the semantics of GIC_PRIO_PSR_I_SET. We
use it in cases where GIC_PRIO_IRQOFF is not possible. Instead,
we set DAIF.I and program PMR to GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET.

GIC_PRIO_PSR_I_SET lets us distinguish such cases from plain
GIC_PRIO_IRQON

>> via interrupt priorities, or DAIF bypassed the status of the PMR.
>>
>> This flag unmasked IRQs when OR'd to GIC_PRIO_IRQOFF and ensured that
> Did I miss something? I didn't see the code related to the OR'd to
> GIC_PRIO_IRQOFF.
> 

It describes concept of GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET, but wrongly
refers to GIC_PRIO_IRQOFF. I'll fix that.

> otherwise, LGTM
> Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> 

Thanks
Vladimir

>> that IRQs were seen as disabled by the `local_irqs_...` functions,
>> as they would only check the PMR if pseudo-NMIs were enabled.
>>
>> This is not needed anymore as our IRQ masking APIs now know how to handle
>> interrupt priorities properly and in parallel with DAIF : remove it.
>>
>> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
>> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
>> ---
>>  arch/arm64/include/asm/ptrace.h         | 2 --
>>  include/linux/irqchip/arm-gic-v3-prio.h | 8 --------
>>  2 files changed, 10 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
>> index 192eb97cd50b..c630165882e8 100644
>> --- a/arch/arm64/include/asm/ptrace.h
>> +++ b/arch/arm64/include/asm/ptrace.h
>> @@ -24,8 +24,6 @@
>>  #define GIC_PRIO_IRQON		GICV3_PRIO_UNMASKED
>>  #define GIC_PRIO_IRQOFF		GICV3_PRIO_IRQ
>>  
>> -#define GIC_PRIO_PSR_I_SET	GICV3_PRIO_PSR_I_SET
>> -
>>  /* Additional SPSR bits not exposed in the UABI */
>>  #define PSR_MODE_THREAD_BIT	(1 << 0)
>>  #define PSR_IL_BIT		(1 << 20)
>> diff --git a/include/linux/irqchip/arm-gic-v3-prio.h b/include/linux/irqchip/arm-gic-v3-prio.h
>> index 44157c9abb78..464bf1d29453 100644
>> --- a/include/linux/irqchip/arm-gic-v3-prio.h
>> +++ b/include/linux/irqchip/arm-gic-v3-prio.h
>> @@ -20,17 +20,11 @@
>>   * GICV3_PRIO_NMI is the PMR view of the priority of pseudo-NMIs. This can be
>>   * written to the PMR to mask pseudo-NMIs.
>>   *
>> - * On arm64 some code sections either automatically switch back to PSR.I or
>> - * explicitly require to not use priority masking. If bit GICV3_PRIO_PSR_I_SET
>> - * is included in the priority mask, it indicates that PSR.I should be set and
>> - * interrupt disabling temporarily does not rely on IRQ priorities.
>>   */
>>  #define GICV3_PRIO_UNMASKED	0xe0
>>  #define GICV3_PRIO_IRQ		0xc0
>>  #define GICV3_PRIO_NMI		0x80
>>  
>> -#define GICV3_PRIO_PSR_I_SET	(1 << 4)
>> -
>>  #ifndef __ASSEMBLER__
>>  
>>  #define __gicv3_prio_to_ns(p)	(0xff & ((p) << 1))
>> @@ -45,8 +39,6 @@ static_assert(__gicv3_prio_valid_ns(GICV3_PRIO_IRQ));
>>  static_assert(GICV3_PRIO_NMI < GICV3_PRIO_IRQ);
>>  static_assert(GICV3_PRIO_IRQ < GICV3_PRIO_UNMASKED);
>>  
>> -static_assert(GICV3_PRIO_IRQ < (GICV3_PRIO_IRQ | GICV3_PRIO_PSR_I_SET));
>> -
>>  #endif /* __ASSEMBLER */
>>  
>>  #endif /* __LINUX_IRQCHIP_ARM_GIC_V3_PRIO_H */
> 


