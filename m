Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D942D12689
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 01:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehsBIfNHPLjOJcLVXzDMFphv2Uc5xID66BAxSdC3HrE=; b=HUDWNcALQezzcLqA6A8VRqLEYm
	c8fn0bsvCb/jakxzPdU6ky8fp3uKTYXXM5cwqSQdpCbUHmwFvutoS5pj6pdrEkm61IaNIPjmpk2jR
	a6FN+fh991ys9U55j0v465Y7ggTVqLvbXRi+ArwEgiyJ4BRsjpYzTg/Rl5JMCpLEVH8QrwRjoQoXT
	H4rgEhUGtNzU+GDlAOMpgVRd2IyvsJ7oIno93Rxzl9TidlMicVrtFxyH9XTKTPyBHPm6zMhzIyNJj
	vcY8cjoEE0X+xmJZ5r2LE95esvIgvQW0+Bo4QPQI09nn4EBLXi6x+N6Rej00y5LPWzKNNXF2IGU1q
	qui6Xu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbZa-00000005zhm-2g9B;
	Wed, 03 Dec 2025 01:22:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbZZ-00000005zhf-0i4C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 01:22:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F3EA60153;
	Wed,  3 Dec 2025 01:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04623C4CEF1;
	Wed,  3 Dec 2025 01:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764724944;
	bh=WMzhh9fHzMqfVKqvzzeLL8rvUNwQUhw5i5XF49Ov1nY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ck1Nbo1/so7daqLsBD4GSsWoMlwxkusaVLhHWuJDPzr+YdCphQ3T/p0xO5xTtleMl
	 B2feusDwMUrm4VQpd6+b/Fz6whdROSWokD3wSIT0SUfxenQMsY6fV0UWIuXbZHLydV
	 C1DPPVLtgekIEzVHm9TORXH3ad7ZL0HzTTkyIzoTWpcRjGbgtnmGlqyZwnNDaj1+9g
	 b7M0Q+2bAebb5kysvLuhqCPqSMdUDtrGTra5iMeW+ujFMekAvPxgfIvhtKbMBHa+FD
	 3hOlQ99Mz8BuLXUg3iAjHHmHs3t1griAnjzuVE0cr33+j0h88Qm9T64dMDYgSh4dFz
	 E/AxvZKBwG63w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 789273A72A63;
	Wed,  3 Dec 2025 01:19:24 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <aS9w1LWtsZFLX9I9@arm.com>
References: <aS9w1LWtsZFLX9I9@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aS9w1LWtsZFLX9I9@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
X-PR-Tracked-Commit-Id: edde060637b92607f3522252c03d64ad06369933
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 44fc84337b6eae580a51cf6f7ca6a22ef1349556
Message-Id: <176472476309.3463594.8331348325756271025.pr-tracker-bot@kernel.org>
Date: Wed, 03 Dec 2025 01:19:23 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
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

The pull request you sent on Tue, 2 Dec 2025 23:05:56 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/44fc84337b6eae580a51cf6f7ca6a22ef1349556

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

