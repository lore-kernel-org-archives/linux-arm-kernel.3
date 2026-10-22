Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B6B606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=satJHT8N;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QKKJcfXC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rp9LYTtMZB4juqGaag+zhPciOxxBTLZDtNH3dChyOg8=; b=satJHT8Noco4Lo0z5ppnk8d/i+
	fDzLVDbP9qU6LoDg4z9OcWGlvXCt+ctX51amLdmlRyQpA0zSK+bFGVW4Y3vNJh3vuOgI828JQWyNS
	iwFZxSM9DlFifPJieVbWlMe6z5WmirNPG3D6w9lQ55N1meLfMUb2k6ZSkvC/eQhar271f6SJmdww7
	+VisqVWCiOHZqnRp9lCmcrxKwjCT1u0Qprh1l062iiRhFcsUPxpyrfETaqjWFdEGqEJihdPEhtfGJ
	Qb3MtoxuUA+4P1ml8Sbul1yr6Q1nDN/Xwzn4orOUQD6LvC5ZSTvnDKUb8PYmo933LFc/T3rGLDv55
	mGF+cWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZ8-0000000Ehhx-1NNM;
	Thu, 22 Oct 2026 18:31:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZ7-0000000Ehhq-1fP3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 64684411F2;
	Thu, 22 Oct 2026 18:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486071F031E0;
	Thu, 22 Oct 2026 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693860;
	bh=rp9LYTtMZB4juqGaag+zhPciOxxBTLZDtNH3dChyOg8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QKKJcfXCFWM9giBQ1pqPvL5f8vi/cRzK+5lnOfw0FtlST0SCWZZUJbOGHmUak/Eze
	 +pAZMr7gpRnt66304ClAj+xk5SM8Bqe534MFjFVY1RKfbkbL3FrhQUpsn2psg/wYZ/
	 EkFIfLnNSx76toXXwQbW0uQPl7XQRB4cQBt3SgOnaBAf75lLyKs/NMEZPMgMEvucvr
	 gG+Xg20Sc7GVzBWOsrLU6IYreyXbPFLdiF2UComdRAAl6BmqZKnR/mWDAqzvhr4gV4
	 Fs/teS206ixQjK630+rOHNmbYBKtR3c6hI9WOASyXmP3ZibsqpzOkNjsaZxWwWOdto
	 5j9UxNY100d1A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ECCBA380822E;
	Thu, 22 Oct 2026 18:30:59 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 7.4 
From: pr-tracker-bot@kernel.org
In-Reply-To: <417575f9-464e-4966-b051-5ecb122bcb10@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com> <417575f9-464e-4966-b051-5ecb122bcb10@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <417575f9-464e-4966-b051-5ecb122bcb10@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.4
X-PR-Tracked-Commit-Id: 15644868ad522eac914d368fd08c340051f1076c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7b9a0e857b427cdda5a08b662dbea7321e6bb470
Message-Id: <179269385870.87271.867381443730942294.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:30:58 +0000
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

The pull request you sent on Thu, 22 Oct 2026 10:50:39 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7b9a0e857b427cdda5a08b662dbea7321e6bb470

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

