Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F0CC021A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsKn7GMdO3njzX47mOUfui0PU3MsuTcQm1Wy0OmjeYc=; b=PHclYnfuqDo42nqoQ+qzglJVJ7
	zhrYujfJbKtTUZH37ODV/67GmCn1WbNWRMVXecGHiHMrndh0ziEH/cu3PVhuS2zSz66tn5EOkmlTT
	5tWZhBogiHSkBmAmiO9DAMyfuhMNnMvTwfRhjBS/U/Siz8+bimBPV9o2K0hFkkDnM/gg+LZ6n5299
	lZFprbnIDP7z4iuW7YKhQmqbt1BsjIXX1Ip/WKYaGkmPQz/McKUUHGaHajmlhHPsLUCIdrXeWTvNR
	iiQPwVovibVVL8LIlyjX4nV2Qui3q18Wq1wduCS6M62hmGElhpF27o1qBNlBMrd5/B0MVht3ceaUz
	boGuUpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFjy-000000087PE-2T8D;
	Wed, 12 Feb 2025 16:37:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFAB-00000007y2g-3y7x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JsKn7GMdO3njzX47mOUfui0PU3MsuTcQm1Wy0OmjeYc=; b=B5UrjMVXgOIgssMSIb+9CLM0WP
	rGL8t4QfUJ34KPvfufe0lY0zRfoGFo0FlFUnm3lrFB3Ofu25gSA9f8e0mkR7yKK7oaYbjo/aeEFvi
	uzwhAz2kRhtcF9ZAm1MM9+Li5nNLA0meG9TrzSx8m1CangLnjFFjHxFaxIs/NLF2tQSMG1nIXgZg5
	QyXnSnY7Mrm94Ru3pLWBzHcuOwGbYZEpqjmj2fjqdPttE/Rptg5HSLhWUq5trUH1XJRb2AkW6Xy/X
	YTirpEFt05Qt7UoEJNJYxNlA6aqz6i+gqxYUXOHHVZsem9GeHCIiSnFg4wdNBsMhNJhCcVZils14U
	qfYySOOw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33544)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tiF7s-0006PZ-0r;
	Wed, 12 Feb 2025 15:58:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tiF7o-0001Ek-0M;
	Wed, 12 Feb 2025 15:58:08 +0000
Date: Wed, 12 Feb 2025 15:58:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Ben Segall <bsegall@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/9] arm: Rely on generic printing of preemption model.
Message-ID: <Z6zFD2HcAtQJWIOY@shell.armlinux.org.uk>
References: <20250212134115.2583667-1-bigeasy@linutronix.de>
 <20250212134115.2583667-4-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212134115.2583667-4-bigeasy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_080035_980701_F2BB0C3C 
X-CRM114-Status: GOOD (  16.18  )
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

On Wed, Feb 12, 2025 at 02:41:09PM +0100, Sebastian Andrzej Siewior wrote:
> __die() invokes later __show_regs() -> show_regs_print_info() which
> prints the current preemption model.
> Remove it from the initial line.
> 
> Cc: Russell King <linux@armlinux.org.uk>

Please either drop this - or correct it as per my r-b below. Thanks.

> Cc: linux-arm-kernel@lists.infradead.org
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  arch/arm/kernel/traps.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index 6ea645939573f..afbd2ebe5c39d 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -258,13 +258,6 @@ void show_stack(struct task_struct *tsk, unsigned long *sp, const char *loglvl)
>  	barrier();
>  }
>  
> -#ifdef CONFIG_PREEMPT
> -#define S_PREEMPT " PREEMPT"
> -#elif defined(CONFIG_PREEMPT_RT)
> -#define S_PREEMPT " PREEMPT_RT"
> -#else
> -#define S_PREEMPT ""
> -#endif
>  #ifdef CONFIG_SMP
>  #define S_SMP " SMP"
>  #else
> @@ -282,8 +275,8 @@ static int __die(const char *str, int err, struct pt_regs *regs)
>  	static int die_counter;
>  	int ret;
>  
> -	pr_emerg("Internal error: %s: %x [#%d]" S_PREEMPT S_SMP S_ISA "\n",
> -	         str, err, ++die_counter);
> +	pr_emerg("Internal error: %s: %x [#%d]" S_SMP S_ISA "\n",
> +		 str, err, ++die_counter);
>  
>  	/* trap and error numbers are mostly meaningless on ARM */
>  	ret = notify_die(DIE_OOPS, str, regs, err, tsk->thread.trap_no, SIGSEGV);
> -- 
> 2.47.2
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

