Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA77C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoQON+uKfeArSEel93EozFzN3+R+zr6tyWu15mzXZek=; b=C3Gz0D/4uD3dwBPL5rBd2AprQT
	fqIacVaiaEzB/xXDWcpgUvYiVhMpXev61fcEkLm7hva6I8IXQvnwIX9oAa/hE+uQ1vD6f8T7f0Nit
	IB7qaQBSELyJXAbc9tCWCgZdW2sZ9eq5WxKHt9RQUA7Rj8z14Is6KGtTB0fexC1aFA+qXTeiViCC4
	CEOa9qbl0EdFcio0tn9XFHXoHZIWvGlS+YZPIvWPwO3IfaRlWTPKrSA8hvqQVSJDAxza4j4oSav0T
	XVzHWkjT6Jn8A2TEP85nqc/Z4XUYBHT3qgbTokcd6cNAZu1wk6G4Vwa6vfwuEZtmDEMjLfPHU3CmC
	V7RpH7Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jYx-0000000B6Iw-1GSc;
	Thu, 24 Sep 2026 13:32:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9jYv-0000000B6IQ-3fIF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 13:32:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9EC1F42A5A;
	Thu, 24 Sep 2026 13:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801111F008A6;
	Thu, 24 Sep 2026 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790256753;
	bh=ZoQON+uKfeArSEel93EozFzN3+R+zr6tyWu15mzXZek=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RUmMinJLOXo2jjpCnXOrOVbSgF6LQ/Fv3Pfa8+y8rs6ln/1dmiRBJOSPhnhW28M2+
	 iN/0YRSairuFtTYaZ8uYPi0uHBZ/HRRtW3M8M52RZWX2CfNPXt8ihDrs6xvTXyeLEg
	 pXq0Hx2nmXBCpzzYUFNllnX7jb5a2OacJQga0itV4H+TCAPwCvca8ovGwIf7U0M68+
	 RTaNUnaxGqrCf0fbe1Zd2U7Bl8IZ2zr85T1fn4ItH0pbkh33qGhUfmNp3UbPhb7EXi
	 E5TcvA4IFlsZoEpSsZoNwXVkiyxxnrgGUAmCpjj87gsVIlQkXlJkn4O3QkGeoNSV0Q
	 Rax4HrVVavwew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CF939FD333;
	Thu, 24 Sep 2026 13:31:23 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <arUI8d-mES9Z00we@willie-the-truck>
References: <arUI8d-mES9Z00we@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <arUI8d-mES9Z00we@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 2bc6b218717b9d08f466f88209251d54bc09b207
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ef33dd4e0a5290b1de0e64e30e738f005289e1f2
Message-Id: <179025668243.1550318.7791677030778155601.pr-tracker-bot@kernel.org>
Date: Thu, 24 Sep 2026 13:31:22 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Thu, 24 Sep 2026 12:26:41 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ef33dd4e0a5290b1de0e64e30e738f005289e1f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

