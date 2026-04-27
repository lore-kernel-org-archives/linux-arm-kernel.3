Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B294FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 23:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Blh0ZV/6Sn/i/92xJ5vPiQZOkM+G2MmaiHvULCsRLM=; b=rsG6lONjukg89AX1/iEfxrxSkJ
	phcswtftUMs2CvWjBPQzAfEMy/bJC9dVov70S/HwTd253zZ+EDoQTxm/hkACB7c0kIaXnmUQM7/TJ
	mHGB2u7/dof+/ByMTsGOdSz/ZPOkGYMcsXjpBtaf4n7fvxWVbfPLEuZpGiyNwhTTA0uS/LsrLdGha
	bWX2xUutHRMWGeVsraZDhNtegsomwEVhmlZ0+5PI2QHAhi23yLXcl/urpBMUuNg7noFcXcwT1ZNxk
	nB1LJb6KUVxeY2CV0qonTSMtRDHaphgjs8dZAKfScVo+ObaDaR+iTVPD+jT3rZfvDShjkrSzxzkEJ
	EMQbPXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVly-00000000JYd-0jVG;
	Mon, 27 Apr 2026 23:53:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHVlw-00000000JY0-1DDK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 23:53:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DACB43628;
	Mon, 27 Apr 2026 23:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F29CC19425;
	Mon, 27 Apr 2026 23:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777334031;
	bh=UxqyfiUhZ3aW4UWnRF+6b/M+UGb6ADVKedqW+/TGw00=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nycM1RFmDqjh1ARJvBD9bD/hEfhdestn5VCkxH4KygiPj0kaXhluGHlVNhJj6tX3H
	 jHQ6kcHHK681i++W+wmFUwcxxg6JtYPt/WtQNTdIiUdGt5my8RrPDKvEsZwKdyzRo2
	 k1WhB+b+Hv9DW1+Xk9C0upT9+429cFIeL1hMtN10ga+fCwT7sbPdTbtNHdd7aXsevb
	 4XecdOsqvaezCLuoLPYuMs84KHPX0aF+pXLr/PsCF9ansvuCwPO861I1sZ7qFQt/TV
	 6TmDtkQ636DprC3vE8hQKy4Xd8jY1cJ3hLdfEkZqtqBcZu/ALsDSobgTyBZXkT93hf
	 pDQOe/s54hoAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9FC1392FFCA;
	Mon, 27 Apr 2026 23:53:09 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY3-iRU8m_UQw2hsmP8R3aTVRRfuz7VgVizVerRMLNdS1g@mail.gmail.com>
References: <CABb+yY3-iRU8m_UQw2hsmP8R3aTVRRfuz7VgVizVerRMLNdS1g@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CABb+yY3-iRU8m_UQw2hsmP8R3aTVRRfuz7VgVizVerRMLNdS1g@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.1
X-PR-Tracked-Commit-Id: 6e937f4e769e60947909e3525965f0137b9039e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7cc308da5f78eee8d94bf666c026671a180d7e5
Message-Id: <177733398837.159864.7182065698696955644.pr-tracker-bot@kernel.org>
Date: Mon, 27 Apr 2026 23:53:08 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_165352_347633_F78247EC 
X-CRM114-Status: UNSURE (   4.80  )
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

The pull request you sent on Sun, 26 Apr 2026 17:51:13 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7cc308da5f78eee8d94bf666c026671a180d7e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

