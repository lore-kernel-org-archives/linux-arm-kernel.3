Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA730D73616
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 23:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTQzcarjruTUGh1w5vBhUCFrMj+jYN9SNpBXLoMYN0M=; b=IoXQ8THQB8DyT6+gj8z4k057D8
	BInVPNruriMAPX/wexsFEnOmVAufoYvi5s28sBGuGpugGx9AHJ2x6+thGClR1/F7p/FXUIonnFj7r
	RuHws0c9xHy0T2FOWKF1m1EY4EDsG3Fpssc3+gSS7cvx3Kmx/2k1bY2dFvTdQg0gX8dP4u42OZWxu
	100gpbkBmhYuVL6RWOl2LD0bFP9rVxGl35Tr7r0mKEOp/oEBo338YsLm5srVhzjFGiuA6Y+l6OptJ
	uzswJAj+/JUp1vpvB7BIFA8y9iY5gu0p4YdAj9K4XDK+H5NXynwhjMJLDUGKeTcLFUdUufjTdF2CM
	JGkpyucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHWhY-00000002irF-0U5H;
	Sat, 30 Nov 2024 23:16:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHWgZ-00000002ikd-0o5h
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:15:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E81735C4A9A;
	Sat, 30 Nov 2024 23:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B812BC4CED3;
	Sat, 30 Nov 2024 23:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733008533;
	bh=tnxuqblEJMiJaspyoXmZVWsww50YIhEz90c+Q197mmg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cnw2j2yz5gV5hcgUp3hmclJNhO8xrxVDFcWaco7qvnPqjUAz1/61WDllXE9BUUTqJ
	 FtDsmVkt38HbkpsbMQmqXxmvkhMptjaOg2YVkcTpmc5bCI0P4tdCTl1vT4NhS9/Xei
	 GIqOqHGkb4VP1uFNaAq0HHGE9Kc59cTLTz0MTFVoivZhxyuPOvearEqmzI5vzHeKGP
	 tiEuPCR1QJJxj2DhDWOSXpaxQbInxi6MFhFrF+Eh1YHG/vB3arFSGFLygKbwn4By4c
	 DXCnT2Bh5zF4hK0EVLylysE42sEp0sLoQNRO0srN/zdZU5x0kzS3HCQzTGDAIYxEYm
	 gYqaXR/ZJS2TQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE215380A944;
	Sat, 30 Nov 2024 23:15:48 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z0osmEaBnjdHS3Q0@arm.com>
References: <Z0osmEaBnjdHS3Q0@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Z0osmEaBnjdHS3Q0@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: dfdf714fed559c09021df1d2a4bb64c0ad5f53bc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 50ee4a6fe3529fc98820f466ec6000aa333a4539
Message-Id: <173300854719.2503582.3539406702952422848.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2024 23:15:47 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_151535_269985_4088EA29 
X-CRM114-Status: UNSURE (   4.75  )
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

The pull request you sent on Fri, 29 Nov 2024 21:05:28 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/50ee4a6fe3529fc98820f466ec6000aa333a4539

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

