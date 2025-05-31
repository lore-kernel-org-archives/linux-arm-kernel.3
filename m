Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3681C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 15:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxMVdMLKBXdd8T+AKwL8HopiPeEwKtVt73L8ofsbxb0=; b=cz98zN6g++nt/oJDQ7c7RTeyHI
	B0tFXTQoGBKVH9aaDc+evG0uVOCrLUWuvimma9Rvet1Qyum2c4Y2UGmdr1WDm/1QWKEwe8SThrBmy
	7ntHjYpV5q1BjY8ykAozw6Cpz6iYsBljm8IgslGvGa1X9WsKqQKcK2Eb6Jh/tWgPmCS8bWG2X748n
	V4XN7sRf/WPU8DlWGZUq2YuZN2T1nzOelAdThmaOTaIpbPERN7s1TJ6jxr3yodQU6raYkXqAHt+VZ
	MwcndwVUY29P0irjPygkvvEUrw7UVUwQenZHBzO2aoMMibvl+J7mAHyg3Xk6NyV+DqTyLcjzgV23c
	9iz2Mwig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOG3-00000003zHH-1N0M;
	Sat, 31 May 2025 15:36:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOA7-00000003xn6-0CCw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 15:30:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DCA64A7D4;
	Sat, 31 May 2025 15:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BA6C4CEE3;
	Sat, 31 May 2025 15:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705418;
	bh=/aV+mxMZ3EDv8/MoJK4yjwQOt7JNJvr+1eK2NXFLV78=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rumRNEuie4jf5TuZ5ntFi/P/iTU9qILW2oLhJBITJ75rtqQa4loDUPlwJNRK1H+eS
	 LRJRMkWj9HFSBI4+tUO7mEWlxifnIB5cToGrPEq0oRVeewaTEwXpNH0Siz2sCKh+Gv
	 /gHt53zahTdbi7KUPtyB1bOYlMmRdQc82cutK93dSsbr0jcQIZCMm+Vdk20jAj+CRC
	 5WRq167X2NGkpnIEyhZP61PYmbD6plGGGBRgNAJj6IWYsJibhZtb5YfyeY/LY4sk6i
	 4be8NR5j9HZGUzgPlXaPNTPmnX+arQt9X6SSZ+DmUxDmiMITdfT9/x3Cn/wMieizpU
	 x430Gb9uhXcIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70DE1380AA70;
	Sat, 31 May 2025 15:30:52 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] ARM: soc updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <0744995a-856f-431f-b694-6919ca161c65@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <0744995a-856f-431f-b694-6919ca161c65@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <0744995a-856f-431f-b694-6919ca161c65@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.16
X-PR-Tracked-Commit-Id: 16066e29d3f5a45cd1ced62dacfce45c9560be1d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 500af1defbcbb6113c9a958b791517d0562b8d6d
Message-Id: <174870545090.163157.3390188665573038835.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:50 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_083019_103291_89527E0B 
X-CRM114-Status: UNSURE (   4.59  )
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

The pull request you sent on Sat, 31 May 2025 11:02:50 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/500af1defbcbb6113c9a958b791517d0562b8d6d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

