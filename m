Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C726C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 23:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYqamsTMcHGNY5FmFDZpVUFfeKj1Rn7AZX0R4PdyAYI=; b=zbrJsKXqMm2p4GHaJi92UxaJhF
	sPST8mzODZ+HJRCBw7Ve86wgOs4CT6p3avoRE/VRmQqoCJE3eeFUhfM16XB5XZGhfFCe4+26i8N9t
	cSqB7cA7ZYvMSeM+/SZK+tafDHPtW9L9rFmO0uvTMeFH4/yXI1YqoGGapextzAaUUQxd0D94LsSVr
	AzkLJ5ai6hbi2VS/b4vVjYOWAyuvSma1xZEhO8jfb0i6vZRujVRZQWZwPIPzJQEgZkEgkYQoeQPGY
	VMUMjbHVUsuGkcPEpfqhDo8BbQH34qryi7nb6umI8MqzmmKUX5HM3/ISy/aRY1r8nsuo9KEgPB/r3
	x9xEmj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbStT-0000000FgqT-3Ubp;
	Fri, 24 Jan 2025 23:15:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSoR-0000000FgEP-1k0B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 23:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7BF95C57E1;
	Fri, 24 Jan 2025 23:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F3FC4CED2;
	Fri, 24 Jan 2025 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760206;
	bh=BIdeLtKrLRzGwo55g51dujzaGmw+3Or8JCQLb0x2AA4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Rq4yRq/I/nq5GosbDOgFBQVjDEOcOg2m3X/u/0+FwLvzehq8E0GZUFoVsXLnB2U0p
	 yXgiFJhDXaIxegp4To+G3igyPm2P1DiTGt2Ms+wsaq4xmZuitOz2N3AaMAMedgYPV1
	 8s42VGoOuFsY1MTNfVt/edOWvaJ6CCvszFhmqIrZwa0Kjk/lwUAvmnkPGDuuglkLbj
	 UTo4je9YKZZ9f6MBG3f25SMbEg6rcROcGrFA0lHsNCn++pZ8MK+JwTTDqzWX6n8FlP
	 dNOJRLzKVbXE9QgDCCtAaUCMBNRDdOePhiELKCKYWtr7vYCcJCNveRa/4xIH/qYTT7
	 x0JPAPv99/Vig==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEA0380AA79;
	Fri, 24 Jan 2025 23:10:32 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] soc: driver updates for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <d968434a-4b23-4b81-8610-6588590e9da1@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <d968434a-4b23-4b81-8610-6588590e9da1@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <d968434a-4b23-4b81-8610-6588590e9da1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.14
X-PR-Tracked-Commit-Id: 9ec80025030b0492512e01e2e667f4111c583b46
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f2ad904e923f70a80f478febf001f88dfd65a64c
Message-Id: <173776023157.2196000.2578971423206596128.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:31 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_151007_494453_C2CD7C79 
X-CRM114-Status: UNSURE (   4.57  )
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

The pull request you sent on Fri, 24 Jan 2025 16:08:27 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f2ad904e923f70a80f478febf001f88dfd65a64c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

