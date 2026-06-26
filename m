Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A187C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwDfC88pqRs+F9Jsw7jfTkMtYWb2JZK6HWh1ghA4DM0=; b=zMEqflntaiGyIj67oM9ZBWjsnm
	KhJBiCbtFT8M2mIO2yx4yihPyDSGF7KZnZs6xPeUPFP50AHz5qAx/LzxAZPFXGGNq2WZufbtQlFR2
	4F1FNef0KH2Eu7cHkT3htmGRpFtS+ifDMY2aVhFv3U1jxCMCmQKY6eSv4Ij80Rk6WKPFcU0y65qb3
	RMu0MrhGg0EGrgOnU1cFoQ0p2XvlvMvcuRUeGoUk+F6bEkZpmhCtz8VP/kizwKU2THHs2GjzHkbhX
	aQk1Jgx8Y1FWeaeJx2UXUnJF1ev/rt24fxiG4tIDC2Izhnn3/ukKi8RI+0b8mP5UEBxRznd6+7tU6
	VEED2LHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8kb-0000000BZDV-3wsE;
	Fri, 26 Jun 2026 15:45:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8kb-0000000BZDM-1lul
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 15:45:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 326C940C30;
	Fri, 26 Jun 2026 15:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156951F00A3D;
	Fri, 26 Jun 2026 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782488753;
	bh=LwDfC88pqRs+F9Jsw7jfTkMtYWb2JZK6HWh1ghA4DM0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Z6WdjRkmhYQytPqK0wAwLmNZU7RfYRXS5maSm7IpYqNAE7uNpXirhB7diRlV+a/E5
	 CqzZzb8gEnp+pEzMBMvXoUZ4fOj7N6w2HenDsoGQoiVQM5ID+qW1yIsxzHsFSNXfYE
	 WbqXvQNSJYdqydXE0c4xDHwQAKoVmSzMN69H4IRUmIwFKjikowRaasuVVVrN8JfAek
	 eCNLraCYt0MpjiorvCW6tSdG2u5lObYi9VHQpuQxC6vZvfVX0Krp9c6dYpx4FwYqao
	 /AohrC+0iexH2gLWzEqOsC13D7RCYOSDlJkcPwOnMEmdlxkAcCVkWtOhtsBpj84Gn2
	 ZgEbj2MCPIiEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 199923938C49;
	Fri, 26 Jun 2026 15:45:41 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <aj5bfQ9E7Qjeeo1d@willie-the-truck>
References: <aj5bfQ9E7Qjeeo1d@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aj5bfQ9E7Qjeeo1d@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 36fa5ffa60344bcc59fb3f50b33af8187e6b8753
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e7c93451eeb06b67b4eb23017824b3dee90b360e
Message-Id: <178248873973.1001923.11208101771542719038.pr-tracker-bot@kernel.org>
Date: Fri, 26 Jun 2026 15:45:39 +0000
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

The pull request you sent on Fri, 26 Jun 2026 11:59:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e7c93451eeb06b67b4eb23017824b3dee90b360e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

