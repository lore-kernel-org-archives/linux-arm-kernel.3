Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE82DC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUlCPsdl2P2cUYSGZEMFCFZUbdr/V5ylnRW5oNz4Peo=; b=DoFtR3U4k0L78yNgkWD2lu6aBB
	KrxMmR1JQuJonhFGsua/kU2mv2/+XJFZg+Aa1FaWCMccbCuZgIX/6OfxGDHh9uGtqbsl+UmSzj9xd
	IlEAeqbeko7bdgGUpSoPH43BZCuOqwjZ7ierNi6SBpNX7cDU47w/mxQKaMBTcr5Y2FmY4YWmX+IlZ
	wRzfIzgH5qTPe9sCocsN3dAPum886HggD2afmX0aLhr/aBZKSYJpHZDHuN8W+OSpOMLhb88CovxWU
	nL97HHIUiYOyvE7DYu0O1lmjRBxmrZK80bH8STjd2XiwWSiAw1Qc4l4rDOrbsZ7cFP3PWOEMcaBAU
	1E/FpPbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txslL-0000000BoR3-3Ae6;
	Thu, 27 Mar 2025 19:19:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txscJ-0000000BnTR-1SxY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C36AC5C626B;
	Thu, 27 Mar 2025 19:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9540FC4CEEA;
	Thu, 27 Mar 2025 19:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743102614;
	bh=b2oXZnPzsIum4K6TXMGqWU1F5vMP9hIiJKyV23xpD4A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=q11eVxxlT2mMfu/SemfDhLr8oPIVcypJuO+4feKNi05V8rjEQDbQl5IPsOrvuv6xG
	 WTtI4B83NLp1fIt3AiOPOx/L18hZyR7GxTpiCbdI2cpWBHTzuRypHpuMTenjxdp7bu
	 mWB9R2zrckjkcfejlvitfp03T7mg/wwFotMZVb/yaOInQI0EyZ7r/5Ha2CsQ/qKnI3
	 9adMWrbQIvInxYa93IAbCsiUfClT/VkO7R8+8RT8yk9x/tkrDZzNiI9qQIX7FBWqvy
	 Q4MBiJ6H6ONnLgfrddKXwNA6EIHDfkZi/eAI2G8LvejLyMOSIyvsyCBMwQMktkfsu0
	 ys1GVUPdnYxIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F1F380AAFD;
	Thu, 27 Mar 2025 19:10:52 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: arm platform changes for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <ba5bc4de-e264-41f4-81b2-757ed275fa53@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com> <ba5bc4de-e264-41f4-81b2-757ed275fa53@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ba5bc4de-e264-41f4-81b2-757ed275fa53@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.15
X-PR-Tracked-Commit-Id: 46367f09b2203f7c63f89293aea9279b875d0ff2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3536cb1e5753a832f88c268e328c644f6e367980
Message-Id: <174310265091.2176831.2744875539352981808.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 19:10:50 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_121015_441146_AB8B7B6F 
X-CRM114-Status: UNSURE (   4.42  )
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

The pull request you sent on Wed, 26 Mar 2025 19:03:55 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3536cb1e5753a832f88c268e328c644f6e367980

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

