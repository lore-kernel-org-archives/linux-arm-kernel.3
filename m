Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B8FD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 21:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieeyhzz8w37t8AaRBwq/svymjfH6Fz/fp8xUkC3vaLA=; b=4dgITrfOtza6b9NGV8BCFCkVpU
	w9vQQDg3jNGm/z0wmdczCAuRBwiZhmuMUgaVfTV8ekd80o8Que66x/2VkSb3b+9ndz7VgGVKWHYs+
	Es6UNfxeBn/u/3dZwnkmN6h71RVxX7EctDGxYG6Jg63BoI7apcb4Ineuirb4lqm2sm2Nv/cfLYw1P
	WTYlz3d5g3BbuzZJV/uk6QaUFpGI3T7UzSzoNyo5ZGxMqd/kgxCQKglWEfgM+wfo3JzTAx27mky3u
	T9R6GoUcjGKqCk94YVIyLDnRCj+gJQxD+RBZgStcqebr5mAUTWj+QI0tUy13/kBua3VnLy+WhONfZ
	SH1d6BYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5qr-00000000xgR-1kuG;
	Fri, 28 Nov 2025 21:18:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5qq-00000000xgE-207w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 21:18:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B99360197;
	Fri, 28 Nov 2025 21:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380EFC4CEF1;
	Fri, 28 Nov 2025 21:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764364679;
	bh=Bo6HSNuvZuSa5hntSS7jZN1hJOuzIVUk56BB6nxZK8c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=V6jJaRBrm/ukRZsEgiPwDxG1vbP7YL+auGSyPIq1D+ZtLmj4Wn3bn2cyI85BhDaQo
	 FNqfcQqRlfDxD9nBdCltTKf5TO6mj+bX4/990fV0ypO2sIjuer0FpiLja2cr2WSkRo
	 SIRd3kS3r/QiBugv+WikpAPdxoEukK7pebrSltibYvwrRTWwpqYxHaL59ajjtkUnz0
	 ORGGySr44d7QkCOqeIS7sJt8L4o+0KEk7RcfDGuAR/R5XdnMIobEAFnQoK4uLJaxa6
	 EhUwCnRE58po+9e/CZPLfOOugMTU6geWahuNDqHQmN5LXactKy0G7vIvX+YGJ8dUui
	 dOJfSLcmxWqFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BA56380692B;
	Fri, 28 Nov 2025 21:15:02 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.18, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <be1c0b1e-4e4c-420c-ba0c-f19ddf30e657@app.fastmail.com>
References: <be1c0b1e-4e4c-420c-ba0c-f19ddf30e657@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <be1c0b1e-4e4c-420c-ba0c-f19ddf30e657@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.18-4
X-PR-Tracked-Commit-Id: 3ecfcf34f0992d11e5eb2458a2108b3320c61ba4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7fa0d7744c28267142287a75134de58790999e72
Message-Id: <176436450076.799297.166330833698529282.pr-tracker-bot@kernel.org>
Date: Fri, 28 Nov 2025 21:15:00 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
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

The pull request you sent on Fri, 28 Nov 2025 17:45:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.18-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7fa0d7744c28267142287a75134de58790999e72

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

