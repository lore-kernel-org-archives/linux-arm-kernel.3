Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C201C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 19:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nd0lEx9hD6ylLpwOU9yD0wtJ3+jV/rg5UBsT4/paZVY=; b=Lq/4hjuE7WXctPxhPfvHLOoTNz
	pli9Bt9IqsAdXgvdSSWw1/GOlulNjb3BhrFYEBaDKG0KoooF9aaQAZn2qhJdn+jQQbPpsbRzlGH6a
	lkmyoOnDYGebO4SwkCCxORdqrTEAE208WqNHlW9EeoAw+Zn7Sq8lDwg67GKwPQr3qXzEUmtiXWLLd
	YjGW8GQy2I8ma4/P1zUfWrBK8b25WQwriq8e5KJRPI8o15po5BUaEWwnW7I7M4XzdVAf2+z6n9zo4
	ug+jOxYAfzcIaMD3CVUiXysjVyLoOtk0YyfvZNQn6rKrplQ5qQLca3yQ7/gUZh1R63M2CoczYm5h2
	kSrOInYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaCH-0000000HInN-3h3i;
	Mon, 24 Aug 2026 19:19:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaCC-0000000HImF-0ihC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 19:19:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6789C60120;
	Mon, 24 Aug 2026 19:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA491F00A3A;
	Mon, 24 Aug 2026 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787599139;
	bh=Nd0lEx9hD6ylLpwOU9yD0wtJ3+jV/rg5UBsT4/paZVY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Na94BTRF2RKxdkL+GaueRXmE0Ircw2EfbvvwCsLbwOsTjgK3B9rTx/kvlVO0PgzAe
	 WIiH5041aIY06VghRYSALGmPs7okvNfsZd04XRbTZrfTJPxfa9hUg06HyovG8fQ3lK
	 6Zi8xpWfQVs7pjFqm3rfO57bFpl38WG8mzRhm30G3eD9yh5AR4l6hOisw8J4Vpf4hc
	 txiY8o5eIx/AOCVMV7kh6rAf5oY7LhfNuaWnWBZcffF88lwQtpq+4YW0Lwht4HeQ/k
	 Lfb0GdLZdl4Wlvhux20orhrZVxbL2Ld8QqJhMYEZ2p88S6t9hCkDxz4LoWb0ACv1Qp
	 NpPOWDCkBXGfA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0D903924A4C;
	Mon, 24 Aug 2026 19:18:07 +0000 (UTC)
Subject: Re: [GIT PULL] second dma-mapping update for Linux 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260824145253.1740671-1-m.szyprowski@samsung.com>
References: <CGME20260824145300eucas1p10b9c95dddfc11e7847607f9c473b6f38@eucas1p1.samsung.com> <20260824145253.1740671-1-m.szyprowski@samsung.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260824145253.1740671-1-m.szyprowski@samsung.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git tags/dma-mapping-7.3-2026-08-24-2
X-PR-Tracked-Commit-Id: 04a19b35dc05354445f0096befad63af885bb77e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f43193b88188b184a967c9427602e019f1b8708
Message-Id: <178759908641.3075085.6062286800482339777.pr-tracker-bot@kernel.org>
Date: Mon, 24 Aug 2026 19:18:06 +0000
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, "Aneesh
 Kumar K . V" <aneesh.kumar@kernel.org>, linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Mon, 24 Aug 2026 16:52:51 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git tags/dma-mapping-7.3-2026-08-24-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f43193b88188b184a967c9427602e019f1b8708

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

