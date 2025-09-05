Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDB4CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+eSJlII7zK6cST1PGVq55qeYoeSZ1jiyHmLtc+NkhU=; b=nwMYo4YTezURL8al3F3KnLeGSA
	mGtAVb7QNOdHQtQ0pAabjWGQazZMXgjenEir37Oq00OxXbTgFKU9HfX4arQl9h2E0/9vhRrxc3il1
	NeobZeC1f5PYG0aIA1V0CJ/0cz+A7xpeWmnLJGtuOQXjABc/gGQO6uR2R6O/hg9LmLIXesxw/xQj0
	//eO8Q8s0GylqwHBaReuetV04riz9rrfw5fPg8jW5cTvwZeN+vGGaiqBBsZYBkS9A5hhJlEbcAyiY
	1Xe9uivdhDTc2vh00+Hlrq5l9B+0XimkvIWh+CrRLJTWPsZ1J5NvC87UI1hFek5LlxtKv8MKc4NPf
	nHl6sUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugYF-00000005Whg-3wEe;
	Sat, 06 Sep 2025 00:13:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uucsD-00000004P65-1qbb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 20:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A5CD44F60;
	Fri,  5 Sep 2025 20:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1A5C4CEF8;
	Fri,  5 Sep 2025 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757103448;
	bh=riI43D9lO1MLv2qm7PX19Iq7jYpv/aKJ8u0QsSqJpps=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ttdoIzGDNxvhxeoy+O6UA5XhzDH+8T1EcwQ2RW/qWySEGEkF3vDe3Kn5LBij2VUPO
	 JpaZp1bgW/5bVdTrkhp787ZC0TAu3ewb2YHHhU0i33Exx/CmcoZYKzNBeqWDPJRONw
	 AwVeOjAoRFF3l2HMtPeOxGb6pRCYThOjDptVyAWXrf9cf1c0Zt3yfY+PDwqo/AKLFa
	 E2jSOROYQnmnNIb2A/XO/tF5FrcqQID6qNFhT808rXmVLBHAE+SA5yQ9Zc67PLYSie
	 7eGMaJZe4q8wzSeUGotrHXLqjSmlsYzVoyBQQgiP3cF4OSiGwapMXXbvRhWaE+giI5
	 Mciq83XBnql6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE6383BF69;
	Fri,  5 Sep 2025 20:17:33 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.17-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <aLsffo3bIIH4hYSQ@arm.com>
References: <aLsffo3bIIH4hYSQ@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aLsffo3bIIH4hYSQ@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: a7ed7b9d0ebb038db9963d574da0311cab0b666a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e5d5d23319565a7e48232707c3fe30bd4eb638cd
Message-Id: <175710345262.2676293.12334008211790244742.pr-tracker-bot@kernel.org>
Date: Fri, 05 Sep 2025 20:17:32 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_131729_502010_8CEA1F7C 
X-CRM114-Status: UNSURE (   4.84  )
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

The pull request you sent on Fri, 5 Sep 2025 18:35:58 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e5d5d23319565a7e48232707c3fe30bd4eb638cd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

