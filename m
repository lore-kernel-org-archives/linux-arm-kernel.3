Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435DCC36008
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 02:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70KKqH65WG/HSXVk0W7gMB8zoEiUwE39WwjHtnlrNW8=; b=MCku4++kUK3VPiO3JP0r5DFiax
	riXTW6ikYhFdensha3GZzBV3xqS8Z359/ahKhJh86xHOTVqBacHkBFeC4ca6hiQvNa5LwsHsT3k2c
	82SLU/n2SHMAtMeuhFxJe+zXGRBCjXPZYKh44mDLdBbiHAzUygPraoAj3oj8RBl6tXuua8a/V/PDF
	AkWNZqKttLrCnt8hioT575zTmuC6MEW1OjaDRSzVM0kWX8ZCzdBn4xxZnt6t6ZUR4nqIznSgf009k
	1Jva5uOw160Ms+J97+oTnEFLH+zcDp/DCdp84cFKQu/bgHLWCxlW+kr4fi6+CfOND8kjoc/mOdJt9
	MRcZW3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyiat-0000000Fk5h-2sSG;
	Sun, 30 Mar 2025 02:40:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyiZ8-0000000FjrK-3k8F
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 02:38:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81C1D5C4030;
	Sun, 30 Mar 2025 02:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB41C4CEE2;
	Sun, 30 Mar 2025 02:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743302305;
	bh=OW1YpnBCQCPAWDhMDpl72owiE6DO66K++nIHB2UMsck=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=UXPZACc68HCbl/xz5XVA8BGPPjIcsfRmKqV1PbD43xm7wNMOZ8KlKdOYMk8iOSPMk
	 D0/N9hoYQP0uJQeGluWNPT94q30YqxAEqm9kkTFJ0YUItPz3AOalExcXQFkSKHEUBH
	 u6FHpcRWWbVd4S9bTL/CpK7YyK53b6s7Mp35vMMQXaYQeqtsD+iHFeBJfQCURDKXQa
	 yKbnOOILSOc3IHscLS8molPdVlDMsnFOMxgsN4NrFEeJo/zR1M4R2IRKhVK/HWkd1S
	 hK1VtTSQ/lGT5A8blptYBj0nN30CdTAEN0bN+irxr7FwWXCQMiDwikI6pnMFni/E1x
	 N/7bQQJLFXOvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF0E380AA7A;
	Sun, 30 Mar 2025 02:39:02 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY3nL=VjLZq_pDxQfr3m2-B78hiuJyEWhSNRU_zcjaQdKg@mail.gmail.com>
References: <CABb+yY3nL=VjLZq_pDxQfr3m2-B78hiuJyEWhSNRU_zcjaQdKg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CABb+yY3nL=VjLZq_pDxQfr3m2-B78hiuJyEWhSNRU_zcjaQdKg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.15
X-PR-Tracked-Commit-Id: 1ec12fd31ecc38e2a81a137be7eec5df51894bcc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7f2ff7b6261742ed52aa973ccdf99151b7cc3a50
Message-Id: <174330234151.3338213.16025891843762658050.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 02:39:01 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_193826_984093_3BBB3C9B 
X-CRM114-Status: UNSURE (   5.03  )
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

The pull request you sent on Sat, 29 Mar 2025 18:57:34 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7f2ff7b6261742ed52aa973ccdf99151b7cc3a50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

