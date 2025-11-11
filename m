Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4013CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 19:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGEQow7YFgM7RnSNHkQoWCu36w2/CtERfuDLommx1Ro=; b=jCzngy6/x/vLC7/n9QxVu2UDjd
	oIYG9Z1+Td6reorIh3JRZ3Sk/tTFITK1qKfHC6eiJ01kJLn+X4ZxBkT44Gy2Z5Npg+NR9kQJoqD6Q
	Uc+fgWhZPFIGcZSx6eKPMJ/0mitrO3Yu0JBqsMuNbUFEG3IgQDiKIq966RPJq4J0TqNqaR+ywoNEO
	Q0ayQjos726imkFLG7u7bN3RsyHvADd6Uplb0YlTdPBHPYpxhXA+xAOjZZk8FuCqOn0dg8ZDd2Qfb
	ZPiDSCQ224zPhg90dsV5cnff0RmDBynft50IVYtzwykRHspwGFNjsU4kZcNec8xyol+bHKtaU7UlU
	RN1Qp22w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItlQ-00000007faQ-3r8c;
	Tue, 11 Nov 2025 19:10:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vItlP-00000007fZt-2pXW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 19:10:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C3DA160208;
	Tue, 11 Nov 2025 19:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71497C113D0;
	Tue, 11 Nov 2025 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762888246;
	bh=z30sYZuweToMSRbZmmjtT/wBIWBGjpziU0vz9SNB8tQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cL/0H+7d+gmHkzQbb+2Z6u/gROBjBU1g0hebfv79C0zz0RuLsC9YX8zKJDc83Rtv3
	 mSqb5fscTv86vbXFQOc03c7tSobXXyO4qORvcFutmRHDEbPl7efD2WxGikxTOYg8F7
	 +f306dTsDg7at3J8/EXCqXeh5gHSOb+BRV9cFgG0SwvckKKro4QC8F73c1o6azTZB9
	 UyEEgjX2JHcrJfNqWRL0lxXxYBo7IUUncq83skTmw6iwZP3u1cHIO3qC5mV1DacjyB
	 qVD5Cvsyv9XV8vumnc4GE1Hwa0Eix50QdATv7Sh6I/MOOuV5oVl/+SKkKJLF6sLDI/
	 tfbtx0GfuzrtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1B78380CFEF;
	Tue, 11 Nov 2025 19:10:17 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aRN7fm_q2B5UzQTK@willie-the-truck>
References: <aRN7fm_q2B5UzQTK@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aRN7fm_q2B5UzQTK@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 8e8ae788964aa2573b4335026db4068540fa6a86
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 24172e0d79900908cf5ebf366600616d29c9b417
Message-Id: <176288821699.3548512.978499096605838935.pr-tracker-bot@kernel.org>
Date: Tue, 11 Nov 2025 19:10:16 +0000
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

The pull request you sent on Tue, 11 Nov 2025 18:07:58 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/24172e0d79900908cf5ebf366600616d29c9b417

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

