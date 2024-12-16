Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD9AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lk1mQ1ngp58122ln25dnnSSBlXl2Me6PKDdhR4GYzsc=; b=g8SRtmCk/XYuR8gTPm1n630VvL
	VcnWCt0cl6xstjKLrQpQspniZMjgg18wZk5gOFbRLORfCNRCpvyEXh5PCrEngDTdJjnIU3+yjJzbp
	UOm0j+vK8gatroU0+95SkP8bCJCNF0X0Zs+8iiZG3DfU2NSJUsG1/WSPNXTOp2QH0uHCdQdKwmaBQ
	cYCwBT1c4Wltv+B8G0ejTwMFwwQpUe2RGgA4RpfQ+R0c7ATw/FjNQWEI0hmo7vqvcLJxEraywd15S
	SwZac2YOxrDwFGPtdHG+DIcFBgS+dt5Q/7rx6u29+scORi2EByBcRStwUkqQz90ANXSM3Qxo5nLJh
	+HOcpoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIYu-0000000BQXi-2Wx5;
	Mon, 16 Dec 2024 21:23:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIXo-0000000BQG9-1qGk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 21:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25343A41AC5;
	Mon, 16 Dec 2024 21:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E52C4CED0;
	Mon, 16 Dec 2024 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734384142;
	bh=BtD+KDsatqmbrAO+cP/aGgEByIZp7auYPo+Z2NoC1nc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LSHeJLguUnyTDHHxBh8dBeR6rNOFIkTHpWaZP2yxd+7xPemSSR4G+Sn/QlgA7nv2c
	 HHvWeq8yE/vgGU/V4lhjUeh9Fo25wn1f87YMvjeh8yzTob+vmcdpun/3TOTMVr/fUM
	 kOe4F+HmgNISEmr7ThEZsC0gd0KOXU0Nu7c5/bVEC4PNHY+X5tMj5WBITKd9p+kCwX
	 YhUAWiUn6gFzBZsyikyMlj2ngw0wxfgyf7D5+Xwq1k0e4cgyjyrwz8N22PsJEnXBBZ
	 U0W2wuOCYiifNpOxoRpBxbkS4PlhTXGLMGXnrRk55t2TOvvzI+wsAyM6UNDARC+yU5
	 e6SO4O5ddjz+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC6893806656;
	Mon, 16 Dec 2024 21:22:40 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <cccdf954-3374-414c-81fb-658df16325fc@app.fastmail.com>
References: <cccdf954-3374-414c-81fb-658df16325fc@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <cccdf954-3374-414c-81fb-658df16325fc@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13
X-PR-Tracked-Commit-Id: f578281000c50cae991c40e1f68b2fc0b1b9e60e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f44d154d6e3d633d4c49a5d6aed8a0e4684ae25e
Message-Id: <173438415948.354515.11626612676903026198.pr-tracker-bot@kernel.org>
Date: Mon, 16 Dec 2024 21:22:39 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_132224_543934_8AF4BF8B 
X-CRM114-Status: UNSURE (   4.25  )
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

The pull request you sent on Mon, 16 Dec 2024 17:21:06 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f44d154d6e3d633d4c49a5d6aed8a0e4684ae25e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

