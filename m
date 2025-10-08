Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2DCCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 18:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLGGmvlQoNJ8/DxAeip1zwGYM3vx5QAjHiYQxI2aCYE=; b=qb6uwKenFLBb7ARUlhhDHmK8tj
	lW+eoHV5EYeSnlTG9STgd4ASwqqIhVeuQNKIh4IG0a2Ye3Znw0/tjc2WvXTIPntPj6R2zX5i0ya1q
	ZQ2V9lnhEEImMBYw2xGlv8g74U4X/CUMi6Ac1PxAsdyj4kJsMnwtCCqDauuw1PADw2bN65sOYiFcz
	5UYi6JD/BpxSpau34xGRzccznyH/iUV66IjiKlik0YpjA8jRvuQr3pddVqbKPferhnS74LD0AU9c5
	Hb7zjlXdsw+TJmMyjwryZP+a81nlW7LfddKtnq0ipdYkTL/kTxmQCMGrb9GpfQSXdwydVqvcJfx84
	dcSsVLyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ZDb-00000004V1Z-2MJO;
	Wed, 08 Oct 2025 18:48:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6ZDa-00000004V17-0Fm8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 18:48:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 39A7361417;
	Wed,  8 Oct 2025 18:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE407C4CEE7;
	Wed,  8 Oct 2025 18:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759949332;
	bh=a6Xq9Ys2MHx5xqZIWq7gXyze8tFCk3/TTnm5Ky9G5xA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iC4KJXjxCyIubWntJvpVH015eKM958jf3v3j1MbRny92tn66x0diUCcBCkWFpF3UM
	 5JPt+GzoZ3krejJeGFdufkULTFZor5PW0S8pMRzp8crINDaS/0tUO72yxbgr9xdtcR
	 4IHSBY79L0wVCu0Gzl9+ZawZniFB2EotYenTYhR5D0uN2c9/HBIrVPTbyoFI3tZn17
	 FmvvaYd4M4v/DUXKMGgrMSMFUrckFdf8zhFs13rSDA6Gy9On2FiHKoDbFvUsoDajT/
	 NKH+44RBFwHEOoK3+ZU3TUYSr4es+ujx/z8+OQHuvSMlIDlJpXCSR5JloXfDJbdnQy
	 WhvCcuQzFlKDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF573A4100B;
	Wed,  8 Oct 2025 18:48:42 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY3nxSwcHs5YwWkmFq=DXoAwqGXdud7673kM32V2+Le1+w@mail.gmail.com>
References: <CABb+yY3nxSwcHs5YwWkmFq=DXoAwqGXdud7673kM32V2+Le1+w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CABb+yY3nxSwcHs5YwWkmFq=DXoAwqGXdud7673kM32V2+Le1+w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.18
X-PR-Tracked-Commit-Id: 3f39f56520374cf56872644acf9afcc618a4b674
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd5a0afbdf8033dc83786315d63f8b325bdba2fd
Message-Id: <175994932118.3563654.4461558328162731929.pr-tracker-bot@kernel.org>
Date: Wed, 08 Oct 2025 18:48:41 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

The pull request you sent on Wed, 8 Oct 2025 11:58:57 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd5a0afbdf8033dc83786315d63f8b325bdba2fd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

