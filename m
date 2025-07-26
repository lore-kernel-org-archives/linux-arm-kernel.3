Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19586C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tjgC5Y43tq4P/PKgQHVO1dK+JtntZIGxLyaAIt9ELU=; b=okrGGM/XmVbdywshl2v4RP5vzP
	Jr7Ei7486NqCrw3/TBWAnncYOT5mTC0xc6kuSMVEoIsid6RR45bWCPzQFv8SUVLRGVSjjRh+0wvFj
	0f7A8KiZL291LoKHXwuYDMogZkhKo1TGyef0VfQaaLphnmyTMWeO/Op8zr8KpxMecHWIt9svxtbe9
	nF9zzINvVFR7qb/BfwqUWEiJsNxLzVVWgNtvGbENv8C0htZ05vh3I7z6Rsbh4EpxzB3TY7iPviDpy
	1AFoqhRAPX68FGb0aFbjbD3QWNjCuTtrK+RzV/i5YCEltCoKnkiRviN6caLl9By7JKjymUO5qD45K
	8xerndgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufj91-0000000Bi9r-1DeC;
	Sat, 26 Jul 2025 17:57:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufj6U-0000000Bi1Q-3AaF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Jul 2025 17:54:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E7E8A43707;
	Sat, 26 Jul 2025 17:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2661C4CEED;
	Sat, 26 Jul 2025 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753552476;
	bh=O8XDFXfBTuXvwGLH4OtMQytQ38kkabiKqv6gfOmh8Ho=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=AeVwA3der4qU1luIdSmKdWNi8DBP6jldHwxGX0f0t8Xn5q4lR8BYhCsjkSQLdudAM
	 QQFfIqDuHnPX3V7kXRYO1Jw/YTuLJr6VzRpW6jbHCeYytGlh38rj/DXPGhrrtE7Fjq
	 W83+ySkg8BAXz0Jo6pMhoa3BzIYlehPY7+/LrQKcH+Hdc3kI5C9v2TMX5N3crcgvyo
	 irqupxkIrUNz29ygon7VRaaNmouhCO4Jj49Icox5iOdVph3bdMjCoC9g90x5YBOKos
	 oWcoB8Au0/M+JHXPufqUN7JRCMCLf75LjJ1bG9s2ebyrYk87ZaQ0tkg+h74O5SfqbK
	 XCPYh6o2zHnvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E3A383BF4E;
	Sat, 26 Jul 2025 17:54:55 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.16, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <94f09700-cebd-4270-840f-219ef14bf2ee@app.fastmail.com>
References: <94f09700-cebd-4270-840f-219ef14bf2ee@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <94f09700-cebd-4270-840f-219ef14bf2ee@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16-3
X-PR-Tracked-Commit-Id: 912b1f2a796ec73530a709b11821cb0c249fb23e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6121f69c36337076fb0ffaa23acee3cf8cc5c931
Message-Id: <175355249373.3655743.9316066633007495504.pr-tracker-bot@kernel.org>
Date: Sat, 26 Jul 2025 17:54:53 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_105438_814056_8AEED09B 
X-CRM114-Status: UNSURE (   4.67  )
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

The pull request you sent on Sat, 26 Jul 2025 12:36:06 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6121f69c36337076fb0ffaa23acee3cf8cc5c931

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

