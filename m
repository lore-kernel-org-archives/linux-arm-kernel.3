Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73FBC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=poPEFQSHLBGfNWSKJ1dTmtOLssR5duFQKMx1eGC6Pk8=; b=rQamxiaUJR8oRwuXTkxQg6f2lF
	n0B32lJjfFeK4ECOa/nmljDLKoMMQ7RpB2bBiI7EYGWu5MX5lwL+RCgZ6hHTfszk/9PXPbg5k1BVl
	/GWMRDxPxO+aBa2CuBVL1C0xBuSucexRCu6csgS9CiXJHmpCoKwlT57sJ370f346E2zTWk4rl0GsC
	+4g+IJnJ6JfU9VSmJEdIH6THLmDtmvEtvi1OxrMlpWE/DhMvLzlFA9dlE9be/6jlIufOxJdWfSDXE
	tvmZdqMwNbb0VWVlMha4wDup4JTXAVF5UPDizOvYahA/RBBakKMxi5McyjnJO1nzyvYcUEWN55F52
	K38NnFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC00h-00000008DxL-3RT8;
	Mon, 05 May 2025 17:53:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzfS-00000008A8I-2Zk9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 17:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D15E5C4732;
	Mon,  5 May 2025 17:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7CDC4CEE4;
	Mon,  5 May 2025 17:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746466309;
	bh=37EBSYnJhSDNKR5eA/742Vcx7GlwTRaQ5a+NTfpjbbw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Qu2rzynJsq8EoygY2OMTrZIRkSMtIMrCHk2u8hghIwmWltlOSwny00YpotNWTMoUq
	 U1LvuMZEHL0j0vTFh6QUlba2pu4LC4tsY51GHZKFcXC9hvsDKIt8NY6u2dynvUzQwt
	 KCwvaVaWunYvkq/H/X5+2ee/yzwg80uv3r5mqOgLNys5ePI4zW0rmxSTyxRfLC1WID
	 058woiP8Ca7DkMz8YGDvcz7yOWWxhBjIM861Zdonnw/8Kaei03sNZ5kCAstamM5jl1
	 MBW5cMKLaDybT9NgpBQqgudzk2SsflX4noj+J29INzMQNuuHnxd+unNkk/h3VxyhMO
	 eUGvxeNBHKKQA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0C139D60BC;
	Mon,  5 May 2025 17:32:29 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <a080c802-52fb-4601-8178-990494c87e5c@app.fastmail.com>
References: <a080c802-52fb-4601-8178-990494c87e5c@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <a080c802-52fb-4601-8178-990494c87e5c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15
X-PR-Tracked-Commit-Id: 2ef5c66cba6171feab05e62e1b22df970b238544
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b26feb436d2ef5db1e8ba82c7ecb4c1cc869502
Message-Id: <174646634824.836049.8124169295654735620.pr-tracker-bot@kernel.org>
Date: Mon, 05 May 2025 17:32:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_103150_697925_C277A82B 
X-CRM114-Status: UNSURE (   4.91  )
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

The pull request you sent on Mon, 05 May 2025 10:03:30 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b26feb436d2ef5db1e8ba82c7ecb4c1cc869502

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

