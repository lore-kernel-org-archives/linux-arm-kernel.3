Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A299AD64074
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhVoKfCFg2G0vSBlCLBZvoAuqNskON1yABqheWbOC2Y=; b=mN+vIfOMpoU6v4et1yeVG3GWF0
	TBlaeRNIXeqM+UUGPM5Z2AuOF+sxcP8khXXUVn012BN4jOT/KMblLQx6zn3csSr8wsuqxf459Y2lz
	fe710t9V618eCpcLvbwcXGC4ncNeAjMddXtx14eUItN/G2/lVVReieyIs3CNjew3t1M8shammue+z
	QHSlAHKyOwVFH4FvaUwmVfzLZ43+bopUB/T1JD/EoZzWT5OADzim0C/WU5LVqwN+3HLnIqEv0eIzU
	EMlhtxwbaKyChPD76YksPzgQyCUs2qHC+R/NjYemv1RBUx5BJMD+RkGuSTPTHtqSb7xvGnEsCRmV0
	mJ7a/7AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9T1A-0000000BS2O-06EN;
	Fri, 08 Nov 2024 17:43:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Swx-0000000BQZ7-2ZL9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 17:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 76B12A445D9;
	Fri,  8 Nov 2024 17:37:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BE0C4CECD;
	Fri,  8 Nov 2024 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731087549;
	bh=dn3WLXb8oNPdnj0Z2mP10sw5XG0ZHNrq8jDqH+HA3BE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gKzNoGP3lpzOomxV+R5eyM5MYFGWV67iYECfa7bkb77DDEHBcRVKtaK2qB5j0vnsy
	 P9fBnTCUDHhRjgBELgwIrdDZgPgfJ+gTr4G56D1pDWwdAn8XOwGh9pVhMdpj1tS1Tx
	 OJIXePj+evKBqicLfkEkgLKF3dXmJdrD3rlngK1uVikDa6+OTUFTvA2UGwZxsxX77U
	 wpPyirS9iDqZ0lvi4eVqr3TVhrVmYLUEX7OrAiCZaLDjzndHhijxIT6Sr8Rlus0a+R
	 JefW4ShBVLn3d+IdkBZ3YljERr3gfrf3Kh965Iz8NsgCs9S7Qj03cJcZ+dWMFXZKNV
	 opASx3KQdLnvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DC33809A80;
	Fri,  8 Nov 2024 17:39:20 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241108115709.GA17107@willie-the-truck>
References: <20241108115709.GA17107@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20241108115709.GA17107@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 81235ae0c846e1fb46a2c6fe9283fe2b2b24f7dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9ea7edac83630a9e8a05042b8750eaa10ecb6a38
Message-Id: <173108755865.2704280.16863022796715917075.pr-tracker-bot@kernel.org>
Date: Fri, 08 Nov 2024 17:39:18 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_093911_735084_93DB3D11 
X-CRM114-Status: UNSURE (   4.83  )
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

The pull request you sent on Fri, 8 Nov 2024 11:57:11 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9ea7edac83630a9e8a05042b8750eaa10ecb6a38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

