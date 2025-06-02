Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD92C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BseLaHsbHaXUlwxNMmNa9DeYev4F2o3ZleJvMioqdcQ=; b=XJk9BkIxksWEwTziiVgt/7XTDv
	g0zk7OdT4fyCHspTWJ9CQPv5yJDx9fp7puAFNgGjuPpz5yvQSVthlwThVPA/xHeMIJT3oEuqR4cPK
	thZfDXTbfpw3R9XFP/Ta5JDGdb2flKj0hI99rLMmgwaebKizAlAoPB1Vh1gSpFL5bb65GDTiJxJ1M
	N94nPtEAHtQR9BmrPnNwpU+hhI27eNyICYlo0mYa3TiteMWlfmKStTyCWvawFXKgpx6VA2rX835bu
	Ds7i1LAYMtUAaxl/zV49Xfs9rV6IcTtcXL7HFZiWE81SQzFYq30PbTp8tSBPbsXDu4r7E+9D/U8S5
	kbL1YXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAh3-00000008ReG-1cHk;
	Mon, 02 Jun 2025 19:19:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAeq-00000008Qxi-2rRg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 19:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76CCA43718;
	Mon,  2 Jun 2025 19:17:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543F1C4CEEB;
	Mon,  2 Jun 2025 19:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748891835;
	bh=prQElXY00R5kGao9KP7Dlye0Bfm3lAWat0EFphPfEMk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YRj4hwPU8MVr4zswbZY76qwB1WY9b4rfEfnwUAJaNHo7z43vPnpbGHs5xSsyW5AiX
	 iMeurL9MWlOUEnpHj8K4Teeprmn7tnRk9RLCsi2G3GBqBctP867KrZptvaNPDrgOEi
	 c6RTBa/fxYD1CrEhCFbqJvZToVMk0mQG8/cijqdRTMddZThuPiCMDCVa2N8LXIMyRj
	 8iGMTI75AzMU0OLCezT+2i/a7l+vZgxveCkJX8VMCimL5Kx3iQrq+6Ugv6XxRcpr/y
	 b9V8K4Uq4Xy/c5rXFvkQgAi8jB0FQNIwkdllHXD9Xpio1tsxD9GZ0Hd1JcXuAnJpRf
	 QhRZpBl8CFTGA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34065380AAD0;
	Mon,  2 Jun 2025 19:17:49 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY0mDQrYH0Z6=kRyCft5DXgUmhT2X-trRfs+PPd8i8ppbg@mail.gmail.com>
References: <CABb+yY0mDQrYH0Z6=kRyCft5DXgUmhT2X-trRfs+PPd8i8ppbg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CABb+yY0mDQrYH0Z6=kRyCft5DXgUmhT2X-trRfs+PPd8i8ppbg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.16
X-PR-Tracked-Commit-Id: d0b497df02e9b2ebcb5771c7b16e424c0614a366
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a06079511167984f7d25ff09fdfeb2f1582c85dd
Message-Id: <174889186788.877155.2445061992752318425.pr-tracker-bot@kernel.org>
Date: Mon, 02 Jun 2025 19:17:47 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_121716_744151_6E374E4F 
X-CRM114-Status: UNSURE (   5.28  )
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

The pull request you sent on Sun, 1 Jun 2025 17:25:07 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a06079511167984f7d25ff09fdfeb2f1582c85dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

