Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C975ACD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 23:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsHUzVE7LKo+uYJSAzkXrH6EmjBVP7SXVUH1IGFltWU=; b=lc3Z78FwFfEDGtrRLmFVNVN55D
	ewvnyA0HTcm8kKJhbzbCEveNhK6YL1ZpecppUDn8v/wEj9jqa/WQoDMszuCUkW09ZA3eNOj9r+DB4
	B6aCY1eIzqrHSVAKWJgDX4rjAMEI1PhP/Ybj/NnNBC+H8MyvOy0e6Ll8hC63LFLxanTMaym6wJLml
	z3vMle3wY23CtfeMQf55VGRilASjbkHxny6Na0kWKIQKEXYV+5BAUDnB7vvWL4CJwer2vrFolq0Zj
	Q9pDZMJvDLIbdPBKGNSfM4z7h6wj4KWkggGKkACeVSzeVYf8qY3I0na/hONSQvZjChK/+opxwjxKt
	JCum5msQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUWX-00000007jlF-0nuF;
	Fri, 08 May 2026 23:22:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUWR-00000007jjd-29wC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 23:22:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 852CF4435E;
	Fri,  8 May 2026 23:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658F5C2BCB0;
	Fri,  8 May 2026 23:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778282538;
	bh=weaL0rAj9bwqCMnAdaO3ctxYFzkcCy5IKKseK6tr2VU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=t4KUmVL6HesIy9KkSHpJU5RKoYEVLPcVkdt0MnVBM7A1feyRfzfcrDr9Vw4IFjlQa
	 UpVa6eKDZg7ZJpfeLN7M341H1LJcwv4vi9gqyeKWR52Ew/Vh9NTeX7DMHxNclW1iCm
	 8XiZCNT/5Zovjx7QoPmAR7NhxT7MAIXTAdGCUWh6hkStjMHP5KhH7+3zqYNxFdnOK4
	 7TBeiPfdyngtfcD7/3aYEdcOnhDTcPcO7fNmdIZGKRbbHGWcd0+XVF8FPK/24TxLvl
	 7jFQ4OzgdCngFYSPXHn+VJSVrD8HjBHT0K+4jYyJjdaCq1Ti0TcD0YQabB2J5iTDrF
	 4VjXOuLysVKTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02EE138119DB;
	Fri,  8 May 2026 23:21:28 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <af5rqOZ-l_Jj2EkQ@arm.com>
References: <af5rqOZ-l_Jj2EkQ@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <af5rqOZ-l_Jj2EkQ@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 5cbb61bf4168859d97c068d88d364f4f1f440325
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 27a26ccfd528da725a999ea1e3102503c61eb655
Message-Id: <177828248667.892019.15789613256296910351.pr-tracker-bot@kernel.org>
Date: Fri, 08 May 2026 23:21:26 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_162219_610600_7518A68A 
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

The pull request you sent on Sat, 9 May 2026 00:03:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/27a26ccfd528da725a999ea1e3102503c61eb655

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

