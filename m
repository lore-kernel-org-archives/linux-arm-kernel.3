Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A79C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9xxmlQ5OirnKDnUcb/sodn6X6Ht/IT9AvPaOVIy9X8=; b=3CGGXklmjHr89OeaRe0utE3bGn
	KG3O0B7p3gQEJX974FwTWSx+6CUUrk9csl8hFxbIT/OXY841n9p2yXBrj9z7/HWKZkp5UR+sVQJy5
	Ccaq9aQsBEt9EjkcUAv6SfMsU2yTB5YcunYfpJRjharHb+of6SwRJQ6GSjIobBr+7orbtDF4QP65J
	k7jiNt3H8YGmnYT0FczncqLbmBRMoYEdPNXFvPDX1xZ6ME/n8VH+sltDWBmZN6tkXzj4EcUw1QExw
	5gHA+s61uOlo9P/T91MGJVtHB+QanilAAS4kwfTAtg6kqQffRxKAXX9kvIKpEAvlUGXV28kqahNIC
	6VmJhoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGvJ-0000000G1sm-2mPs;
	Wed, 14 May 2025 18:33:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFF7o-0000000FmJ0-0bHA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 16:38:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 235C0A4DF47;
	Wed, 14 May 2025 16:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDBDC4CEE3;
	Wed, 14 May 2025 16:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747240710;
	bh=bzbDzI4Ez8wa1Uh1GkwX2f0BYckJ+tBjU0J9J8XVnqo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=h7cZzGoaqjPpJdyg15oYzhuZ2x8bT9ukTM3eWexgL59cNwzjAn/koIZduJL8epF++
	 E5mJ1q6Qa+Y3i0C/KJU2yrKwPcrisjqyhyLMK/TPjRDPg1FlBvsdeCimSr8xpObAJL
	 PUTrtBmWE39sdId4lL/Y8SzPdgDVH3Yk5MmOAI7aeOhDgW+6kouq5JHDFmSo2C2rwK
	 0lnxnpU3gPz3dTnjrfHnnh0cT8r1Ms8KxlrRrp5VklSCiBW0c+UxnchHrNICb577HK
	 NYSqzesr+IjG33WLNqfb7cM8DAOfSgqe1mlf8iWyAV90ND8wnnoAtp8PKMj/DIBBu4
	 hR39vEmvfCz3A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 39AB7380AA66;
	Wed, 14 May 2025 16:39:09 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.15, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <660e30e8-7ae7-4a55-a136-9b0aa4e5ad0b@app.fastmail.com>
References: <660e30e8-7ae7-4a55-a136-9b0aa4e5ad0b@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <660e30e8-7ae7-4a55-a136-9b0aa4e5ad0b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-2
X-PR-Tracked-Commit-Id: 15eaaa71e8ef142b122942b35653d513cfb90050
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 00f281fd9d8ddc1a83d3b188c087edac2116a089
Message-Id: <174724074813.2432206.562898073472288541.pr-tracker-bot@kernel.org>
Date: Wed, 14 May 2025 16:39:08 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_093832_252869_CEE15E0E 
X-CRM114-Status: UNSURE (   4.91  )
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

The pull request you sent on Wed, 14 May 2025 10:07:54 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/00f281fd9d8ddc1a83d3b188c087edac2116a089

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

