Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0221D743F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 23:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ucvipiwxl9XpBZdoqxuKAz5fGqg5zWO7QZ1l9yg5aE0=; b=M7dY2JpXMe7MWT7JQuvC4eaFF7
	ipc4x/BP62z72Z2eayBc2bU4IpSx//VmrQ/7hKYDiEYOJXJ/U59wns+Nc62Rw0BIguKg89WxPezpr
	2mUeV/t3hK95Sk7mgco67m+Z1P+pxKgJGgExxxVkNpMHKY/J+Vi+X+e1Pof5FQLitaiFW2CjBB2KR
	Ru4QTggCYkiX8bZuP24nswjS31f8GhXk1hR5W5nGt/7EoazkZ8x/N0jS0qrX3O3Z+V3DakAWPa83H
	06NQFxY/LoP2SQTZAlb+pmtGmIC3rNIdSgar4g7LWXObbW5yhsSVtu3o7ndozSjI6Z41ev953gZC+
	l+5IuoWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuTV-0000000GRUE-2qMK;
	Wed, 20 Nov 2024 23:51:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuSZ-0000000GRLm-1J0s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 23:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 966565C5BB9;
	Wed, 20 Nov 2024 23:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3228FC4CECE;
	Wed, 20 Nov 2024 23:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732146610;
	bh=K0kp5tuf+SSXDFO60de17alvWz9vZ9z4wreFG2rIQ8U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=L5czxUKUUcd3GweV91+TAWRp1vWiS5zqyynUN6TjbTw+n12jH6rF/B7cVhiNAGFzC
	 nxTkRG3djaNHI5Kh8SgPxHLg0X35Sja49/EQyc0QCLK+abHciPM37ffLR7a9b2PdhS
	 Cna5hsnplt55CjAWpPlR6yaDtbhewYDeIgrZs2b4sEqsSFqwkV73exXQfQ6HKguE6E
	 9pijnHbNI5qwWlJAdVj29iTr9cqDWNb29TSu8Ku/8lN2JvDF7C0pAXnwE6HC9O4J5Y
	 Wz1vZaFLeZ1GQL6gGySPNe43HPRf9idlGnpnkvXGwV8zGxcTheiLLp9ssb7zt33+wQ
	 HN//T3Fsqx/5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1B9B13809A81;
	Wed, 20 Nov 2024 23:50:23 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <8fa23f93-385f-4996-8298-2271d259b352@app.fastmail.com>
References: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com> <8fa23f93-385f-4996-8298-2271d259b352@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <8fa23f93-385f-4996-8298-2271d259b352@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.13
X-PR-Tracked-Commit-Id: 9f5cbdaae5f760c218c82e0a5e0f9c58bac56f0c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c39d5ab450f7181775957000f4aff33bfef9f7b
Message-Id: <173214662175.1393168.2564138699259242655.pr-tracker-bot@kernel.org>
Date: Wed, 20 Nov 2024 23:50:21 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_155011_392670_C6A8FD04 
X-CRM114-Status: UNSURE (   4.84  )
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

The pull request you sent on Wed, 20 Nov 2024 23:59:30 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c39d5ab450f7181775957000f4aff33bfef9f7b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

