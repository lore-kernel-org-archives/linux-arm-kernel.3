Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9E4C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 17:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ueT566sjBORq18eNHJc/KDUX2nEdJuI5A0LGDnBZhM0=; b=xRCTxD4b7ef9Rz32Da5XTROVHK
	sU27Ogf4yB7ampp10rbDi4jI5ZGPVUiRlnuCh0uo6a+ckarLJmOeNO5NYoYRIn3HSQ5Wu85VUFayo
	qGZ5g4Yos7TnlQFL3y51cpYhlR6izuY8EeytYYurjcU9Vlf/xqqS9Y4oecWxtWtd0eFU5f+XZ1SAr
	HAOBt04u0nrSTzbhQ4jNQSpN0dkVxl43ru+gfZT1B82JEUICrsY1LUhBb5M9f/l+d51p4Rq3MHWc0
	IVCkuxV9tiPPLnbsRJx/gKTwI+gYkc1dRosbb1qb+q4LAu6BWwoREo/R6Ut5CBzcZ3hQ6Ycs9zOTz
	3BEA++bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00iS-00000006HLJ-1Bkc;
	Fri, 28 Aug 2026 17:50:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x00iR-00000006HKu-0F22
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 17:50:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61CA1414B9;
	Fri, 28 Aug 2026 17:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 434451F000E9;
	Fri, 28 Aug 2026 17:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787939410;
	bh=ueT566sjBORq18eNHJc/KDUX2nEdJuI5A0LGDnBZhM0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=OYCjkXJwjLGZtuC2TuEeHjm/EVqgO87BhpIyOXxkemewND+iT9g9/h3PBGwjSKrzF
	 o8MCh/obpIMJjMvdmwowlyyJojB+iXrkZxt2NZ/ABSCXhEWGrsXdMA4a5iJLhs9qGI
	 LkDn2XKRByRKywbQ/EtkjuKUcQ0Jq+7JOliz//6Ffa6PioMH/XGo7rLZVz1BdOKz6p
	 qS1MNanUFQ+45P+pSDqzqheNDjWcrITktWIoMs3rbW0h+mtaA/4QMFcEcPFntMVDmF
	 dN4bz13lmhFs2tLfwYVs5Qgc/UR8KHwmedOcmaVZjAziiMtFy2FcM5iYsrem2EEqSO
	 zv6fvqCPZW+NQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 569FC380AA67;
	Fri, 28 Aug 2026 17:49:16 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <apGVNo7DgJmIQRHm@willie-the-truck>
References: <apGVNo7DgJmIQRHm@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <apGVNo7DgJmIQRHm@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 2bd533739234d79b74afabfece1abfe9c6d52c83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d607ae0f7d629dc068aed5f498e24d3e9875ef1
Message-Id: <178793935490.2708560.12637339671283035073.pr-tracker-bot@kernel.org>
Date: Fri, 28 Aug 2026 17:49:14 +0000
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

The pull request you sent on Fri, 28 Aug 2026 15:03:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d607ae0f7d629dc068aed5f498e24d3e9875ef1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

