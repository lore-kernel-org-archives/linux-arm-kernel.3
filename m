Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044F2C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7QxrCynyF4do74mgaq70tIQAL0DRCraRq7S2qg3lT0=; b=3oSxxb+ZZSc0oQSaE68M83pvTA
	wAfmia9rt6nQ2jvj4qEnUFdr4jLx320G9qj0mkcqR52a5ITVjZ07Noz1kds7qQmMvbHNqsD87NQJc
	iInIq1+97yidgUFN3ofx33IkSEt9O+BGkIpjT4S+2h6LMmpIn52SA1UP0RLusniu5F/0+XIcGUGps
	DKGy/mbM3AzpCYEtHaZgXgd9yXjnBccAR4rSAFUlSwsc6q+dQC8Unn8hv6rIsvemVB02vAeRYXYXF
	nIV1p+/fYmlmtx7utYHtLSTFMoiSUfWKWmuGsHu9wBGAZT+cR9Mu/3R2DgSGXLHMgifdbIaFD+UcK
	1/XRavvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7bep-0000000F3xY-2Vep;
	Fri, 18 Sep 2026 16:41:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7beo-0000000F3xM-452f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 16:41:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59A65416D0;
	Fri, 18 Sep 2026 16:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5BB1F0089C;
	Fri, 18 Sep 2026 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789749710;
	bh=v7QxrCynyF4do74mgaq70tIQAL0DRCraRq7S2qg3lT0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ojOfBmfHBuNU1fhGjmtNDZsbD7K4jPiitEXHK64AX9wvHUE2UxqJtGtGBs7RgO1iR
	 kahTWw/pejOJObyGUX/Xaj7m0y+zdc3p/OZkNILnE8eHY5m7VVPcEwuc5pN9WaYZab
	 o7pW7d+g4hNn6IPUh39AlMMy5IK9W/ddZOhIxlx7AQDxRNDCUPuw7TL0E1vQFkp3ZA
	 tX5kUAz7afbmjEQ5lJn+sGhS10V2CkD1kf+CiD6kJayeopTUIuxWcvWhiXOa1tAS07
	 oU9mb/lNTCm7qpnMl9elfD/Yhlua/H6D4hQIqMuzvnQhIdP2x1jEoOS0LlE4041Ob3
	 HSzNhg40VWtfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B26380CFE4;
	Fri, 18 Sep 2026 16:40:44 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <d55156c3-cbad-48f7-b8e2-a74cc48575dc@app.fastmail.com>
References: <d55156c3-cbad-48f7-b8e2-a74cc48575dc@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d55156c3-cbad-48f7-b8e2-a74cc48575dc@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3
X-PR-Tracked-Commit-Id: 4dd1999783d7d12434006289338373e49492dc96
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f259f446f5198d98e13756d2cd531812a0ad3064
Message-Id: <178974964311.1040423.2904965268263147242.pr-tracker-bot@kernel.org>
Date: Fri, 18 Sep 2026 16:40:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, soc@lists.linux.dev
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

The pull request you sent on Fri, 18 Sep 2026 15:40:53 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f259f446f5198d98e13756d2cd531812a0ad3064

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

