Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D46BC5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 02:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV+IwPbNSdjQh2V2r1dLNI2xIYGbED5IkX048TdMAF4=; b=PFLKoGaNu5fgB6F3QnPda6wYsX
	jsb/OMA4MfEbG59q7YHwCiSGQWqV6O0XoFwPBO7G2pvhB6riRJbYNcjs6Ey9mxoJh4IIrtfGpHBbu
	lwXtndAsdhf+g9PPJZD8HxRh0ZDRjA4OwxUVsyE2NKyubcXhm0kqUIorKcFXORLUJRHG0aYAGKgkS
	li8MOcUm9vTMatHzeLMS5Qk8pZSIk0vzFVZKdnpTnmryYdzkzbNW4CAZ3EMduzQnrMXIcoDr4uHLo
	c9+GDANIOz6GbJ20kLA3aqnE/zN3BjEkWOFij9SUf/PNAxaIi7vwj8FYc69KjckkPr+zvEyjmFsIU
	P+yW5pWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWWB-00000008urp-0E2h;
	Wed, 19 Aug 2026 02:59:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWWA-00000008urj-2iTq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 02:59:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89E1643EF0;
	Wed, 19 Aug 2026 02:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E31B1F000E9;
	Wed, 19 Aug 2026 02:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108345;
	bh=bV+IwPbNSdjQh2V2r1dLNI2xIYGbED5IkX048TdMAF4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HkOC7+MYaCL9pPOif8t8pFwHcYw2nCp8qiOa2k7vJ1/vmMnjn0GPm2UYO3H32/BKo
	 kbgv40D3mmqQVSBcc2lCH+YwN5iECmpBm6CkurY2rVTuZSawMO7Y3aU6aimNTJL8KF
	 uZjO7ezBLJO0ymqlsy8hMzwlqZIo15ZaS1QGqW0LgimNUV2hwj2UQihI10DnZsXvI5
	 B1PKNrq87PnGqnSZLCBDpMUXQuHWDizYmXbDXFssFYquDIR7ivTZEtEugGBBD6qNXg
	 DJH+SqVE09c00dLP4CJ6ba8K8dcxSXliEfan7N8UTCw0s4EHHRFXYklnN16rXYCLly
	 xggnRV8ZytCEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F082C392706C;
	Wed, 19 Aug 2026 02:58:17 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <65b2fd96-9f44-407a-84f6-b42db271c3de@app.fastmail.com>
References: <65b2fd96-9f44-407a-84f6-b42db271c3de@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <65b2fd96-9f44-407a-84f6-b42db271c3de@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.3
X-PR-Tracked-Commit-Id: dfda289ad743d037f33f9e3796e3fd40ca23374c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cbe8aadf1551f3f4a853f24b3b96d9f0eea49c53
Message-Id: <178710829666.2816674.3279445762266943795.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:16 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Tue, 18 Aug 2026 23:16:37 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cbe8aadf1551f3f4a853f24b3b96d9f0eea49c53

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

