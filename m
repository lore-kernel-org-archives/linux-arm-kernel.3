Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CCDC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhhNINDBiC59vFpMCC14Vk72XYkJDy2FTBc8nnj9t3E=; b=N8LKFylVikrTxH8M+Hi74tsnB9
	Yupodkj1AqcsavC7vCvBMTLfc+GHlTeFEN8VmuabP6Z1jC0HC3Ngl4K+5XKoAORiWZpYEU2icum8r
	BIP9xpxOmMw9FmohKWsQ83K8Npdiy8oWKB3NZCusVf9ukl9gkAwWHSjd5NmD+YaIfJ3PbV4qcKbHu
	FZYNyaYtb9TpZ5YAhR5UhNQ7IA7meidKqOckNVtiHuAyDxffpXeKZokDqj6UNaQf8TFx7Dx30I0hc
	3OGwRO0F7MSZF0ayefjGjTbsI/EReO8UQU9evH6ovikt5FhVbt1elaJDpm8cO9t1hJHBjr54rgWRg
	C0Wf2tzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYEz-0000000BGLO-2X5q;
	Tue, 14 Jul 2026 08:11:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYEy-0000000BGKE-0zoF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:11:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E7C8243871;
	Tue, 14 Jul 2026 08:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7B91F00A3D;
	Tue, 14 Jul 2026 08:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784016703;
	bh=uhhNINDBiC59vFpMCC14Vk72XYkJDy2FTBc8nnj9t3E=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=gj2GRs2wl2irznIrDvNpPnV4vkpGfKeI+3PSVbB0CyujGyPBFiY3ZMy79CveQ1to9
	 uvVMI39tRRXLXTc2j/JCxfw4D6UcLWhftueF19QMVUvZsQisjNa75Z+3I2e8teORtO
	 /+oNVXoKvZAkBPH4vf2Pq08kaWd2xOdf7mTnnyHbr3kFQrNYsaElHgegAL+MsUNZYV
	 zDbqzL0z7ug3iUjIZxJ3Zczp1WHiV+m2ZsZ1ASBqhY+Hl1x4g7O3rTSzdP6qkx/zf2
	 rB2BwgEdHqDrBoWuBWeKstawddVUwLVfFSl3dy2Wanro49mq+tTdAZFfnoZLNYLCc+
	 dsUq6GVWIW4ew==
Content-Type: multipart/mixed; boundary="===============0057947368761341553=="
MIME-Version: 1.0
Message-Id: <a80043974ca9edb08061f10579b253bfa019919fa162de90e6fe322ec8246274@mail.kernel.org>
In-Reply-To: <20260714073041.40250-11-ankur.a.arora@oracle.com>
References: <20260714073041.40250-11-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v14 10/15] bpf/rqspinlock: Use smp_cond_load_acquire_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 14 Jul 2026 08:11:43 +0000 (UTC)
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

--===============0057947368761341553==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 0ec17ebb67c1..e5e27266b813 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c

[ ... ]

> @@ -269,6 +267,17 @@ static noinline s64 clock_deadlock(rqspinlock_t *lock, u32 mask,
>   */
>  #define RES_RESET_TIMEOUT(ts, _duration) ({ (ts).timeout_end = 0; (ts).duration = _duration; })
>
> +/*
> + * Limit how often we invoke clock_deadlock() while spin-waiting in
> + * smp_cond_load_acquire_timeout() or atomic_cond_read_acquire_timeout().
> + *
> + * We only override the default value not superceding ARM64's override.

this isn't a bug, but did you mean "superseding" rather than "superceding"
here?

> + */
> +#ifndef CONFIG_ARM64
> +#undef SMP_TIMEOUT_POLL_COUNT
> +#define SMP_TIMEOUT_POLL_COUNT	(16*1024)
> +#endif


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/29315652884
--===============0057947368761341553==--

