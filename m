Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC43ECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhP2WZBA7DtQuDUk2txA0dqGE/F2Th3xH/t9ttpEKXU=; b=FQp6v9aDm6e5AnI5KRjvIB8mOp
	CkJ9RAtfM4uWN4HMHf1Kf5RDeQV9kujQksyZHO9XSvvwYzRrCTZvreUOFhlqPaixKA76iVmeiEbcW
	Wd/5MwRm3VKyF2SebSNRVughT9Q8YrmZUKmW1PTcjxNnG6JEusZE4x5KgcG1fN6tduUrDD/lQ3TKi
	UTNRgQxlCP/HSkoAdhg3HiroPMov+NhtuY+wiqmCWEsq1YYPIJ3y0y3rNf8K/2O16giC73BrVXKsC
	y2XzDtrx2xnr16Qk4N9+rkKStzSnFI9UwgLsoq2XJ4whdP57pRR5HINxusGy8iHwpu+rPPEDRLEE0
	I9LUIq/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47q4-00000009Mur-3X5v;
	Thu, 02 Oct 2025 01:10:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47q3-00000009MuR-2FDI;
	Thu, 02 Oct 2025 01:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0997602D5;
	Thu,  2 Oct 2025 01:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F58C4CEF1;
	Thu,  2 Oct 2025 01:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367430;
	bh=pHTUi2pFN5j1Ger1eF5Kb8j6I/je2tT6wP6Bz4h2hxs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EhBZ+cplaUX6OCUZAjQxBzxjiYS4Lk9miro+kugcVJyXLtffr4biXm1qRmGUmZ3th
	 o8i0E+M+xBLXVV+xzGsgnfx+FT+anwu6Tebm7JfJkjpaz5LBZReubOyZgpjmIkbSzv
	 MSKU4lErA6yvkpu8cDpflQmGTez3+QJIZ4wl25xq9xg98SUGxGyxeDv1tx7biEH4OX
	 +gJ5waqMrvpbvZbcDqhzwEZ/LotoJY9HaUOvhmoA/3PvWzkowMg78bNYl0ylGLBvJo
	 O1r5PRQUO9WZHRfGwOZ8YDuQmZ7oWgQ/a4sy4B1Nx/fn7l31sOcri/xUgrEJ7wnDKC
	 n9f37hwil5kCg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 39A0739EE03D;
	Thu,  2 Oct 2025 01:10:24 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] soc: new SoC support for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <ce4be3de-eae9-4a73-9d85-e47976ef8372@app.fastmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <ce4be3de-eae9-4a73-9d85-e47976ef8372@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ce4be3de-eae9-4a73-9d85-e47976ef8372@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-newsoc-6.18
X-PR-Tracked-Commit-Id: fee2f45def0379ed140de4db8f998edb1d78e619
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a8253f807760e9c80eada9e5354e1240ccf325f9
Message-Id: <175936742312.2689671.6180621715040570208.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 01:10:23 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, soc@lists.linux.dev
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

The pull request you sent on Thu, 02 Oct 2025 00:24:18 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-newsoc-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a8253f807760e9c80eada9e5354e1240ccf325f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

