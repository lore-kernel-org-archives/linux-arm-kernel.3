Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8318CD277CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 02:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRyLascoQUM97o9Vu/yvS8UUccbDbO/P7onpuAYwAUY=; b=JpaKlE7SajuUtYISBnQM9F5xyz
	RAubQGuxe+Iwa4pW4ch9BvNxpaJ2LPzB4OFkOdQOSGy/XR7s0vDv393pDPN4AW2zcRE5gRSoL+xjy
	SbfwgANwZyUgAb6IsWQ9CN8Wpv3a7CiJagR5ffqrIbvdchl9daLbQZMKoxUQi0eVOT8oU2f8VlHkJ
	CKs/b8BxuRdtd9Upd3w0c3lPNEzmX5J6eRhulewtjD96Y1T0G2D5pA8UDV+vuqlqG1IozfQDgJY1+
	dTimDj1w1TKbcTX92o3cQpscATvKxx+0X0c2UV596W7G68aPOLjMsyYI47z+xImfLwfCC3UFVKOy8
	bRIM9b2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veOYh-00000003BX5-3FKS;
	Sat, 10 Jan 2026 02:18:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veOYg-00000003BWj-10Yu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 02:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AC1C460052;
	Sat, 10 Jan 2026 02:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61428C4CEF1;
	Sat, 10 Jan 2026 02:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768011509;
	bh=x/N/ycohyLUwtK7qtx1ituEGmvDVj2oS4STEWRj9CZw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hKRUwl0j0+QSTvs9YiKtgE2VcMNfUWmnT5HZcYDitigerQ4OOKStWi9FmYLAUkJl5
	 1zUwfSvQjVkRcEWyU8MRk1HTU+5lvEKNjnt7Ya6jG2E+FgpnXVDI0vHxGgVw+hcG2d
	 flxgi3npZrhUQ1KPmWeVBqSySwAMIZeHJCQhSRW6bXgQnFQgs4/L6fo5ISSUNbHccI
	 /xKltpeucqvcASl2OcSRJj1eXDbsYvwsBcOOSZofyJIrNMLeGpqdslX3wRSw4wrg5a
	 KmwQacvBunwDGNwdk917NXjHQ4vdZ/anjbauzUKsMPh+xNJE+Jpf+3o3/5Thd48DEt
	 gtNnwpSzTYMoA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B7C33AA9F46;
	Sat, 10 Jan 2026 02:15:06 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.19-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <aWFIj0hGUQK1ywDu@arm.com>
References: <aWFIj0hGUQK1ywDu@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aWFIj0hGUQK1ywDu@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: bdf3f4176092df5281877cacf42f843063b4784d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e28ddd0b7af218e1a8863c524e15918895af9ac8
Message-Id: <176801130487.452892.291354896566463029.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jan 2026 02:15:04 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 9 Jan 2026 18:27:27 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e28ddd0b7af218e1a8863c524e15918895af9ac8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

