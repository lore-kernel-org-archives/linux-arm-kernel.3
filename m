Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D026AC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXbZdgom/1sHMjvJmQu75PfsergaCBH5phB9pKIuF7E=; b=W9zN5h1B7GVoO27pUjgeAV5WH7
	IYM+FlZqhxki3nI1hlddi3j788PO2ZYrBIi1jXW7+d3IUruOt4MFPKNIeXx1bSWd6IuDjoB95R85o
	CXpiN7SIID0Tt1sjdyUWDhTFU92mWufMjzREHGcAN17VwF+S5pd4rURJUibPmu4sMuUXepwmG12Sz
	XKqXaMhNSUyvSxfU8tGzNEbBgb15sNHjgRv9z3a5OdI8RmC0W+u7YEO2arYZsUUTyJxzRRzsuTcsg
	mme2OIRTjAW0kgp6CUY91xUqnICv3BKUzgADp2zo9TiR8QQ2qX+Mw8ObvwzgKJnSsSvB9/UWcaQ3Q
	znC1e8LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0ll-00000008Czb-3rF5;
	Thu, 24 Jul 2025 18:34:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezFF-000000081v7-3BCt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 16:56:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E778A56530;
	Thu, 24 Jul 2025 16:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48670C4CEED;
	Thu, 24 Jul 2025 16:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753376196;
	bh=pyk73s/rNvyurZ/Ot1PRShVA7sPCJz6bljzDW6hOjs8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=S3BqV6fVfx58PLGUujWa7vx80h7Wx+6l4PrLsPRviraMYNqZfPSbZs/9UqdkwR8as
	 VhrKgGaEZgL9I3TSOBK+iLwGbaOHUSARhGB06kJVy+ViO6X8WKojf5mU8tnJv8llsE
	 ueHgYP4N2VIRUmNvNWcv3hVL7l+egQdx//kdN1TEYNPFTPTLzrNzzp/y7Q+j+KnsN4
	 Ayvb6tPwYL37hPa4EVX8pMlxONyeVFyI+m7jFRQvXnciGCPR2nxDqXfwozX5wwgVRd
	 qg+2tGCK8vlgSLp+p5UDhPz+zl5GHbzIneAfsVNjhnob6u9kDF5cIU0HsGSAQnXxUK
	 QWP6BxlyiMJsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 69C71383BF4E;
	Thu, 24 Jul 2025 16:56:55 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <aIIAZiQ6ca3DFHpE@willie-the-truck>
References: <aIIAZiQ6ca3DFHpE@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aIIAZiQ6ca3DFHpE@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: d42e6c20de6192f8e4ab4cf10be8c694ef27e8cb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cef6c8c92fafa58fa04d8622e89ed4871d121fc3
Message-Id: <175337621396.2464257.2491131967302422873.pr-tracker-bot@kernel.org>
Date: Thu, 24 Jul 2025 16:56:53 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, maz@kernel.org, mark.rutland@arm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_095637_860598_E33ACA63 
X-CRM114-Status: UNSURE (   4.52  )
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

The pull request you sent on Thu, 24 Jul 2025 10:44:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cef6c8c92fafa58fa04d8622e89ed4871d121fc3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

