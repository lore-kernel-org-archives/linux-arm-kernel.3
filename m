Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D88AC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naF8pKOfujhMhhO41mHqkDpYPdNhuSPDUjzdPMoSMEg=; b=WfI1AUCZOGYdrkxumCL7cQ2usw
	kimY9nrPRZHHHF3Wu2hnTVVZ7pbmTF5Z7rqD7v1ahTTPpgAhooxaRlXlxT1+UyHZDv+U23BWzB5FJ
	AR3FCIeHJA4PHCSQM4qoeZdnwuDV1ZnGmvoGbWHp/gkpMbKDpdjieqjguLNPHNsKK7HqiAmPVkZjk
	CvChPZbr+PS7Shy6TlHO+NpX0h3Sw4i5QVbCL7418AQRbLHTHy2jCG/+X0nHLwdYTmRRy9nNgPwUJ
	2pUoxxJ7f3KUZycQla6tTw3O4CVg4yq9qp/S2rYEXdMASyWf/GwNgYwlQMWVS8XaJ52dpegBwpDAW
	nZITEnjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpMb-0000000HUJk-1lyP;
	Tue, 29 Jul 2025 18:47:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpFI-0000000HTIb-2Iqm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 18:40:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EEEF66020C;
	Tue, 29 Jul 2025 18:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF97FC4CEEF;
	Tue, 29 Jul 2025 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753814415;
	bh=mmOwwVRBi8fDFzqmJj9zEcGDFG8iThDID9GPpqWiE3M=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=I/e3w5gW7Pt9juPHNhu4oQ7B+W67lMtSMyUf427YDLwH01qssGgar4RchmtVEZhNa
	 XxhiSrt+I8BsNNBVinkIr96j/xyEP9Z9fg2pr1KrFU17zQPpoLZnRsp0ueMPRPfmLQ
	 U2Yt/KqescHBMVL7b1ivIeArlkuiY/RD1/AjBgFHdwNpdgUgI/0RHabrjlnfRYXale
	 EI2BjBUMMDyLVc5nmqCkk8jPvtCbvYVFzxohU+iH4wlci9mREEa50osNGjCFDCqAV3
	 diYM3CHhAqXIub6AeO8Q7JT1SCaCEwxLtL+bLUWs3xHCBWQVJTcVD3J0EBKfyLaz8S
	 Z09r6gx9Taz/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5830A383BF61;
	Tue, 29 Jul 2025 18:40:33 +0000 (UTC)
Subject: Re: [GIT PULL 0/5] soc: new SoC support for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <66ad07fe-3aa5-496c-8c5b-1b7ed18eb056@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com> <66ad07fe-3aa5-496c-8c5b-1b7ed18eb056@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <66ad07fe-3aa5-496c-8c5b-1b7ed18eb056@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.17
X-PR-Tracked-Commit-Id: 05a623030b3cc2250755e4d4d6b1440a03aed674
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4df9c0a2465a523e399e46a8d3b5866c769b381b
Message-Id: <175381443204.1585410.9078207862165751472.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 18:40:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Sat, 26 Jul 2025 12:31:12 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4df9c0a2465a523e399e46a8d3b5866c769b381b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

