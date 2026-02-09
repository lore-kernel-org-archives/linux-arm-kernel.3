Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21ADEF06EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 03:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnUNVQ4VDArePgiBNpFfO8XyW++VMsOpm9JRhsnML/w=; b=ptoRDNxFC1D1S8jatTfxMwUCeU
	8JBtZ/1k/0R4U5LdtekH7Gqf+ae9Kg/dXf3hydv28dpuvj1oDJV0P8wxPzQu7mheUMY3uyaZlb7s2
	A9EHCzTJyWf0CpZ/YZDFf6rVNrm9JaNXYDaZ7XrhtppiusnoZQm/2gq9j81j0MjJmc7VHISWk/TBC
	sOBgSIq2zBdTsB9Ui7p6ovlyQCe+fNo1phW/MXwdR727FTUrb0JWK0NPsKUXCUBcjUNUpJ2Vvbm+H
	tCwrNJ0VHd0KO3njMmqc7zHQS7k3jnj380txXUjz7jrJmyWWRYAxRn5aUsjs7hbUhR12iLGNvbTg8
	A+0CNr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHaw-0000000EkbV-2wzZ;
	Mon, 09 Feb 2026 03:05:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHau-0000000EkbH-0KXW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 03:05:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A9ED600B0;
	Mon,  9 Feb 2026 03:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C1CC4CEF7;
	Mon,  9 Feb 2026 03:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770606347;
	bh=vvMHAN6L2tVEAL6dEZf2ykF+FEIUVDPhLofe2WZoOhg=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=EGqniBRkII1k0v2zEcVrgvvp1RGHn5x1yku3AM9oRO7ltwSd5Hx059aku8TzQeA5W
	 Qech1D2jNbTI4/325eLAAXom6FCOlYZut+9bStgMtdLJOV9O5BhHILXPRU/JaVF6d0
	 AMUp8sVEARuZCxKCUKBocVqb1Aa6yj5ahcuieRxTofBIcolX83w4wZoJCf+TKGqwgS
	 2/Q2gEalcidmAAo3hl0K3PUaqvs4p8eZlUe6CqzRqnNPIpKDO6vEQeO40QBXDdq2XX
	 7f38PNlJA0ANID1SeUCXuf5sBcXt9QOkZ2t0MSuXg7uX92J5oxYIF3knEBsUWh0J5G
	 GKj9WATL7YBlg==
Content-Type: multipart/mixed; boundary="===============6771391642254911456=="
MIME-Version: 1.0
Message-Id: <48114f7cb5d9dbe88299056f69a43708f29f4f4569aa0c04d4411d5140e932c3@mail.kernel.org>
In-Reply-To: <20260209023153.2661784-10-ankur.a.arora@oracle.com>
References: <20260209023153.2661784-10-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v9 09/12] bpf/rqspinlock: switch check_timeout() to a clock interface
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon,  9 Feb 2026 03:05:46 +0000 (UTC)
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

--===============6771391642254911456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 2fdfa828e3d3..f02b1c5f0222 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c

[ ... ]

> @@ -340,6 +349,7 @@ int __lockfunc resilient_queued_spin_lock_slowpath(rqspinlock_t *lock, u32 val)
> {
> 	struct mcs_spinlock *prev, *next, *node;
> 	struct rqspinlock_timeout ts;
> +	s64 timeout_err = 0;
> 	int idx, ret = 0;
> 	u32 old, tail;

[ ... ]

In arch_mcs_spin_lock_contended(), when a waiter in the MCS queue receives
a timeout signal (RES_TIMEOUT_VAL) from the previous waiter:

> 	if (old & _Q_TAIL_MASK) {
> 		int val;
>
> 		prev = decode_tail(old, rqnodes);
>
> 		/* Link @node into the waitqueue. */
> 		WRITE_ONCE(prev->next, node);
>
> 		val = arch_mcs_spin_lock_contended(&node->locked);
> 		if (val == RES_TIMEOUT_VAL) {
> 			ret = -ETIMEDOUT;
> 			goto waitq_timeout;
> 		}

This sets ret = -ETIMEDOUT but does not set timeout_err. When execution
reaches the waitq_timeout label:

> waitq_timeout:
> -	if (ret) {
> +	if (timeout_err < 0) {

The condition evaluates to false since timeout_err is still 0. This causes
the timeout handling to be skipped entirely, and execution falls through
to the lock acquisition path. If the lock is acquired, the function
returns ret (which is -ETIMEDOUT), making the caller believe the lock was
not acquired when it actually was. This appears to be a lock leak.

Should the goto waitq_timeout path also set timeout_err = -ETIMEDOUT?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21810635323

AI-authorship-score: low
AI-authorship-explanation: The commit shows typical human developer patterns including a missed edge case during refactoring, which is a common human error rather than systematic AI-generated code issues.
issues-found: 1
issue-severity-score: high
issue-severity-explanation: Lock leak bug where the function may acquire a lock but return an error code, causing callers to think acquisition failed when it actually succeeded.

--===============6771391642254911456==--

