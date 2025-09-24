Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB18CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 21:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THp2I/EJjElcvpql/NGIBYxszpu5F7oMEvETNLboKbo=; b=rXGPSE8YpgbhFUlhwAAVtoyqWP
	phhj+nUKAHtbi5yR/ffFly6ovhulDO4esWALTrwmRDiCZXx/UNKq9yIxTX9GIBSWMV8+dRTpdfPnB
	LaXdzNZz1CgBC+m3XYI+/tTYQ4SzhhG9liUUjiOzbLYW68dQ8wWUBsNnuENv7nBMcA7fHY7pzq9VF
	lYMwHO7rlODW9HvU2x7Qs+BZkgv+Wt1H0VjW+r8b8KEtqRlelIcYgbLBsxvUzCg1K1GE1kR1pWqHu
	cBAgM9rDPd+m6bALjY9mp7NwcUoOEwn4XaKTEQ0Kv5vsvqNCrqUNHpbCjjXRjZJCK9XSS9tg/R0Xl
	aQsfjOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XKS-000000041PV-060f;
	Wed, 24 Sep 2025 21:47:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1XKQ-000000041OZ-2yow;
	Wed, 24 Sep 2025 21:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 28299602BB;
	Wed, 24 Sep 2025 21:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAEBDC4CEE7;
	Wed, 24 Sep 2025 21:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758750429;
	bh=ANND0iRENRaFSgE/hRDoAWTStBO6vYY2JgBulVQWiNY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Nqc4PNqE6f/vBciuFeJBZkWPKGHKeTbRWqdfvotuXnfU32lKURFDzO0chk4DW7Xta
	 gL6vvLdE2kZ4O+bxXgMWDPIJSpRDWBW8topiNqc4iIb6f2vhiA3mG9sMEQlWpR+71n
	 lTuVk63mF64yHFxawcyEsYGQxnNwCqEXSHKSE6d+Fsl8oggdAnzVp9Y1jjV7kj/SR2
	 kSQDh7lmGZU+IdzrLX4cHDJJ6SyQ1A9WDKIYic4gh/IKkyLlcpC4yIh7beGkYUxbOK
	 kaYACZh0lvQRUVlWTpL9AKr7hCTIehADa/SpRljtVo5jXOneSYHAVrEVGnjyM8yO1m
	 LBxztGerNt3Fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EF539D0C20;
	Wed, 24 Sep 2025 21:47:07 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.17, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <6565e739-19d5-465a-9fb5-d918bcb24b56@app.fastmail.com>
References: <6565e739-19d5-465a-9fb5-d918bcb24b56@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <6565e739-19d5-465a-9fb5-d918bcb24b56@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.17-3
X-PR-Tracked-Commit-Id: 13923775d5b0b47656e800bec7baf50a20474aaf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ea78c190810ecd2c9dfb6d22b52fc670a38e8836
Message-Id: <175875042603.2710061.11952077850560903706.pr-tracker-bot@kernel.org>
Date: Wed, 24 Sep 2025 21:47:06 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, soc@lists.linux.dev
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

The pull request you sent on Wed, 24 Sep 2025 23:08:56 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.17-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ea78c190810ecd2c9dfb6d22b52fc670a38e8836

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

