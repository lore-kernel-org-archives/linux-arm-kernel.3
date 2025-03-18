Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 971F9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 02:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AVtXLQxw9WrV8Q5gp084k8K3XnAZ/tHorfT5MCSPfwk=; b=IL04ChU+eaOhIDbGv0DHSmthwD
	djq/Q1db7nQm+Jmc7cDxbwOIaaNsfph9ta/V3x95QCnw3QB5DZpLPPir1c2EFy3CS8PXTYYRsCqci
	+1D9ybJhoJwzR5pPqeIfwlPw42qUYIxny96ITcqWP9/dgVsiSM+Oxx0yodesm5oE+NEn5KbtOf9Lq
	Ij7WA01n507YPRfJJgMRwkIeYqW9kVlA9cAzK6NtJ+1wNKJOTnauKpvFiVnnMpH7caMNGh5vmvWag
	MYsgZAHANAuA6LDFFb0kbE0Sf8PTfh0KHWP5Q9NTHqFz6I7RziTDleDZzBFsrji9y6HwSRP06yYHy
	463Uj7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuMvo-00000004Rrg-2bLq;
	Tue, 18 Mar 2025 02:43:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuMu7-00000004Rm1-44v3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 02:42:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 008075C5794;
	Tue, 18 Mar 2025 02:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E41BC4CEE3;
	Tue, 18 Mar 2025 02:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742265726;
	bh=1/YnOw4TNIKciP5NQwC4UyK5OcYEwOpvaukPg1yTD8g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BXozGuDyKD72zVwOyyoiogfi8budas8+RmGW9Rc2q03Dz2rcDn5z59SIJQubLqskx
	 A2EJHesEj250uEbXrC/O3BY7o/aInBbO2+xYenprFurRS9TRuwxNEvXjJOPNfkJd+y
	 0LNzF3Qwz6c+HXrmq+c28zVs5UPa+hu+CY0vvJTsFLFHC6Oini9tQnUgBpEW9Q/I/6
	 au8PYvnSPDlIzd0pPh1TvOxgogp0Qon3IdauoX8ZaUzAH+4ISbH5K4IWAEPpsn+KfB
	 QbN3Uf+oKHK7TWaFJzx3B89ncWlwORchZecT0oiCbINcRZWDKF62txMi8mhHdXvdWF
	 KU+nSSJp39O5A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34645380DBF0;
	Tue, 18 Mar 2025 02:42:43 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.14, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <860b2eaa-1aea-45e0-8bf5-3645b3840966@app.fastmail.com>
References: <860b2eaa-1aea-45e0-8bf5-3645b3840966@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <860b2eaa-1aea-45e0-8bf5-3645b3840966@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.14-2
X-PR-Tracked-Commit-Id: 45d5fe1c53baaed1fb3043f45d1e15ebb4bbe86a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc444ada131001812c5d10b380837238c9cf7c8c
Message-Id: <174226576175.3993121.4904814038298026258.pr-tracker-bot@kernel.org>
Date: Tue, 18 Mar 2025 02:42:41 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_194208_052881_522D857B 
X-CRM114-Status: UNSURE (   4.75  )
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

The pull request you sent on Mon, 17 Mar 2025 18:57:57 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc444ada131001812c5d10b380837238c9cf7c8c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

