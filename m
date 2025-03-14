Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C952EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 21:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHpkUaHkmrAiUk2Agy/w8+5ToHakuywqqL7mhJ8aU8Y=; b=W3Q9Di32+afFvjIPtrelzqCa0L
	R5eYqq+8TmxGt3oadBuekMVAXj5FRckePrxM1fVMzK7I3rDQz2Q9GMPL6E+kapsYSX3jNf1x73YeE
	QP6RgRYSYws9edCBoKNRQhpUiZKjOMr2GUmBVSt1QQ2+KqeD75j9LCb98jMK2rho5g+i43C5IYVzr
	PphSfj6gpBhs/SVyA+OhzCTlhg8B3I5QckfMRpskdSEn5dFgOzt9QtrBu2lNb+7UVw0Mst9chV9Tc
	DncY8kL4u9tE1CcmuPR8LgkJTy0HSrOU2p8ZA5jXaiAOuqZuWriGcLYdyDTWzofUlwW2zKBpzyl9p
	j/RXw4Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCE8-0000000FHbj-0Iie;
	Fri, 14 Mar 2025 21:05:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttCBQ-0000000FHFP-0JP3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 21:03:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7FFB8A488FD;
	Fri, 14 Mar 2025 20:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54CBC4CEE3;
	Fri, 14 Mar 2025 21:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741986187;
	bh=37c96Ju4RQ3EjKN7eGLifJHe0WXdKJC67hGKjJwVSvI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=N7dZRJZoPUXhUbMrBIbCDxH2HSFr9q/DjZkVcl1RRClAEYX57iM859lHRslsQ2K1H
	 7Mq7ERoyX89ur3pbdysh45S5KUu7MUllDdJCeGBoGsdAG0QBpyvTltAKKB4RbOmpGS
	 iOimaj+BiQqrThZOjq2O3nVj5ApNkbq2WFZ1fkHfy3Jm5av+7t2OvNdg5avSAol+3m
	 wJPiB8gVqd5rw5AQRlPtiwFB32ks0Pmj9PNEMQPc8Dg92du8U0RYsx9ymZLWz+AI8t
	 qu/VGQTFtTQa/NrwFtgsPchWPQRFElzw4NVLu31IV/GGJ6yk2vDDp43CirAmkUKvD6
	 8CsjDmZe3uMSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFF9380CEE2;
	Fri, 14 Mar 2025 21:03:42 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250314160458.GA9438@willie-the-truck>
References: <20250314160458.GA9438@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250314160458.GA9438@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: f7edb07ad7c66eab3dce57384f33b9799d579133
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef9248676f81c0342d6e8f90a380a9e0b8c25280
Message-Id: <174198622151.2382486.16421451040430592857.pr-tracker-bot@kernel.org>
Date: Fri, 14 Mar 2025 21:03:41 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_140308_390798_6BDFA7FC 
X-CRM114-Status: UNSURE (   4.08  )
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

The pull request you sent on Fri, 14 Mar 2025 16:04:59 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef9248676f81c0342d6e8f90a380a9e0b8c25280

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

