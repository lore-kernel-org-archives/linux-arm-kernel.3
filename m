Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33B0CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 23:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ft2fdifI7fzVET5uUoUcl7CXqePEAXoykOZErZWOYM=; b=plFZBlDdqNfhxWjp2U76fv2Wnd
	dJpprTL2booM8Y1Un2oYm6dZPLEEHdKQVCLsAnluuv1G5fEX5Ac8kh1ZDXZeJg2MkyvWFqBw6acIY
	dUFqw5SftSUE7miHRX0b7uSEuZsvdzXIShiFF0XjN2xgZ1ZVwGjuUnICidT9lN/uFxIQhM5kPvfio
	gnIoSBKkxE4pOp9AhFKmsAa9+UJr3cxaQg843rXtR2+p7h0GMGBLlJLnWM4fbzaha/DdPuyKlggn8
	4+SAZKeiewGroTGkvoC1ELRz+fZPXkuixlUqlwIlTHKSFeTPySSM9pk5uEoAP5hCStf+RKAGkaw/L
	IUgot//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIxP5-00000007pmq-3I4m;
	Fri, 01 May 2026 23:36:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIxP2-00000007pmF-431j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 23:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D26DE40896;
	Fri,  1 May 2026 23:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE25C2BCB4;
	Fri,  1 May 2026 23:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777678571;
	bh=buN88zAUYahxLqAZvL+RntlbGYti1hIQOx7g4AY1JNA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=m5WctYxeOU38mwd+rgRSm6wZENtmAOnu0YfjMSc9mvCf+pVWSQgStNkCOjt342JFW
	 qqbTvYuRL2E8GGHVfgoDuuTdvWhidXHz3d/B8DcPORp7alIx2Qw54dlfLyh3610q8v
	 sZJOn06w7EO7XXB3iRMlQQIHp2VSuksWWB1WsqfuuHOIcXwoBw4b1uAIfJtvinwdFq
	 xl1xQmt2sjSpJTpIee0SfJtz2UkVukaZgQCGS3l9LRaXbMbtuO9cF1TE4u6b8n8pTZ
	 8eHbXaACUdPXlfnvU5W5Iq1OdFFu+b025ooaR76+9v83fIu2kCuHQfQgIer/vv6Lqp
	 f3xzXOVzDEyVQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0312D380CEF5;
	Fri,  1 May 2026 23:35:26 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.1-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <afUX2gRwmgEfU0X1@arm.com>
References: <afUX2gRwmgEfU0X1@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <afUX2gRwmgEfU0X1@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 030e8a40fff65ca6ac1c04a4d3c08afe72438922
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cd546f7ae2fce8b695c834143b50e712d62ebed8
Message-Id: <177767852454.3657848.4077107082156418175.pr-tracker-bot@kernel.org>
Date: Fri, 01 May 2026 23:35:24 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_163613_043422_69D72DDE 
X-CRM114-Status: UNSURE (   4.39  )
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

The pull request you sent on Fri, 1 May 2026 22:15:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cd546f7ae2fce8b695c834143b50e712d62ebed8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

