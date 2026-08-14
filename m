Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB674C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 22:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFMyEhDW4bvFif6qLOHnrHmnWRiIQ8epg8yOJqyNpxc=; b=gRMXcTVpyD6B66hqBYDNsq+Mvi
	FDaDfC3onotJi0GHa06Unij20DQHSzFU6ibyN4ZUJUtD3x/l8z544IwyT1maCGnnhUxgLAZYj8bj1
	4hW3ea1o+ivPEOTZx5pg0FwWu7b/BFcH1JH5UoT2hsA3ec1HWhQ00GszyGfATlb69qdESwv+jPrrf
	GBODlHRa9hz3akir+W+SfeQD8lAwKqc7Y8H74EwDeGrr0ZppSC0xNRyONf6LJom70Kwv8h166IFwt
	aPcFoLrlr0YpIKUM/oEesoRXW/PNz9IRXZeXQmJvFvD47bGrJl5MI2GaOlyWPtKsLRkRK64qYXrKh
	vmdogLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0rk-00000003IDE-37iH;
	Fri, 14 Aug 2026 22:59:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0rj-00000003ID4-1A3X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 22:59:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3536360008;
	Fri, 14 Aug 2026 22:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB8B1F000E9;
	Fri, 14 Aug 2026 22:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786748344;
	bh=GFMyEhDW4bvFif6qLOHnrHmnWRiIQ8epg8yOJqyNpxc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NZ678rqfzIFy2XU7bawtM7T03MEmjy/CiNZM/Db1tYxAQjNkhFWPF8IfqgJddhtvh
	 7KCZIo/czaQKcbwWqqUI+98pcIh02bwVeki0AKMRue3GDFSAbDkuO+wh6ASjxogCIT
	 gjMIM71L42EhCOtXBQt/tcxmm337b/xHf45RbFtA+ERubLhcS8XUzliyHEuv7EboMp
	 XQz3HPPNjo9rP1p6jqoJi59t7nh4mvJNWt+Yyfc5ZAiNG/1vtkcLh/tf4tKRBwvk3t
	 jjUhHPGggZjpcOPKwIgfAb3tDu9rzLpL3HGp34CeiLz3GLQeSFQCHk6EWPQ7HDND1m
	 25xuxp1HCB9zA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1971E3924460;
	Fri, 14 Aug 2026 22:58:20 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v7.2-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260814141504.127436-1-ulf.hansson@oss.qualcomm.com>
References: <20260814141504.127436-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260814141504.127436-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2-rc2-2
X-PR-Tracked-Commit-Id: 090a95dbe13df9965279b588d97eda134831769c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a823c9da52b2cf81e2203870d758871470b3bcfc
Message-Id: <178674829900.3991221.293792173327152525.pr-tracker-bot@kernel.org>
Date: Fri, 14 Aug 2026 22:58:19 +0000
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

The pull request you sent on Fri, 14 Aug 2026 16:15:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.2-rc2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a823c9da52b2cf81e2203870d758871470b3bcfc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

