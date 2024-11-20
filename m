Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB77D743F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 23:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnZ4eL6fw+uh95vQGG+VhVargtzXYYmtsiv3vEbH9xE=; b=Vx3Ri7xWMBs2Dv9+Jo3BOoLFC3
	TQg61QdIwpT+QPHg74jPbWq0S278eFkrKEkqW5qEJQc+e9iK0ZdH0/sHNU8tsEi95G0FDmiAbggaw
	wE5VxWX+unCj3QqhnA48j5v3HIVcgaehnoS0ka9d9H3ZYzB6hao/2ARk0GiEpwY3vJvEZNk7HW/6f
	/SWCPNLgGHrqDXbQOGRsnoNWCyASecHB1zcd9lMxvg5eiqQ36GkPHkY7BVAuQVdIU3Yb62Oqb1UCK
	+fppcqzZ8L6mLDOIWdQfZkQ6fXtD4jeJyotXa7oQJn7OCfLsiqoRD5xjYvlHH5scWlV38rDhvYj9y
	lvxcIKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuVJ-0000000GRjH-3W8Y;
	Wed, 20 Nov 2024 23:53:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuSc-0000000GRMQ-0xJU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 23:50:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D42C85C5E03;
	Wed, 20 Nov 2024 23:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E23AC4CED3;
	Wed, 20 Nov 2024 23:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732146613;
	bh=p6VUmk5N75iEPCaOOP9vG4kDiWSfRjIef6HIGUgrU+c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Mt77Y5ecdi9/jwtPv3n/Tc/EWWuSgsO8wUaqvaNUxjvz6WYFE6GXJISAKXuOFZxyc
	 TRPbeTcUnEitTtfclH6lmJZ4ylHovpM1RAsEOPFkdX2eDOF5CvhTstdbFteTrc4eRQ
	 CApLtoQhxv6ioITkbjYyquWerWGop4lM/FXmjN+ghYX1fiH2HJp+4K947cn/ZRhhfP
	 XZl1yvfcKzyl3DH+pcTFjL3MJqEk2d7ziYFkRpCus4YiFBFCSdJHweVkaF3P7pMvE3
	 n+/b3k96cEyT6TsZv9pIx54JTdhlTA+fmiNygIIAsBEXrXHtITCL4ye/8d+al4Xu7g
	 jLGNcjIB0y7RA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 97B633809A81;
	Wed, 20 Nov 2024 23:50:26 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig updates for 6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <77eaecac-c423-494d-91f0-e08322fbb0d8@app.fastmail.com>
References: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com> <77eaecac-c423-494d-91f0-e08322fbb0d8@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <77eaecac-c423-494d-91f0-e08322fbb0d8@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.13
X-PR-Tracked-Commit-Id: de6dff2090ddfa74ae53e3e52243a9b9f3ff8526
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 06e47dce8fc3ab68c2ea3b5082caab99e8002b80
Message-Id: <173214662551.1393168.2060692360534209256.pr-tracker-bot@kernel.org>
Date: Wed, 20 Nov 2024 23:50:25 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_155014_303065_B010906E 
X-CRM114-Status: UNSURE (   4.83  )
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

The pull request you sent on Thu, 21 Nov 2024 00:02:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/06e47dce8fc3ab68c2ea3b5082caab99e8002b80

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

