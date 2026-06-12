Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3952CCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5uniVr+Csx8wdFNe6bLYx8ViVeOY+AikkN+adblB3Q=; b=Wsqh4DbPWkxDCj4VZnzH5eBhPh
	w3vKXdaWnWYgcJ0MPLX6vPsw2iv7QY5KCcdxXyfXRrJFRAOFJpMLpCDgMUo1UNEkpQOjp5mwUcWN7
	grSCpXOV+I9Frw2pXW837vxhwkIaitmY+4H9V+fdwmVWKnln/oT5jMWLX94lv6Cl+cFJgXp2OdY24
	ZGW83usv8uW4dxXOX7YayLlAUgYN1ZU1MQb1MVWtwbt+JnH2aMlx94+fNgmxF4P/GVyMX4NEDnFcj
	GAkQK4Cedv+g5V7BMWdlcb8hcW/fiJvPsqad52qsJyN9yNQfICDNce7JLu/jWJUVIaNTYzBl7OyD5
	M8K5aziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4EO-0000000BBzF-1ibV;
	Fri, 12 Jun 2026 15:55:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4EN-0000000BBz2-0aTa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:55:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5793A600C3;
	Fri, 12 Jun 2026 15:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102031F000E9;
	Fri, 12 Jun 2026 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781279738;
	bh=f5uniVr+Csx8wdFNe6bLYx8ViVeOY+AikkN+adblB3Q=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=MeQbcUInBj9ldOpAE89uP2NUsvXp7UMXox7dWXQjNvg5gMbFsiZx9UHB/27m/N2zp
	 Hzy69kgZJ1Outb1YhqSRQI2OWnClRQHtiIa8zgLOysoinydd8UgmS2+n2PUTkYcylv
	 UROkRBsMAw0qZX93nuzxHQL7duu2gebbUEmx1niUHX98Lt++u8SDLoLW6IDTr5aulH
	 qbuWr3GZZYImgKmoGG/Xdx71hGuecHRmLNWxQ2fDSKqqKposNJxbgE0sWdrwFitBaW
	 3JFpDQSkTlxDklDO0pkr4JojXJqi/LFil88tirkcldrxhwTA5RC4xxJxrBP9x281EC
	 QKb3JpBmcZXlg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 198E03931092;
	Fri, 12 Jun 2026 15:55:36 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.3, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
References: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-3
X-PR-Tracked-Commit-Id: 9c648f3554920721d8878807cd794fe2d7f989e8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fd41dc46db5eecf21c9d53fe034a731a2767030a
Message-Id: <178127973459.723498.3822504448921341481.pr-tracker-bot@kernel.org>
Date: Fri, 12 Jun 2026 15:55:34 +0000
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

The pull request you sent on Fri, 12 Jun 2026 09:23:32 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fd41dc46db5eecf21c9d53fe034a731a2767030a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

