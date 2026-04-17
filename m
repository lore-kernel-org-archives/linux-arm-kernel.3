Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06004F8E499
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 04:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NUVbvIK1os0CYyoZcSwL6XI+VUU7GcuZighaYu4tU0=; b=TvrPJLCD1IQwCg7g5K+NnyGnSB
	5h4LBuxN9iIGNxpDHRonhHWX8LcQ0SItLa7fy2217fZ4i8keEcsQvPG0TB5mfH0fsiRSpBibQzXpm
	u3BeKZgeV/tcaD/0Sn5JgsiSeW1qGjiNOmJX3WGvExEyEsoOAyWRKkGI2mFDIW1o1Ah1ByF8UEf5r
	pb4pnpr3LagvWJApuMR948t91Ow9zqFCCL9tbUSM5KO1gWGT4zQ8mdPmQL6EnkiOaXgDxdAVzole2
	qXnpWmpyR3pLALkySAwLemWJ4GKDVFH1jJcUCf2VXJA3Vnhi5z6xlhvpWccS8E4aaHTO46qevQ+/W
	pz3tNiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaXv-00000003PNo-2PSq;
	Fri, 17 Apr 2026 04:11:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaXu-00000003PNh-3uZG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 04:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05DF960128;
	Fri, 17 Apr 2026 04:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10CFC2BCB0;
	Fri, 17 Apr 2026 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776399069;
	bh=gpI+2bvrautKEg+CLlAd+ga/Zkn7dCmVgn0MpfJyFLI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SOdbDNFAWaZBmD5luB8ew3rRok/JgahfHEbnZalvWgIFj/phG69j7lu/ss/urKdBG
	 aDs+Ome4xiwE2TULEVSZe+iiO8eD7h99IDvCQjdnl4WfsG/KTY7EE2sHHMrc45GT+d
	 piI0xqG5GJZ6BnFf4smd9RZ+lzzXF6hyMgVw3qNKfnMVmQqZNi04Y06cJBcijw+/JZ
	 +5AyTdacp/hQepaAol+l7yIEXutTSOI2H9yFYcW6zqyjOQiDhKd/YieiNJg+38LXLM
	 GE11DjQjAwULiF1fdYyXX/kibVqvvR88wp4Gp8bxVXmRR4JIYg+A7Cp5ZtlgfHqsAo
	 lLSM2LvTx2KCA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02D1D380AA78;
	Fri, 17 Apr 2026 04:10:39 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: dt changes for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <b3203b1d-4c1d-49b8-924e-c17cf6be7ec0@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com> <b3203b1d-4c1d-49b8-924e-c17cf6be7ec0@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <b3203b1d-4c1d-49b8-924e-c17cf6be7ec0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.1
X-PR-Tracked-Commit-Id: 41d7004ab4e521ccbd98793d7da55022796c463f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e65f4718a577fcc84d40431f022985898b6dbf2e
Message-Id: <177639903769.3519243.4077028477830670105.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 04:10:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Fri, 17 Apr 2026 00:22:48 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e65f4718a577fcc84d40431f022985898b6dbf2e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

