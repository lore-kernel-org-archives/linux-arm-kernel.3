Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9653C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LihcTHli0P/Yfu9REE6rSXeIhBtTH1JWKT2B9EqFMeE=; b=2H+Eh/HuljXgPF5vJzxd4oQWsf
	imgY7XxRzZlyz8vwFmbUkvGKjnCBHAchH1nIjW3nQMyhaUCToFWaJJ3nLzi0xpePUFgFtUEiLPg0g
	4/VnzM0Kg1/0P7INBwtwT41EZq8xI5o7n6qNlseLSpb4kM88mxuabLGQzedIhNfGSIgD+MlpRUbFk
	HgNAveImIZqRVVA+XmnRNjweghpHl/6pwOx4s3T/FME1OgTAvzqVoVSm7IxN4dc+pbp5caIj+8tn9
	Hls8MV3CQr6fyfonD2QM51nbbWOUPaa4578m/aM9eo6Y6163Xf7tZ8ovcbD5hdyT5gWa9qvKQJFVM
	oHAeiZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfrX-0000000GHsP-3ul3;
	Fri, 20 Jun 2025 17:49:15 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfYJ-0000000GEtd-0CzJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 17:29:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2EF0A52B64;
	Fri, 20 Jun 2025 17:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57416C4CEE3;
	Fri, 20 Jun 2025 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750440561;
	bh=85cr4eLyWlNP87n+hSpFBj2t7Xu9xQ0rfmOLdT9i2B0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mqvPrcjg0YsD6pPYqwQkC0g+f61GnckyP16nfS1pmpDQvUA8D2AEM1mViJTdjamgW
	 5uaGwKRdSpGTr3PdaB+skvwbawUz9MPzIo5RSoydL2EGBkTWrvXDWsk5kdNM9yRy3m
	 qCxvBe/3YV3dxlrqvIv+h9rZfu5B5UgnOrg4cRyFpXE8vt1ZmSVHnjCrQr5uIDrxjI
	 Xu7goyCOSg4sLxZC2hg6Vr/1mgcKJexe7bvUD3TDFjgeVm34e4fK8LoIUzug0yX2b4
	 ZTycvpRpolP5gCP9Oink4oMSsNDp1CAP2KdszJSz6rMGMv3ulIUwp0IkihX/m8ANWC
	 eivCN/XWT5rCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70FC639FEB78;
	Fri, 20 Jun 2025 17:29:50 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250620105005.GA22615@willie-the-truck>
References: <20250620105005.GA22615@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250620105005.GA22615@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 39dfc971e42d886e7df01371cd1bef505076d84c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d41fef1ce2f3cd9df128d2c3cf6d91ce15130daf
Message-Id: <175044058898.1649825.15526665644913580484.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jun 2025 17:29:48 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_102923_150222_78A5CB6A 
X-CRM114-Status: UNSURE (   4.34  )
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

The pull request you sent on Fri, 20 Jun 2025 11:50:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d41fef1ce2f3cd9df128d2c3cf6d91ce15130daf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

