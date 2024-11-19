Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A0D60D09
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 02:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoilDNgTJj6ZSMc6STYGpQzNXDcpadEIGWVp6YJn1eo=; b=HPAWYHXheayjh4VcdmEp1SBGDg
	UJqSNRnAOZ2CqmzQR7yYYCpGFHN/MPMtD/DkmrpxD9mWFr0OiGCdzlNaH/aglmL37D5WhOTia2kYr
	65s2Xemg/VNclvKlAmP8s16AdmKijpJKmYXWo3Wug7j5f6G0evkZOYeBk/rtnbSJEVKxy+AYmMsli
	YrdlJlb+rAYEXMoPKpQfhdLmlHDgadpuR5DykmoVQHFDYfpgmWvoY9SlLJx8qqCs2Tj+xCTw5lwxd
	C/J+3/4WG8coizO77KH8itiQtEd0XBTjS2yJd3FAgcBPfGdwKh0CjXk/ssZp8yCD+wTiCEL5QlFEK
	bHWhx3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDvR-0000000BBBr-0bBz;
	Tue, 19 Nov 2024 02:25:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDDuW-0000000BB6i-0SP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 02:24:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 150055C53A8;
	Tue, 19 Nov 2024 02:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C709FC4CECC;
	Tue, 19 Nov 2024 02:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731983050;
	bh=AFk3dEW7eoqSSrKBTMYIRluZEfqiDOKQAs/9HVWgNnk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=GfE+VMzaj4WpfFZA3ECg82W3xAIJAmcM+oXd2eouyKgEdHZrnnXDUzwb4YdTMp2xJ
	 5VE0xM3DNQKCyWXD8EQYkMCk/vAFvmO76knHzKQfbivjhYCjCRi4IBXsnE+k6QiT6q
	 lBl642msZh+LwwytKbJMGl/wC2cfIVAYRq3lNM7WKqA59Qxg0q4P0XsxuLFIPuFk65
	 kGkuvNDMpt3wSCExMeH0NBKZOjiVKTEHhoz0DJQq8T5cruHlOPoYBpxoyhUjFp0AWY
	 etfFTl6bSmABhDksJJCVGLSGivY2tnXmFpqcv8cnu/Ys0SSB/MKyMy8XHc7v5k+D47
	 d60n/xChRVSMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70EA33809A80;
	Tue, 19 Nov 2024 02:24:23 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 6.13-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241118100623.2674026-1-catalin.marinas@arm.com>
References: <20241118100623.2674026-1-catalin.marinas@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20241118100623.2674026-1-catalin.marinas@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
X-PR-Tracked-Commit-Id: 83ef4a378e563d085ddd7214c2a393116b5f3435
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba1f9c8fe3d443a78814cdf8ac8f9829b5ca7095
Message-Id: <173198306214.73657.9794916659616465087.pr-tracker-bot@kernel.org>
Date: Tue, 19 Nov 2024 02:24:22 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_182412_187761_723C1453 
X-CRM114-Status: UNSURE (   5.19  )
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

The pull request you sent on Mon, 18 Nov 2024 10:06:23 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba1f9c8fe3d443a78814cdf8ac8f9829b5ca7095

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

