Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D88AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 21:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkEQT9zCChk7VUosw9GwWRh//yAYrZjJMLMgilmglUU=; b=zLkfUvJOF3FT1wB5i1oWqjwt8q
	y43c4jhqrdKh/L0eDPPiMDTbp6hxF25JUmIV+WN2xkBmOCy4ipTIT8vshHI2MV1QmKJ7cWar0456W
	N37X8IUc/IUcR1Q4xg9Wu0ucTm0j4EqOsodpjWIfH+E6XBHXXdq9rZxS8/D2BCQrnH0qtKx2Yol/m
	5iPrGRmUeylKGxB2CZ40Zd1fOWRdnqgGrqZbEQMpZylSAVOb8/UcWGffDYN7yKdj8rn8bwbt1lZe/
	2/gBfZjbrbDrGthA54GyVjbHrvRxhsB6oNaUhp+ZwCsRB6M436okoCUn0dC2JElbgYo9vmBbp2FcL
	7WEiVihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toUiP-0000000F08T-3C3I;
	Sat, 01 Mar 2025 21:49:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toUgQ-0000000Ezr1-06ec
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 21:47:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 839435C4CB7;
	Sat,  1 Mar 2025 21:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B9C8C4CEE6;
	Sat,  1 Mar 2025 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740865661;
	bh=l96ouok4AKa5ZQjf0BolxTw7Xw4e3l8rGwWZlTIwOYM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aDV5f1jw9oeJflUiLb+X7EWn7fdM8suTkmRmidhEGDvjgZV0PSNSSJdttuIZ/FKk4
	 rvWZ0OFVyC3AHt5UmLIqvDaZjd2OwaDEca6AxXQAxrPR4fJnb/EZIsHf2tE4pEiehy
	 PUYxyU4YEsCaqMISY2x6+UHHsZ/7gixzGM0hOHeNpHgbI7guB4HmJllSD3AdtywBHw
	 /3zPs4JCNS+iHpE9cmS3tXbWSU/gYPoCvRg5bq9TArPinUz88n7JuNv4RxaRuhmKy6
	 htrYYG8jXi5XdynhkRqY5x5KB3iPmoK2nQCoV9jHeXD7exqoCoIjwPMvd947WpCNHa
	 e+R3znJBEaxEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE76D380AACF;
	Sat,  1 Mar 2025 21:48:14 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250301212116.GA29069@willie-the-truck>
References: <20250301212116.GA29069@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250301212116.GA29069@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: eed6bfa8b28230382b797a88569f2c7569a1a419
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d20040d71ede4c0e5fc6ae7aaa92788de1e713a
Message-Id: <174086569337.2508762.431455640708983782.pr-tracker-bot@kernel.org>
Date: Sat, 01 Mar 2025 21:48:13 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, ryan.roberts@arm.com, akpm@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_134742_106902_9959743C 
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

The pull request you sent on Sat, 1 Mar 2025 21:21:16 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d20040d71ede4c0e5fc6ae7aaa92788de1e713a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

