Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570FDCA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 18:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tf8S/GLytZ4iEatr+NNh76K3vyjdM9YIW328Mj9fhI4=; b=H6WpMh03nXpYXRYKR9rkUmbDUs
	OYBP+LKrAE8Og38yMmE7doMasH0p0FjMr5OzwZqAMoK44c86Y/2Q4paq+2XKo58prasqKWr/RTkpN
	u0eBBNalkxGgXpyx14/EZeY3hMRmZJ1volQKf28bwFaMxxXHzH+U0xBLRpIwPYbuIurLqBRMCwYur
	UH3cWDNVXhpKcjoMlP5zxKFBs7oPDwbMNnUpvWmx3N8CA6cXa0N6kfkAO40obfiniqIjnka7C2w3T
	2cTJoO494noRsp1+oGXI4YqJuWLXKWJjWneB3V9AwqZ31flp1LzDH1w6fyzGGzZ8kYtfmrKSWYmAr
	tkKs3HYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPus-00000008Hfi-0xZR;
	Sat, 30 Aug 2025 18:03:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usPo3-00000008Gym-42if
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:56:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F32E4428F;
	Sat, 30 Aug 2025 17:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B795C4CEEB;
	Sat, 30 Aug 2025 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756576563;
	bh=/wWIpt/RhNt0zzikItWj4BYvAVYQxfg2lBw64Bxe2p0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sdHiQ8mFjCk8RmFCh5J7Zg0XqJOu5bOtrIyThgmmYmLhCOlM41n5uxyKM0wBPNRX/
	 pwXMYxYeLTMkyO88oMbgguPQgbzZlJXnmYvP7N1GEL5CyFIM/pPP5lzGX4euLpqkF3
	 aJVmTa3q5mrfIk8OeIQ48CHFSY4M6jbswlpMwiNEo/inbtAN1es7ZnCzqDFR+VhIS/
	 k9K9xcRqmdHN5EZ6w76xUumUmXf/dzQ15571WGvKfKAmxHDutFEqz1MPTq7FYgBrOI
	 /zOqPblVDLhvqyMnrtR3s3Zdc7VsrEEtjshQVW9sd3xFHF5cOES9CHtjAmhA7Npa2j
	 IaOExDF5yriTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEFCA383BF75;
	Sat, 30 Aug 2025 17:56:10 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.17-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <aLL02Fi-gazNRa1G@arm.com>
References: <aLL02Fi-gazNRa1G@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aLL02Fi-gazNRa1G@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: d82aa5d3501b25bfb7bc2a24a68ad0a83b2ad10b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8bc81a52d5a2ac2e4b257ae123677cf94112755
Message-Id: <175657656917.2548612.428091907590415108.pr-tracker-bot@kernel.org>
Date: Sat, 30 Aug 2025 17:56:09 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_105604_024402_046DA76F 
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

The pull request you sent on Sat, 30 Aug 2025 13:55:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8bc81a52d5a2ac2e4b257ae123677cf94112755

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

