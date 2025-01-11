Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A7FE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 20:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9KWfY8Hcp2UXnIZNmRYFkTUKCk5ns1ec7UAiWxB9nqE=; b=duReVOktqZClkVfrSV5EMv93pW
	As9VzQFd3b6eG4Hs45xm0zBWv6ZbePRaJoJr4OTtov8fNsuX1ZJ6gZgxp0HvOhfNvGHYl0N3TbDjE
	BcMgj1Z4OhRDUIV65jcE+ahh3XckjUMUdEoFCIArQu9FPKramw6TD94nWJEnCFegabCRyubDd20vy
	1jCRKvZenasTTLTiYicgzSvgWz5YoZIMRnyg9NJ7RCsU/B69gH5MBS1IE217hYtMWPO3sGqFL99bR
	0w3nCtTTQnXEK3sSByQKCgOX1mcFHsRQa6AjOXtc4bZoZiiKIg1pOx2vorKpRflTc4nw1BRFSKgaM
	+K2n+DQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWhgi-00000001NXg-3NNv;
	Sat, 11 Jan 2025 20:02:28 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWhfR-00000001NK5-0F4Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 20:01:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1B00FA407F9;
	Sat, 11 Jan 2025 19:59:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CEDBC4CED2;
	Sat, 11 Jan 2025 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736625667;
	bh=Sgwi84VkkgZnJ6vUPufItBOuLmdBhf9RZRhF/vTtie0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CDSBF2pyUb4YrSZtWUey1O1ehqdrJl1uomgkobFYraOljjghax69bHKTAUcSRTkPw
	 KAoTMI4lZUsTuf9PWTGO+pimBFF4T/FvNwMAaxMTEBcLLhROcbtYT+KNZH07FT23ev
	 EIDSmd/WAV6YElDqwcrha+8vemq7JuosWhZQviBuz9NnflaB/bN3r1ApkE+ZGYnPsI
	 M/hM1qF23N3XhWyjAkRx4A52FvQHq2m9vd9gvLGXWugs5TmGzTDGuf+FsbrAzmOk+v
	 IuDFdKmzjcUGTXHJKP+F8sx2ztK/Qnfg3bVlgx5w1o0tY7vsiMMfYmibyY042yIJa4
	 WuQh5ZiO+ecqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E81380AA54;
	Sat, 11 Jan 2025 20:01:30 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ffc40760-bb53-4e6f-8e0b-efa1fbb171e0@app.fastmail.com>
References: <ffc40760-bb53-4e6f-8e0b-efa1fbb171e0@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <ffc40760-bb53-4e6f-8e0b-efa1fbb171e0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-3
X-PR-Tracked-Commit-Id: 5391c5d8e60610bf914f767a6a749004e2d223f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: da60d1547deea5d597a0a70d43a547e6148b719c
Message-Id: <173662568895.2439897.8837686119817785965.pr-tracker-bot@kernel.org>
Date: Sat, 11 Jan 2025 20:01:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_120109_163844_5CC622FD 
X-CRM114-Status: UNSURE (   5.11  )
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

The pull request you sent on Sat, 11 Jan 2025 15:41:22 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/da60d1547deea5d597a0a70d43a547e6148b719c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

