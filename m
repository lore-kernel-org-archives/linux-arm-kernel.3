Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14471D3ABD0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 02:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6y5kM693AvIjOBtheUUjCc9sNovIsANRK2IsHlga0M=; b=D3P/Qk9stmUSAH+2WKABhql3aQ
	serRBb26VjjJ3ek6M35RMwnTisghbxPFLoFn/6T8wSdCgZEQlF+7P1i9IZeUoSxkGeEBp8qIc2NKV
	EAgwUNHvzhYWddhMEbiaj/AdhY69SM4bDSckpmJhGnDkE0PYVEMVkhkzeSEqtUYP7mSXZQW7OCM35
	ZBnKWAa125M/Atu/RqhLW5z6WmE2yb+ux5iGyQiIMtCZWLUCbllQJLuFt2ay6iI3WB1PrCjQSGccT
	a4W2bC2tFE+cV/MDUN9ccqvkjJ6uWIXznyAiDACGcPDwFVN9qznfoi8kTRpKsAkTQa5jan/kZwbs3
	s+a1C0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe6-0000000ARTd-3QMZ;
	Sat, 06 Dec 2025 02:03:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe3-0000000ARTH-25Gk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 02:03:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B79460156;
	Sat,  6 Dec 2025 02:03:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505CDC116D0;
	Sat,  6 Dec 2025 02:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986613;
	bh=0+aZ3LtoSl1V89ajEyz0w2XJEnn4ctPweK0oO6yJki0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=aJ0IDzhP9Z8J+LQKBhUGJ3UXbnDFTJk2LjyVn6D9Kl45JxM7tmrMK+4C+a2hj3C80
	 8CR6+uOLrJ/TMk8rAObkUR/vhcQCMySoXygmBLVXY057BcrIdSnRRWePYDhSduEryd
	 jKrW602stZt1IDjIKiVE1LEwg89rf8fzAN+Aease2zd0Kkhp1J3Vw6aB2jhJ10rxgk
	 wKhmktl3TB1Udp1ZOFeat+HriQgsRl2dJhT85SPuBQmbVVB4AbwOcuzcVOlNGSPALm
	 /NL/3brlh0eXcCyqXrdFrDTsYbcnYa2mlTkc5mMmMTPQNRsO+jl0xATqNbmcdOOmXC
	 CbueljGZ42pcA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F28523808200;
	Sat,  6 Dec 2025 02:00:31 +0000 (UTC)
Subject: Re: [GIT PULL 2/6] soc: arm code changes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <b4048b25-c1a8-4442-8594-c604bcef9e29@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <b4048b25-c1a8-4442-8594-c604bcef9e29@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <b4048b25-c1a8-4442-8594-c604bcef9e29@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.19
X-PR-Tracked-Commit-Id: 3ce8f4a501f61edbb5cb3fe13520f09ffb33396e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 09cab48db950b6fb8c114314a20c0fd5a80cf990
Message-Id: <176498643093.1925836.1399760157687412457.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:30 +0000
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

The pull request you sent on Fri, 05 Dec 2025 19:27:20 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/09cab48db950b6fb8c114314a20c0fd5a80cf990

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

