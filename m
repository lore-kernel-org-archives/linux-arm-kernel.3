Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F298FD743F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 23:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7t4FuOgQACEje9Lvn4lUoJwpnNTEMFHwS7q/99jpNc=; b=PamNgYaxVwSXVC04pm5G4VJm7p
	UMpWReuHkeDvTw99Jt6DluGeCqh8VjfMq1M1svfoDW1HKGzoQ99R1yB1WytbVdezxZ5PgyvZTD/ip
	oP/ptfFzZTcDl+QzO7YoXJwDEj0F+PLMTOOSNVqLmLOouniCPog0HjanOjTVqBbm4LZOJh5DddTtv
	o3MTRBQncRAXoQYTLN1Ga8cX9MYa2Hk1adzxG0P9vjHzfqewMeDcegDIzaBX0HFhtFGskl/NnMy/Q
	gO4hZ/7B6eBx6UM1GfMsSmjF7xO85fgNhY+AQ5XL2Q9sUfaCfy+sgX8fIpuaTjTbc3X5/MYosfRjL
	11CYwCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuWD-0000000GRop-2098;
	Wed, 20 Nov 2024 23:53:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuSd-0000000GRMj-3ryq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 23:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BD965C5BB9;
	Wed, 20 Nov 2024 23:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272DCC4CED3;
	Wed, 20 Nov 2024 23:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732146615;
	bh=OqAjSpUUNBYiOdRxJEe7prLlAds3BTXXfb9idsZe2eo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iu6YEBtCWcmALJTzIhwSZrMuKxxJy6zlrhO702EzXJf/PWYzwqeUW/pWB606NlaGY
	 nNYlFOHfMC8161hxjmfJAq8S1ZMEZ77Zvu46C1qAOBIjZ8dpl9fyqnPdbopGEetw8o
	 RN2D/yK7IXTFG799T1RdbAFGrnZgmU4pDbt9b6so1PxjvfracZoSpSrxfKIY2I1JAB
	 dJuZKLWCz3pEkr7PG+nGZYaEiO4CgK8k+PrU1DBKsA7itBjM+OpYNc5SwQXphMb5YG
	 yqjnVknIxj43WI61mY/WBqOw6TpwfpC8kUHUqqlWRHZDtdC3uwHn/OZj8m3xt/opI9
	 l31D3id9O9DaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E443809A80;
	Wed, 20 Nov 2024 23:50:28 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM: soc updates for 6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <8eb10ff6-08f3-4efc-8839-1d7559bb8c6f@app.fastmail.com>
References: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com> <8eb10ff6-08f3-4efc-8839-1d7559bb8c6f@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <8eb10ff6-08f3-4efc-8839-1d7559bb8c6f@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.13
X-PR-Tracked-Commit-Id: 9c6cb0377534e77265ea673fd4834f858d5d1a6f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2
Message-Id: <173214662694.1393168.5527301233918920474.pr-tracker-bot@kernel.org>
Date: Wed, 20 Nov 2024 23:50:26 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_155016_002170_3327C298 
X-CRM114-Status: UNSURE (   4.92  )
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

The pull request you sent on Thu, 21 Nov 2024 00:02:53 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/43fb83c17ba2d63dfb798f0be7453ed55ca3f9c2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

