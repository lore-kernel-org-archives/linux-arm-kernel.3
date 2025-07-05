Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA11C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 00:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0X2ySdq4Xd2nRU2YLBlQRiB/elsPLDgTwtRcHAfvL0=; b=LIF5VzsupY6NFORgdeWWrwqlWe
	ug/1cdp2JZ23vxXmwPgSwTcM/HKqqFDIAjP2OJYQxTGlcXE7XQfJEYiuYbivbivPAxSZxxkeTQOxd
	aZdu4UVCL1nJ/Az4IduC+5pB30h11AQPvZllMh9MrnHyZG0mWoX77PtZAaU0BZzFHK2zgjcIYAuSg
	sBEPcDay+bTAtcOROUZVduGS4Ts2aD0sdP6XD4jbc+DyQWDg6dcy1QIwe+8mceQVNVZ3q2OQOuday
	NhF/0cClSoidEpGx6K+o3rJDvLMFI5GDJnk74S7iA2w1rbb8Lm8UHLpIimvJ8+dvQmoRQemvGqrs3
	FkAwvDrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXqtE-0000000Fj0z-430k;
	Sat, 05 Jul 2025 00:36:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXqqs-0000000Fipw-3J9I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 00:34:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ACFC466F7;
	Sat,  5 Jul 2025 00:33:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B63BC4CEF1;
	Sat,  5 Jul 2025 00:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751675637;
	bh=Tr5iJKgiT0z7XojSEiCQJ6l4nii6Ybq+p+mSjtCiPPE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=A75Uxm/xDnMTEyLAqDffVeFrgSSzivyx4oLKgRRSKLwL8jUBaBFxnmjloEOua+vDy
	 gGk+119pky8NO+wnTfESVBuh4PO5sA4fBVo8rUdhpvzgXkhWw439plmr/LZbtcMdVU
	 YXyIUdH8Og9oXYuu0hN/vZLxXyEXFQSeFydhKwinWR1B/3IAdSd0zOlCParUlHKnpq
	 s9UkMLSjaTZDvecB+ef1/5D1PhvWVJgI4pWC2gJIYp6E8SWeQAn7UWTTER0eGRh9Ia
	 UWUDVhpKc+Km4WOfV60LCnqxd0OKwujiLcTCGpk/2VXqnCAIqhTlNw2pEL+FOqjU5W
	 ZHY8txcfa0BWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F35383BA01;
	Sat,  5 Jul 2025 00:34:22 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <01889b2c-3a49-4510-9e25-b4becc0e4a2e@app.fastmail.com>
References: <01889b2c-3a49-4510-9e25-b4becc0e4a2e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <01889b2c-3a49-4510-9e25-b4becc0e4a2e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16
X-PR-Tracked-Commit-Id: 3f3fb97374308993dbe8884f44c2579a81b90bfa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1bf2ef6259e6aedc3f952ebd9bc056605563b74
Message-Id: <175167566071.2360325.16244358644323018769.pr-tracker-bot@kernel.org>
Date: Sat, 05 Jul 2025 00:34:20 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_173358_850052_4FD86EDB 
X-CRM114-Status: UNSURE (   4.38  )
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

The pull request you sent on Fri, 04 Jul 2025 20:13:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1bf2ef6259e6aedc3f952ebd9bc056605563b74

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

