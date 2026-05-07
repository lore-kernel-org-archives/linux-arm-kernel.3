Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4D4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X04D+fUaIVeFkIJ2iNFVE3W0CqxPAz8eX3wF+zibuYM=; b=RGfL5TtmR0J/GlpYSc/tnzWpOy
	PL3Vj5e2pY7LbtMSef1CKNX7hjQTAi55fSHtWsYFE+YeZX1XJacoULZ9Ose04yBUE59UDOxli8UmH
	00vJ/mnhsutfw5hBdFGV8FNvTIRBhny5CA98MoavSv3DA/iN+swtMMwwQfLa/p+5a/4B/XVV0XVIP
	NgQCdfnzMt6GiMAS/uLZ1Vk0mGWtU43nQbBzsBPxyYA7dMBWTNmXFs5hiQudtOHbxDRy9Od2epQ4z
	leQe/icl/dnf8+wiSdtrUMoM9sGNaohWWICLyKTpmCgrd2C+0tLqRHd0MOM1Rin7h3Wl2zzneUl4O
	NteMiCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1Fh-00000004Hxu-3K6Q;
	Thu, 07 May 2026 16:07:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1Fg-00000004Hxo-3wG8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 266386015B;
	Thu,  7 May 2026 16:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE27C2BCB2;
	Thu,  7 May 2026 16:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778170023;
	bh=5z1MGFO+USucjV/1tjsmkRhMpG8nWbc9mYG4cOnHawY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wj5vVx05fyg+WhDGWxOHgQr2h8zk28EVv2ZwT/ipJZWYCfYyBlaDiCa1Deg5CrAmy
	 9YVKfiI+1eY1NCHkueVfC5/SSrop83ftQy+VgGUBV3j3SC9SiVr4dIyXsqBsOlYyWm
	 y4VFhNdN+twGT/lCxSg/Fq48kIhY2lLajU/vAY4UYmfSKQ8WphSz+fPAlQE+feXbV8
	 k7tw02pIkkFXrxnnhjU7sym5tveNzZtUPG8kusx3g/FW8k6H/C41F6POlyHQtLG1WG
	 O076S3yXOpQkJAEV2JkEuKN8zPbu8BK/RNfFPNO4PZ+tNrE7fQuj/Acp/WDvBTFQnx
	 tFsQ2JgNeFu7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE303930909;
	Thu,  7 May 2026 16:06:14 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v7.1-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260507100304.8170-1-ulf.hansson@linaro.org>
References: <20260507100304.8170-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260507100304.8170-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1-rc1
X-PR-Tracked-Commit-Id: ec1fcddb3117d9452210e838fd37389ee61e10e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b3737eac0a0f70b2a6b6a872213f0f235624e487
Message-Id: <177816997280.4057089.14466103668847479623.pr-tracker-bot@kernel.org>
Date: Thu, 07 May 2026 16:06:12 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Thu,  7 May 2026 12:03:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b3737eac0a0f70b2a6b6a872213f0f235624e487

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

