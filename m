Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DBCCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jCb3WJVCZBJAoARv4vFFIfRaeJ8IxSMakk+MI6d8f4s=; b=HjITcEh6z5bgsYB0Hw6WseuzSZ
	KBpvskxSjW39jQu4bZQg7qmpmYsODUFQ2P/Qsh3SdWWZAYr5hOxo0MdRTxpfuCk9pmfYK/iOclkHd
	NfIcT6E2RHy/dapWQT+Ij6T7pYQPwtjTjv82yNCeBbxCEZl1293uHvOayJ00a4YbiyIA5Zm53rJUh
	PWLfB1vjwLsN4nskhjxCqgmnHRsgh9QTP7/Qvj/wL7i7AEUkEtEXfyTCC5zX7zd1AnpZYmMJh8/7Y
	lmjOngXJU5by0aoaMq3snMF0Q4dcIOvAQUiD25W4fh0ZithmiL6h05vqYNEtZK9+UOvnZbRI+YlXq
	K6tJ5FcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpvS-00000006DzR-15JX;
	Fri, 31 Oct 2025 14:16:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEpvO-00000006DzD-2ojX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:16:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B01C96021F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 14:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62829C4CEFD
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 14:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761920177;
	bh=4nV6bg9BxQBHR3ve0/aTh4iBlD+ZLxghEg4FGIDt1Ko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QH1nYPWNHA+7SlbW4rkoc6HZk2zGrFi5h9Imb9AUheD7aYMcMHrf1HQnaoHHkd2uL
	 2+2M5g7jTRh57yZAsWEcLTfHdn0H0zlfiFakThloKPvEA4wgiaoPEhWku6iIrZtWUS
	 Av6ZCdustK6VQ6Br54v1zcIFMO7rCwI8kEAAnVgyAq86RnQXMVJW2z/MSZivYvJaGH
	 yDZSWDQtH6T0Uy++F8Iuy1VRZ370ZuTwJZr4JjEcZLAZ80uuLluy8E+JalWaprV4Pt
	 auF4lAd6wnnoOpQ6JxKiTkCzahWiqqHX5pP2UUVXehMbspvMRCU5SDbaouXcljDHEB
	 J9JyliGfhyuFQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3737d09d123so30563471fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 07:16:17 -0700 (PDT)
X-Gm-Message-State: AOJu0YzCcwYSLLQ1OSQmUESP9VOO1mRSzs0chpAk5Rzcvvvbntd0+4L2
	4qYYuaQHhG62oXRfZ7uUznnK+0uatTXbdhL5L0SVfCqf7v4jzgeoYWZQtkFa3PcmzhFYdp4KO5/
	5Ds3iub2TvDj7THjsOvY9jljHG/qRkNE=
X-Google-Smtp-Source: AGHT+IFs1mTCcTHch9nwgEpBOET9c/2ewJ7dIptcwyNtn+9vsPTkhZ3FIuxBD0r2sJ+I4tqvqhMIzczxFtmxLqmfsm8=
X-Received: by 2002:a05:651c:2115:b0:336:bd8c:5e53 with SMTP id
 38308e7fff4ca-37a18d86e10mr13223471fa.5.1761920175576; Fri, 31 Oct 2025
 07:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251031103858.529530-23-ardb+git@google.com> <20251031103858.529530-44-ardb+git@google.com>
In-Reply-To: <20251031103858.529530-44-ardb+git@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 31 Oct 2025 15:16:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGV1xeZXF7adHwbUsg6+JpLyueWaiS89pS7XFm3fKuw6A@mail.gmail.com>
X-Gm-Features: AWmQ_bloi2mdeVrG1W7Ne01Tlv9fDhnqBIB5ANhc-xgL21Rb2uTEStHrSK70YvA
Message-ID: <CAMj1kXGV1xeZXF7adHwbUsg6+JpLyueWaiS89pS7XFm3fKuw6A@mail.gmail.com>
Subject: Re: [PATCH v4 21/21] arm64/fpsimd: Allocate kernel mode FP/SIMD
 buffers on the stack
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 31 Oct 2025 at 11:40, Ard Biesheuvel <ardb+git@google.com> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Commit aefbab8e77eb16b5
>
>   ("arm64: fpsimd: Preserve/restore kernel mode NEON at context switch")
>
> added a 'kernel_fpsimd_state' field to struct thread_struct, which is
> the arch-specific portion of struct task_struct, and is allocated for
> each task in the system. The size of this field is 528 bytes, resulting
> in non-negligible bloat of task_struct, and the resulting memory
> overhead may impact performance on systems with many processes.
>
> This allocation is only used if the task is scheduled out or interrupted
> by a softirq while using the FP/SIMD unit in kernel mode, and so it is
> possible to transparently allocate this buffer on the caller's stack
> instead.
>
> So tweak the 'ksimd' scoped guard implementation so that a stack buffer
> is allocated and passed to both kernel_neon_begin() and
> kernel_neon_end(), and either record it in the task struct, or use it
> directly to preserve the task mode kernel FP/SIMD when running in
> softirq context. Passing the address to both functions, and checking the
> addresses for consistency ensures that callers of the updated bare
> begin/end API use it in a manner that is consistent with the new context
> switch semantics.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/arm64/include/asm/fpu.h       |  4 +-
>  arch/arm64/include/asm/neon.h      |  4 +-
>  arch/arm64/include/asm/processor.h |  7 ++-
>  arch/arm64/include/asm/simd.h      |  7 ++-
>  arch/arm64/kernel/fpsimd.c         | 53 ++++++++++++++------
>  5 files changed, 54 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fpu.h b/arch/arm64/include/asm/fpu.h
> index bdc4c6304c6a..751e88a96734 100644
> --- a/arch/arm64/include/asm/fpu.h
> +++ b/arch/arm64/include/asm/fpu.h
> @@ -15,12 +15,12 @@ static inline void kernel_fpu_begin(void)
>  {
>         BUG_ON(!in_task());
>         preempt_disable();
> -       kernel_neon_begin();
> +       kernel_neon_begin(NULL);
>  }
>
>  static inline void kernel_fpu_end(void)
>  {
> -       kernel_neon_end();
> +       kernel_neon_end(NULL);
>         preempt_enable();
>  }
>
> diff --git a/arch/arm64/include/asm/neon.h b/arch/arm64/include/asm/neon.h
> index d4b1d172a79b..acebee4605b5 100644
> --- a/arch/arm64/include/asm/neon.h
> +++ b/arch/arm64/include/asm/neon.h
> @@ -13,7 +13,7 @@
>
>  #define cpu_has_neon()         system_supports_fpsimd()
>
> -void kernel_neon_begin(void);
> -void kernel_neon_end(void);
> +void kernel_neon_begin(struct user_fpsimd_state *);
> +void kernel_neon_end(struct user_fpsimd_state *);
>
>  #endif /* ! __ASM_NEON_H */
> diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
> index 61d62bfd5a7b..de3c3b65461d 100644
> --- a/arch/arm64/include/asm/processor.h
> +++ b/arch/arm64/include/asm/processor.h
> @@ -172,7 +172,12 @@ struct thread_struct {
>         unsigned long           fault_code;     /* ESR_EL1 value */
>         struct debug_info       debug;          /* debugging */
>
> -       struct user_fpsimd_state        kernel_fpsimd_state;
> +       /*
> +        * Set [cleared] by kernel_neon_begin() [kernel_neon_end()] to the
> +        * address of a caller provided buffer that will be used to preserve a
> +        * task's kernel mode FPSIMD state while it is scheduled out.
> +        */
> +       struct user_fpsimd_state        *kernel_fpsimd_state;
>         unsigned int                    kernel_fpsimd_cpu;
>  #ifdef CONFIG_ARM64_PTR_AUTH
>         struct ptrauth_keys_user        keys_user;
> diff --git a/arch/arm64/include/asm/simd.h b/arch/arm64/include/asm/simd.h
> index d9f83c478736..7ddb25df5c98 100644
> --- a/arch/arm64/include/asm/simd.h
> +++ b/arch/arm64/include/asm/simd.h
> @@ -43,8 +43,11 @@ static __must_check inline bool may_use_simd(void) {
>
>  #endif /* ! CONFIG_KERNEL_MODE_NEON */
>
> -DEFINE_LOCK_GUARD_0(ksimd, kernel_neon_begin(), kernel_neon_end())
> +DEFINE_LOCK_GUARD_1(ksimd,
> +                   struct user_fpsimd_state,
> +                   kernel_neon_begin(_T->lock),
> +                   kernel_neon_end(_T->lock))
>
> -#define scoped_ksimd() scoped_guard(ksimd)
> +#define scoped_ksimd() scoped_guard(ksimd, &(struct user_fpsimd_state){})
>
>  #endif
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index e3f8f51748bc..1c652ce4d40d 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1489,21 +1489,23 @@ static void fpsimd_load_kernel_state(struct task_struct *task)
>          * Elide the load if this CPU holds the most recent kernel mode
>          * FPSIMD context of the current task.
>          */
> -       if (last->st == &task->thread.kernel_fpsimd_state &&
> +       if (last->st == task->thread.kernel_fpsimd_state &&
>             task->thread.kernel_fpsimd_cpu == smp_processor_id())
>                 return;
>
> -       fpsimd_load_state(&task->thread.kernel_fpsimd_state);
> +       fpsimd_load_state(task->thread.kernel_fpsimd_state);
>  }
>
>  static void fpsimd_save_kernel_state(struct task_struct *task)
>  {
>         struct cpu_fp_state cpu_fp_state = {
> -               .st             = &task->thread.kernel_fpsimd_state,
> +               .st             = task->thread.kernel_fpsimd_state,
>                 .to_save        = FP_STATE_FPSIMD,
>         };
>
> -       fpsimd_save_state(&task->thread.kernel_fpsimd_state);
> +       BUG_ON(!cpu_fp_state.st);
> +
> +       fpsimd_save_state(task->thread.kernel_fpsimd_state);
>         fpsimd_bind_state_to_cpu(&cpu_fp_state);
>
>         task->thread.kernel_fpsimd_cpu = smp_processor_id();
> @@ -1774,6 +1776,7 @@ void fpsimd_update_current_state(struct user_fpsimd_state const *state)
>  void fpsimd_flush_task_state(struct task_struct *t)
>  {
>         t->thread.fpsimd_cpu = NR_CPUS;
> +       t->thread.kernel_fpsimd_state = NULL;
>         /*
>          * If we don't support fpsimd, bail out after we have
>          * reset the fpsimd_cpu for this task and clear the
> @@ -1833,8 +1836,13 @@ void fpsimd_save_and_flush_cpu_state(void)
>   *
>   * The caller may freely use the FPSIMD registers until kernel_neon_end() is
>   * called.
> + *
> + * Unless called from non-preemptible task context, @state must point to a
> + * caller provided buffer that will be used to preserve the task's kernel mode
> + * FPSIMD context when it is scheduled out, or if it is interrupted by kernel
> + * mode FPSIMD occurring in softirq context. May be %NULL otherwise.
>   */
> -void kernel_neon_begin(void)
> +void kernel_neon_begin(struct user_fpsimd_state *state)
>  {
>         if (WARN_ON(!system_supports_fpsimd()))
>                 return;
> @@ -1846,7 +1854,7 @@ void kernel_neon_begin(void)
>         /* Save unsaved fpsimd state, if any: */
>         if (test_thread_flag(TIF_KERNEL_FPSTATE)) {
>                 BUG_ON(IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq());
> -               fpsimd_save_kernel_state(current);
> +               fpsimd_save_state(state);
>         } else {
>                 fpsimd_save_user_state();
>
> @@ -1867,8 +1875,17 @@ void kernel_neon_begin(void)
>                  * mode in task context. So in this case, setting the flag here
>                  * is always appropriate.
>                  */
> -               if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq())
> +               if (IS_ENABLED(CONFIG_PREEMPT_RT) || !in_serving_softirq()) {
> +                       /*
> +                        * Record the caller provided buffer as the kernel mode
> +                        * FP/SIMD buffer for this task, so that the state can
> +                        * be preserved and restored on a context switch.
> +                        */
> +                       WARN_ON(current->thread.kernel_fpsimd_state != NULL);
> +                       WARN_ON(preemptible() && !state);

This is in the wrong place: we are never preemptible here, even when
called from preemptible context.

Will fix for the next rev.

