Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04A8CDE015
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amHqBGTdQawFVm0LwCwHTx4WOCHiePZ3qut6Gw9czoY=; b=4lWHo7oDPZEAionfx/UT4SrV1a
	0GMYyrMxwHQIXLEnJvZMnRUVgoHIJTxblkQ/mXHp3MTXU9j1gkBLE8QiRY5BNzYYyh+8cNDzW+fOO
	jmNottsCCdXPcJJEOb/gWXCVj7T4rLHSrikbLVqhy2WmDmeDTzdmSj8z7GcTkmGqcaGiicXwy1PwJ
	k/tCk/GBRd9PI0lwBh8HG1rnnBDoqVqI0i+VPdKeW6a3xbmhIzdcFOf/yZOYGZKd/cMQeF3IZCxNF
	rEjundyODAvggd34wkYn68RdMjkwEnxp8QbbARdIsFlFK/57thbsI3yVjXntuPlOk4sSE6DZhu7bt
	KLgqmmIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1op-0000000Ao3A-2W0S;
	Fri, 26 Jun 2026 08:21:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oZ-0000000Anbi-14Rl;
	Fri, 26 Jun 2026 08:21:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F35DA417EA;
	Fri, 26 Jun 2026 08:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21131F000E9;
	Fri, 26 Jun 2026 08:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462090;
	bh=amHqBGTdQawFVm0LwCwHTx4WOCHiePZ3qut6Gw9czoY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=d5Lo7MDsnDBM/WZunCT8elchDCzS+3C2c2lbeT2RSyY4SfuiwU/JuHgJcOlOwtDQj
	 xTs8KeqZ97q11hRxTGc6nX5sC8HyMT5fZT+4qSj8SryW2td/wtO9smFCvfjcxc87Ru
	 eLKRJlPdL6ayIsq8pXjYViiy3xT8buj1g0NlrmisaHekowwVrgLIe+N8x2ztJj0mHl
	 P2mUemccKTtOFMr2RIOTamnjYwOMVgAvn0oNX07Zb+nu/Qg5awHIX5oYSWKc3+tC3h
	 k5BC3dcthXef5b80m5peDldls/Zf3sAtajK0+0mGczG7pCQAJfwafDixrBN/6u/FYB
	 5mx3vhjFNnd6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1977339389E8;
	Fri, 26 Jun 2026 08:21:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/5] mm/sparse-vmemmap: Provide generic
 vmemmap_set_pmd()
 and vmemmap_check_pmd()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246207775.3816447.6521226918403076772.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:17 +0000
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 david@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 palmer@dabbelt.com, pjw@kernel.org, chenhuacai@kernel.org,
 andreas@gaisler.com, davem@davemloft.net, muchun.song@linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, alex@ghiti.fr, aou@eecs.berkeley.edu,
 kernel@xen0n.name, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com
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
by Andrew Morton <akpm@linux-foundation.org>:

On Mon,  1 Jun 2026 16:48:39 +0800 you wrote:
> The weak vmemmap_set_pmd() and vmemmap_check_pmd() hooks are
> currently no-ops in the generic code, which leaves architectures that
> need PMD-level handling to open-code the same logic locally.
> 
> This series provides generic implementations for both helpers in
> mm/sparse-vmemmap.c. vmemmap_set_pmd() installs a huge PMD with
> PAGE_KERNEL protection, and vmemmap_check_pmd() verifies a present
> leaf PMD before reusing the existing vmemmap_verify() helper.
> 
> [...]

Here is the summary with links:
  - [v3,1/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
    https://git.kernel.org/riscv/c/0b6073ff1574
  - [v3,2/5] arm64/mm: drop vmemmap_pmd helpers and use generic code
    https://git.kernel.org/riscv/c/f521f198b50a
  - [v3,3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
    https://git.kernel.org/riscv/c/abff0ecf7602
  - [v3,4/5] loongarch/mm: drop vmemmap_check_pmd helper and use generic code
    https://git.kernel.org/riscv/c/ecca7da924b1
  - [v3,5/5] sparc/mm: drop vmemmap_check_pmd helper and use generic code
    https://git.kernel.org/riscv/c/d3d58e946900

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



