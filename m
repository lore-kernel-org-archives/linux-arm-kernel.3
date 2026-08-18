Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14038C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rex70n3xuoVsZUjC+kbWJQ+frdpWcIePtFGUIWDW1Lk=; b=lynN6CDLR9pHw09ifczMqgwUKR
	UdgMmGSgnnsNRoyscL9c8qNDljUczY2dVxpQFlcrll3ZLaqaFHokL3BtFa1nkHsEB3R1bi4Ju1XBT
	Q0ShEdr69d2I1cxLKh+5G5QizPIaSNx457x1SlViRp5NnqZX/ZRAEa0F87tudy3K2IkgrlBO9avw4
	ePojEKnScXXyyvGmz9gbpM2RfXgeIb+NPOjm4e6pM6Qa9mmc/6YHTyJ8TFXUfGU1TzW0+egbsGRy4
	vbXniHKfELGuDoyedZg1ZLH2GngzM6zbEIPfFOOzQSCE2JoxR+5+bjirVQFFbtKwgeRnXzSCmpyAH
	64kFSwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPHf-00000008ZZS-369p;
	Tue, 18 Aug 2026 19:15:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwPHf-00000008ZZ0-13a4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 19:15:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 628DA60204;
	Tue, 18 Aug 2026 19:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1772C1F01564;
	Tue, 18 Aug 2026 19:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787080538;
	bh=rex70n3xuoVsZUjC+kbWJQ+frdpWcIePtFGUIWDW1Lk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=a1cnPqStVNyLibp65poXoPt9LTio3fUfE/XWXcpALbykVUamzuv7QLinKiIdgpCUL
	 iH/iGrsfZl84MvzxiU08f+yvXIA093g1QHPZEvhFNp+TVYkq17pd4Q5/Qi/+8dZcrn
	 z5mdqsVkjnadYGCDOcMhjFvYqyKhGtYbffoR3INz+q+zF0hs1UKKvqn6txhLLvIpQ/
	 6Rk9QPjsn/B334D3kyGwemSWCa6l+0i1771A4dzKEjQkI48Vx2MbrnuAZefpBbBW6K
	 pbeBxX5/k+dkHhnB3O7BH+UomX/Gs2GNpmSbT8wGai1gG9sD2Wke0gN6iLgCAAGVrU
	 0RE3xTXbGm8ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09C33927051;
	Tue, 18 Aug 2026 19:14:50 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aoGIWuq7XL2jnG7s@willie-the-truck>
References: <aoGIWuq7XL2jnG7s@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aoGIWuq7XL2jnG7s@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream
X-PR-Tracked-Commit-Id: 26b77009ee74f6122a067a4f9926ff6e09fffb94
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 85cdaca6970028bf6f544c355c90035586836ddf
Message-Id: <178708048932.2235733.552017722537862074.pr-tracker-bot@kernel.org>
Date: Tue, 18 Aug 2026 19:14:49 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, mark.rutland@arm.com
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

The pull request you sent on Sun, 16 Aug 2026 10:52:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/85cdaca6970028bf6f544c355c90035586836ddf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

