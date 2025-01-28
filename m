Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D624BC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 17:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8afi8jeYOA2s17E6u38DYoUhkyKKNslCx6yOlT+Hqo=; b=KUycve9aVbdXfWOTgBB77FRYIP
	TE6hZsR+vA9RdnB7a5xOvej7M6rHRaS1izEf8sHmbaeD12RDrf9Ec1215SiXY3fI3EuN55aCqUIGq
	WX8dnptN7JwiGOf3FNU4PNGXxzdXa6arHZLYaLMioBNDhFaWlnS5btIvS98HWHuDBWEPQYKvuV5dk
	OFemi6GQNTInSUxMb046ma7gn4LeVqHHojyPBZYBx/cRFxyQ8EXWsOjFsrQSnc3vf5whY9LJIV2mn
	q5f3/rNrXCPjF/9SLYd7gFddQ2U5g9hjQjzV9m3hZ2AueyGPxfCK6POFxIUCQNoJVbnECMsHRV6Tm
	40k00dtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcp4R-00000005QCE-1c0e;
	Tue, 28 Jan 2025 17:08:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcp35-00000005Pwv-1Ska
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 17:06:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65E735C60E1;
	Tue, 28 Jan 2025 17:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D292C4CED3;
	Tue, 28 Jan 2025 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738084010;
	bh=3VAHOUc2+R7vNWk1QkpS9cQLxk+Fzufe/2rsjvuMrYM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tC07a0dFdN2t8alVuPu1BptCoVHS23HV1tj7r5q30cLavwEiNhBtAj3RTBVj5pEaO
	 BlXCNWwgjwwxdhRCEnTgR7Ir/NTszBxRG2x4x7lYzno+Vl2L7h4yvPaiClgYSGsIax
	 WYTamBOIkl5g2GXVMNPjrqsZWWYU2+gwV8dafUDVc7+TRN5Pr3p6CvnEs5KQQWnOqz
	 dMghi/hrJeJn0RpNcMnIJnPMSFwfIFTNcwZAZb8zjG+BYfK0ZUqbR+o8eYT8Wls+Gw
	 wk08UicCEfftEp5OxYuFN0Wrp9Hab2k+fgCOD7XdHXpc5xfbyr8OYaVuuQGr3/exKb
	 PqAKO513PTogg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F20380AA66;
	Tue, 28 Jan 2025 17:07:17 +0000 (UTC)
Subject: Re: [GIT PULL] KVM/arm64 updates for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250128110151.GA26808@willie-the-truck>
References: <20250128110151.GA26808@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250128110151.GA26808@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream
X-PR-Tracked-Commit-Id: 01009b06a6b52d8439c55b530633a971c13b6cb2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e2ee2e9b159094527ae7ad78058b1316f62fc5b7
Message-Id: <173808403590.3856593.4033698384471308198.pr-tracker-bot@kernel.org>
Date: Tue, 28 Jan 2025 17:07:15 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_090651_430239_245100F9 
X-CRM114-Status: UNSURE (   4.64  )
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

The pull request you sent on Tue, 28 Jan 2025 11:01:52 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e2ee2e9b159094527ae7ad78058b1316f62fc5b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

