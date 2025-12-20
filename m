Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213E1E668BC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Dec 2025 19:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcEdt97EI6S31BK9zcdRkmSO9yOn20RGicFwuAJCyZE=; b=QdzTvo0f3ZG/xJYy60TZ/K8w+u
	93rCvCspM3YyBY071E1GKiWAUzeXQjfuV8iq9PTzPo98anePjDG0W9vWTdtVMeMIdeAmkM5JRcSno
	d3VetzbQpmV/1DaDNbzu4NDHyvv8pXoyDZ1qFGBl3Ce9PObPAIer2WVRZhzzs9zGPGhjapKnXA0qK
	tzDJMw/otUsrQYG96ABB/pLen6MP6jUez+Sl2La1f30ZqoaPp6zTMhltcz8/57XTpHrJbLX1nf16f
	JMEmXxZmKgwidzaxasO9wgDJkliz+Lz00R+vMqN0kZbjndygHCOgs1/8hoM1JKCzzOyR7KACqubK+
	b2tLDQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX2tu-0000000BrYx-0mRj;
	Sat, 20 Dec 2025 19:46:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vX2to-0000000BrYb-4B6N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Dec 2025 19:46:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2ACAA407A6;
	Sat, 20 Dec 2025 19:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD83C116C6;
	Sat, 20 Dec 2025 19:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766259955;
	bh=pg2ZQDHbvPbAql6E5k7stB0WqrrC42e0amjpL4RWEY4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S0zsZCMHb4pErx//zdgRvJ8JgkoJppAZUV3a231PszrhO6QolUNXVB2TZms8HA3YN
	 /dytrLFwn7sgsMhgnIUGYO5ML62WAaUavpYX7Qwa8ZNFJ1yA/xpDFqfqkGOP5ZyAUW
	 yo9Kb0xiGv9Ht1lBxdbm6x3N/LYmOpsOEcEbaaqXb5lFuz3qMjFlfLX1jlD9PQBXPn
	 m4ABJSywONxibt0WZq/O+oojnyb7aLYl6OFREATA3EG9Y360eyJto1oWTfkr9Cys+R
	 cdDPTdLReUFwmQbAF3elEdvNVYq0Zxo2y1GM1JrGpE2rr3GkiGY7LyMHwSxWsQtsQG
	 NjTJsGwQKtbgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BAF73809A05;
	Sat, 20 Dec 2025 19:42:44 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates/fixes for 6.19-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aUZxFI1CtSF2R5HX@arm.com>
References: <aUZxFI1CtSF2R5HX@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aUZxFI1CtSF2R5HX@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: f4ea8e05f2a857d5447c25f7daf00807d38b307d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18dfd1cbf6a633c39256c76ca13114de46435e22
Message-Id: <176625976290.123080.3526231548931362785.pr-tracker-bot@kernel.org>
Date: Sat, 20 Dec 2025 19:42:42 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_114557_085972_6ADCF607 
X-CRM114-Status: UNSURE (   3.59  )
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

The pull request you sent on Sat, 20 Dec 2025 09:49:08 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18dfd1cbf6a633c39256c76ca13114de46435e22

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

