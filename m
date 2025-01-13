Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A011BE7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 10:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDD8F3n8IqS7fSnTDhSsRHAqe//TFWttQaM/VdPwaQI=; b=JlgIrK0AqIA8QLZbGGb/FoTO+9
	IDZDuS/slIkg7Cs1vtGqrM4x12Z+PCTbkAr0E5txBVXtk0OkdYjvw/Y0n5VNXRC3RBNwEOhQF7EsS
	Kx35RkzZORNUWxSBivlSlRBzYcbF233RHBdD8U/rTnf5igh3DK8TleIgBxP/5IaZjcxMpJoAe/832
	wV6+AtLlfQrN7BPwOSQWDq2m5MK76OqLmQUvCM6CWcq2EQwANgXRK195WNZ26/hh69zvmr4eRFR8d
	14BKOiYhnTw9L3xFGuoa4u5lQmwA7rdhKfOKrO5mM3UNE1xTBrz+fcCkK15abgG2FY8UJCbjCUq5y
	EMPOoHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHQR-00000004kmZ-37jj;
	Mon, 13 Jan 2025 10:12:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXHPB-00000004kY0-2nHF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 10:10:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF80D1424;
	Mon, 13 Jan 2025 02:11:10 -0800 (PST)
Received: from [10.57.94.36] (unknown [10.57.94.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B2183F66E;
	Mon, 13 Jan 2025 02:10:36 -0800 (PST)
Message-ID: <83b57cc5-fe6f-483b-b7e3-8d6e356c914f@arm.com>
Date: Mon, 13 Jan 2025 11:10:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/15] pkeys-based page table hardening
To: Dave Hansen <dave.hansen@intel.com>, linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Kees Cook <kees@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org
References: <20250108103250.3188419-1-kevin.brodsky@arm.com>
 <dcc1800c-cf0a-4d88-bc88-982f0709b382@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <dcc1800c-cf0a-4d88-bc88-982f0709b382@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_021045_754897_93318AE9 
X-CRM114-Status: GOOD (  18.27  )
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

On 09/01/2025 17:30, Dave Hansen wrote:
> One of the sticker things in the x86 attempt to do the same thing was
> context switching, both between normal tasks and in/out of exceptions
> and interrupts.
>
> The easiest place this manifested for us was code chunk like this:
>
> 	kpkeys_set_level(KPKEYS_LVL_PGTABLES);
> 	// modify page tables here
> 	kpkeys_restore_pkey_reg();
>
> We had to make sure that we didn't get preempted and context switch over
> to some other task that _wasn't_ doing page table manipulation while
> page table writes were allowed.
>
> On x86, we had to basically start context-switching the kernel pkey
> register the same way we do GPRs.
>
> How is SYS_POR_EL0 being context switched?

I think this is pretty much the same situation with POR_EL1 on arm64. I
mentioned on the cover letter that resetting POR_EL1 on exception entry
is required (and not done yet), but in fact as you say it also needs to
be context-switched per-thread. This does sound pretty similar to GPRs
(unlike POR_EL0, which is switched in __switch_to() like the user TLS
register for instance).

Is there a particular concern about that extra switching? I don't expect
it to be a significant cost on arm64. In the vast majority of cases,
POR_EL1 will remain set to its default value, meaning that the overhead
is limited to reading POR_EL1, a load and a branch. The only situation
where an expensive write to POR_EL1 is needed is an interrupt firing
right in the middle of a page table setter - possible but pretty
unlikely. Writing to POR_EL1 on exception return isn't really a concern
either, as no additional barrier (ISB) is required in that case.

By the way thank your for mentioning the x86 attempt, I wasn't aware of
it. I'll have a better look and make sure to Cc anyone involved in that
work in future versions.

- Kevin

