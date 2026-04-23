Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92241FDEE24
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUvtZcKH+hnV4TOcIt/XowiCFud6XxmF4f2No/S1vfQ=; b=gk8YKYzKaLmVqK/5A1/T9BUedx
	nMzU8pMzGJ4IYr1KcCl5AFcC7LtRxYYuAI5rB+lRG9joAcGwsFONB5uT5C0jOvgjc90JvG5ktCxaw
	/YJjne6WqsykC0aS8zhxZArgRxM0UNeq9dg0YwLkhVXzIQrOq5Aao8uJJSKns+rtKwhv83vHXVLK5
	2UK6nMAZeBfk4LlNhAmC8kCJCivpmWaq486shDLmezV/2eqgCri4mXdfSHY0WnywbKA9Z2e6RB8HT
	ThBWJSWw3iBUKknMiCi+Zml0Gli98XGyHXWb+5Ow3s2gHFMnEFEEKBVo+icUkDDoPNxw+kxSFpqeE
	ddkCGGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwlZ-0000000Bxcm-2MWA;
	Thu, 23 Apr 2026 16:19:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFwlX-0000000BxcS-1UWu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 16:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 38F4741892;
	Thu, 23 Apr 2026 16:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17270C2BCB3;
	Thu, 23 Apr 2026 16:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776961138;
	bh=9eVOvXWSKO9Mwpv08p5pQZbtG7HtNaejExq3zx6fma8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IDtEi5iM2fBWVk3l2mt5Mjf/3KLuLJmXLdRuVI5RXXXXPC4uyJa/6zPlH6WSSZvYU
	 kUSCb+pZaBa2zjbqKMSChei4swNJI8bGGjUAXQoSFgaLItoCXKVfJw6gRjLgNfH/7I
	 mvms7go0EnxzqzOLnaK35m2oq0blzW61Onq77c/1lDSpGNKTOv0iqFFLyhMlWrDYW4
	 3J9m9LuP1/4CfuQ8bpVWx/iRsz+78tdbVAP5R0ocELwamiQyl2fToeh5fKQFkJdQSS
	 0xvkhgSgmIUNBotOi3NDxacnYFmHdHJ/oamQt/aY0aXp0zl84otDw9OTFZgAIGSEuQ
	 MZPGGvndMf/NA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F4038111CE;
	Thu, 23 Apr 2026 16:18:20 +0000 (UTC)
Subject: Re: [GIT PULL] soc: late changes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <61d255e9-84eb-460e-afc3-0405c9363524@app.fastmail.com>
References: <61d255e9-84eb-460e-afc3-0405c9363524@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <61d255e9-84eb-460e-afc3-0405c9363524@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-late-7.1
X-PR-Tracked-Commit-Id: dd5dc1917473f398949b95f6b77c60d4d8eb1d97
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 507bd4b66c85d5b65696150cc16d31ac0b2ab151
Message-Id: <177696109949.655676.11999537219261091094.pr-tracker-bot@kernel.org>
Date: Thu, 23 Apr 2026 16:18:19 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_091859_412578_A1EA55B3 
X-CRM114-Status: UNSURE (   4.32  )
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

The pull request you sent on Thu, 23 Apr 2026 14:00:43 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-late-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/507bd4b66c85d5b65696150cc16d31ac0b2ab151

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

