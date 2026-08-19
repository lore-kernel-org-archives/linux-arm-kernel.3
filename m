Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF54C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imEHt27mUhxQ58R44WgkTdQcFGZixGru/Rw969OaqtY=; b=nxvT7kkHo26gS0ffauwBssTDBP
	iKOc18Ot+3CMA2wh0WOXcucXjcg4owfb6SDhA5ahmTGD8XlMDS3PtVAo8X22mXmV2SneImQXi2xeK
	S1J40YlS196c+AR/YkuDVMw28/Ngzek2tPXr3vFE+cDLJb8drUzS37+CBHDJaaiQrgMGWpH3QO5zw
	zG4LroFm/6z0jIjlRT4u834T4M5tME6dhesFNDcdvr0fTUeNfW3yrJ48z6Z7GO/m/9p1pJaIikiYN
	h9W6bSSmKmyb58isQUadipgNuUegYER8u597erKSd17AatAZNoDaA8/ADg1jhWLVMM4wtn050emJR
	+AtnX+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjyD-0000000AGom-3EmO;
	Wed, 19 Aug 2026 17:20:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjyC-0000000AGoH-2cJ4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:20:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E46160A92;
	Wed, 19 Aug 2026 17:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561E11F338CF;
	Wed, 19 Aug 2026 17:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787160055;
	bh=imEHt27mUhxQ58R44WgkTdQcFGZixGru/Rw969OaqtY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OA4XH17kgEwXC9nbTZ5FV84tBgY60IrNVGMRr+33XsSy6z08k3yMcwojQJlcVc3Mb
	 UQZHi3/v/3v/GpeHwkkggEmyIf8bSzc398SG10kJDhvIY+3/+c/NyjkdMSjbDxaVHJ
	 ILOCvbNH5dtnxOnLu5xEjtd1N57FHBx15RoHN12OJexbZ9TtkrQQk/a41LdqqoliK9
	 HcJ2vwRvBJFJW9w44PVWN1gMUkwJ7L8cRgvp3R1LfJ/MDIaULhCbP580h8d+PjWwH0
	 6JVsj3Q0WZuFjgJ3WoRVedR6Tkv1uFKoNuXGCI2VFKM80E4zDM04gQMrWWg+7BCfzp
	 Am95YehXVlf5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8395838119E7;
	Wed, 19 Aug 2026 17:20:07 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain updates for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260817113836.134458-1-ulf.hansson@oss.qualcomm.com>
References: <20260817113836.134458-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260817113836.134458-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3
X-PR-Tracked-Commit-Id: 3ca7b513aec1db32b75b909395be1111c1198afb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ee1b6365f07a14e987dd0f994fc7d46966037ea9
Message-Id: <178716000620.3599392.1518378382337655084.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 17:20:06 +0000
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

The pull request you sent on Mon, 17 Aug 2026 13:38:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ee1b6365f07a14e987dd0f994fc7d46966037ea9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

