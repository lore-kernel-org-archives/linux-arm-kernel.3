Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC80C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+r78CyEX5VvQ3a65izvE2nM+n4GHRxwCL+x1Mgv38Y=; b=gpqpOd8L3STHBz1Fvn8TsaEqgM
	yOghsJdrhuY8q4gKIBBzNyOQjRuOPNOVW9sqYKtoyD9cx9BBC0ZOStb5hg7QCHr64ChsOfnz8ahKb
	eiFFQSr5B15NNSSZ05iD2K8dV8NSVnxMSZFCceCwRVRZFNnBsogN2eRlh63Bsp8xGUgTTPYSevo9Y
	Nt5dK4kVotH0S8AbEcJ1hIOXPRbjSZoRpLVKpNUy3Z/s60s3+h9Jb+biXeKYxQ4XRZZTI+Trr17Kp
	FxsXVFaRwFrsHOA/yrqPVOH0m5EIxw+8zbL+InTNxnB/IAViD9dx1m7NgFbCeatwu7++c3PG4r/8Y
	/oc9gOEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLUf-0000000H9X6-26rF;
	Fri, 24 Jul 2026 19:23:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLUd-0000000H9X0-3CXu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 19:23:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EA40960A5F;
	Fri, 24 Jul 2026 19:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAE21F000E9;
	Fri, 24 Jul 2026 19:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784921014;
	bh=J+r78CyEX5VvQ3a65izvE2nM+n4GHRxwCL+x1Mgv38Y=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CgPlX6gV7fumyaqQgWS53o64SuG5qwAr8nJ5MNLBv9/y231nNohSACO6B9nKUhkD1
	 x4p/5tsMfI9Wol2AkR3BLHS6kMMql84w/U3JihTplWcBgepxLCS9HOGr6neaaHWPax
	 xL9nDAFXD/ccUiYxW/Dhir/gkf/RCR8QumVC8m3U2Wmws8kBmTAFD5DPVGiqPcgqPD
	 sYYShZ3U8dSgoZfdacwng2+P10omO2Yo/kunE20Y9hAFlnR9ctKRLJ9ZP15G4VqOOt
	 87bpB04rz7nW34OTOoOqa5b9wah0lvgCY6w37ypsBySuQcuQU6p1V5NTjVCi1wp/st
	 asy+w+0CWnmvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1982E380CEF6;
	Fri, 24 Jul 2026 19:23:03 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <amOSJBcrwNy1SV8p@willie-the-truck>
References: <amOSJBcrwNy1SV8p@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <amOSJBcrwNy1SV8p@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: f73a8edc2ccc6ec72c37d5c578e7592d2e1f9922
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c452fbdf41374ff418cb069e59d141eb73f374a
Message-Id: <178492098159.3280582.10922999280118914031.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jul 2026 19:23:01 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Fri, 24 Jul 2026 17:26:12 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c452fbdf41374ff418cb069e59d141eb73f374a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

