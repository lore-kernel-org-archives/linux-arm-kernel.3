Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B7DEC111A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49ZdfYUmuiKFw4I1m8NQ5iSXMDc75p/1mJTRCageK7g=; b=FLUxPq1ZcwuLQsvWDxNbQGhPpL
	ulCHpz1tmcPuSq82kb2TsIy6xK/YW9wb4c5xrSfY7eZck8ZGsNJR5PEruFAYIZpIXfQ57b2miT0YM
	O4mwrepoH4v1E6q/ogcZV9qDW7gBFKJ4XPorJzdQ3Pw3Kx0mEJAEk+axhPshlrQH5baFtHWE/ox5s
	8p4p/iQXRvDNmWuEm8FU+GwraPoVXipXvuFUikF6pewA9ie4cLZQ0FHNynaq6qW2EIEMt+E0cTmai
	ELQQsT4ncvleHTvLqc8lsKt35wuF2Lck95oyNoKy4Nv8ojteUjtbwSxKUZlhXbdXtmThdb4l7jGg3
	7uoLyxgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaVs-00000000r6e-2XSa;
	Mon, 23 Feb 2026 18:18:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaVp-00000000r5a-2zin
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 18:18:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 048A5339;
	Mon, 23 Feb 2026 10:18:22 -0800 (PST)
Received: from [10.57.13.34] (unknown [10.57.13.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFDBE3F62B;
	Mon, 23 Feb 2026 10:18:26 -0800 (PST)
Message-ID: <f62d7cab-883c-44a8-9714-251af1b20eff@arm.com>
Date: Mon, 23 Feb 2026 18:18:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] arm64: Add logic to fully remove features from
 sanitised id registers
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>, Fuad Tabba <tabba@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
References: <20260219195533.2455736-1-maz@kernel.org>
 <20260219195533.2455736-2-maz@kernel.org>
 <CA+EHjTzVRq3r-7UR-MJYvv-Aw4kHQDHEmwtqY9is-fRDm-J06A@mail.gmail.com>
 <86v7frafpx.wl-maz@kernel.org>
 <CA+EHjTzj9wEm7oBKBXF8sYpK60FYeLOJwEapxDiO1HxK5e6Y6g@mail.gmail.com>
 <86tsvba2nc.wl-maz@kernel.org>
 <CA+EHjTyiHALTEgA7tuqQZ2ZLW3_vFdTU=vUb7+vn1T4OoMjgsw@mail.gmail.com>
 <86pl5vaizb.wl-maz@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <86pl5vaizb.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_101829_876014_6CA69CC5 
X-CRM114-Status: GOOD (  18.46  )
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

On 23/02/2026 09:48, Marc Zyngier wrote:
> Hi Fuad,
> 
> On Fri, 20 Feb 2026 15:36:37 +0000,
> Fuad Tabba <tabba@google.com> wrote:
>>
>>> I think we must prevent this downgrade the same way, meaning that
>>> ALL_HIDDEN and FTR_HIGHER are mutually exclusive.
>>>
>>> How about that:
>>>
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index d58931e63a0b6..2cae00b4b0c5f 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -1067,7 +1067,14 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>>>                          user_mask |= ftr_mask;
>>>                          break;
>>>                  case FTR_ALL_HIDDEN:
>>> -                       val = arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
>>> +                       /*
>>> +                        * ALL_HIDDEN and HIGHER_SAFE are incompatible.
>>> +                        * Only hide from userspace, and log the oddity.
>>> +                        */
>>> +                       if (WARN_ON(ftrp->type == FTR_HIGHER_SAFE))
>>> +                               val = arm64_ftr_set_value(ftrp, val, ftr_new);
>>> +                       else
>>> +                               val = arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
>>>                          reg->user_val = arm64_ftr_set_value(ftrp,
>>>                                                              reg->user_val,
>>>                                                              ftrp->safe_val);
>>>
>>
>> Yes, I think WARN_ON() here is the right call.
>>
>> That said, I still think you should explicitly short-circuit
>> update_cpu_ftr_reg() for FTR_ALL_HIDDEN features, in addition to the
>> WARN_ON(). Relying on arm64_ftr_safe_value() to naturally preserve the
>> safe_val during secondary CPU boot seems mathematically fragile.
>>
>> Take MTE_frac as an example. It uses S_ARM64_FTR_BITS and
>> FTR_LOWER_SAFE with a safe_val of 0. If it were marked FTR_ALL_HIDDEN,
>> init_cpu_ftr_reg() would prime sys_val with 0. But if a secondary CPU
>> boots and reports -1 (NI), arm64_ftr_safe_value() will execute min(-1,
>> 0) and return -1. update_cpu_ftr_reg() will then overwrite the primed
>> safe_val (0) with -1. The "hidden" state established by the boot CPU
>> is gone, and the feature's hardware state is now exposed globally.
>>
>> Note that MTE is currently ALL_HIDDEN when configured out, so it's not
>> totally inconceivable that someone decides to make MTE_frac ALL_HIDDEN
>> as well. Explicitly short-circuiting for FTR_ALL_HIDDEN features in
>> update_cpu_ftr_reg() seems to be the safer bet here.
> 
> Right, the signed feature is a pretty compelling argument. And we
> should do the same thing for overrides, probably as a preliminary
> patch.
> 

Suggestions look good to me and I was thinking on similar lines with the 
FTR_CONFIG() (Was away last week, now back from holidays).

One minor nit: Given we now have more uses
of arm64_ftr_set_value(ftrp, x, ftrp->safe_value) , could we wrap it
into something like :

static inline s64 arm64_ftr_set_safe_value(... *ftrp, s64 val);
{
	return arm64_ftr_set_value(ftrp, val, ftrp->safe_val);
}

To me that makes it way easier to comprehend what we are doing.

Suzuki


  Thanks,
> 
> 	M.
> 


