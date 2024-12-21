Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D464E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 23:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5m6jAFeo2oh1KidhkGFat++xkt3Ln1RadWAapj/rI4=; b=aygbpelZthQxb5xSHsF3DUDxil
	TiPKo+N8vRboUOC71U4gaytgEnwCsSlQ924xop8MElQtIzyvrAreBcYCrjUPqeasK9Ajv+vGgA+6o
	qfbmuEqI95Xbx1JuTcyB+StW7Rqb8AL86EpWd9CX1koVpRVLje3LCRPpQMZtzB29bc18RTdNqvf44
	6zKAmiIV9Z8Lp4Yf5Ni99dy2n9XXfi0kG2lSlPdc212zlfJ9aPyK/vR9IuWBpvMmiLFxx+E+9PXPb
	Fqw7cVkRezf5WQGxllgDUAMql6S8NAoSglZsf6LqIiBF5QUujVxD9vA7nLe3jvvFjwVFF1qdl4nZE
	sFErq4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP9EO-00000007Z3I-3kEV;
	Sat, 21 Dec 2024 23:50:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP9D9-00000007YvR-0ExU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Dec 2024 23:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC6C55C4821;
	Sat, 21 Dec 2024 23:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9CFC4CEDD;
	Sat, 21 Dec 2024 23:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734824921;
	bh=wmjD+hnEhQ8Zf8Qy1dbiQdFtZbeySQ9bgsTylbG5IIE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=sJOelDTWjCJSz0Bd8jjlaqpG6f0fLhfcCCCMX0CdlKJi5v0c+0l/cHzkwE0GRED/a
	 3175yj5WzbXObWegk9gZS+lQaTZ+8cKlaWA6q9YOxrCRXTiKE9v2uU3ALznqIVvYpB
	 poEPBWJwdcWy6ZYGR4YLAZd2I3Azlrl7F4WYZ2/p997cuJRHQf8LZ8UGlpDJz8f0zF
	 zS5ZfE/cIPAiSCN+7ziLnq2RUUB8wITlHF2LLvoHcAwGWRy2DXjIfIWxu3rsZEiTo+
	 jd21wMQgrhEQXdvBJOxrxiZ4MIqEUljUMGcXdZEFPENVUyO6Bp+IKFNyxL4nDEwCAk
	 MaqXD3lWtsPTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE803806656;
	Sat, 21 Dec 2024 23:49:00 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <a54c5c66-5255-4177-a616-a4f39a83d2af@app.fastmail.com>
References: <a54c5c66-5255-4177-a616-a4f39a83d2af@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <a54c5c66-5255-4177-a616-a4f39a83d2af@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-2
X-PR-Tracked-Commit-Id: a31ffd6ed5ee994e1c04dc794499a0c04618dc55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 48f506ad0b683d3e7e794efa60c5785c4fdc86fa
Message-Id: <173482493956.3244160.10724298707654952402.pr-tracker-bot@kernel.org>
Date: Sat, 21 Dec 2024 23:48:59 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_154843_197404_CCE5AC13 
X-CRM114-Status: UNSURE (   4.04  )
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

The pull request you sent on Sat, 21 Dec 2024 23:50:23 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/48f506ad0b683d3e7e794efa60c5785c4fdc86fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

