Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B07C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 22:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARvWG8gKjLmat/63jyq3yeDBJpuQ/8WhQZhGIcH0HN8=; b=2kjVM5A6NZ0IM1uUtEUNXCCTLl
	GvgIp/s526pjWyLlaSZHao6mCDGUEeJnkCxZ8e2CZLoVeOdbU74U4YAwkhOL+hzyzVyo1xm+d+fDX
	lhDF4sxxv80tjs+YpcqxUCrFIooiwrAiF6bY5WdCiuqLr658InUzScY9avX6mYj+fO7CECsdg9Ttx
	VgR0KLlzJHasMmWC6y/Oz4lwhCx8Ms5hvLKDy6zWGZKWfB9kZ4Q8ljctnbDaiUGY+bm5ro+bYTvcn
	EasswPb/qOYUhw5kL0zoDFa/RTDdo6NAQi8lpCoOqW9Fg+gHp1T8oyDUPXDxE9L0/T1H0k0Kz7wNq
	m2vNHsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKP76-0000000EFHO-0Iqx;
	Wed, 28 May 2025 22:19:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKP4v-0000000EEvU-1hHC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 22:16:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E807A4FB3F;
	Wed, 28 May 2025 22:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47F5DC4CEE3;
	Wed, 28 May 2025 22:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748470612;
	bh=ME97XvHP1p/V2KP9dL0rNzabOMCHQocn0bMBshCDqEY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bY8oYg+WH5wXr+R1LSgLvMOs0WJ4knWwqMWhgq2cYtwFK1wIS4Ww4n8k8pKc1U4wv
	 RII9pc5JXDFi4OPTTd7pV5yPBAyaiqTj16hZvnHZMxHq88wbnYCnEq7cM02+/xNgRm
	 GBSeJlI+G9d4AdQk4FXbWdhSI44hYKTM3+gidkos06Y5SrKna7dj1QrB/4gwOLOtYM
	 EgtRsBsHQCjULHPt6jj/1txwBHDT/jakHN48iyU+E7I8yXAbmBsGMGlVwfhl7RgHrr
	 R74joo7Yy8E5/wd6fxhsDuM7trc3B7FQZ8+LigPhxJOdUQ9u8qWVaKX3RAMcCtu80H
	 hjI3DADA6fIyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CD53822D1A;
	Wed, 28 May 2025 22:17:27 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250528114103.GA27965@willie-the-truck>
References: <20250528114103.GA27965@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250528114103.GA27965@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream
X-PR-Tracked-Commit-Id: 217e3cbba3d6613bee9ac33ddc330f8676eb9eca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 47cf96fbe393839b125a9b694a8cfdd3f4216baa
Message-Id: <174847064592.2608061.11972465031439133363.pr-tracker-bot@kernel.org>
Date: Wed, 28 May 2025 22:17:25 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_151653_502616_DF65F244 
X-CRM114-Status: UNSURE (   4.47  )
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

The pull request you sent on Wed, 28 May 2025 12:41:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/47cf96fbe393839b125a9b694a8cfdd3f4216baa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

