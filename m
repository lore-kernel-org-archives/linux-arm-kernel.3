Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0390D10987A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaSMeHUWrNv6lV4/RH0yCzsLckeRYl1Z0R5ip4BFPfs=; b=ov+RMTwMw2avkDSeXtfCPqTatA
	6XtQrwRZUDuOGZX8vaRW2+2GqhbYba1CJvfFlQLyGh/YTi2BYkAl11xnW+5i9BkbjRIfJVUZ9cWXW
	zUj4HPHzvhFVQ45ueOdqEAXEboZoO8kEZ0nhGWWQLhROLq4hEiGShyyiVd9oNVA2dB5xPuG8v54ZK
	t5lyNrGBRQK+qGifXaKjpW647P5BJXT7xZeTxkjcDgA74jx5kBLyUi0tnb+WXnQBJozsb/N9z+5hJ
	UbckgGq4YgbMiAHunQ3c/p0WtV3Dju3xECYpOX5GXmAhd4+rM4hSk9m4C1bPwagFBhhDs8PvLCRUe
	p3k1zfrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cgB-0000000D7M8-1QAe;
	Fri, 20 Mar 2026 16:26:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cg9-0000000D7Lq-0w7x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2EDA96183E;
	Fri, 20 Mar 2026 16:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00E1C19425;
	Fri, 20 Mar 2026 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774023958;
	bh=U1lim8GSAm4P+qOIyro4CtRSGIEA4QfvF64eRKV8uxE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tChveoyf8Rqdh3DNG80JMjEo4ZDEWj1AITGKe1S14pOJIhfq7m+8JpWSDkv8G/mjH
	 tliTLOpaPNoIvqfTRVsmC+MpwXRPfwdoc+kwrPoOE+BGZx7FGDjbjUcOIPkAdY6kVe
	 d7FDVeR3U/V5ttryOnqUYvjcEH4WYKuXnqJutNkWa/fPOsMUZVyPx12ZsO0Fak5moy
	 KTj7qKlKkrWvcVBVT8grm3m9YG9zRemFADwFnVgcmxt8PhKb8UHpX4Aokt3a3BXNcS
	 k7QHMqUBJvDsMZhHwkHyyjImctg2SLK1STV4KmaVaj0+YC8qtpABjY/YiSvloiZM7f
	 q3mRIhMKTJPyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D017380820D;
	Fri, 20 Mar 2026 16:25:49 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <ab1GQXqkgL61wARW@willie-the-truck>
References: <ab1GQXqkgL61wARW@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ab1GQXqkgL61wARW@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 8c6e9b60f5c7985a9fe41320556a92d7a33451df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 165160265e4be3a6639dd4ea5ca0953a858e2156
Message-Id: <177402394803.2556506.9218806196382078104.pr-tracker-bot@kernel.org>
Date: Fri, 20 Mar 2026 16:25:48 +0000
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

The pull request you sent on Fri, 20 Mar 2026 13:06:09 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/165160265e4be3a6639dd4ea5ca0953a858e2156

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

