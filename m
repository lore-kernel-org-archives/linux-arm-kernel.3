Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CE060A2613
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fzw84ReJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z7svluBK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bmCDsyneSFB1Q1Y+EnwxKUfQ2U+xJgsnpcG8682RRn4=; b=fzw84ReJ+BJbEAlMZ/jUwzGACc
	KzhwzM0GX+jdHEmd/ZcV5rAkZlyyjDJ9dJ/LD9ZGRvvZIfR3hrN4BtbQwxGck8oXXSQjUDEcgHHgN
	q2UgJYDL3HHu0xOQJVC8YfeGee0cYpW3uIovKTzgmk1rIQGje/d4oXEeH7kI7SlavZM0Rz+WENSvr
	S6kAtaVO7md9P9VRNpg96PmE5FqKBi+sTSdom71aup7CL+DH9BzotiY1/ywJFwsjPNJadzxbvVbT8
	rJvo0Olgq9G7RFBZ5NR2+pF/iPG3yyOAFyU56azTL3dPMos3B+g3nKlnBxvvnaDQ6cGd5Jhz3hKlO
	hJ5fAjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZG-0000000Ehjq-39NN;
	Thu, 22 Oct 2026 18:31:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZA-0000000EhiS-16In
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70990602CC;
	Thu, 22 Oct 2026 18:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448691F031E2;
	Thu, 22 Oct 2026 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693863;
	bh=bmCDsyneSFB1Q1Y+EnwxKUfQ2U+xJgsnpcG8682RRn4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Z7svluBKFVbdvUc+15UIfe5doLBefPJczEQ1mEk2CWeDUj3CINkfqnztU2x2O/Wjt
	 gtUgzl1xs1eKO2LjppVzcu4TpeM2fVlNQjHe/9KcnC3qOtZCuq1pEM/tLxi5jjlqny
	 VMre8HbedR1IbdJoBAk2HI1y/bYkHwmsuz3eXImKxhcH7xHQeoMfOqxZIBxNaU1HYa
	 B3mzlnESA+02UgLm3MkwclmiNQgijyw2ouSyOTGb2R9WsdU1KXlKhxqBIXuzIfpfTL
	 p1AULBbtFCfRWPKWgdxuAXsmLCIyXEwJZfoMuL1UcLbsj6ND1sGH+ZHz8asRKGbmzE
	 hgj+NBrGfV0yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A493380822E;
	Thu, 22 Oct 2026 18:31:03 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <ad9ad328-9f10-4a62-a698-139cb8b6b1a5@app.fastmail.com>
References: <6c776ba1-f114-44c3-96ee-938dcd7ac82d@app.fastmail.com> <ad9ad328-9f10-4a62-a698-139cb8b6b1a5@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ad9ad328-9f10-4a62-a698-139cb8b6b1a5@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.4
X-PR-Tracked-Commit-Id: 6db3ea21a541d34e45f3727b71575424495df44c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4e092c2be4320f06dde1206652746ce0d83540b7
Message-Id: <179269386188.87271.15608062536872321174.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:01 +0000
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

The pull request you sent on Thu, 22 Oct 2026 10:52:11 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4e092c2be4320f06dde1206652746ce0d83540b7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

