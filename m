Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F86C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 02:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcbR36aFwlUt59gMHmMIGJ18qQODA59AX7GxDJAumkk=; b=w3edQyoAus64IrJE4pjzJDEbKt
	46YHSNyeGAFPG97W+a7yxl4Vw05ugrky/AQXoCnd12q5CSxvaAWC04Z7Tve6cjbIFn4xi3mCh36Zm
	lzZnv8SCLA6B8i0aCF906NcVPzWel4YVs2nA0dZYZDQZqfNA8ZeM3+uii53vu+Q6cnVZuFwLI6VEy
	CXJbSyF0RoeXmh/9mFUxNC3da7Vu1tc8aucyX+uUwDQs2Til+ghXWc04a3KCg5NGBDdCpA0vOW/2/
	Hj6rDWSALULSAu867Jt3VTkxFWIfPs3BSkokpDQjxYZ724J4QLoZ1r8ENAUkjuZM2wIt4JWOKRU1K
	KmqpKVJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWWG-00000008utV-1bmR;
	Wed, 19 Aug 2026 02:59:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWWE-00000008ush-3fuR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 02:59:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 535E060A5D;
	Wed, 19 Aug 2026 02:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A72A1F000E9;
	Wed, 19 Aug 2026 02:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108350;
	bh=UcbR36aFwlUt59gMHmMIGJ18qQODA59AX7GxDJAumkk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=QAHBC3mexBM31sZmY9AYbpkIkbEI5o8WvU9lFvpGL1cfcFHUmZoKaJhDj5Q4/1Y7p
	 jWiFn94SKckCwg+RSBA91XyeWncHfZXltpFvwFkycXdQDsFbbYtIhNSJE0b/6cEq2J
	 vmT59BBvAhqHhWAGQ0eRDq0KR5zo876DXwTNy6kcMVFAmrEZfks6J68aS6/nd4lygi
	 taaQ4dPgljNETS0MhP+mJUnFMnOj/cPEyGzbziaSORxHMr+SDjhYAqhrP5+GyA7dk3
	 7csZcUmDxYAD7CT9RVwX/o+Nzg7Jzx04k2vvMFxB8Wu/kJ9P/h7Jr+NZuWkdr/jHXP
	 yUIeVAwBMeuJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8AD05392706C;
	Wed, 19 Aug 2026 02:58:22 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ee98fe32-e635-413e-aeab-caf9f4b98431@app.fastmail.com>
References: <ee98fe32-e635-413e-aeab-caf9f4b98431@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <ee98fe32-e635-413e-aeab-caf9f4b98431@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.3
X-PR-Tracked-Commit-Id: 373eab9eec316c315e884e9cb520c6d8c3236e0f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6eb1ea5ff48d647deb67c58b7a0e97bbf4de088a
Message-Id: <178710830110.2816674.18324994998363899388.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:21 +0000
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

The pull request you sent on Tue, 18 Aug 2026 23:15:19 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6eb1ea5ff48d647deb67c58b7a0e97bbf4de088a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

