Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD58C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFh4/3xyOKgfQ4/nEjqStHfW21LKL5WMdD7LihFSIaA=; b=zS1Psi6WdNYjquXp4FwPtR9ZLB
	ABxEV7npw51S2hELrcvIAPvFv+WA2zTFsNwtKAtsiypgqtPvwdPpTN672tbhSsQBpHWNMhiRzOZoS
	rmRgjYXPLlj6gBP4zD3jkLIXJYj175UmAi8KNJ4AAA6OHS+MJKp0tXZPxhlMbqD2kBJEqRh1hLjCU
	Tz5OmcGRrMtK5NzQd1Q6mG9NuOD3nakCiFg4+Ux68dUaU18S388hG5JPgHUFXomhE04a5iPsv1iyZ
	SPAtdpD8K936JW25nL490fenYwsaq2NNEx6fZ2z8gQPB75Y/0brdDW9kwLnk0HvIBrldmB404n8Re
	42V2fkwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19NE-0000000AW9H-15bS;
	Mon, 31 Aug 2026 21:17:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19NC-0000000AW7g-1P72
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:16:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2474602D1;
	Mon, 31 Aug 2026 21:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229721F00A3D;
	Mon, 31 Aug 2026 21:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211017;
	bh=PFh4/3xyOKgfQ4/nEjqStHfW21LKL5WMdD7LihFSIaA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=XNnHRH17HFtbbbpUMCFZFUYOISQJdwaYji/LlBXcV6RYez+wXk7e2BgPstsJ2PHwk
	 giFrp3+G5BnWyzCFv3xcJYuYCZS9ZYGKFWgeTLBr+JgBP77X7mRB5W4VmP/lAty6Hf
	 +BO7X2wmz3i0aPAx+EN0xa4awjnUC4MGAf1pzA+Pt02ppR0EZPWXK9dipW3DI2t/O4
	 Dc57p8iYXB+8jtvNxGhLMlsEXu9araEUo8tgmFknM2ADbiOl3pSOlZP76OpjdTt1Xa
	 3FoS8sWNxH/Neq4nWIbqZvFd11xgqEpx0H3/2A185GuGw4Tyztf+fo5YWvTCKmw7AE
	 ECVi2d3oY9Q0Q==
Content-Type: multipart/mixed; boundary="===============7660510954029895059=="
MIME-Version: 1.0
Message-Id: <2895763b954f1c233ec3c6fd4cf4c1f1af790941e719934a8c7628a4d3869e83@mail.kernel.org>
In-Reply-To: <20260831202251.305046-14-ankur.a.arora@oracle.com>
References: <20260831202251.305046-14-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v15 13/16] arm64/delay: enable testing smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 31 Aug 2026 21:16:56 +0000 (UTC)
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

--===============7660510954029895059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> arm64/delay: enable testing smp_cond_load_relaxed_timeout()
>
> This enables the barrier tests to be built as a module.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>

This isn't a bug, but half of the diff lands in
drivers/clocksource/arm_arch_timer.c, which has its own MAINTAINERS entry
(ARM ARCHITECTED TIMER, Marc Zyngier) and its own changelog prefix
convention (clocksource/drivers/arm_arch_timer: ...).

The subject uses only the arm64/delay prefix and the Cc/Ack lines name
only the arm64 maintainers, so the clocksource hunk is easy to miss when
the patch is routed or reviewed.

Would it help to either split the arm_arch_timer.c export into its own
clocksource-prefixed patch, or widen the subject/Cc so the clocksource
change is visible to its maintainer - and mention in the changelog that
the two symbols get pulled in via cpu_poll_relax()?

> diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
> index f08eacef2f0a..20bc2894b65b 100644
> --- a/arch/arm64/lib/delay.c
> +++ b/arch/arm64/lib/delay.c
> @@ -12,6 +12,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/timex.h>
> +#include <kunit/visibility.h>
>  #include <asm/delay-const.h>
>
>  #include <clocksource/arm_arch_timer.h>
> @@ -30,6 +31,7 @@ u64 notrace __delay_cycles(void)
>  	guard(preempt_notrace)();
>  	return __arch_counter_get_cntvct_stable();
>  }
> +EXPORT_SYMBOL_IF_KUNIT(__delay_cycles);
>
>  void __delay(unsigned long cycles)
>  {
> diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> index cc9a8b399004..227447b19b14 100644
> --- a/drivers/clocksource/arm_arch_timer.c
> +++ b/drivers/clocksource/arm_arch_timer.c
> @@ -28,6 +28,7 @@
>  #include <linux/acpi.h>
>  #include <linux/arm-smccc.h>
>  #include <linux/ptp_kvm.h>
> +#include <kunit/visibility.h>
>
>  #include <asm/arch_timer.h>
>  #include <asm/virt.h>
> @@ -893,6 +894,7 @@ bool arch_timer_evtstrm_available(void)
>  	 */
>  	return cpumask_test_cpu(raw_smp_processor_id(), &evtstrm_available);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(arch_timer_evtstrm_available);
>
>  static struct arch_timer_kvm_info arch_timer_kvm_info;


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33438155296
--===============7660510954029895059==--

