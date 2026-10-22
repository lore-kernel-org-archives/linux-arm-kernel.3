Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BE1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fj2quG22;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fOvnTlYY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EHFCa0ldhEsycNZ0Rgr5ixDYvOQCY4C+G0NWVzg4/rk=; b=Fj2quG227QjyMCaqyPDKYQMnG6
	Xklufc0NgYiBnTPqUz/v9YglaXzIzOnbjWfa1k0PfP8iBFCyy9HvlRHXbGmpdiyqGVVajKeYhlB2S
	7y7WgTbSRuJVycmC2HRGdpnQ54T7p9znpXleQVEI5zMPVD5m2Xp0Y9xdjmjjftdpYvI2WthWwK7rG
	+SkLlEWVK3YlaLl51sU3oCUl90byJXo/wxqoWBirQECB0+CMLAyz9xozCpPnZupkpaOVKQyPmK+3a
	r+eNgSfCAxslOSOdvOzTdMpbspDdiVpEvO3heD7QT9vyazrbcd02FeMY1K//q2AFW1Jpk2fSOOdqM
	Bj5dEa8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZH-0000000EhkC-0hN6;
	Thu, 22 Oct 2026 18:31:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZB-0000000EhiZ-2XIw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F358960A53;
	Thu, 22 Oct 2026 18:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84221F031E2;
	Thu, 22 Oct 2026 18:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693864;
	bh=EHFCa0ldhEsycNZ0Rgr5ixDYvOQCY4C+G0NWVzg4/rk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=fOvnTlYYn55hll1L9Gr7KZg61MsC9JmYisaoXP51fv/cvCkskqixPR6X66LTZbbp0
	 WTFKDdI6EwfiJLotFyIN3L9YR8Ud1uYR8JbOE36tCNsLhEyfvuGweQiwMlqPVCSM+m
	 3HvD1pkxUIYDZqfp6H7zlNK1+/dbOeBFGIARP9S4HI3venKfNDk7tXex+5hBYtklhH
	 3k4xsDrkG0LL8haBe3TkUMMSe49bgREDTrcKScWX7mopUtuGkacDowYdlr0t2LMzeo
	 PyIzMriYyz30LofHI12sjM8o4aJl/2IpjX8f63QouKQo4B1TRhSDHLhPkQ9nwREUlt
	 otjA3FB3daSZg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BE6163808222;
	Thu, 22 Oct 2026 18:31:04 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: arm board file changes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <b5df3f05-41ba-4d46-818b-776067467f14@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com> <b5df3f05-41ba-4d46-818b-776067467f14@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <b5df3f05-41ba-4d46-818b-776067467f14@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.4
X-PR-Tracked-Commit-Id: cfe69169c03e71e2a22870317ef4cffb51f6f06d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aad73b807cd1a5bff9c5277e8a42e75bbdc8adab
Message-Id: <179269386359.87271.16249924434915066293.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:03 +0000
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

The pull request you sent on Thu, 22 Oct 2026 10:52:57 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aad73b807cd1a5bff9c5277e8a42e75bbdc8adab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

