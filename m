Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296B7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 22:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KN3EZkrWSPjgDq6WI2O2Dp5tt+jwvaZY5azj0IYcgps=; b=dAjFE1qBNrSHQkF/AefMbdxqI4
	5v925SHrxW+s7Wh3oKJfGFc7x7CZRfIlVCkF+MVCnsP75+uTyBqHvK+MdEkrA+UjeQJwzVMGQteNt
	8l+wsDS2QoexYMq5lzZ02/oNU0ujuzmMZMRu4w5HUAm8bVBjwQk2ZJW5lAwHykPqzgzbQkkdZT3p+
	Utbr/AyjVp4V888urYx3WrvWKFvr/1Dobs3yzuY8n3DXxWnG4mYensexTT5L62rnYPPcBMk03drbr
	B+02/DDATnozfIX9dBFvl5+BznKUCOnez3MCUTKe5FYiMycsGxiueSPmcs4JTPlPuQ0azOgwr64K0
	FQnL7/mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlEo-00000006ApO-0e4x;
	Fri, 20 Dec 2024 22:12:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlDf-00000006Ai4-0gey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 22:11:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9440F5C5AEC;
	Fri, 20 Dec 2024 22:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED1AC4CECD;
	Fri, 20 Dec 2024 22:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734732697;
	bh=kgiobXyIZMt/RjVQEERWL+qrehOPlwO8CJlkGgW/o1Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qFBWaWjYuyc6prfZgj4mBxGJcJFkatr0c5h6nF0gjsbSOVdBCgvC0NHkrALGeB5bt
	 gJ73blnyKZ+jT2wCSLtpJo8c3G/5Srewc0XnnVcW2MIoiCaSLynftIwJl0vN3cfTNc
	 /y1P57eWUYtLuUjivs7qedeeOXSH4FlkeD7crbhJ0DHBZEZ0ugts44/lrHUua/YI34
	 FYKmVoPcCG8K/DNghxKk8TBLAfH09CpqGL76f1NlSN0d9Rcie4/4+XYYtAjbMkxJdT
	 zHc5w4OqzTCqfL3bwbNvPRJ5s44IbRRF0yti2FO18QQYcgFKm4JY37scqZ+L57ErJa
	 cStkL+FHfSfuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E953806656;
	Fri, 20 Dec 2024 22:11:56 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fix for 6.13-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z2W6puapTlYMGeyx@arm.com>
References: <Z2W6puapTlYMGeyx@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z2W6puapTlYMGeyx@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 926e862058978a8f81872845715d67ad21c30f65
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 499551201b5f4fd3c0618a3e95e3d0d15ea18f31
Message-Id: <173473271491.3035596.7797347508137942205.pr-tracker-bot@kernel.org>
Date: Fri, 20 Dec 2024 22:11:54 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_141139_248723_26980BD4 
X-CRM114-Status: UNSURE (   4.09  )
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

The pull request you sent on Fri, 20 Dec 2024 18:42:46 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/499551201b5f4fd3c0618a3e95e3d0d15ea18f31

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

