Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE3FD61010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vIz/+8z3rnDPY9S+cxoi/Fyylr8WD+2fcmnrN7ghw5Q=; b=V4ChON3PZ3BGLT/ONvGFMYtmMb
	OMSOdkg6WOKXQtB3P72DKwqTwWUAzz7P/QbIkA74+s+UbOVuXQot3YBPC4pthMoxrHnJxOciv0aSt
	2PmsJwKxU4h6EFLPUmVJgwUUCJ0mTHbCQm2h5ODmVSqaYoiXeTFxi4xJ64/tLE56r8ZcBPl9Bfbj7
	DsX3XdNN1cmFMZPQyFtySEnBY2kuMl+kb9kqcNQ6UxNnGmfI9xU4q2JIn45yTRq6BEKA9LHFePJta
	Li6xFr745AAwlV3iJBkAhXWEf2/ezODgWstjoCAIqKKR5Tw4nQSzmlWgOHoXnzbheT0uyZy4F+J7l
	63A8jJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQmv-000000004a2-0XiZ;
	Thu, 29 Jan 2026 12:06:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQms-000000004Zd-2qQ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 12:06:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08B4F1516;
	Thu, 29 Jan 2026 04:06:03 -0800 (PST)
Received: from [10.44.160.76] (e126510-lin.lund.arm.com [10.44.160.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0126B3F632;
	Thu, 29 Jan 2026 04:06:02 -0800 (PST)
Message-ID: <6e3f5e61-a7d2-4d14-85fa-904cde856f34@arm.com>
Date: Thu, 29 Jan 2026 13:06:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 01/14] entry: Remove unused syscall in
 syscall_trace_enter()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, akpm@linux-foundation.org, charlie@rivosinc.com,
 ldv@strace.io, mark.rutland@arm.com, anshuman.khandual@arm.com,
 song@kernel.org, ryan.roberts@arm.com, thuth@redhat.com,
 ada.coupriediaz@arm.com, broonie@kernel.org, pengcan@kylinos.cn,
 liqiang01@kylinos.cn, kmal@cock.li, dvyukov@google.com,
 reddybalavignesh9979@gmail.com, richard.weiyang@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
 <20260128031934.3906955-2-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260128031934.3906955-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_040614_771705_D9393B0E 
X-CRM114-Status: GOOD (  12.99  )
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

On 28/01/2026 04:19, Jinjie Ruan wrote:
> The 'syscall' argument in syscall_trace_enter() is immediately overwritten
> before any real use and serves only as a local variable, so drop
> the parameter.
>
> No functional change intended.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

In commit title: s/syscall/parameter/ (very confusing otherwise!)

With that fixed:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  include/linux/entry-common.h  | 4 ++--
>  kernel/entry/syscall-common.c | 5 ++---
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index 87efb38b7081..e4a8287af822 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -45,7 +45,7 @@
>  				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
>  				 ARCH_SYSCALL_WORK_EXIT)
>  
> -long syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long work);
> +long syscall_trace_enter(struct pt_regs *regs, unsigned long work);
>  
>  /**
>   * syscall_enter_from_user_mode_work - Check and handle work before invoking
> @@ -75,7 +75,7 @@ static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *re
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  
>  	if (work & SYSCALL_WORK_ENTER)
> -		syscall = syscall_trace_enter(regs, syscall, work);
> +		syscall = syscall_trace_enter(regs, work);
>  
>  	return syscall;
>  }
> diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
> index 940a597ded40..e6237b536d8b 100644
> --- a/kernel/entry/syscall-common.c
> +++ b/kernel/entry/syscall-common.c
> @@ -17,10 +17,9 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
>  	}
>  }
>  
> -long syscall_trace_enter(struct pt_regs *regs, long syscall,
> -				unsigned long work)
> +long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
>  {
> -	long ret = 0;
> +	long syscall, ret = 0;
>  
>  	/*
>  	 * Handle Syscall User Dispatch.  This must comes first, since

