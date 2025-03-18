Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F9CC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgUbzZxmJoyjTk3zPMoIs2DWg92zz5+kzAI8PDuO1wA=; b=Odr8J4N9oLW1nEKOzsE2zxWHiA
	43Tf++d/hPYyLkP/3FSUmd7sdwJjli9Ak0ALrNe0ToAbtIO3mE22rsT1FMxsm26lBX68mrSL/NR1s
	zk3qOYfB6GcDCMjDv5lD9W8dZcZXLZ5aWhEWyZfrAVE8LEQ8EgZcAl1eJJ+RErPO8wTzJ5Qy4nOxG
	HTFUespYwQQ7HXYN8KT8UwPiLtlQ6V/xB89BAWzELonBM2CkRmPbJdFtyDOofSddWucf0VvMKy5lr
	F5ostuKnMAcaHbffMhr+qe2zEYO/9il8EpB0U3VONuGsNG8YbRNXQqbC3hSeQTldXbSVQqLv6Bq7y
	XFp7rL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuacV-00000006f2N-1Zvs;
	Tue, 18 Mar 2025 17:20:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuaan-00000006enh-1sXy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:19:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F8D1A48C28;
	Tue, 18 Mar 2025 17:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78397C4CEDD;
	Tue, 18 Mar 2025 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742318344;
	bh=8Z7SgxoCJA+GSUt4Ui7Aw65TeOzoEivKQZ1WDkvRvq8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tuMY49yoMizIEu9aK2Tyhr8gCdqWPR1hhVEOR4FQDntvgHuD4zDRIu6g2z3U5HYdL
	 U2Aw2T4c014FyFUi4V6XXcKFtQgyCcJz6m4UKEdVY/+7t+uoo37PlWThXntAGDKw+C
	 OXn6GfzpHvHrZJ/MAPSUoD67CZEiveSe5ivMSLE74uaQGH+hO5HnEBHuYq9so0VYHH
	 KOEBWZmolp9zQYlOn5/HCp6N18porp4Q1I05HoMYuOPXJeYoHPff8XFtot3QT+gUkM
	 3DZByPRj9bQRClpcfszVU9hGNLYjoNuCZ6H/YNjJcbHSCXpAhUwz5krArWvXsnaoH/
	 aSRzwszjPvk/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F11380DBE8;
	Tue, 18 Mar 2025 17:19:41 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.14-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250318122548.1328552-1-ulf.hansson@linaro.org>
References: <20250318122548.1328552-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250318122548.1328552-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.14-rc4
X-PR-Tracked-Commit-Id: ef17b519088ee0c167cf507820609732ec8bad1a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 81e4f8d68c66da301bb881862735bd74c6241a19
Message-Id: <174231837963.393299.6404503405685975618.pr-tracker-bot@kernel.org>
Date: Tue, 18 Mar 2025 17:19:39 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_101905_550843_AA57CABE 
X-CRM114-Status: UNSURE (   4.56  )
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

The pull request you sent on Tue, 18 Mar 2025 13:25:48 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.14-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/81e4f8d68c66da301bb881862735bd74c6241a19

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

