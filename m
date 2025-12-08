Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B034CEBF88
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 04:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gt9EnkBdnn8KkaSKjMMFNWN87wObLMqbVZWC14OSLzI=; b=nZ5VPHlH5rHvReLQYxo1htWHrz
	/bxCHPcSJC3LQ5D8/uhqLU7wxoI0kzzoWGdJ+79XBhHTPbAHzS/tYAJCM/bQdgEEaqYn0gIW86/zL
	ICyxJS4mYOhnp6a5rQQ4EdO012j92CiYMVJ7N1k6meP7jMs8NsDqnB9+o8n/4N3D2gWa4VfNg7aEE
	pURcBO5drOTd3Y23DAJhi+vGIOaI6C/jjCfHLLeU+UdGiCgGIWZi94d7JJcfke9ttEPgxVPuXzQuu
	P0xGi0tVnZ8Y2IaOFAAfi7yVmfl+jBhsyljPFgLBVamKydLX228Grz/4dYso/e5xS34Lu/I3HAPu7
	xULsx4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vST4p-0000000Ca1z-2NSx;
	Mon, 08 Dec 2025 04:42:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vST4m-0000000Ca1S-09OC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 04:42:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D00F3497;
	Sun,  7 Dec 2025 20:42:08 -0800 (PST)
Received: from [10.164.18.52] (unknown [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 954C43F740;
	Sun,  7 Dec 2025 20:42:09 -0800 (PST)
Message-ID: <b88a2a99-44c5-41bf-b986-fb3ca996e580@arm.com>
Date: Mon, 8 Dec 2025 10:12:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/16] arm64: Remove unused _TIF_WORK_MASK
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, macro@orcam.me.uk, charlie@rivosinc.com,
 kevin.brodsky@arm.com, ldv@strace.io, mark.rutland@arm.com, song@kernel.org,
 ryan.roberts@arm.com, ada.coupriediaz@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251204082123.2792067-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_204220_126084_707FBEE0 
X-CRM114-Status: GOOD (  10.39  )
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

On 04/12/25 1:51 PM, Jinjie Ruan wrote:
> Since commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ
> entry"), _TIF_WORK_MASK is never used, so remove it.
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/include/asm/thread_info.h | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
> index f241b8601ebd..ff4998fa1844 100644
> --- a/arch/arm64/include/asm/thread_info.h
> +++ b/arch/arm64/include/asm/thread_info.h
> @@ -106,12 +106,6 @@ void arch_setup_new_exec(void);
>  #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  #define _TIF_TSC_SIGSEGV	(1 << TIF_TSC_SIGSEGV)
>  
> -#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY | \
> -				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
> -				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
> -				 _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING | \
> -				 _TIF_PATCH_PENDING)
> -
>  #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
>  				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
>  				 _TIF_SYSCALL_EMU)

There are no more _TIF_WORK_MASK users left on arm64 platform.
 
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

