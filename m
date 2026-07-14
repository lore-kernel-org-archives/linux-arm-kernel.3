Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B50C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhPNnCyAK5l7wJj/UbQ5T+WzfEpV9TEs0RlWJOryv3U=; b=RHq947rQ2cgYcR/0rOd/+y5+8S
	Y9eF1t9Q/JJVx/qEGQu/J+PBhrIDlHMFRAC9Lefb6/LEUxo4ELs2BM6GKtaV3+uD0oFysxpvB+2oE
	/rZVX2ZUFNxMuLjq7qAhmphAN8NyvYkkdCfwAHmkHOl7WoyN5JXojJX56IaOswQuTJJlCKV0MK6me
	+96iEbHsHPV1WoJ/Pjx5JnOQ9JJLHOi7KAp6IXfmUX3uXr/vIGALIw0z8F9PJnKzlEceREXj8gXfc
	+HQvYn9tmi4I2YVldgysHoxaRxMhDXAJm4hSc1jP82GlY+9NMwI+VMyxbtKySOnNpK8V8C5DMyc9i
	hgQDrq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYEz-0000000BGKi-1PwA;
	Tue, 14 Jul 2026 08:11:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYEv-0000000BGJ8-3KW8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:11:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CA966601EC;
	Tue, 14 Jul 2026 08:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2222C1F00A3A;
	Tue, 14 Jul 2026 08:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784016700;
	bh=NhPNnCyAK5l7wJj/UbQ5T+WzfEpV9TEs0RlWJOryv3U=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=mEu5WEeYZ+EaFFly2xY40Ho0KJUvLnP0/EWZpn49iNCQ8ymDh2iLUI2LIWB7WKJp0
	 /5+3z2XACnfNiO1ky/amBdvG897xtIEg1CL7eZJBG7/YqGnMOlEtu1ntFyYdfV55TT
	 qadWji0P2Aq9Kw13yEnx0eH+wdbQDJILPZ8xQh55fPxtF7rSJwLsVnAbhH9SyilsPF
	 6dk14iq9oa6j+jaW11R0R6ny64JaFyWVUBPJc2p2+TOzd9AEaEZeKy/+/sCTif6Geh
	 XQblCpAy6mtfUMB7PHJ8wD2BGoyA645KIyMHtT6o18nkL66U/4+ri3LEdkIdrcKm5q
	 C3TImVkxrgPfA==
Content-Type: multipart/mixed; boundary="===============8529905552442563276=="
MIME-Version: 1.0
Message-Id: <4281974d1859d47c58f0e44ff33d654eaa98eee84be65d2ae72e22b5e24b4b04@mail.kernel.org>
In-Reply-To: <20260714073041.40250-13-ankur.a.arora@oracle.com>
References: <20260714073041.40250-13-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v14 12/15] cpuidle/poll_state: Wait for need-resched via tif_need_resched_relaxed_wait()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 14 Jul 2026 08:11:40 +0000 (UTC)
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

--===============8529905552442563276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>     cpuidle/poll_state: Wait for need-resched via tif_need_resched_relaxed_wait()
>
>     The inner loop in poll_idle() polls over the thread_info flags,
>     waiting to see if the thread has TIF_NEED_RESCHED set. The loop
>     exits once the condition is met, or if the poll time limit has
>     been exceeded.
>
>     To minimize the number of instructions executed in each iteration,
>     the time check is rate-limited. In addition, each loop iteration
>     executes cpu_relax() which on certain platforms provides a hint to
>     the pipeline that the loop busy-waits, allowing the processor to
>     reduce power consumption.
>
>     Switch over to tif_need_resched_relaxed_wait() instead, since that
>     provides exactly that.
>
>     However, since we want to minimize power consumption in idle, building
>     of cpuidle/poll_state.c continues to depend on CONFIG_ARCH_HAS_CPU_RELAX
>     as that serves as an indicator that the platform supports an optimized
>     version of tif_need_resched_relaxed_wait() (via
>     smp_cond_load_acquire_timeout()).

This isn't a bug, but the changelog names smp_cond_load_acquire_timeout() as
the backing primitive, while the code path looks like it uses the relaxed
variant:

include/linux/sched/idle.h:tif_need_resched_relaxed_wait() {
    return tif_bitset_relaxed_wait(TIF_NEED_RESCHED, timeout_ns);
}

include/linux/sched/idle.h:tif_bitset_relaxed_wait() {
    flags = smp_cond_load_relaxed_timeout(&current_thread_info()->flags,
                                          (VAL & BIT(tif)),
                                          local_clock_noinstr(),
                                          timeout_ns);
    ...
}

Should this reference smp_cond_load_relaxed_timeout() instead?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/29315652884
--===============8529905552442563276==--

