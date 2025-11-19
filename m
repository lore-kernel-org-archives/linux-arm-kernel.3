Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AF3CF58C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyQpyTCqOlHNdfL5NAO51jE4kidfnQiEMiwXGnTCeXU=; b=0SgY004WiM0yuklhPd2u33f3/A
	LlMHRvzu8kdB8WYqJgcifbYlyjWRuRvPYdfH284RqoTbbdZqHVi/eGQdAgmyBD+yQ0SrBQeK7hkIt
	iWHVf3lGmtzn2LUallZvndchg3jGyVFBQroYwNIcekm3SLjhUDrwBFBsnW9ViUVSdzx717ZVwMiAB
	fWvWYR1qaXUxXjVhdlvlMBEvV/vZCwmIBs90FYD+0giZ2lYyvftgG29HD++x3/IzK7jMWT62+zdm/
	YjAIiaP8GZDSwa4ysXv8jcwGiyjxfpfsQqZzCeGb2l7lGGA/q7W+7OaTiuuBngSpA1AkLyolJCyax
	TmYDmPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm9F-00000004CEr-2SSI;
	Wed, 19 Nov 2025 17:39:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLm9E-00000004CEQ-0maW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 17:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41DD660171;
	Wed, 19 Nov 2025 17:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D79C4CEF5;
	Wed, 19 Nov 2025 17:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763573955;
	bh=Jqs07eP6UB9i87JiQEg3vKSrqXNfka2QBSOHxYmkT3U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mIMgDiB6mjFVfNNi3ix3SenJ4xZdU1S/WtuScWhlIRbh97fb04+UhGmxhrHFaElmS
	 zf37sXcE0sIJ73YRG9v+KBis98CqkUHpkZUnDKH1ZMY/FZjHfd7SDB1zcDz0OUZNMj
	 gUT02nYNqOhKGULrHX2qep5UXh45DlAT6xFzdAFFXUuVFLMuIzRho4fYM6Ql6hY1rQ
	 eo9NPLYQs8f6fkwcVBWr59t0T3QQ0tD/2xNhX1yjYnwt/32GWfBCmNY+09pPKonUzA
	 COxx79INjuutN38sKSIayadbZpBoYywEK7Bh2I4ccJK31wumc5kiVnzG09uFgdHtPS
	 FvfGLMnV5WQlQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0E439D0C22;
	Wed, 19 Nov 2025 17:38:41 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.18, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <fd25cb51-ae6b-4c03-9215-c3285f7533e0@app.fastmail.com>
References: <fd25cb51-ae6b-4c03-9215-c3285f7533e0@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <fd25cb51-ae6b-4c03-9215-c3285f7533e0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.18-3
X-PR-Tracked-Commit-Id: 7a601324ac9828468291151d220edb47a6a82449
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 23cb64fb76257309e396ea4cec8396d4a1dbae68
Message-Id: <176357392060.896813.3808811333357737123.pr-tracker-bot@kernel.org>
Date: Wed, 19 Nov 2025 17:38:40 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Wed, 19 Nov 2025 16:52:21 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.18-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/23cb64fb76257309e396ea4cec8396d4a1dbae68

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

