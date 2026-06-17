Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDED8CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsXDRt1hcWEJc10VMPsc8Php2knvFLEiK0RhQcFO6Kw=; b=zVkEF8Nsi7uX3W9TghpCqxBwkC
	MEK8pLkbMSjzauiJJisCvh1eTZokybZTmoeatPKH63M7U1lijH+3mZOgRAvJRz+GIYAl1wT5bjdQW
	28dmYSigGoI3JyMkCe0hr05BmrtOOdg7auq17ffCy8lHUNflLtbEe8OU9f9p5SwW6WjexkBxOUVqf
	q5NVTA0nxkj2eRxkcdOZUYiGlVpsyGx8WWxpmQdQEh3CmChzMLqmRLORDjDvlk0oxXBEnmTufRGYW
	GzPtiupbkOJzwy7GrlpRygoo079DQAT3isMF6pFU7Iw+bLes3p1n2hYSfK8IAPCmLMhvOQJZbM1O5
	JvRQWRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv8L-00000000ASm-2SRK;
	Wed, 17 Jun 2026 18:37:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv8J-00000000ARt-1p98
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 18:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7270860121;
	Wed, 17 Jun 2026 18:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 217191F00A3D;
	Wed, 17 Jun 2026 18:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781721422;
	bh=vsXDRt1hcWEJc10VMPsc8Php2knvFLEiK0RhQcFO6Kw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=J5Ck61LRPVwTcNiNWxbvFhbWfU7f+geQM4x6rCDc3Y1a/J2hPsLsApboLalCsrg66
	 WBqtVkT72b9VVTFwsV6hpPHlcbh8BItC5HCOgdX8FgcG+4nHyKDDGVqec+CQ6ONAyT
	 IEwmJ/xaqbBcl5xlYmOCCC1r/8WX0grt5YpQHqS6F6oaihJDV11aGrXp0lQz5GEcfs
	 iB3tzGGVwgD9EsQh+L7WOcPaOu/la+BYbrpwqsaM40TzmRkL+wsWIcCSoq9mNatbcn
	 HRwmqN8jwvBnVTx2fu9bXy+uAbppEP9WwLPGRoL3x6uwaUFTuDHzA77TZ3jXPZyML6
	 gA9AXCvs9elFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56A413930FA7;
	Wed, 17 Jun 2026 18:36:57 +0000 (UTC)
Subject: Re: [GIT PULL 0/4] soc: defconfig updates for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <287ca074-9329-4a51-a5f7-35abc0d977f7@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com> <287ca074-9329-4a51-a5f7-35abc0d977f7@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <287ca074-9329-4a51-a5f7-35abc0d977f7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.2
X-PR-Tracked-Commit-Id: cccde8de2c72068051ff8351ae6f1e2a12718aa0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 61cf9588108762323c4c186f94a0c6e7ce5cb9f6
Message-Id: <178172141584.1757661.12713285656299517077.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 18:36:55 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org
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

The pull request you sent on Tue, 16 Jun 2026 09:53:53 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/61cf9588108762323c4c186f94a0c6e7ce5cb9f6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

