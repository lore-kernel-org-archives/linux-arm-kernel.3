Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28072C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kauvoeANiYhemJRX/P3R//tCI/dUa/QnjJIw6eJesWA=; b=1Ub+txWBYpRoPFZRqGXA6DpJwW
	diQNX+2Ba2yg2pkm4Aht/cqFMMo2IAmavp3abNdGvV0oyM0Ooc5PN9PtKufPEONsO0TffQMwCt/xD
	xwZPny9quQsuY5ZVtgq4w6GVZcdEgpTGnd6AYNp4ERw8Cf6zv97xZebwBZ8pdEEXa9+Y4npCSVJXn
	GQBz2ENRXjSkZoomzjcI615PtIG0MhExfJzD4xshuKZ2NUz+Clmcx9BI2cxIA3SanzlJcjPKxZDJH
	f12UeMqeka3PUIEgl/AZHYEiZ6BBoWjGcu5xR5MQw+GORNOqGf9a6TkFZYBswY0R9ZUyTlDnFXE93
	VQbhlApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEfF-00000005PVu-0wAG;
	Fri, 10 Jul 2026 17:05:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiEfD-00000005PVP-2uf8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 17:05:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01A9140111;
	Fri, 10 Jul 2026 17:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D858D1F000E9;
	Fri, 10 Jul 2026 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783703122;
	bh=kauvoeANiYhemJRX/P3R//tCI/dUa/QnjJIw6eJesWA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=S/09fcV7zOiQEsd+9AORdoRkDyruaEF34pdmkdwkeUSDR1ZwL01JTSf+wPB3TG+PI
	 C4h8zCZEEwrwbFtgqQ8Wg08/PsiKc9DGmaCiILBz4C0BhRz0zCsYr6ZcQ+L2gnGJoi
	 ROw5YUJ4JevSyPAvNj97dKxmjGgQt1wFD/I6fyzNiiL5Jxe+dp9Oal5Ycv7Ihcd3xq
	 vymnRQY5B3Hyz8u9jZfP8KcA9HCisz0iluG6rB+0BJSgy1iP81ENpcCQumvJrvgHVa
	 7Rb3YsifGMIQL8TeGK/UJ5u2sRTdtftSLunsZSUOjETqoQaHEmYc3k/uLgggYjehE0
	 9U/kfj5FV1IDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B543924FB2;
	Fri, 10 Jul 2026 17:05:01 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <alDnnvhyhZLioQAe@willie-the-truck>
References: <alDnnvhyhZLioQAe@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <alDnnvhyhZLioQAe@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: a52d6c7160f7e2f8c56adf29146385b8f2868d3d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d96fcfe1b7f94ac742984ae7986b94a116abff1b
Message-Id: <178370310035.779204.5586327922977214737.pr-tracker-bot@kernel.org>
Date: Fri, 10 Jul 2026 17:05:00 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Fri, 10 Jul 2026 13:37:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d96fcfe1b7f94ac742984ae7986b94a116abff1b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

