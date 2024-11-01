Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D939BE6F068
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 18:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSKkI4zNeYRXmSWvud80v5uOwYzt4UOn6HZQ6dZTt5M=; b=20Lv04wCx1KSeHnkZSoeJQ2vUW
	k2zat5IUM4fXeIzpiIQjc+te+cq9LVYp6Dvk27Iv3gXzTwBs4YCOj32QSXNaaDi9O1RXRga/nPwi+
	llowm8WRO0DsblaNO0jupiNtWHgtwiAZn+mI7vkle7GhEBU7o1vCx4+7x0Td3gCjwkn/LzE1/fVbX
	4m7x7eBHvv4OtMQT8CnDGUKUElvPLJpuVGvW5ZpoH5HN9hX4ovtSE3xRFyAQCBYghlq1VXoHhH0BJ
	vkf56DgWTbuGwQ9c9Udrra4ZUApqLIJEGxGBbi2MrenuskCetVucQQQjMulEILQnDTkF/8wr+VgGv
	O9zdIKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wV1-000000080Ka-3F4z;
	Fri, 01 Nov 2024 18:35:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6wTK-00000007zvt-0PQR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 18:34:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 760A3A44AD4;
	Fri,  1 Nov 2024 18:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F92AC4CECD;
	Fri,  1 Nov 2024 18:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730486048;
	bh=Qmy2SsUg/DjK0ASuxpIEoHApiXwwm7Lzg/npM5rGqaA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gMegm/u7rNcN37ojZ5yUGKFsZIUhQPuLimhohZaQF0vpls8akYp5KoPaX18TGEUpf
	 uh6FUgSRiQal7udxTuizRiKHmo+R9JKfBcaPIWEjYXym4fBuImkfjdfNtGRYU2NQuD
	 K2klZ5dIv/rYQa323URuisrJ2djIhBv+Um1DhbbDcNHr9dffuP21WKHgPxH/gIsBud
	 2k7KmkI8spc6Nch4p3t6z1Lyq7OrKtv7oSImME0NJEK55Ugrg26wf1xLOdVNKQuo+Y
	 zQMuqlrE5eFJl6yJf79Q3iHETPlCxNFYslac8E5/JzgH6+xaPiFz6rnNr90ctPXJQo
	 drnNuuXY8+wag==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4BA3AB8A8B;
	Fri,  1 Nov 2024 18:34:17 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241101112207.GA8472@willie-the-truck>
References: <20241101112207.GA8472@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241101112207.GA8472@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 2e8a1acea8597ff42189ea94f0a63fa58640223d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3dfffd506eff69e4246a0f1760e67dd90f9bbb32
Message-Id: <173048605655.2776063.16448857518642615257.pr-tracker-bot@kernel.org>
Date: Fri, 01 Nov 2024 18:34:16 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_113410_220088_665CBCCD 
X-CRM114-Status: UNSURE (   4.68  )
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

The pull request you sent on Fri, 1 Nov 2024 11:22:08 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3dfffd506eff69e4246a0f1760e67dd90f9bbb32

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

