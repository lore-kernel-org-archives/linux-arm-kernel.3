Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995C3CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVXssO8EFA9BNezf6Qbqed3+OIPwO+I6eW/HhTeooU0=; b=WLBMP/xy2wFWBWIS90wdO0tHeE
	4HA5PWAY+5WshpIKdnnY+uNtshpGKTaukd7ImR9bl+Ylcq0RLNrdK5fyLHQjbHxKZV2ZosZjpVpia
	Pij+B4xzmgn58WuKDyu7cGelPcHDVN4rlALdzMCd4RupEZdjkR5wBgIj093vt1J4fAH1PwJ4M5x31
	Kmz80f4tShRaip7io6SoWyE8bxWIQa2unV/6Uvh4mgPLf4Yyhs8uZH6s1MQwOU+3pQmccP035t66r
	R5flkkmdFzKRiVgJmZ9COdH3v5jthyZ8gmERxRJXRvrRIVxBlP0rA55oSP54/ZpUgySHii4Ub+mOA
	yTzD8Dtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv8S-00000000AUs-2ubh;
	Wed, 17 Jun 2026 18:37:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv8K-00000000ASM-49Qe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 18:37:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D4ED6001D;
	Wed, 17 Jun 2026 18:37:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC8E1F000E9;
	Wed, 17 Jun 2026 18:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781721424;
	bh=WVXssO8EFA9BNezf6Qbqed3+OIPwO+I6eW/HhTeooU0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=SJK8VaG+vpPzyGZl9bsevox1vS4Xzo+icGA3JqIWwPKUHuFrVtvW+e1cdhWmq9076
	 OkwgTQ2qIPTvNVsIiXeGTM80/OxI900Ye+PFMN+YEr6Sq0Xejlxr7xUDXKTTtXv+PR
	 ddZluVD6Wp8U/6pidaxvdcUhXsLE6Ljhe/I+dbPvDANFTj1KreRfEOuRpO70bsp5OR
	 TFoHLu60qtJDScuaWR3DNurlgOmxPIR+JsagpHDNyz6aGE/pWMTsptKnDS7rSRoBE5
	 FfF230ap2gfBQtoMPF6mcfEvcQszmJy0TFY5M/OePd/HIRoRkD1R5mJIYSCvK6EfhG
	 s9X9uB2cf29rQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568B43930FA7;
	Wed, 17 Jun 2026 18:36:59 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: arm code changes for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <c00cadd6-b8ae-4d09-bcdf-adbeab2f0e11@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com> <c00cadd6-b8ae-4d09-bcdf-adbeab2f0e11@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <c00cadd6-b8ae-4d09-bcdf-adbeab2f0e11@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.2
X-PR-Tracked-Commit-Id: cb2c3b5e113f26f74ef05926c6ace0f83cc3d0b3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6505114e82e7541414b176b5da4a3c015a1214ea
Message-Id: <178172141784.1757661.634270573366128584.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 18:36:57 +0000
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

The pull request you sent on Tue, 16 Jun 2026 09:55:00 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6505114e82e7541414b176b5da4a3c015a1214ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

