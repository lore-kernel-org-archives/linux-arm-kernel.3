Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E315D5A6C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 01:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eam3QNZVs0WoQljWB8tHIqFX7b++mLcO2kcoIwbj6Jw=; b=L+B6ShjEOGi55DIhqZKt/szkHd
	Xj/U/0lX1THUClKqOVBfcTJv7kCXOaqqsHpe7cqVPgyB+0Yigt7B5EGUstotpNWfyswzYPtUDhmb8
	RICUqUkJtbjRZC2x12fr1h2yh9sli/vkI78cs2cMAL6csL1DX9ANxURg4VNzQb6vxrdr6CbXK/wu0
	Y2Oit/DrV9Yr84FmPde7od6OFECmlAK0QBfFxboIHBlNi7Uh+ksquCVIh+9ErkbOCKhkzA9ntA+VG
	USrg2f0n3I+USU5oDUeRitIYGJoPZgijmo+9N+jwum/Ewz9sFrwE3hNuRjADvZsH8url6oAgjLTYG
	O/O/BaVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFka6-00000009QfQ-48AE;
	Tue, 26 Nov 2024 01:41:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFkZ8-00000009QTk-2iVT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 01:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B5885C3E3A;
	Tue, 26 Nov 2024 01:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B59C4CECE;
	Tue, 26 Nov 2024 01:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732585233;
	bh=vJfWA6n4G80xSqB2iyajecyhNPovZUzCxSTks2j8bPo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=jyg5gHsDOBKkQzR22NG3Ooz2kNQQ0Fo+ug1F7DnD8o0NThy6cA9DTxbEPBd0zeXha
	 JXnLiIjl/WP+9blevkmsMiKArBbRbNinnfYM/37xSKjcsY6dTQW/Qb+6wPNhgW9Pvs
	 uoCGCDOdwuCqgDfET+W5+riXpAUh33SxcpGRtIMhB7FhhUrxphYhJYEu4t/KIhtG17
	 WHeRnWJaXNMFZr9dlkWWWLmLq3s8S3XZTmOGL1yZzEA32WCbzT7/Mq7u4UCZFb2bGu
	 H4ecFAGDBm87J6QmucVS1lH+i/+DCXLbbK2Tgj41LDJR451fE1vzF3BGqtpdHsdDk8
	 I77VNY2xiD2jw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713B13809A00;
	Tue, 26 Nov 2024 01:40:47 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY33qnivK-PzqpSMgmtbFid4nS8wcNvP7wED9DXrYAyLKg@mail.gmail.com>
References: <CABb+yY33qnivK-PzqpSMgmtbFid4nS8wcNvP7wED9DXrYAyLKg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CABb+yY33qnivK-PzqpSMgmtbFid4nS8wcNvP7wED9DXrYAyLKg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.13
X-PR-Tracked-Commit-Id: 7f9e19f207be0c534d517d65e01417ba968cdd34
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2c22dc1ee3a1d1c50bee5f0f71ebffa86c33e172
Message-Id: <173258524588.4103683.11286245173894515706.pr-tracker-bot@kernel.org>
Date: Tue, 26 Nov 2024 01:40:45 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_174034_732248_67A17947 
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

The pull request you sent on Sun, 24 Nov 2024 20:02:27 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2c22dc1ee3a1d1c50bee5f0f71ebffa86c33e172

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

