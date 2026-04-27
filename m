Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C732CFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u54jw5Cog2JjhNp/6oy6nebS+UqX05qjDI/YnKFk22w=; b=t7Is82Q2CKdSDJj52BQKpcE6s/
	yhzeO3StsOVUflvSIGIM5qGKJQDYZIjGKEWAdbDCKK02evpc58rASwv8a/lbASXgELMLhPtsFEtP1
	hOufrFlIjxkCUyKddyxqoNAp+0XyRRq892txSECl9F00dITWFh03FTMhrT62peCUu/7dDI+Fp054H
	lEjmPH1rZISvQCXa5WQtU65S+eBueWqn3Sq5RBztAA59ZSPXMYMlS5JtLXn/BOu9zgNGBUbPJIkKn
	U9QTO/NvXyec507QQPRo8BZRIEegi/G+pm89ogfUsReZAoH1cQces3KRchr/lKPIaJmJph79E2hxa
	0K71arxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOiU-0000000HLww-3vkF;
	Mon, 27 Apr 2026 16:21:50 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOiS-0000000HLuO-1OEN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u54jw5Cog2JjhNp/6oy6nebS+UqX05qjDI/YnKFk22w=; b=eVOtN1viGyys83lB43W6Ku2d5F
	bjCInqloYEcWOlGmsXDY20xDDHv4r77nRSOEtaq2uMt5UCXrfwO6hXnCBjniq0Kv2nWuhxP2vuChd
	QskPuJp/yrs90fgvcSpyVpCc+D8osJyIv3/LKhXqQmfAuprRB7TqSQNRrDGN3asunIVfF/+i71O3u
	/UODlPZi1aBStOf2ix6eEAnI+z6AIvvfgcZHp9A0dZXLvD95qfuFKiRT8DLVUAa/Y48+2srU4JLmD
	HErx7EwdmcNCaobmDzFXb2SrH0Ez+VizDwTqs2idRCSeE67ZmDcmxMZnDs8gPMwr1j4V4+gijU5xg
	EF7gTQ0Q==;
Received: from [187.57.76.96] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wHOhs-0030Ib-89; Mon, 27 Apr 2026 18:21:11 +0200
Message-ID: <d608b534-d266-43eb-9adb-908d9c495508@igalia.com>
Date: Mon, 27 Apr 2026 13:20:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/2] arm64: vdso: Prepare for robust futex unlock
 support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Carlos O'Donell <carlos@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Florian Weimer <fweimer@redhat.com>, Rich Felker <dalias@aerifal.cx>,
 Torvald Riegel <triegel@redhat.com>, Darren Hart <dvhart@infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uros Bizjak <ubizjak@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 kernel-dev@igalia.com
References: <20260424-tonyk-robust_arm-v2-0-db4e46f752cf@igalia.com>
 <20260424-tonyk-robust_arm-v2-1-db4e46f752cf@igalia.com>
 <f8e83a24-0b04-4c88-9f67-0879875be25c@t-8ch.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <f8e83a24-0b04-4c88-9f67-0879875be25c@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_092148_381528_CE7369DE 
X-CRM114-Status: GOOD (  22.82  )
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

Em 26/04/2026 15:07, Thomas Weißschuh escreveu:
> Hi André,
> 
> Some more comments, after doing an actual proper review.
> 
> On 2026-04-24 15:56:00-0300, André Almeida wrote:
>> There will be a VDSO function to unlock non-contended robust futexes in
>> user space. The unlock sequence is racy vs. clearing the list_pending_op
>> pointer in the task's robust list head. To plug this race the kernel needs
>> to know the critical section window so it can clear the pointer when the
>> task is interrupted within that race window. The window is determined by
>> labels in the inline assembly.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>> Changes from v1:
>>   - Fixed linker not finding VDSO symbols
>> ---
>>   arch/arm64/kernel/vdso.c          | 30 ++++++++++++++++++++++++++++++
>>   arch/arm64/kernel/vdso/vdso.lds.S |  7 +++++++
>>   2 files changed, 37 insertions(+)
> 
> What is the reason for splitting the series into two patches?
> To me it looks like it should be one patch.

I've followed how tglx split his series ("x86/vdso: Prepare for robust 
futex unlock support", "x86/vdso: Implement 
__vdso_futex_robust_try_unlock()"), but I don't have a strong opinion on 
this matter, both options seems fine to me.

> 
>> diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
>> index 592dd8668de4..f9c520a1c942 100644
>> --- a/arch/arm64/kernel/vdso.c
>> +++ b/arch/arm64/kernel/vdso.c
>> @@ -11,6 +11,7 @@
>>   #include <linux/clocksource.h>
>>   #include <linux/elf.h>
>>   #include <linux/err.h>
>> +#include <linux/futex.h>
>>   #include <linux/errno.h>
>>   #include <linux/gfp.h>
>>   #include <linux/kernel.h>
>> @@ -57,6 +58,33 @@ static struct vdso_abi_info vdso_info[] __ro_after_init = {
>>   #endif /* CONFIG_COMPAT_VDSO */
>>   };
>>   
>> +#ifdef CONFIG_FUTEX_ROBUST_UNLOCK
>> +static void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm)
>> +{
>> +	unsigned long vdso = (unsigned long) mm->context.vdso;
>> +	struct futex_mm_data *fd = &mm->futex;
>> +	uintptr_t success, end;
>> +
>> +	if (abi == VDSO_ABI_AA64) {
>> +		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_success);
>> +		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list64_try_unlock_cs_end);
>> +
>> +		futex_set_vdso_cs_range(fd, 0, vdso, success, end, false);
> 
> Both VDSO_SYMBOL() and futex_set_vdso_cs_range() add the vdso base
> address to the symbol offsets. The value stored in .start_ip will be
> wrong. The fact that futex_set_vdso_cs_range() does the addition looks
> like an artifact of it being written for x86 first. IMO its interface
> should be changed not to do the addition internally.
> 

Got it, so for x86 we would need to explicitly add the base address on 
the caller and remove from futex_set_vdso_cs_range()

>> +	}
>> +
>> +#ifdef CONFIG_COMPAT_VDSO
>> +	if (abi == VDSO_ABI_AA32) {
>> +		success = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_success);
>> +		end = (uintptr_t) VDSO_SYMBOL(vdso, futex_list32_try_unlock_cs_end);
>> +
>> +		futex_set_vdso_cs_range(fd, 1, vdso, success, end, true);
>> +	}
>> +#endif
>> +}
>> +#else
>> +static inline void vdso_futex_robust_unlock_update_ips(enum vdso_abi abi, struct mm_struct *mm) { }
>> +#endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
>> +
>>   static int vdso_mremap(const struct vm_special_mapping *sm,
>>   		struct vm_area_struct *new_vma)
>>   {
> 
> (...)


