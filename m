Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA76CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ciQOt6NWwfOog9VoModtejysuadNlQaMBIW440bGX6A=; b=RKbIg8UI4gmWuqD7DU3MIrUIim
	adSj3FbxBKHZuocBW17xUCaVLGoMAuPBxG2zirIaZpL9K8Yr3L7UApeKUKZk3VciqDWZDuJ7MWp0d
	d/xH6/2BMAn6J5GTEH0KW7x20bTijH4X7b0SMG+YMzO3kzpWyYY/og1lRTeeBCNj9AjickF+bln2K
	IWV4W0myezEun7+C1qE/GgEbTJ3Sa8/zyfLQ4+qKL1ZWJNR0mRd5Y199zPGx4h6fgwsEgYY12855h
	9k4+/KnzbzA9XW5KlnjK+j8VjqsUeUrFsNoREhZZmEuZ+pB1HN/QN17CcIlPNIwO1XT8jVjUC/5Sj
	uSfYL4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv8G-00000000ARV-1Vuf;
	Wed, 17 Jun 2026 18:37:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZv8F-00000000ARN-2DTt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 18:36:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 78CF56001D;
	Wed, 17 Jun 2026 18:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28F161F000E9;
	Wed, 17 Jun 2026 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781721418;
	bh=ciQOt6NWwfOog9VoModtejysuadNlQaMBIW440bGX6A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ThEU5PLXWXdgatxdxme6fxBxazWqxrclLqPSl1OQeetAt+toZ2hZw58PBX3Tv0Fg4
	 FHKpWBtSCUKOUSPqcLsZflM3wNcg294GOzx7tSMEEnsUrJxktBTeJXQeRplzwpobrK
	 BVU3pvaeizwOjTh0hoTEmkpBMNHiAp18Heu+/Sl5oh6+5gHF8AWizpu+XumoBngKkK
	 QDzdATMjzZbXXc7lbzyRlkWtOipoWnGxkxsWbckGDB7/SJsRvG14fk8tpFbsVJ33ek
	 vZIW45YmvS8jII3YrAmY5FyRmfh4g2OhMzhzgGeW6qQk+gpeX5yuxIXq+J1suJBV0m
	 2jrS8WRkVhM0w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56C153930FA7;
	Wed, 17 Jun 2026 18:36:53 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ef5fa237-1d2f-4c1d-8940-0e8c6c156759@app.fastmail.com>
References: <40c8ebc3-d681-4dcf-b3f2-ce0d780c539e@app.fastmail.com> <ef5fa237-1d2f-4c1d-8940-0e8c6c156759@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ef5fa237-1d2f-4c1d-8940-0e8c6c156759@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.2
X-PR-Tracked-Commit-Id: 9e84fd546dc3f9f97bfbf2717c2d71d878a4f46f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aab799b1bdd1ff3e6912f96e66c910b8a5d011bb
Message-Id: <178172141188.1757661.2783841397380560114.pr-tracker-bot@kernel.org>
Date: Wed, 17 Jun 2026 18:36:51 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org
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

The pull request you sent on Tue, 16 Jun 2026 09:51:35 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aab799b1bdd1ff3e6912f96e66c910b8a5d011bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

