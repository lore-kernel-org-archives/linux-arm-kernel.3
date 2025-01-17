Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9388FC02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 23:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVtZF2j9pEgt8vk1pFbHevtLdHtX6lbucujZU8Z4HvI=; b=i8R8g+8leugcIV2D9/A/fjNDRo
	4jMSIhRHZ7CTrra6DRZS+EYTGNkV4WY8IN8bsmx3o0KaBjVnpuQhD4DZSqkUHjJ9Kx6eAehU4lq7j
	3KVba0GgahZ/ZJ/k9mhlbpEqcdrGbDx5xryWLYivhrl2PBvn9CcPBOTRFfdXDMg8TffFtlCx+kmA3
	pfC+9/rOI+qluTCu6atfWCm5wM/buX5w5D+b0aQnIXyRjO7M1bOrRxYtSbWFp781Ia69yAvL+nhtF
	zPRysm9vbF5N8qsggpiQowgdnIUHfwJWeFMBhUvf7s8yMCyzPLxRNrmLDD0+EkVd66rSUdeOpT9aB
	tLFHRynA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYw2R-00000001ZPM-1eqp;
	Fri, 17 Jan 2025 23:46:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYw19-00000001ZAd-33TO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 23:44:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86007A434E9;
	Fri, 17 Jan 2025 23:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A51C4CEDD;
	Fri, 17 Jan 2025 23:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737157486;
	bh=8dSUKblfap4Zb+tgdq45FLILJMcyqgtpVOvFFYvkdDc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O8zPiXyArCyo3MI5ua4pUBijNguGwZSSMLja15tVxoXXQ0aFV0G+buSLneNzJPAeA
	 uaPfB0kxS2Ss+FrMkFR+ugdUmQjC/mQlbuPsWMtJH6Td5WRJ5bnaja3gVrP5qdFh3/
	 Iqc9TZCi7WufIGpH+Z080LwLyJNg7YTDYGeKiGo8zn8XoQyWwHYVFfQvmg7nkBv2lG
	 WDVqfNp3Jz2TPdw3bTF+sfYkP2wTdy60gsXH/Xz+r4d1R1ZN78tlTNlsPFGbU/m6lb
	 s4l/S5GlikQocGkK0U7GoGpCh1qhDFq8eeh1ia09hHCMnYU8wgc4OJJhSiOh9RdxKB
	 teK/n+fDvg2tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE84F380AA62;
	Fri, 17 Jan 2025 23:45:10 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <99e7cf2a-2578-4b10-819a-16321a7739c7@app.fastmail.com>
References: <99e7cf2a-2578-4b10-819a-16321a7739c7@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <99e7cf2a-2578-4b10-819a-16321a7739c7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-4
X-PR-Tracked-Commit-Id: 352bba6c19cdeac107e7fc1684548269e6b0f111
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed9add2b32253b73d4909cc5cd4e7abcfdc0568b
Message-Id: <173715750924.2291664.11872474582835471287.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jan 2025 23:45:09 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_154447_833466_BC86A4D4 
X-CRM114-Status: UNSURE (   4.40  )
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

The pull request you sent on Fri, 17 Jan 2025 17:47:32 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed9add2b32253b73d4909cc5cd4e7abcfdc0568b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

