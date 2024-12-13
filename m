Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3F1E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 22:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPxdlxSD+0XuwqblVWHSIgOfZOaQXXjiq1kB5/MHXWw=; b=22H/rcfqQYPHAQiJC/fPXhmCZl
	oVuye26L4ePk+wG7XX1b7NARaVMyCZ+LwrfKCh9R5B+KHM/NZcL/zJVSqH+Ei9OuqzinzxCkcduzm
	db9Rvq1S6bg4qD2Qy4LfqbM7gb6P4c2dt2yoSngclZQwYFwifppkzxzWfUNz7uYDzw4bVEH0P9id7
	lhCOH3lNq2w6V/fVZAhk18hZ9BvpmGlcXHiErbc8vYOtWIRQ8wHxQc04tOtsE4VApS23J11mD291o
	3K2wT5jJ/UBXypF1VVE4DQCj7MLzf/egJgybiKczjCbSJehAUkgs/GExjrb+SztgSr52TZdC4FS/b
	+SLY3WAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMEG7-00000005COK-1iKw;
	Fri, 13 Dec 2024 22:35:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMEF2-00000005CDq-1fWH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 22:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F568A42E05;
	Fri, 13 Dec 2024 22:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04900C4CED0;
	Fri, 13 Dec 2024 22:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734129275;
	bh=4R1yhE9pAWNS67ycWv8EN0gZQwo2wTlHZFpGXsFka5g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=qwq2bq5U0lpZQy4fN3+HOnuf4mJXisILGw4y8TMyShwhH6pcix7cDqwmw2prP+fnm
	 j0ymYMQDzIXRg5Q/C9Z2kXXWyp8Mm8OtQLD7KvL2VFpDq4b8fFeQ0W8gewYeZKkJqk
	 aag/QMQQxn3n/VGFr94yFYnRRWzQDi3nUu3PNGsF1TCyoSBXEZ+sDD9/trfGIXTTmR
	 DkiEdTYcqBFOfpWB+Wb/ea3W8Hqp9GjE+Q4UwGJE0gUsqpVVOxc9/un0ZyOtJ+tZey
	 Rz6kD27IeMccqP2zytg+BikySdeJoSlX2hQrRz1ZdAcY0Ezx8jP+HpT0XLcPTcOmZr
	 uT9SgHa9tj5xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE55C380A959;
	Fri, 13 Dec 2024 22:34:52 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.13-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z1xx0ha7lbKkdhRC@arm.com>
References: <Z1xx0ha7lbKkdhRC@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <Z1xx0ha7lbKkdhRC@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: ce03573a1917532da06057da9f8e74a2ee9e2ac9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 01af50af760b5b796794282d997a3610f74039da
Message-Id: <173412929121.3178864.3766212521863822880.pr-tracker-bot@kernel.org>
Date: Fri, 13 Dec 2024 22:34:51 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_143436_499983_2B29DCBF 
X-CRM114-Status: UNSURE (   4.14  )
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

The pull request you sent on Fri, 13 Dec 2024 17:41:38 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/01af50af760b5b796794282d997a3610f74039da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

