Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1332C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 May 2025 23:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bkpy2iLQHPIWvazsZt+Rsg68uoQLNAArJX8WN1HxnMc=; b=K6vBy7NOS5a4BBmTgkPYgFrqvR
	+BZvuAojNTKwU3Y0bVFWFBv0+THuE/6VXNEN9UBnkAMUdWJNZ+7y6LVQuA6J7v8ZDTLpZmRbLWJmc
	Fp8wHlzE5JzLCrYhQ3x2jqfCnEdMOlYuK2bjs8Hu44ik3jR5GhIIcTpylDX1w30EEOwfL8aL05rRP
	IowHfeCjNX/3SyeTFjna/g/8cVifyz6XqabOBeLqT8RHorekfVX+MoXsUxZUY+gOPQkncQFJe881O
	6xSq+7pF95jDNrtony/a3bPt/tE/vp+FSiesJf2jSpJaVBEpTBj1v/9MIzb+rn5aQP3A9Ql8Hrvvn
	VzDx8lsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBMkP-00000004d4i-2g59;
	Sat, 03 May 2025 23:58:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBMiW-00000004cw9-1dQQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 May 2025 23:56:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF0415C20FE;
	Sat,  3 May 2025 23:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EA6C4CEE3;
	Sat,  3 May 2025 23:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746316581;
	bh=NsbQ28AQYUMxdmDbRR+S3Im5XcudWRmv5nObzP+tmEY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JXTsGSMWW75mWdsuVEvAt0GxIZxRodsruwZDIQ15EJdJvSk22x8gHuqVlAnqEJnvI
	 MMZEDsC/M43+UNWVY5imerpoVfZGWaA1qltxm5o9REUidDv2Fm2+o1BMx2SCI1xdew
	 GKX+8f60jD657bTQ/eMXouT9PP0G4lAe0P40r0keiHZzkB/RT3nFErmA7Mna0SIDSS
	 xAO2xpzTw89vVXIWFF2BIgcXX/8tJHPcDKkjMZk7OpMkGKw/gLN7FeLssAQY1ZBXRh
	 ZFFu8GIceOOxnQjMxD5px2h4pxufE+5LBJqgquAx7IB4rEg8uax5yHrZshjFso0O53
	 C1VZ1wVqA+YGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFF8380DBE9;
	Sat,  3 May 2025 23:57:00 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.15-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250503230151.2578203-1-cmarinas@kernel.org>
References: <20250503230151.2578203-1-cmarinas@kernel.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250503230151.2578203-1-cmarinas@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: fee4d171451c1ad9e8aaf65fc0ab7d143a33bd72
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
Message-Id: <174631661940.3942549.18022262367009295112.pr-tracker-bot@kernel.org>
Date: Sat, 03 May 2025 23:56:59 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250503_165624_474211_F6084D86 
X-CRM114-Status: UNSURE (   4.54  )
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

The pull request you sent on Sun,  4 May 2025 00:01:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e8ab83e34bdc458b5cd77f201e4ed04807978fb1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

