Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18ABCC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 23:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J9kvLyYO8zwCVBcf85SwFFv4pqMBy/CZ3F6s1A6DzM=; b=Y8VlUAPkSqe10Nuov4o1O2d/md
	tE9D9G5GHJIEykGoHWI3Qvc+ryc5STej3rRibtXC4iNyf60swYTzcCx+xKM14wRUW2XYcYIsLfqrY
	cWERuX6Wp09dWdbDU4JDVjl+Ww7BHK0hz3vuHGAgoVQ81DeXxzo28fWZebJwhS9LOPLtOsHtpLPAc
	54L+bUEm8qXbC9/NX2Buno5FGs1rKGXiWWLgm8//fB0e64L3ZwsjuMEkGMqyFy4Y141WIWVXF0fmZ
	QIfSQHnHQAWHoTD7TMJz694xLgVneh/DAD2+9uBiEwrtyw8n+aaK2dxZAls9PX9gp5o3vXprOGXin
	I9/bmrew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSqx-0000000FgXl-2KHS;
	Fri, 24 Jan 2025 23:12:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSoN-0000000FgDV-2kDT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 23:10:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1C875C6206;
	Fri, 24 Jan 2025 23:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0130FC4CEDF;
	Fri, 24 Jan 2025 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760203;
	bh=TmabQ/nYOhh/0sNyLrazFQXwRk6ZYd/GuwkO+kxpGhg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JrB5neY2r1xenP9R4yb1XZiVbxh5DNXN3pHbjJDHbg1o+cTpsJPWDbQw6tB6eedHa
	 obNb08+dEQOb79ROVDPIaKsKq9yf/SEF0qh/tmBqplWzuuBGzdw1Z/719jx58z1UR3
	 w+kgb22BOAS6ho3nhFUIGqR7YaJjv06ZorERQ16Z1XHtXAZUoF1jUnA6RLWrlwuf3U
	 p0l1D/Lz+ShRADzlxlIEfHHCxAJqHDQlFaNHbhQr/hxgTj6z/uOqioLLMN95dTzrzj
	 djti7DF1o00Tj0FgF2g+5IjhXl343LZSE0DTdN3rMDqiJ495tI2/4HwDA4RWw6Xo2+
	 lltWGvbwcr3NQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342AD380AA79;
	Fri, 24 Jan 2025 23:10:29 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] soc: new SoC support for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <f3a7e280-9d47-45f2-aef4-394b378ba99d@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <f3a7e280-9d47-45f2-aef4-394b378ba99d@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <f3a7e280-9d47-45f2-aef4-394b378ba99d@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-new-6.14
X-PR-Tracked-Commit-Id: 0bcf3ac14626f1c174c262834656603769579497
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e517a6acdc40d61076ead4244b980c276af9b6e
Message-Id: <173776022795.2196000.4549627470445239715.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:27 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_151003_742164_C84DEE4C 
X-CRM114-Status: UNSURE (   4.56  )
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

The pull request you sent on Fri, 24 Jan 2025 16:03:28 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-new-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e517a6acdc40d61076ead4244b980c276af9b6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

