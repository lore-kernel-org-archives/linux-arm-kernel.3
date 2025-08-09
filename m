Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF075C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Aug 2025 05:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uhKeMdP5RbEs4S+KqGl2y0rcgArKNgZAN/egy9JK5Uc=; b=QTLiFJuFxNuoA1qjncuJ04i/2I
	GNezXe/xHzJg8DgcLq7zOdSOQnn71EZ9lOb9Ox3QIj6GDOzzU09xrarOyaaNoI2a9TdlJsCmPDENF
	ayLXzcLZO5zbWv+7HCIE/lZKpCJgxqpemhNe4puCN8asTrqeMLRR3QcPvV/rutYkoSbtKQQ6mBdUO
	WmOo+lbEVmJNWOIG7nRUVHTGdBDsZsYLwEc0HlVdyBBUAg6Bh9+wEb2z5+2XJf48GfjVr2OzMPD0N
	gj2gedEacAT4hvUCo18D+K/YFsjtUUMAB99PIOHDRieWgkCjVb4Goe1oxU5TK9E0anDP6aPP66cgK
	RjNlmc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukc1l-000000048cS-3oL7;
	Sat, 09 Aug 2025 05:21:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukbzF-000000048MF-3OOv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Aug 2025 05:19:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E892A601EF;
	Sat,  9 Aug 2025 05:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E040C4CEE7;
	Sat,  9 Aug 2025 05:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754716760;
	bh=3ei8Qr/PqDz5ACLnFQhpd6y0dXsESOZmqG0XmKWm0/I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cwsSvrP6aV61RIAibbHpjXcZHapDY9tCkoYleb9gvItLzZh2OJ+IOqJ2Io/T1lgKG
	 Ez4OHZ4e8W30X1ZdEF21Rr3G4BQiOZSYVJ3yaO7YyfffB+XYhrJ1bloOXC/B4yVyvI
	 k01P/FDv2xe+mFdZAmbheKUZvjXCWthuaqW4wqLug0KXGMN8SeTE5HjyKQP2ehwRvJ
	 EfZn9Xhx9apVIVcpIzkK3k0/6a5yg/z06+HXKM69BFdiXAG4JHA4nqZ+8Nwv0uL89i
	 K6a8oE2qyShGOal3V2KcWhBVKq5cg4AfVB5/Z9NjlM2rg2jSVYoH1y1qR3FIwv7N0F
	 MkxMJ+L8P/6hA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACDB383BF5A;
	Sat,  9 Aug 2025 05:19:34 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.17, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <828e73a2-23ae-442a-8d29-415a87b8ec4a@app.fastmail.com>
References: <828e73a2-23ae-442a-8d29-415a87b8ec4a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <828e73a2-23ae-442a-8d29-415a87b8ec4a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.17-1
X-PR-Tracked-Commit-Id: 0c952efa0d7cf5258879406077df33d23cb06d5e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 61d417921c9390ee2fb48c697490b6967c9b2034
Message-Id: <175471677342.380510.16866147607593828957.pr-tracker-bot@kernel.org>
Date: Sat, 09 Aug 2025 05:19:33 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 08 Aug 2025 22:53:37 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.17-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/61d417921c9390ee2fb48c697490b6967c9b2034

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

