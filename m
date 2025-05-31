Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562A3C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6pQEpvvpLHPYMMNPoYBZY+zMs9dcaLNaItW19CMfEE=; b=cvb3r5TPauM2lw1q9ZSwBKxqe/
	S1si36U2EpVLMhgdW//uf29IgyVkNFztD4pGR9B47OHfO7O15lp9Cd+j/9aLVAfNZtVbdDomQBE5I
	kAD5+H41TUHD9aumIsnysP65zwS7ovVoIpIn3gmYjqg3TrYilFUUQ8w1fqEh4Oc4FFVX1AjpeUEVH
	YcjOP9eet84O8pCWbnUiGduAfW7ml0K2rnV/4lalNUQI/H8xlhJBl3FGxonj2oxiv3Ee4wOSSB2+e
	s2UHkWgbK+wN0/p73PxX3OQ5jQLAauke8ZhyEWha7QaEskrjneKTI/0s33acbm5ubXVImQZnmmVKC
	AB+XKq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOIA-00000003zWy-063c;
	Sat, 31 May 2025 15:38:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOA9-00000003xo8-1Dpr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 15:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94AE8A4F062;
	Sat, 31 May 2025 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A53C4CEEE;
	Sat, 31 May 2025 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705420;
	bh=aSKBR3OAdZzFDbue9Xcbehqpq5MXM8tMVL4HWVjGvRg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TiebD5/Yxe2n6WnCnmLQMq58d5Yk0/NkRa5HdrJDqLTNYhDdMTV9EOvQ8ZJ6g+pHD
	 M45uvg5Mia3W3QS6xrQyvyN1G5Sr5KdmSNieBR3bYaI8Ld0lxSkdV0GrNyoAdq0SfX
	 4YwPlrnAybSSALNY0Be/mCbGzh++7I+zVCuLpd+bNpJTlad3nMfwtnfZPHqoYnQfp8
	 +y9RK9QKeBl/YGY3pB4tyfhsL3NPzAGT3oXMlxiNGHOYLEakM0e1JLRRUwuU409rD7
	 DPSs4Z6xY1981Kxgxe/I271wwAJqheNnfKcEvI5owCTAsPAb1xTdfOXEoZpuPCAsXd
	 LzQgyBZvBpKcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE052380AA70;
	Sat, 31 May 2025 15:30:54 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] soc: defconfig updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <70c2f540-d534-4b17-8daf-4409845f3a5d@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <70c2f540-d534-4b17-8daf-4409845f3a5d@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <70c2f540-d534-4b17-8daf-4409845f3a5d@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.16
X-PR-Tracked-Commit-Id: ae006498a0723e1cbb14fb7c56a1fa4642791897
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f79749a8e42b3a6dcb980e87f3ef752962b9f094
Message-Id: <174870545315.163157.15508675521389745146.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:53 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_083021_393948_F460A545 
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

The pull request you sent on Sat, 31 May 2025 11:05:53 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f79749a8e42b3a6dcb980e87f3ef752962b9f094

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

