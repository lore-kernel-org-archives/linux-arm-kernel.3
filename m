Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74450C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 05:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYto/246ByxXvAouVpo/3WyfsHuBfLWzRnSV/XxgHaQ=; b=cDPnsLre/1vjidlyJvotqgAl1C
	ruXm3LVoIwR8jMUTk4onlnGgH+rcRIeM48NE7VeZCgOi49+Jg47+twnJnF2PQiAtP9Vb4pydwF6NW
	RiMqH6zzq5V3j3vyrKwnTX3UXxz/TyxtBY4xavFVMvj1NzKoM/AccXUtuu+sUGYvnzc4TNdgrIP0P
	zS8Bj+zR+mdDWuKRtytw48aQILZWG2yAbWBSVRFcm2pv33FYHqnfxnulp2yOud5DAPZ91mrSVIXdh
	uiqZGnmbkIPL7RyneufBUNjwNMkGkEv2QJ1+PdUgQgdt99xl9fy3axuNIC5VsN6HtXy/Wjr/NNFQA
	7/kwYOvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta6rA-00000006wWM-1sv9;
	Tue, 21 Jan 2025 05:31:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta6pr-00000006wF8-49ZW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 05:30:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1F53A40CF1;
	Tue, 21 Jan 2025 05:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15A7C4CEE0;
	Tue, 21 Jan 2025 05:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737437397;
	bh=riit2nimsPYEfdfSWZvrF8FiX4ezkjMG7/tgHwf0oIY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kHv905FPKq5uY+FiFfz+4ZdCRbp6d1oTpHKs2FFUnMlmxEp3qkTrBiQ10IbtpTpUy
	 38BiW+37GZLIV4a35YnDb9mKChvU0bJEswI5iwkiqTlXIrpTCehOOG24gAz1hM/LVb
	 /mJnLFB9s3tEhW2kWF+pmYVc74RIxKzlyinzvnuV4h9EF9AAqG8llZU5b0p5CAE9mR
	 7/18d1pKmtfz/56zQyj3Zy5XpUbZci5NjZaq3GV3uqTNCA7ah9DNJ3U+893sbiiOJ+
	 NRkb4rAXhsNZi2Jk+Fac/OtgZusMYzIpHKtXHp22N2VVCSIqavgqv6wzRfoU1dz+EK
	 aoShIK4zQX0Dw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 36E0D380AA62;
	Tue, 21 Jan 2025 05:30:23 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250120185950.GA20356@willie-the-truck>
References: <20250120185950.GA20356@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250120185950.GA20356@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream
X-PR-Tracked-Commit-Id: 1dd3393696efba1598aa7692939bba99d0cffae3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ad09c4f2868540130ad2d5dfe265f55c75c1705
Message-Id: <173743742244.3745731.4078377532835508132.pr-tracker-bot@kernel.org>
Date: Tue, 21 Jan 2025 05:30:22 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_213000_094468_99F6508A 
X-CRM114-Status: UNSURE (   4.88  )
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

The pull request you sent on Mon, 20 Jan 2025 18:59:51 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ad09c4f2868540130ad2d5dfe265f55c75c1705

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

