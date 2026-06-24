Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38497CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 22:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LitrfS+RJ8O8cGsTVU7cFsT1JjhcfhiARP+rjeg5MiY=; b=ik30m3+10iNmePkSv0ua+rOiAl
	+Y2Rwy69aj9d565uS/78crlFP6xrpJJGb4ZmZtkkWGX7U/ZrP0OzILHpqWla8x9ro3vXH11GoxXj9
	1m0Ohe0fHjHRJK3q78p6Pd3DAs+/5XzRpOYO3rzLeW0uowqEzKcwXKcjaRJZTgKxxz1u13KIuCx5X
	4rhh1OKhV8GtVGA3PMJc1PyoAkwPrqSaHYYcUqt3pz2UJPBmiWzB9HArmof2uXlyCviGPJPUqbkA2
	QGaVX5zvk2LIHhU5N+wt+WD/5uxctdGk7f89CgXpu/UAKb1Nvx6dBXa7MkRCdn46LUhgyUhSl/3Bd
	9kivUPTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcW1H-00000008OhZ-2weI;
	Wed, 24 Jun 2026 22:24:31 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcW1E-00000008OhA-2lf8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 22:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1782339192;
	bh=wkq+3W2fWEC7bjhwfGrR0IiAI2Lcq4cw5kgHSMEauzQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dcGXgBcvO7tRghjIOXtuBM7mTC/NTI/62SEd1Nz5fy3XUT+MNNVGqDGRRjBIAwAlz
	 XnSQbj2vTWa3ajWmb7aUfRam5ePkwpmU4cF2H1y/9nk7B/VTfw+lCFpnE3XSrS63KH
	 YMqB9fjam4WD+aUospgSWGXxoabWS+fGtDuSFWBQ=
Received: by gentwo.org (Postfix, from userid 1012)
	id 918C5402E2; Wed, 24 Jun 2026 15:13:12 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 8FCCA4006E;
	Wed, 24 Jun 2026 15:13:12 -0700 (PDT)
Date: Wed, 24 Jun 2026 15:13:12 -0700 (PDT)
From: Sayali Kulkarni <sk@gentwo.org>
To: Linu Cherian <linu.cherian@arm.com>
cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, will@kernel.org, ryan.roberts@arm.com, 
    yang@os.amperecomputing.com, cl@gentwo.org, sskulkarni@amperecomputing.com
Subject: Re: [PATCH v2] arm64: tlbflush: Reset active_cpu on ASID rollover
In-Reply-To: <ajQM4bkKfWdPowpM@a079125.arm.com>
Message-ID: <2ef3430f-fdea-aff0-b9fb-f4ff2427df93@gentwo.org>
References: <airWIxSd_a5kR65-@arm.com> <20260612232254.2856649-1-sk@gentwo.org> <ajQM4bkKfWdPowpM@a079125.arm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-556800636-1782339192=:3177764"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_152428_726769_BAEBF1BA 
X-CRM114-Status: GOOD (  31.30  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-556800636-1782339192=:3177764
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT


Thank you for catching this. After going through the patch again, I 
realize that the race is real. Resetting active_cpu to ACTIVE_CPU_NONE on 
rollover can leave it in an inconsistent state when stale entries still 
live. Note that the rollover state entries themselves aren’t the issue. 
Those are handled by the existing reserved_asids/tlb_flush_pending 
mechanism. It’s specifically active_cpu’s own record going inconsistent.

For v3, I am exploring handling active_cpu together with the generation so 
that the reset can’t open a NONE window. Doing it in the slow path after 
local flush and updating to the current CPU rather than NONE. Does that 
direction seem reasonable or is there a cleaner way to avoid the 
under-claim window? Will follow up with a patch once it’s figured out.

Thanks,
Sayali


On Thu, 18 Jun 2026, Linu Cherian wrote:

> Hi,
>
> On Fri, Jun 12, 2026 at 04:21:06PM -0700, Sayali Kulkarni wrote:
>> From: Sayali Kulkarni <sskulkarni@amperecomputing.com>
>>
>> Hi Catalin,
>>
>> Thank you for the review. I’ve addressed your feedback in v2:
>>
>> - Moved `WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE)` from `check_and_switch_context()` to `new_context()` after the `set_asid` label. At this point, a brand new ASID has been allocated that no CPU has ever used, so the reset is safe even for multi-threaded processes where other CPUs may still be running with the old ASID via `reserved_asids`.
>> - Updated the commit message to correct the safety reasoning: `flush_context()` only sets `tlb_flush_pending`; it does not issue a global TLB flush.
>>
>> Thanks,
>> Sayali
>>
>>
>> Once active_cpu flips to ACTIVE_CPU_MULTIPLE it never resets, even if
>> the process settles back to one CPU. Reset it to ACTIVE_CPU_NONE in
>> new_context() after a new ASID is allocated at the set_asid label.
>>
>> At this point a brand new ASID has been assigned that no CPU has ever
>> used, so ACTIVE_CPU_NONE accurately reflects reality. Any other threads
>> of the same process continue running with the old ASID via
>> reserved_asids and are unaffected.
>>
>> This gives processes a fresh chance at the local-only flush fast path
>> after each ASID generation rollover.
>>
>> Signed-off-by: Sayali Kulkarni <sskulkarni@amperecomputing.com> (Ampere)
>> ---
>>  arch/arm64/mm/context.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
>> index f34ed78393e0..46c7fd07b9bf 100644
>> --- a/arch/arm64/mm/context.c
>> +++ b/arch/arm64/mm/context.c
>> @@ -209,6 +209,7 @@ static u64 new_context(struct mm_struct *mm)
>>  set_asid:
>>  	__set_bit(asid, asid_map);
>>  	cur_idx = asid;
>> +	WRITE_ONCE(mm->context.active_cpu, ACTIVE_CPU_NONE);
>
> Can the above store race with the store to active_cpu in another thread,
> that updates it to ACTIVE_CPU_MULTIPLE ?
>
> Lets say we have two threads both initially running in CPU 0,
>
> Thread 1: Runs in CPU 0
>
> Encounters a rollover, updates mm->context.active_cpu to ACTIVE_CPU_NONE and
> updates mm->context.id to new asid.
>
> Thread 2: Scheduled to run on CPU 1 for the first time
>
> Observes the updated mm->context.id that belongs to the current
> generation(after the rollover) and hence proceeds to switch_mm_fastpath
> and ends up updating the active_cpu to ACTIVE_CPU_MULTIPLE.
>
> If Thread 1 and Thread 2 races, then active_cpu can get corrupted ?
>
> The reason this could be possible is that, write to active_cpu and
> mm->context.id can get reordered and we need to enforce ordering for
> correctness ?
>
> Do you see this as a valid scenario ?
>
> --
> Thanks,
> Linu Cherian.
>
>
>
>
>
>
>
>
>
>
--8323329-556800636-1782339192=:3177764--

