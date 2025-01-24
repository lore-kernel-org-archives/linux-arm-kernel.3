Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC05C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 23:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DupTuzAdwqeszaFrm/i96LZPaVXQaR4jtNqlAc7FY1Y=; b=znE2suAl8Nqs33OJQs2uwYzSjJ
	7BNSG4dpzrLCyp9leIoQBnA/syXuQa60ODq0fV5jS/hSBVfI5bnItUDwnG6esXn1AGLPwrfdlR29X
	/Y4viTg0xcqqwEiLiE6CLRQ25BQiJWG+zqJQOqcagSmNYO3njtkq+nPVkRjD/tb2bd/YULGAgqtLx
	EZbpHiqobtlIUPnIzqMWWNa9zdQFCGPHhRI0dmbt38F8qpeoD1IIa0pRR1ZYlJKV506TnhxmOy9/5
	L2xj8/W66EFuYosmipdLW3Qnsdgl/9pCgPNzpSuVcGAn9xnnvbz0N+Rn1/ENtpPMKwZADu8CX8ZwH
	IY19yltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSuk-0000000Fgz7-2Llg;
	Fri, 24 Jan 2025 23:16:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbSoT-0000000FgF0-1Bgi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 23:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88B8B5C6218;
	Fri, 24 Jan 2025 23:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D07C4CED2;
	Fri, 24 Jan 2025 23:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737760208;
	bh=qzeVMbWdTSH3KrRvdyrA2/KRO/xdldCi2D9vpkpksxw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=apa81IbRgHYWSIWCkU4grWP0m1XRBxwo85yOlRo4mMHv2WgS7DJBqMNkayan/VKV5
	 U+tNnFjmFasA/kM2deH39zvG+fPBpWZA8Kpr0n9nyM7bxULCS8WsUdj8aZL568qQcN
	 gr56AYJojeAf7IT2ANFFWNYpqC0LovJbe5wXsGuBT4GGt21CutNN/Ac30NNcjZTI4D
	 RqYJNmHtZymjUL/VeUaW5V9GRfnAa2ypf8LtMhqRK8NzCQOB1zmATX7MwOwoJfQoOW
	 6rgjACWuGrgev43RcZ+szBABtQDZdadW7UYVuHlmWoIMU1L29l6fa/jUDTNZn77yWq
	 drnXBKaHDCy4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AFB26380AA7A;
	Fri, 24 Jan 2025 23:10:34 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] soc: defconfig updates for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <fdf46fd8-2449-4579-b85b-265c693addf8@app.fastmail.com>
References: <1f0939fd-1694-476e-954f-e58ff8650dd9@app.fastmail.com> <fdf46fd8-2449-4579-b85b-265c693addf8@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <fdf46fd8-2449-4579-b85b-265c693addf8@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.14
X-PR-Tracked-Commit-Id: 309f64469cd5d09d5f1207e57d42f2eff9bd9311
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 71088146704efcd13ab85ae00345c98526ccc87d
Message-Id: <173776023363.2196000.700620592758688434.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 23:10:33 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_151009_360252_CC3C7B58 
X-CRM114-Status: UNSURE (   4.67  )
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

The pull request you sent on Fri, 24 Jan 2025 16:08:59 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/71088146704efcd13ab85ae00345c98526ccc87d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

