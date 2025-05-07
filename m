Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7637EC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 21:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Zz32pLphoICTAifU2IjJX+E5D978EftjHmPnlHqJxQ=; b=2Atw2nCDc02zRgQzZewQfJcIHB
	IJ87UrGjbiq20kIO94S44ptMlkTtb6QBYkbXdmaRY6DlVTK0ZwewTkFKjTZj/CDKwx9Yz24MuQ7SM
	94dXpiBVwV10pkSsSul9+F1bFENm0/MBrUyd7lee3BkUQtIyaa/29X8lBzTxMeTsHER3m7BRmPGZk
	TFT4rHuYc4vj9nN6yCNdQXfvCRJJ9hheI6/JdhkflX33lLO/EANgGzNY4EoKZF57g7NVkzDwQDuJv
	2MIoSLLk/cqqn6TgKjdEvE59NdjKgVLdlGQ0HkwjQtusGgmQ5b+owIJdoCBELyir+NLMmnxtA9v4C
	5TVpoNDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmGf-0000000GnI3-3Fax;
	Wed, 07 May 2025 21:25:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmEh-0000000Gn1A-2IRh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 21:23:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AEDA44146;
	Wed,  7 May 2025 21:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C9EC4CEE2;
	Wed,  7 May 2025 21:23:26 +0000 (UTC)
Date: Wed, 7 May 2025 17:23:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Nam Cao <namcao@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>,
 linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 17/22] arm64: mm: Add page fault trace points
Message-ID: <20250507172336.081a41eb@gandalf.local.home>
In-Reply-To: <554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
References: <cover.1745999587.git.namcao@linutronix.de>
	<554038c996662282df8a9d0482ef06f8d44fccc5.1745999587.git.namcao@linutronix.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_142327_608721_2D7A653B 
X-CRM114-Status: GOOD (  18.32  )
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


Can I get an Acked-by from the ARM64 maintainers?

Thanks,

-- Steve


On Wed, 30 Apr 2025 13:02:32 +0200
Nam Cao <namcao@linutronix.de> wrote:

> Add page fault trace points, which are useful to implement RV monitor which
> watches page faults.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/mm/fault.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ef63651099a9..e3f096b0dffd 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -44,6 +44,9 @@
>  #include <asm/tlbflush.h>
>  #include <asm/traps.h>
>  
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/exceptions.h>
> +
>  struct fault_info {
>  	int	(*fn)(unsigned long far, unsigned long esr,
>  		      struct pt_regs *regs);
> @@ -559,6 +562,11 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	if (kprobe_page_fault(regs, esr))
>  		return 0;
>  
> +	if (user_mode(regs))
> +		trace_page_fault_user(addr, regs, esr);
> +	else
> +		trace_page_fault_kernel(addr, regs, esr);
> +
>  	/*
>  	 * If we're in an interrupt or have no user context, we must not take
>  	 * the fault.


