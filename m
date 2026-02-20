Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66975C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 04:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0OVKgZAmQrpZSCSne3fNxbWN7hMvnzN291IRopqQ5A=; b=cms69f21U0tK+9xMxMnzjo2kat
	Wc6dgIT2wcGPtMR+rE2p3c+hDUuQlq8yPNtuRtxcj3/Hdn0QBPx35R4bV6JudSGG3CxAZmgtRC/qs
	nUjundy7Sk9yOK+wnp+lgHy66HDGr3UKDpb1giYHkjFBKyubIdG3V0xyAGf4ZjjXyDxMYfyzA64C0
	bUEj4OBFUkSk/8d3GIK0fNCdxWZldxBQNTceUs1rsYoGqEgpMwwXtoQ6SKbV4Lndx11T8OlMe/Svm
	V4Oy4/GtQl6ft/SL9XOREEfexSJPlBcX8XbB7OEDmlX3LRUVCRQgPHB2R9PgZPQyPqjqBQiM5nQAl
	C6mlftkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqe-0000000DCGp-2iki;
	Fri, 20 Feb 2026 04:10:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqa-0000000DCFQ-3nOA;
	Fri, 20 Feb 2026 04:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D305F40016;
	Fri, 20 Feb 2026 04:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2BA7C116D0;
	Fri, 20 Feb 2026 04:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560629;
	bh=gZxt4xZuUjXGGHmHKN+uEL1LSaVN4uFpnXdEPutVfBo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MzlOe0JtKCyX1m5ydTdmOVzcXvTdxMfSVFRW1WDwedpZ8p2JQgmRJOZGFUgTlts71
	 Hr60ts3TI6hMa3MEyxinxB57rKfjHU2uxE59BpIu/+eB5f3N+qA9HfZ/y9pxXHSsMe
	 L3ExxJrJPNmdBaRO6LklAWgLCZeMQM4SfZe7oXCSEv7YKA985b7AFKtdTkGKs4O6Cg
	 uqRH8XvnpIhuAXM6oqK780uPGKVGplX4xHqu5H1I49NkIMc68H4gUVOHdiYrMaHLJA
	 Q+bm4rmFxd0LDsuO3oJm/VkUkisIdSk1ra0ERiEMWoHPkm/KA2dJz7OtlmZRoOGqC+
	 GRRuuHhKY8EgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE293809A88;
	Fri, 20 Feb 2026 04:10:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/5] uprobes: transition from kmap_atomic to
 kmap_local_page
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156063804.189817.17364776119081008453.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:38 +0000
References: <20260103084243.195125-1-ming.jvle@gmail.com>
In-Reply-To: <20260103084243.195125-1-ming.jvle@gmail.com>
To: Keke Ming <ming.jvle@gmail.com>
Cc: linux-riscv@lists.infradead.org, mhiramat@kernel.org, oleg@redhat.com,
 peterz@infradead.org, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, tsbogend@alpha.franken.de, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_201032_967001_D3BA0AE1 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Peter Zijlstra <peterz@infradead.org>:

On Sat,  3 Jan 2026 16:42:38 +0800 you wrote:
> The use of kmap_atomic/kunmap_atomic is deprecated. The purpose of
> kmap-like functions is to create temporary mappings.
> 
> kmap_atomic() typically disables preemption, while kmap_local_page()
> allows preemption.
> 
> According to the documentation, kmap_atomic() is primarily necessary
> for contexts that cannot sleep.
> 
> [...]

Here is the summary with links:
  - [1/5] riscv/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
    https://git.kernel.org/riscv/c/a18dfb5dd332
  - [2/5] arm64/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
    https://git.kernel.org/riscv/c/094cc7bb5fc3
  - [3/5] mips/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
    https://git.kernel.org/riscv/c/e6eb9acc024c
  - [4/5] arm/uprobes: use kmap_local_page() in arch_uprobe_copy_ixol()
    https://git.kernel.org/riscv/c/1752a1ad43a1
  - [5/5] uprobes: use kmap_local_page() for temporary page mappings
    https://git.kernel.org/riscv/c/a491c02c2770

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



