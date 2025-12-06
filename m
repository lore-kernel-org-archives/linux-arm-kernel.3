Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DD4D3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 02:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7h950QVYB7Ryf4tYDULXqOTbUhF5pLxMjE5Qkmyh7g=; b=pgaRReJgg8gWWcYKNVZQC1QXvg
	9xHbLRG94JzIKqURCBnvN7mH227nU+cW+lm3NUzdzGzJW682O59kGlksncEpSPlfbqQFcTnDkUjNq
	dvpRfi8Flk6c3u05g7QrPnBiy344qKN50tYXfg197VrmfryodkESRLUYdS62liX4tzMTj/nEy0Ehc
	m8kgKt1aHycNonmKeVK6aZzmJ8tHlPlWg9G6Uek/LWbDLSy0a97h6hGTyvJfp8vtBxO1ogHDVlr12
	aqu2hjaRyQdl2WEKzOOXuu0Z/9NhPn1hz5qjDitVPcc7iWN2g76GwETA6iq5qQAFqCEjuJr8P7VXp
	quZoWDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe7-0000000ARTm-0Q4B;
	Sat, 06 Dec 2025 02:03:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe4-0000000ARTN-0htZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 02:03:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B0DF600CB;
	Sat,  6 Dec 2025 02:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F68AC4CEF1;
	Sat,  6 Dec 2025 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986615;
	bh=PbA+1vMq3PQRddyKU3c+Vsns8bbeiwHFu9deTNrC+rk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tYdrNK+K2XPkk6ugWkjoFmHYEZ49jkaKahRHq/fxaN52qEPpoEbJCUV+0WGTS8R0N
	 3/rJDzWkBoN2kVGMxVgd0BebyMohui/5RpZKHdSSrEuZ3QYGn6CTvKCuujoye7CCwS
	 5MKpo50LLfDDDwDD5JtkpIzoaf+4aq3VU092CV1X+xKp/YAv7eqvFhFDE6Q5E3Rlbh
	 UID5HdkAQEPVVqtzj68e5ZfL8RXMrZtyqwite/d4GEaKCbxsGNJMkgjLhhcy1FKeca
	 uKcrs3XEm+YHnWq2EMcriUtzDfKuJ3TSCDqhc7wokS2h9oCK9v+5XQanOjETgwXio9
	 FyTnKUpyA3RcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F26063808200;
	Sat,  6 Dec 2025 02:00:33 +0000 (UTC)
Subject: Re: [GIT PULL 4/6] soc: sew SoC familes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <46536f6a-6225-4d5b-ba9e-5cfc64b414ac@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <46536f6a-6225-4d5b-ba9e-5cfc64b414ac@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <46536f6a-6225-4d5b-ba9e-5cfc64b414ac@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.19
X-PR-Tracked-Commit-Id: 9b418a3bfdd421c01002424958fbd86a1001c2c2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 66a1025f7f0bc00404ec6357af68815c70dadae2
Message-Id: <176498643269.1925836.17201281819804899057.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 05 Dec 2025 19:28:42 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/66a1025f7f0bc00404ec6357af68815c70dadae2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

