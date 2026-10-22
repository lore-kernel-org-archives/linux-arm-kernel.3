Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF460A2617
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ndZDJL55;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdLYAn4c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4MVFPG77efEuUosYVbWjoLZ15gxtGuDgaawKIFeyJUs=; b=ndZDJL55YZEShmytk7mF3YewSG
	5UgyK306j1UfuvCzbPsZHb6mb6V54xAhxkTbCKJStLFDiGqlUr7szwP/DB464fT1ELER5LMt/d4Un
	JYQT2mOc4b8SJshgD7q412syPl2GOtjD5xQ7UvBQWe8/nX4NBNU8Sv5GGKRbgtOadDer9cU63MpdC
	WfBlV0GIARHXtW+2yQCYHzSZECRFQU6OgCyJRAx/N92WzzX0HbP/6aehY9MlXrx8p/+NowOZPdG7j
	rgrf5hlmCnNKzVoOZLKb6N9IomOBH5x3Yny2RXnUEGADc22vtzQcKCJJDkPf65nQWsaBfHkUXeWpn
	q0hDmz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZG-0000000EhjW-2Giz;
	Thu, 22 Oct 2026 18:31:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZ8-0000000Ehhw-30Hj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C43B160211;
	Thu, 22 Oct 2026 18:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990121F031E2;
	Thu, 22 Oct 2026 18:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693861;
	bh=4MVFPG77efEuUosYVbWjoLZ15gxtGuDgaawKIFeyJUs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fdLYAn4cONUgTs6pjw69eIQKGsfydeEJRTo/QBCCqp7FOK3UQipj6C9iPWaxYmt4I
	 Gl/dcww5O3yeOEZwJufEG7svsGFycHqdLaaam665vUYwhBRx4fSzmtQEu8Q6Efdc2u
	 8CL0LGN+eHaVQmqRS3VJn9J6Twq+t0NXOzLxBuRxyxMJCem4gO+ua34iPvVUyCU2ty
	 Gvir2bQFOVrPlDkxEiuPUL+XfjORY/+nKkn79F5nIYwpj736zUgg1LCK+mYxYFzhQD
	 1O7pV35K20PfzGQh8zDHggZLULi/5N1l0mo0OffNGbxL3MQOJx+boaRKsKWZ3TPe0n
	 dbu1W60rKruFQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 814A53808222;
	Thu, 22 Oct 2026 18:31:01 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: driver updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <f13c8cce-0c6e-44a1-96de-2c834d61900b@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com> <f13c8cce-0c6e-44a1-96de-2c834d61900b@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <f13c8cce-0c6e-44a1-96de-2c834d61900b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.4
X-PR-Tracked-Commit-Id: 0045cd6b8ab2319e9d8de46e5e329cdc35ce6d05
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2e51c645fee243dbcb5cee3eb063b5713317444c
Message-Id: <179269386032.87271.2135463394048502814.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:00 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

The pull request you sent on Thu, 22 Oct 2026 10:51:33 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2e51c645fee243dbcb5cee3eb063b5713317444c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

