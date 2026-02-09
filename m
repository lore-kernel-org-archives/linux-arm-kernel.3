Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3605EF0702
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bi0BkSU0X7luO/eNKUDTo3OAk9c0hNwnUFQEUKPEsfw=; b=PP+K/CUNGWfPJImQrvQgzyQnhr
	G8ItZ03A/dtGMquxJS6FB1nuZD14/49HmIzB+U4svqN3vZW0m7fpZSZMtmo9PdbvhkwbUlzndanhf
	BCfGD0GgkayHVKgDcixQaMeQP/Ro2NwfyrpX1oDZnkbYRCnZnDy5A6YfjdW61pOmX1dBR2xFrNnfx
	2xOd613tdBdkZhzTkHlW/V9KcX8hL0tRkDZczItX5IyHUPu6HophfFLNRXm6ngfZLhl0h6gpTN8RE
	hvzjPXCAYPrWzvnuiPV1UUPxch/r1f/YXvxZslHoqmjBavnISvtGTqusOFcK67tGutqDK/5OzgpuW
	YML140nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHau-0000000EkbM-1XJF;
	Mon, 09 Feb 2026 03:05:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpHas-0000000Ekb7-40nM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 03:05:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EFB1060008;
	Mon,  9 Feb 2026 03:05:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C193C4CEF7;
	Mon,  9 Feb 2026 03:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770606345;
	bh=Bi0BkSU0X7luO/eNKUDTo3OAk9c0hNwnUFQEUKPEsfw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=cG+sAeWyJWGwC/Aap7um1mW3FVa/saSM/1E0r2PdRfdLfatSgunijyvKcqeRKABt1
	 9whi9FzkNVfIQ+TvxlYTn5HAgF+pnqN7B8G8sc+cq0+vrZ+IEjN+w4XE6xDPQAIE76
	 VCBslV3UB40R6f+l6hQkpoi7dGX88W9ej+jud/nTyIyGgpW5ZUQ7/KHhJRu8mS6Qpp
	 EnokLaUHyDKEkGtmoD/kh+zpbfxMklkxNIbByo8g1VXDH13xuzaw1WlHs/rN/ouozD
	 p1xmIGCBlZlHOlA081oGTvSijWr3XLkgIlwuC/KeTiuT9PICZR1onuWPwB2nPtMzR5
	 uvHk2B6DOXtIA==
Content-Type: multipart/mixed; boundary="===============3409934204227450896=="
MIME-Version: 1.0
Message-Id: <7d3944c1d8ffe5ee6d52907d7227f8eb8b91f5aa2b705fe3eb0af23454b8b072@mail.kernel.org>
In-Reply-To: <20260209023153.2661784-12-ankur.a.arora@oracle.com>
References: <20260209023153.2661784-12-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v9 11/12] sched: add need-resched timed wait interface
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ankur.a.arora@oracle.com,mingo@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon,  9 Feb 2026 03:05:44 +0000 (UTC)
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

--===============3409934204227450896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> The wait is implemented via smp_cond_load_relaxed_timeout().
>
> smp_cond_load_acquire_timeout() essentially provides the pattern used
> in poll_idle() where we spin in a loop waiting for the flag to change
> until a timeout occurs.

This isn't a bug, but the commit message mentions smp_cond_load_acquire_timeout()
when describing the poll_idle() pattern.

However, the code uses smp_cond_load_relaxed_timeout(), and the subsequent
poll_idle() conversion (patch 12/12) also uses the relaxed variant via
tif_need_resched_relaxed_wait().

Should this say smp_cond_load_relaxed_timeout() instead of
smp_cond_load_acquire_timeout() for consistency with the implementation?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/21810635323

AI-authorship-score: low
AI-authorship-explanation: The commit follows standard kernel style with iterative improvements across 9 versions and reviewer feedback, consistent with human authorship.
issues-found: 1
issue-severity-score: low
issue-severity-explanation: Minor commit message inaccuracy referencing wrong function name, no impact on code correctness or runtime behavior.

--===============3409934204227450896==--

