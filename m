Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4CBC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CvD0PdjJuQJfASQ3ET6w/7FmYacC8WBoQeRAuxAuOs=; b=KT9oelCExcl5UcC6ApdwzkQHZe
	GDVOBHPddVJwys9M6TJ+GSkXuzDe2gZR3YFT2csGHBLZvAvSpN0c2/jQOBZJav7AzPBx3qJw1ADve
	am8x9zH/L4hFpWoL8KHg4GdhR/XPWQlHFHSSgOeNO2ZgEsR+lm16hoTe1Wl3fxs3xDQVtXmahZ+zX
	VAazDcUsnWs0THazoVKQMnMB0JTTUpoqYeE9EQ9XqKPeMCoZQuQS+cSgr+NGj9hQPERJWJ0SuuA9D
	FN9MZK06Xx0msowbQ6XBnd+oibNt0BOjMwY2GvC4lcfFNlUp54wmFoqLLpAD2w6d87Uv7L8vCdLyl
	dlkEs2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOKG-00000003zsv-2nEG;
	Sat, 31 May 2025 15:40:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOAB-00000003xop-1l90
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 15:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BDFB7A4F04B;
	Sat, 31 May 2025 15:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4BBC4CEE3;
	Sat, 31 May 2025 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705422;
	bh=8fXpeC8lBPDgsJUiXz7eqiDdYLAKyepb0wBS5l2htGs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GDAM3pyToeNbnZXw6Gm/aEPL6IiipxARDy2GDnVoUv1rIoqqL3C6BRSx9EFR6IGCl
	 Ru1ijLBT3ogRIAixTyvP4KUvtTzQqmReCgoFZI7n1hzN3n/b4be43DLh1CWwcZ8eUG
	 1fMcYXqVD15Lj6tZBhxj/63nA82po8/qxN8CLfkOOtx9IQQ2RSpdNtC4XHuQfYzmbn
	 e+f/tKa83g4fGmmhOCVMuj/yCARHN2WBv6RSFsESvJcE4oH4uvVRlQoqWebnrn/u8W
	 wlgieJ+YN8tGiS1jFeQ2SaVKOPXjGD2PYQ/oRlJfxu6HhiROnctrVtjQCLOAMwg10S
	 Oz2LZ6FjWYwbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADED1380AA70;
	Sat, 31 May 2025 15:30:56 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] soc: devicetree updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ae82a64f-fe42-4abc-b298-1570ed17771e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.16
X-PR-Tracked-Commit-Id: 3f07353e2fd3e154921e539044b26e85ca910dbe
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec71f661a572a770d7c861cd52a50cbbb0e1a8d1
Message-Id: <174870545544.163157.7191295860821501844.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:55 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_083023_519299_11EE1DF0 
X-CRM114-Status: UNSURE (   4.49  )
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

The pull request you sent on Sat, 31 May 2025 11:06:47 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec71f661a572a770d7c861cd52a50cbbb0e1a8d1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

