Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0E5D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfeJcxANJRnfDRQP2gfnjPkmqmJjm2ATUVCiJX2uCRU=; b=K+pKeSbXtRR93xNIxzqtMbvsce
	xV5ioqj6x7WMgWr7zZ3i7OEZ68Jgs0o7yESNN32fPtzwYnWIT3UvG/Jh05EzRysB8D6HM+ZnNuI9P
	v16FLH6KKEiB+fxlBU4FY+bY+nndW1JlRnbnUVAe+zd1fyfWGZHSvnsxXB3JXWyxknGgZKFR/0OHv
	G1SAfxPHnUxvBNlmD9TNTd/FLQtufLPk04aN1Y8ukOI/UObXT/Ha6f6B5tMhaWn87z2arUd8I+qG1
	yY/IwF3kMvxOFd89M5/UYW9a41BrW6V4kOzmy841lWqCJHDPDDmnWMxu1SRCMvcZ1TgbJONd8BVlC
	r8Pgpiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2jG-00000000klr-2Uqw;
	Fri, 28 Nov 2025 17:57:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP2jF-00000000kli-0TBG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF52E60125;
	Fri, 28 Nov 2025 17:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99238C4CEF1;
	Fri, 28 Nov 2025 17:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764352675;
	bh=yLKBDVQz5qy/7gmxL+wwgZ1RmUpIq9LWzyMdL9CnmhI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Ktpk+MBl6NHVkew7ZGwk/aHdmfI0q/JPaEXSqUl1YyhiD4awLTFtgwMfchZgTbE+b
	 hkh/wu+YgcPlSqpKds4SgUtspg5wU0UKtzsXnI6ggji8aMNF30vF0VPwWumbUejv9I
	 AGFvKqSgaGAXA5hdGhmtnwzsL+UbAlRmaF0BqvNZNPqxASJaswfNQhSYHbiDxIFksp
	 XEebvYrnvyMMu2ds89c72HyOe9CS19CJhSl+m1EJySjHL5nGZ/HZuhsTzgbpRZWoXS
	 1uXWQ2LmyEuSqTus6Mb7Ur8R2RBbQy6RMwIwSTWnTBDGGKesMoJbELWw54lnWv9cWO
	 nhjuhTtIfXreA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5BE53806929;
	Fri, 28 Nov 2025 17:54:58 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox fixes for v6.18-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY2GeWHWeASzemit8XvgvHg=Cse+46CqF3KJfsBXNPEBAw@mail.gmail.com>
References: <CABb+yY2GeWHWeASzemit8XvgvHg=Cse+46CqF3KJfsBXNPEBAw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CABb+yY2GeWHWeASzemit8XvgvHg=Cse+46CqF3KJfsBXNPEBAw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-fixes-v6.18-rc7
X-PR-Tracked-Commit-Id: e3cee98f2fcc2234be7813c0e55a7f7a5e77aaf2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 24a84ea4eef6ec6245e1efdc64764d60d17321bb
Message-Id: <176435249732.746710.14306784406816038162.pr-tracker-bot@kernel.org>
Date: Fri, 28 Nov 2025 17:54:57 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, johan@kernel.org, jamie.iles@oss.qualcomm.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, "jason-jh.lin" <jason-jh.lin@mediatek.com>, vulab@iscas.ac.cn, Beleswar Prasad Padhi <b-padhi@ti.com>
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

The pull request you sent on Fri, 28 Nov 2025 09:58:47 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-fixes-v6.18-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/24a84ea4eef6ec6245e1efdc64764d60d17321bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

