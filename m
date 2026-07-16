Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B02C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUaLGPZ5j3VqnvxuPFbCeedwozNP234RROFK3oar0Uc=; b=YcJt721aF/LbRtJKPCJxkOQx9B
	YEra0Q/21ooEvcwPIlygzvz7NC3lB4SdXrNtdiLIJ06P7SQW5Nd6qeHYg1zRVR0bRIPp4Zig01Da4
	yD89mtNQFvR5QvQOA1PJnzc83Dz93lGYuxdhLqMsqZv/cSict7caeYUFguHf5oDjvrNOLbppZw8sN
	R5vHJrzc+ZyD1GXlQconGCeozHV+eE+VyNePN3yxdnBRyxNC8Lfg/46NOcD9U5LFHKc9n3o7OOELd
	S2cAGa2rMF5bjZA6nxDlpvqxUQMdzr3HvOw8PMgXdzNfHFDJGPuDefUppul270iXeFnYqjy3kYBbP
	LGMfH/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOzf-00000000ALD-0fgS;
	Thu, 16 Jul 2026 16:31:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOze-00000000AL6-2CFX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 16:31:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E08F240435;
	Thu, 16 Jul 2026 16:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF301F00A3E;
	Thu, 16 Jul 2026 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784219485;
	bh=RUaLGPZ5j3VqnvxuPFbCeedwozNP234RROFK3oar0Uc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=iZWxMS6NrN+WHoqYEOSeK7kTT60ZJAscfmBaoAeHo2eAwJjoLyeiQkBnRmmbnflVT
	 hWENbn0V6qZhsmzb/nDgnIUm5CzLLl1Ez0LM+JTcKYAFe/3WHQYy2BUYgjjZMvbKbo
	 EXKUAy10ZAu3O0VYVXeUd1JUHULC0jdrnwGjrn021UT9/+jdQTwlOvqSiCXHOSteGH
	 QugFB8VBq9ZgpMSHHt+929d0q5ll3Lc+a5mpxQ6fmJzlrBEcHUGiB9P2rcQXrruQms
	 G59HhNyxt5kAKLdMufrDq7yO45UXNrpJnuX4ErtY9bCIczrunGNY3WA3g0G9BQC3xP
	 oyaon2r+YLSfQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199CB3809A19;
	Thu, 16 Jul 2026 16:31:00 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v7.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260716124635.45302-1-ulf.hansson@oss.qualcomm.com>
References: <20260716124635.45302-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260716124635.45302-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2-rc2
X-PR-Tracked-Commit-Id: a4876f11aa1d076802676e23f8af500706e780e3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4302c3503cbe00c54900105d15eeea3b1a8030fa
Message-Id: <178421945874.1334695.1376180464929495873.pr-tracker-bot@kernel.org>
Date: Thu, 16 Jul 2026 16:30:58 +0000
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Thu, 16 Jul 2026 14:46:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4302c3503cbe00c54900105d15eeea3b1a8030fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

