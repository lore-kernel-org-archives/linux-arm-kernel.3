Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A9CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 00:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHJFNrNyRp1QwO/dP3VfgQDbigoTZU+j3gRE3gqu7Qk=; b=kOJyQHTtPR3xJ9l62BaKjl1KEO
	5zGM8Ycoe/nI8sWvv/+vxnrW4tR5u+i1x4Bg8lhyPPbw40nqPBLBkqbLiu3X2ihMuFlgdXtp1Gh1m
	chG11iREzcwqpAULMLJC9wv4oVXdxzBwr0ok8nF/JOhdisXt1rebtv5vkdqJlpZAPndRTZkhxYFGh
	u86qSfTXjgrFo4ZZMsKmog94I9DoOwyfiyYe0ZGTD7kdmXZWbSpEgORg0UoHHvtiNNeXFxr08aHRL
	YWaFhRxDQcGeLSvEByTbxf41/0b4exV8Rt+v9QBVvYEfT9yfFTjRgl87QZt9jFo8YFECHSG0woJLC
	4J8XlJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO2XV-00000009loZ-2LVd;
	Sat, 16 May 2026 00:05:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO2XU-00000009lo6-1ki9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 00:05:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ACBD60142;
	Sat, 16 May 2026 00:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85CDC2BCB0;
	Sat, 16 May 2026 00:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778889954;
	bh=iVQWLHkeEmjIRuyVZdnJLQX7aTdeFZkYKqBHFTv8hY4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=p8C9oBxIkf/BRzQDLz2IOP5AS5EmXxnNGgO6poA8W3yGYAkTwt9apNHL9OlbjX0B0
	 73iuTC3Wp3RZIDoX4sNGy8m8tgZV7ARblXaXJO0Ejr1AOSNjFWgVI9lB5/xOYBWbba
	 cinNFyS3EwGgozzMgwMqYg8fSjlSF4UuO4Vq8yMaZLEkvvuUqlnSruDpkz6nlSgKe+
	 nMHU3hSr+8CcnDiAF5IIo28p2du4RlU7t/TjYpW0uoWHRplTgfHiGtsv2JQeZJOe4j
	 BxVbQktVsWPonE4Cto2txQXpp6G2Ngufmg9smnLbNP0MK7UIrKWrJnxrdY8peqvp39
	 cL3qhgkx4KDWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56BAB3930A23;
	Sat, 16 May 2026 00:06:09 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.1-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <agdbnfcTQATqM1K8@arm.com>
References: <agdbnfcTQATqM1K8@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <agdbnfcTQATqM1K8@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 6ccbb613b42a1f1ba7bfd547a148f644a902a25c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 36343a8ff328efd3eb5604e3567d63e6c7906deb
Message-Id: <177888996786.203181.15801604136937630669.pr-tracker-bot@kernel.org>
Date: Sat, 16 May 2026 00:06:07 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 15 May 2026 18:45:01 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/36343a8ff328efd3eb5604e3567d63e6c7906deb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

