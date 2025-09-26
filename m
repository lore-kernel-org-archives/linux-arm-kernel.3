Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72E9CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 20:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yMPl4ZKifSPGmgzH6tla29PwWr0sr+rO69J+eVLu8E=; b=OBG3SI/MhM/RDsVhiIj820+lnB
	c/VWkIOXSsS7njhOB6l7Nd45BXagE+i+lIju22ThMPBkxuMxMXSNlYZCJW8kcJY/dVFL1nKws3SsE
	n/CmhPVvQmRSeRqOG30yLqp0OvjbPlGaJNDbqGJyV4PmwfZGdDfFxoCCo4NBV/duVwQHNv7poherM
	qTc0g2gtdi1jIXehX5GRBuqzP+1ScQGNyOf/f3Qb1DZa4RsKXHgp0DheZQ4vaF38A2GNL218T1lr9
	ibVtywJ3NJW6khSEfrKtP9E9eV2XCcgID7s2E8W5twMYtwkAUMTrfhpyOsBFVT5Hx5RCfkc1vRtgO
	6yAGiisw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FIo-00000004OmE-1X3X;
	Fri, 26 Sep 2025 20:44:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2FIl-00000004OlO-2oub
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 20:44:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95CF7459E8;
	Fri, 26 Sep 2025 20:44:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7399BC4CEF4;
	Fri, 26 Sep 2025 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758919462;
	bh=gbih4vMxJwa0NyttLI9rVwuk5qr34L04OnrZlGsM3dg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YwjjsIoD4jPmkhi8AgTdhzQGK+X0fNbSDKJy4Nk6E1A6yOrgwnO/sq01F4Z0IloF8
	 LYPeTA0mqFq4jfvPs4wPANjCG0fIoxpNV0+5i/H3uR3LG9ICTgB7IVS/PRTvyXMKZ+
	 477F8MJNzQ1XN6TyxAOcsHujLEYitV+mofzTYZ55m99KGCvRlH9/KSrgPIjIWBLV5p
	 AZT/rrFVkPSEtrX0vJQqWXPgUWKJeLw1ELRpDHleBZjCoIbx5Lxd/MPl/2lgv39PTe
	 Vr44Z/FbFm8dhTsxJN0vvsiOt/O/eFFd7iJMV9A3rGSbDRWdhx4wlKFwtVl1ooqShm
	 f15jg66QZx+nQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD5339D0C3F;
	Fri, 26 Sep 2025 20:44:18 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.17-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250926124327.212581-1-ulf.hansson@linaro.org>
References: <20250926124327.212581-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250926124327.212581-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc2-2
X-PR-Tracked-Commit-Id: 5fc4ab3269dea6a0b00c7256cb6f6c0101b6a44b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d97ef77425e591669111ebf819ceb5d5e2dc329
Message-Id: <175891945757.51956.2518306762590478395.pr-tracker-bot@kernel.org>
Date: Fri, 26 Sep 2025 20:44:17 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_134423_730885_D14D7B36 
X-CRM114-Status: UNSURE (   4.33  )
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

The pull request you sent on Fri, 26 Sep 2025 14:43:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d97ef77425e591669111ebf819ceb5d5e2dc329

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

