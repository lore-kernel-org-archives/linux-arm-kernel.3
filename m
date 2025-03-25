Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E770EC36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 20:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jLgXy+/YBmt/n60WX1BVmu1a9Lq4wOvRhsmDmawcLg=; b=sL4GuoiITfUXp3SUeAhNomTc6P
	tQBbLj108A7KquEEv7TmlpIS2k1R/NhGy4qHEqj9V30DMQUliJfWppgkM4oecitW13EQjOculOL2H
	f/e/dF+3jyewSICQfRNk848SPlrsZj+CJ9OyTuqDQi+hqt1a8idUjIF1q7MMMVqxe/yYb/8cj6ngQ
	kawjU5wxkmPjfYD2PtYWQv85qY+9wWDr7B6ka2H7qhRFwEpGudX8a+XMwSppZKLZaKg92IzVbjMCF
	aSRhSKT5IGDUUCJS7RX6SbimhRT93nImeg5KjK0O1jrk7lUUEHmjDUjiy8YeZnKNBHEduLVox2dud
	ZXT8Mayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAvz-00000006ywm-0s7G;
	Tue, 25 Mar 2025 20:31:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txAuH-00000006ykn-0eqx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 20:29:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 963ED5C66A5;
	Tue, 25 Mar 2025 20:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E220EC4CEE4;
	Tue, 25 Mar 2025 20:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742934592;
	bh=8QjXegMWX+AmAtmqZTgk3EVoNpjgmWvsqxJ1UW3Q2Y8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=j58msUpuXE5fBr2XVtFZJqKcBoThVG2KDVBOq0b4+BhGXhpnP8iofAhQBUN3WQbub
	 w1B7Vwi8dVuMTHPjBfZ78GCCsnDBqKbsvyBDnwx9lzJbo/fiVvPTrp11BZYYU5gLEV
	 O6i9HOmxjfTKVsutW7d967SgHQ4leuu+BDTbPvKOwUgnLJrnHvEvHcM9PwoHw6ML+i
	 darRnuMynOh1ZhK9ZH26yhOemeJoBOX2pPGAEDIqkEMQr/4xz5E8Umu8TPSNS7PdHK
	 dOjBb/ZVsngvEP+IJPrH9FdxrWXnhcXVQQOzGDLBWsy86j2E8X/QLNkF62vBC9tQRF
	 sOTGMxRpJd2YQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71254380DBFC;
	Tue, 25 Mar 2025 20:30:29 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250325195322.3243734-1-catalin.marinas@arm.com>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250325195322.3243734-1-catalin.marinas@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
X-PR-Tracked-Commit-Id: 64fa6b9322a904198589c0479dca6f2ed7f2eb04
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2d09a9449ecd9a2b9fdac62408c12ee20b6307d2
Message-Id: <174293462817.715410.15472239124104431811.pr-tracker-bot@kernel.org>
Date: Tue, 25 Mar 2025 20:30:28 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_132953_235050_3A87CC73 
X-CRM114-Status: UNSURE (   4.65  )
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

The pull request you sent on Tue, 25 Mar 2025 19:53:22 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2d09a9449ecd9a2b9fdac62408c12ee20b6307d2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

