Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9977BCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA2tbNlZlNkpjsDIjyAJXYtXbXdnmdhW0pNgQ+5y53Y=; b=nZDmsyrUBX8wgUaeL6oo8f1i8s
	5HXIsRUoUBlC9eVkR6OKlCD86zhJwPvVCxq+eWX1gpnsxMthtYcx6P7H5sKrQ78W2CD5PfsodSe5G
	HSidx2/9gtmeZJv6ApIm/a/54OEJ2T5bvFVcJTjFkRuCrqS1DoEoyGnKnE/e6b6TYHqbOzDlkAFuA
	loDJW5YdSQNERyD83okSvNgoM/Y/5uY2Pt6U5gUBaMF6X6NWw0R15IP7DrKcPPqQn1gLsiqzV8eoT
	7bmngUoca9AyNwSHa0hdZBriiiHu9htRnOzwXhy5IxV+GLHTU5ZzZ1HCEDDqAf9Mq2KkucIYSazQQ
	QyTmwrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47qC-00000009N3j-1XeM;
	Thu, 02 Oct 2025 01:10:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47q9-00000009MzT-2ZC2;
	Thu, 02 Oct 2025 01:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 43BDC418D6;
	Thu,  2 Oct 2025 01:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F6AC4CEFC;
	Thu,  2 Oct 2025 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367437;
	bh=Qj+VqYmLCoDLwNZ3CD8VSc0unj0X6rcyDf2HT00XNm0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m28vmC2Bou8PAh4D5RlCAZdNfwK0ZRCxXTvi88D1Hq7xvFDLBnDUV+lM9KaGJKRon
	 7RDURdyEIS4od8vCJJwrrqS+jooNqrcVPj5M4pk1Oda6oktkAIgUHBq71KxHW9jUgi
	 3BuXVGaQR7WTrvTfqalR58iLdAQczYh9VTXKH7ykxAy1qaV2ZbQVF8VauW6I0MmxmX
	 zst83EEse5f02ANnGPOaOcHSMikuIM1b2B8zSDgQD302c4AGzV5OTy12MnXUv2bkps
	 1VTm1SzOnK/A+gXSSstAgAAyxN7j/+BqnAxGL706tDb3itUQZTRTsJw2bQxlQdrmk5
	 Pe1DjhMkFRXWg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE0F39EE03D;
	Thu,  2 Oct 2025 01:10:30 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] ARM: soc updates for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <cf067bf7-5990-43b4-b96c-0700b3d59293@app.fastmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <cf067bf7-5990-43b4-b96c-0700b3d59293@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <cf067bf7-5990-43b4-b96c-0700b3d59293@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.18
X-PR-Tracked-Commit-Id: 65d2419f931c08ead6722fbb9d4bd8cecb25a7e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42cbaeec987b9fb91045060f2e7ce3152458ead9
Message-Id: <175936742943.2689671.17186609638314051553.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 01:10:29 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_181037_671161_45E2474C 
X-CRM114-Status: UNSURE (   4.19  )
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

The pull request you sent on Thu, 02 Oct 2025 00:28:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42cbaeec987b9fb91045060f2e7ce3152458ead9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

