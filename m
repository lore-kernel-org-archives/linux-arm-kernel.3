Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D110C02181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jan 2025 00:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OeaJimcddAnKNxms+C7pW06h8qKObWCpQPC7+x9C9i4=; b=rZL3g2yOe5qEeJfnTSxi5hcNJN
	PA55WN6Z+XZWzjeWM8A76cOSxOxjLyMIGCzMpPiA8sR6HOu7R42O8Fw29JsNcvbsAzF/9S7DNL63T
	Q76MYvJajmT0dstBYysY6mTSitRDY6jPROpjvNTpdriqwwCYQ2hje2VYNCvzbkzgukbgCunn/e2nb
	8cEI1bO29zn78PYNuG+CroBZ9LxThfyU+SA3Szlx6x0k2lw59xxjHgBpmj4G2bK2nC8XQi+t67Qg8
	U9iXPgbayd/GW9NDcUKIOx2M4WchHi+qIynvWfEBnfEUyKE78QhHYkCQlYLwx0EVDdEihUvM02xh+
	V/dSlyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbTqJ-0000000FmVD-3F1C;
	Sat, 25 Jan 2025 00:16:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbToy-0000000FmJ5-2oGU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jan 2025 00:14:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E4DCD5C6243;
	Sat, 25 Jan 2025 00:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025A5C4CEE3;
	Sat, 25 Jan 2025 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737764084;
	bh=s7rbi1QnAM2by6CnlRFIk/t6MLH260JcqqQbLZUT5zw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=fzqw5bLzROXtfZwhQfBVB+nPPkb7LTFlNc4V4PRY6+aohxhkn1ZMBoZGfXx466Bw3
	 yKWZP6DeBwGgDB1b3pa0KHgCnPgL7amxDPwKqWNlKya2RCefHGGteOCRa4wI3+EG9j
	 PGfQ0eiLVNrOvV3JQZdjso4spy1xO+IEPivU8xBKSQq8FGlAMBUDfqi70/eST1bSQl
	 8vQRTRl3AqGGZeSIagnM6Wu3dqSK4n+apscYq3Rg4mwr1gMbOUzlcr0rHsUbbwjRBi
	 YUPvXQ8EelpRqu9JF7Gk9Mk8njS8+JM2tkBafqjjNWFfHje2XkWPRBNZtxgOfTRn0R
	 NRT7OIskeRWmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B73380AA79;
	Sat, 25 Jan 2025 00:15:10 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY0QX4PLU1wSfz7DsXCzoeOD=VAR-E0vDH2LLtwfp8aJbw@mail.gmail.com>
References: <CABb+yY0QX4PLU1wSfz7DsXCzoeOD=VAR-E0vDH2LLtwfp8aJbw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CABb+yY0QX4PLU1wSfz7DsXCzoeOD=VAR-E0vDH2LLtwfp8aJbw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.14
X-PR-Tracked-Commit-Id: 4783ce32b0806911287f35cc65b799876d6f9547
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 917846e9f00508ba91e7f1f6fd03db696c971459
Message-Id: <173776410872.2216626.10891103708279037592.pr-tracker-bot@kernel.org>
Date: Sat, 25 Jan 2025 00:15:08 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_161444_746540_0AF18510 
X-CRM114-Status: UNSURE (   5.14  )
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

The pull request you sent on Thu, 23 Jan 2025 21:49:29 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/917846e9f00508ba91e7f1f6fd03db696c971459

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

