Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F57ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+e+hA6vshYY1krfisHxwYA78Rn6WHA2C2UgjFfi4wY=; b=b7tN7Jzwfoj9xK2QQX/hTys9jJ
	A5KRv4HjHSpWJO7v9NhxkkKeJ1vp6wqXq0VGykeIFMyMIymwe6wCSc6kUVphtlQSaVqPIsPFDipLM
	hAdGLGspew+a49b3fTWUYye061n+M61EM3MXSJ76NAzTmz7BGFKPq8zbCjjMhHtZID9hlmnmx2kzF
	xFpdNglX6dyGtjeiwnj/Yt1AKi+D8O4Y9f+NF5gR1m3pcEcwfNIszw3C5hNxZ3oUN4pGbtSNj0Kyc
	ki5ihR8mAz3v/QbQlOaBEMrZ3hxt9KkPch4EkKdJ8xELyScpLJuzaUcoPToLev6f3uhlr3gm0kaXl
	m+ZbQfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC10u-00000007NBl-429I;
	Thu, 23 Oct 2025 19:30:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC10s-00000007NBG-2hUx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 19:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1611A4B0B1;
	Thu, 23 Oct 2025 19:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB458C4CEFD;
	Thu, 23 Oct 2025 19:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761247818;
	bh=1Y/y50WGOlMTTCe84TsHd3cSHzkic+ceDyTy1PEuEB0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=MUIhoDuK7B4rZJkHrfifPlenhu6hmntNgG3yzDALEFw6MthvzoT7/o4SEDuz9fh5c
	 RD26LeYyZRct6U3+PchMy556cMcviZKUbOdyzloNZlDn2yIlnB6/gW2ndk88XDpF6H
	 FXmOe4Zbj3uEseEi6JwH+AWG0aqnutlIA/ZzlgIgMiZeQNuIzmb9RZbcEnT/eOE3Yq
	 W/l1soQbw/CovGBFQDIV0cMQniHUD+Lan3Q0baXVEMqKsD9CdH9sL+AGpAHRT+GPnG
	 +3kV9Xkc2rNTjgEHCDyGxDZU/pOoqhDO3r3MT1v/uh9EX89OmtVoUOgl/Pbvn4txzf
	 FupU7reIWqexA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713F6380A959;
	Thu, 23 Oct 2025 19:29:59 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.18-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <aPptJe8qXOGO-lGt@arm.com>
References: <aPptJe8qXOGO-lGt@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aPptJe8qXOGO-lGt@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: b98c94eed4a975e0c80b7e90a649a46967376f58
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 266ee584e55eed108583ab4f45b5de734522502d
Message-Id: <176124779801.3220186.11968346054917749523.pr-tracker-bot@kernel.org>
Date: Thu, 23 Oct 2025 19:29:58 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_123018_724045_31EF32F6 
X-CRM114-Status: UNSURE (   4.49  )
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

The pull request you sent on Thu, 23 Oct 2025 19:00:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/266ee584e55eed108583ab4f45b5de734522502d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

