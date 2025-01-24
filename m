Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C386C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 23:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MabAroFP/QwMStf04OXR5iCZz/D40aofwj0AdnHcu8k=; b=VgDs+nijtAjM2Zv4EFHWbOjwwN
	y8Jx7qmhT3XC1GK8qts8qXWwU4UJD65VKzM9prOU8vjszctXxAkL0fVUjrtwaWqdjNtJQzGLtryzi
	lg0zVATK+YYWV6UXk1D4ispB6LF6h9hD7+u4j5TnizFU9xo+TnFG3Spuu65JeX4mlW9vRt7BRMfo4
	jmMVEqygTozmvJaE2yT6r8BGVd8Kgl6R76xFjYYWaSt98aoHvjddjAVsS2+CqOsYELSlH1OYlfmtF
	tYox/VD4F5Kg33SzNsecYP8yX+Ftdx3Lolo7WKBbizOavIKIcgjFTOJIqmt9waK0AAIXzwtOdD1me
	Ib+qlXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSpg-0000000FgQB-3tnu;
	Fri, 24 Jan 2025 23:11:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSoN-0000000FgDR-14OK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 23:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 27C415C57E1;
	Fri, 24 Jan 2025 23:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9E1C4CED2;
	Fri, 24 Jan 2025 23:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760201;
	bh=7VgfVJzS3JS/j15bcfH4pLHzKDDF98ESyq7FqeSmhTo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ahORzODpfHCzeASrO36U8y+zMoWkcezFg/gDjrqA7DoG0BtM9wG2+AIMqBtHxy5fk
	 vDlf6+4Rn9v9PzXGhr8fnCVtoT61JvvW2CjVW2Mw2een3Ji2EVLDDwz4mWZ1XN2BJz
	 V4q3yLh39LjcFMH/YzesgiRiKQueuVrOpEu8cf0Y2wQlUt8YBuu65cli131tDpnZ5i
	 olOwLQjSuMAn6ZPiJ+sK+GKIyy0g8d1IzKSyPHbUCueaBChT5Fd8brd1cJkXog4ltW
	 C5Da5smU+53VWWPgJXryLwll0DBZav8qvr+oyPKYRD7b6tw7T+GuZr2IBC0ZmR94JH
	 lhxVVgzTN/lDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 35027380AA7A;
	Fri, 24 Jan 2025 23:10:27 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] soc: arm platform code for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <f06cf7c8-9480-4cd4-9380-47161dc56d0b@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <f06cf7c8-9480-4cd4-9380-47161dc56d0b@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <f06cf7c8-9480-4cd4-9380-47161dc56d0b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.14
X-PR-Tracked-Commit-Id: 2fd7a3f27892f1ca4fca24591a7a82fd0437e080
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1e8f6db9eb1d88e2761d7e8498a06e9c4c0324b1
Message-Id: <173776022591.2196000.11789540028171292166.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:25 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_151003_338492_918DB89E 
X-CRM114-Status: UNSURE (   4.53  )
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

The pull request you sent on Fri, 24 Jan 2025 16:02:44 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1e8f6db9eb1d88e2761d7e8498a06e9c4c0324b1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

