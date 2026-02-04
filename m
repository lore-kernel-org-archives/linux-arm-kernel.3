Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB2DE9D416
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 16:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mlBJORZY2xOR7CaV0u9N8o/gRsP5/zuT+mum4H3/38=; b=2NQFYiwKRgR82D+dP6w+VGP/eP
	ouAeG6Sn7FqnnSBFpe5vudjwVgoEz4TsDT6KHMDP9gFZbetRf+YQyNXaZc2ms7rMXlw6RtKIkaqc5
	IgBT2P6RIVo0a4mZ7BYIbAHZuz0YCfIX/dQ+YY3bfOlG3w+4U2Rko0SznhUc4PAwHtpIUCFWgqHOZ
	aDC+zOzglKuQl2RvdBODw7117tsU1PwnMoB0Ux8mYZ4FVHBQmC7aEOC6wc0Kx4ujAuepMSMk3c3nj
	iAw+2Rp/fNgnCzcTdwVZ2MwufaL2qm9g/Gb+mHreTIfGgUwtBuSMexoOTNzqt3fY1mH2eaiF13Dia
	lN7ITCAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vng8v-00000008nuN-2Fvf;
	Wed, 04 Feb 2026 16:54:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vng8s-00000008nu1-0dX0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 16:54:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAAD04404A;
	Wed,  4 Feb 2026 16:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27B6C4CEF7;
	Wed,  4 Feb 2026 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770224052;
	bh=7lo8w3BgNZyWjoPQvvRONpecpYL0Do1rMcsACXc+z7E=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aW2xBkn5bxdEkl0O9OObKpU56tzY6gJGDoK41vbBPLWI4QBqt3KVwcRTaNyfMEWxk
	 woNvmnPcMa9hdjrlXm7G1IVNY9AlsaKnoXD+mbcNovWRC0bTjsV+kiafzsXyf8gHgI
	 0TcmAsbBI1hOo+iaHJ1TUwwZVrUwoIEhNnqcQxe+tdUitBvFMZcalc1xeG64hY2lJf
	 azqqUt/5CodAArl8yCBqtbDt9pyucfc0wbkdLvebqkjUkTwCBqWLstObDeVNA2lDLM
	 THLN+fzVbCRthDSRAp7nxDeZAtsFb7rwjEuiLr396sSimqzQDvJuO6g8j/pVfTSwpf
	 92cZE8JimmJVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CE2373808200;
	Wed,  4 Feb 2026 16:54:09 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.19, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
References: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d9748b0a-1b06-4d7e-93b0-3ceb96784fc1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-3
X-PR-Tracked-Commit-Id: c3cb2722e28969650c58d6defb09d57339a2a223
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a14980444f418de53a7cc315eb4fbd8a89c72991
Message-Id: <177022404834.2820859.14650392233570791827.pr-tracker-bot@kernel.org>
Date: Wed, 04 Feb 2026 16:54:08 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_085414_210612_7F396862 
X-CRM114-Status: UNSURE (   4.99  )
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

The pull request you sent on Wed, 04 Feb 2026 13:17:21 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.19-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a14980444f418de53a7cc315eb4fbd8a89c72991

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

