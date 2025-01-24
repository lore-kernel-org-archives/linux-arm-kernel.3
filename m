Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E0FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 23:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8k0dd02c8g7kpH/VCmzTCQvvFeUlbP93W+yMmC1f/8=; b=AY/xB/Rr8MT/BRhcDt9WuJRJUO
	a6svSeVHyWH37CXvH5wqhrc6si3VkYwoMk2pw2gMsUfCFQL3eil2hwq9VbaoAU18t+/XonIt1qs0+
	9DK2YU/G8Go7HLlH8FrZ4SvYfa5UYRtNTLZDxMaV9gkf5uLO+gYhvkK7cVJeGhEAFMtDEu8/r0TB/
	v9rB9x1fM7a/MzEuVljC/86ftkV7vbfjlppreO0Pmz8Vxp2Wxk+f4USLnx5D7QFuDar29FP4uhFrP
	nSDPd1OrcEId5PtfkERYw9RnW3XRoUdC44aP01EesG+d/J51sFC+7in/C7ONuQcktGiybXE7Xflb5
	Mdpno9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSsE-0000000FghQ-0xyc;
	Fri, 24 Jan 2025 23:14:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSoP-0000000FgE2-1wdx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 23:10:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABC095C620E;
	Fri, 24 Jan 2025 23:09:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0637C4CEDF;
	Fri, 24 Jan 2025 23:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760204;
	bh=psal5TeyyH/P1IOmxYc0hNvF6xTwlmznaKSkvYXLboo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sCE7q8QnjUg37RP2Gsp7+0pAH/dkfMCI1Mqh3YLImhoUpR2BeH7PPOo5gCyZgJg/l
	 s2LFZeZFZ5yRAzubFCS7rNWMrtIHDpSrI4hWImFW/Yi6xojasrvFCqWKHh6MDaI/yn
	 ccYe7IJS/dtOVMWs3aWvRyH+OTnZXyxHisXzyrKKBGm4wbBy5BSsgaBhLMfnmRa/Z+
	 aaQdHoEeTBEGDXqVwda2TffTYhkPIDx4qM4AMV1cv3tFu0o58iOnDOKXQYkcOapnxx
	 VSDiV+adAsDKG46xFt51fPTbSF7Tggh6svx2MoEEil8beimxbVi2LMKEDtf6HKreKW
	 3AGTVOi06ldoA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 08774380AA7A;
	Fri, 24 Jan 2025 23:10:31 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] soc: devicetree changes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <a31f0a31-8c70-43d1-b2e5-6072ac5d8b53@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <a31f0a31-8c70-43d1-b2e5-6072ac5d8b53@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <a31f0a31-8c70-43d1-b2e5-6072ac5d8b53@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.14
X-PR-Tracked-Commit-Id: 3c9690f76d66f45f727e00c838faba9a3ef4e295
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f10203927097ff9e5a251f170038fefa38e274b7
Message-Id: <173776022990.2196000.9156649489225251981.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:29 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_151005_540759_505325CC 
X-CRM114-Status: UNSURE (   4.45  )
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

The pull request you sent on Fri, 24 Jan 2025 16:06:32 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f10203927097ff9e5a251f170038fefa38e274b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

