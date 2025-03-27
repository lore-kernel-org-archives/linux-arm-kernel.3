Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEB6C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gHF/nLh5z9pfQ3Mt3qzJSCYJEuYO0ubmYxlgjw5QFw=; b=qgpt87b9AutDv1a4/xev1VuwrZ
	J3vL0guAxQWMHNj+49GKwxkaeqptv226BOF0KYu5rOBcn8pTeFzR6EPZw849Ii1n7RlfZmeRcFjJ8
	WscBfq0DnrWf3g/8vArYo8AXoKxTBm4gyYI887OF9VG7Zo7f59jP34kGFOsKwAQjncLVFzHuAYOXc
	ciF55C6iOMeOgo9zrlOcA53gGo2bQvunCQongIsVfMTPpu3SKfnFNr8MpH/XJiTQXMmlYsuPhp+BZ
	nSWiwwT5M5KyjpHOWqu82kur9qZIDYolOvrn9IbqlG6jamLMlqTP3Cpg4yGa7cTzRbmK39QHqw6E5
	XGb8i7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txshw-0000000BoBV-0YlY;
	Thu, 27 Mar 2025 19:16:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txscF-0000000BnRR-0wxD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 973E95C61E0;
	Thu, 27 Mar 2025 19:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B45DC4CEDD;
	Thu, 27 Mar 2025 19:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743102610;
	bh=5QAP23KIhAdrZlLT5kpDiYvNaQ0YvaYdzgGKZ5c0ewo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=o6FHkvN55ipVbXfy0np2HmertY7OG+YnfuZDf3JDU1jrzM80z+gyPAWuD090WWMKj
	 r0DCM0IcjYf6OwyivrdmY5YNBTDZnYtBzhB8i/zt3Zd9VhvKOie1hHFWm2x0zcDhZ/
	 n2k4uAN8y6TKACG7ATglZgGH9CtklT/h+DuhbAFdvtxnv2ZoeVDyuNTsU3XjPILkOo
	 nSim+CFF7ItimMsz+S3CzBEsuenPWhG0hYddcaxfxT0NJSMvysP5Y9xr9i7uoQoTuM
	 d1y5WHgIMXbBlfFMZpcGLqNOsclBeEEFtTgTl35hAHV4Vv9Icu9PgsWRJBj96e9Ob0
	 CTyLLR8GiB4PQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11569380AAFD;
	Thu, 27 Mar 2025 19:10:48 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: driver updates for 6.15, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <ab627300-24c0-46fb-a236-f94751afffc1@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com> <ab627300-24c0-46fb-a236-f94751afffc1@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ab627300-24c0-46fb-a236-f94751afffc1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-1
X-PR-Tracked-Commit-Id: 2124055fb5c6554cab0fdd7a09235526cacaac23
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a9fc2304972b1db28b88af8203dffef23e1e92ba
Message-Id: <174310264664.2176831.12176170026565000904.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 19:10:46 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_121011_304893_9513544F 
X-CRM114-Status: UNSURE (   4.60  )
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

The pull request you sent on Wed, 26 Mar 2025 19:00:31 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a9fc2304972b1db28b88af8203dffef23e1e92ba

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

