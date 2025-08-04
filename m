Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB798C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 21:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XB7C6/aVnnrbQ/dUBJlr2CzVvr6Wjm81eqZRGMZX1w=; b=aL52OuWY/8HlWbOOyXaXRVWx7Q
	h0zunE4w6njQk+mzeTcTHZXQ9f6og9K5UunSNRm+ZbfaqeEvfkUrq0x6vjVTTpyPbgh54zRXPuuAj
	Y/KPND1q9LwHQRFU0ixpwqmJcefatRtasYuIxGDfhtmJfp/WYsSyr4uj56i3Hv+vI00rqwcEcjvjC
	ng37HtcwNa/Bw5XcSkAaGlx7/JBiQdS1+p20uaXv2lebgdQtQH8qtFMIFdL7EmCcaFAq2fJrOYcnL
	4uhCYu4OanO4h77xaWomMK4Fh0eGb8W7QHRTPLMQPbsdNpOGrE0KrmDdppIEwqnMLYm52DIr+RULV
	U4bUqdbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj367-0000000BMhU-0FDR;
	Mon, 04 Aug 2025 21:51:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj33Y-0000000BMXw-2EP2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 21:49:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AAD12574;
	Mon,  4 Aug 2025 14:49:09 -0700 (PDT)
Received: from [10.57.5.104] (unknown [10.57.5.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 591BE3F673;
	Mon,  4 Aug 2025 14:49:15 -0700 (PDT)
Message-ID: <e5193801-9160-4e05-8d02-eb129487437c@arm.com>
Date: Mon, 4 Aug 2025 22:49:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] perf: arm_spe: Add support for SPE VM interface
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>,
 Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Rob Herring <Rob.Herring@arm.com>, Robin Murphy <Robin.Murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
References: <20250701-james-spe-vm-interface-v1-0-52a2cd223d00@linaro.org>
 <aIzA632hiAldjJQQ@raptor> <a492ccbf-6442-44dc-82c8-d2c8b1d5c56b@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <a492ccbf-6442-44dc-82c8-d2c8b1d5c56b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_144920_647250_3D1309D6 
X-CRM114-Status: GOOD (  48.23  )
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

On 04/08/2025 17:00, James Clark wrote:
> 
> 
> On 01/08/2025 2:28 pm, Alexandru Elisei wrote:
>> Hi,
>>
>> On Tue, Jul 01, 2025 at 04:31:56PM +0100, James Clark wrote:
>>> SPE can be used from within a guest as long as the driver adheres to the
>>> new VM interface spec [1]. Because the driver should behave correctly
>>> whether it's running in a guest or not, the first patches are marked as
>>> a fix. Furthermore, in future versions of the architecture the PE will
>>> be allowed to behave in the same way.
>>>
>>> The last patch adds new behavior to make it easier for guests to be
>>> able to reserve large buffers. It's not strictly necessary, so it's not
>>> marked as a fix.
>>
>> I had a look at the patches, and they all look ok to me, so for the 
>> series:
>>
>> Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
>>
>> I also tested the series by hacking SPE virtualization support in KVM:
>>
>> - without these changes, the SPE driver gets into an infinite loop 
>> because it
>>    clears PMBSR_EL1.S before clearing PMBLIMITR_EL.E, and the 
>> hypervisor is
>>    allowed to ignore the write to PMBSR_EL1.
>>
>> - with these changes, that doesn't happen.
>>
>> - ran perf for about a day in a loop in a virtual machine and didn't 
>> notice
>>    anything out of the ordinary.
>>
>> - ran perf for about a day in a loop on baremetal and similary 
>> everything looked
>>    alright.
>>
>> - checked that the SPE driver correctly decodes the maximum buffer 
>> size for
>>    sizes 4M, 2M (2M is right at the boundary between the two encoding 
>> schemes)
>>    and 1M; that's also correctly reflected in
>>    /sys/devices/platform/<spe>/arm_spe_0/caps/max_buffer_size.
>>
>> - checked that perf is not allowed to use a buffer larger than the 
>> maximum.
>>
>> - checked that the SPE driver correctly detects a buffer size 
>> management event.
>>
>> So:
>>
>> Tested-by: Alexandru Elisei <alexandru.elisei@arm.com>
>>
>> While testing I noticed two things:
>>
>> 1. When perf tries to use a buffer larger than the maximum, the error 
>> is EINVAL
>> (22):
>>
>> # cat /sys/devices/platform/spe/arm_spe_0/caps/max_buff_size
>> 4194304
>> # perf record -ae arm_spe// -m,16M -- sleep 10
>> failed to mmap with 22 (Invalid argument)
>>
>> (used 16M as the buffer size because what the driver ends up 
>> programming is half
>> that).
>>
>> I would have expected to get back ENOMEM (12), that seems less 
>> ambiguous to me.
>> I had to hack the driver to print an error message to dmesg when the 
>> max buffer
>> size is exceed to make sure that's why I was seeing the error message 
>> in perf,
>> and it wasn't because of something else. I get that that's 
>> because .setup_aux()
>> can only return NULL on error, but feels like there's room for 
>> improvement here.
>>
> 
> We could add an error code, rb_alloc_aux() already returns one and that 
> calls setup_aux(). But the scenarios would be either EINVAL or ENOMEM 
> and wouldn't give the user the exact reason ("need > 2 pages", "need 
> even number of pages", etc). So I'm not sure it would be enough of an 
> improvement over returning NULL to be worth it.
> 
> However I will add a warning into Perf if the user asks for more than 
> caps/max_buffer_size. That would be a useful message and Perf can do it 
> itself so it doesn't need to be in the driver changes.
> 
>> 2. A hypervisor is allowed to inject a buffer size event even though 
>> the buffer
>> set by the guest is smaller than the maximum advertised. For example, 
>> this can
>> happen if there isn't enough memory to pin the buffer, or if the limit 
>> on pinned
>> memory is exceeded in the hypervisor (implementation specific 
>> behaviour, not
>> mandated in DEN0154, of course).
>>
>> In this situation, when the SPE driver gets a buffer size management 
>> event
>> injected by the hypervisor, there is no way for the driver to 
>> communicate it to
>> the perf instance, and the profiled process continues executing even 
>> though
>> profiling has stopped.
>>
>> That's not different from what happens today with buffer management 
>> events, but
>> unlike the other events, which aren't under the control of userspace, 
>> the buffer
>> size event is potentially recoverable if userspace restarts perf with 
>> a smaller
>> buffer.
>>
>> Do you think there's something that can be done to improve this 
>> situation?
>>
>> Thanks,
>> Alex
>>
> 
> It doesn't look like there's currently anything that can stop an event 
> or signal to Perf that the event has gone bad.
> 
> We could add something like "__u32 error" to struct 
> perf_event_mmap_page. But I'm not sure what you'd do with it. If Perf is 
> the parent of the process you wouldn't want to kill it in case anything 
> bad happens. So you're left with leaving it running anyway. If it's just 
> an error message that you want then there's already one in dmesg for 
> buffer management errors, and that string is a lot better than a single 
> code. Unless these new codes were detailed PMU specific ones? Actually 
> it's a whole page so why not make it a string...
> 
> It's not a case of the samples ending randomly somewhere though, you'll 
> either get all of them or none of them. So it will be quite obvious to 
> the user that something has gone wrong. Secondly I think the scenario of 
> not being able to pin memory when asking for less than the limit would 
> be very rare. It's probably fine to leave it like this for now and we 
> can always add something later, maybe if people start to run into it for 
> real.

Do we get EMPTY AUX records in this case where there was no profiling
data ? If so, why not convey the error via AUX record header flags ?

Suzuk

> 
> James
> 
> 


