Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74045C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 02:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkulwsWWotVBTlqqMWVaRL8Ifh1j+x/O3vL6MT09JMQ=; b=Kdn04BwujhKyLw8PSIKzG9zcm1
	v4rUjFhI04carhX0zluTG49BJ7on9ugrbY4Zfihs5ZDVx+mLZSqL7a+nquixtah3R24EUxYL1J69U
	P5J2y+2dGcoeAuSLMyDECGyE8KJyWyIWbOY+7q+qJl2ay2PLemgNklSm3a6xfjRjQC1xfqy3hsw1d
	QV/yL+kxjkVT682TGkxxxGGrywYJq9ovQMX90q+nAwpmJHZ81wEspKlY/k+JsbI0tJ+eZlZE3XJQA
	UE5f7qFA+/Sg+EvC73C2hKLjZCM5TqU1f2eLbn676C+xbRkMktw/gaD9pazPI5KAbNl3BEggMDkHw
	Xk0d5Qng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWWG-00000008utA-10aD;
	Wed, 19 Aug 2026 02:59:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWWD-00000008us9-0zdF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 02:59:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BF4143F66;
	Wed, 19 Aug 2026 02:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF6B1F00ACA;
	Wed, 19 Aug 2026 02:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108348;
	bh=RkulwsWWotVBTlqqMWVaRL8Ifh1j+x/O3vL6MT09JMQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FR1mNt39LHlYiqqaMu/zUu7mkVqLVVJEogimA5K6Pn+qguwoLxpt1vLZ1C8kqnokd
	 ivFDkSzewC2sn+lXjwxJPrKtzrqOXbpRWiPwR8BFn+w9m0eJIa9yVscOSMEfcVeGax
	 IhjEqXuwYWc6qh+60J+q8iTHNySVpDl7wIYAOiE0iatGy0GqWyqZvYA0XW9GegVCAd
	 9CeOfsb2LuSS7runA3Krtc+Nw9Jvw9uVtpGD2adN5O2cywD9G2Z88PiCjkYLxEFbRW
	 +MzIM64mU1cIQZisKm5SuSvZqnvVvvtHiPi5zKGLj9iSYSpe01uPoUEAhJfLvabgQS
	 7d+2+tAAYiPBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AAC392706C;
	Wed, 19 Aug 2026 02:58:20 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: drivers for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
References: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.3
X-PR-Tracked-Commit-Id: aed89a05a736d2570a514f00c2ab83388662b271
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 368cf60c36a3a311474de08e52dc6314df3b06ce
Message-Id: <178710829967.2816674.1020193772523186333.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:19 +0000
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

The pull request you sent on Tue, 18 Aug 2026 23:16:41 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/368cf60c36a3a311474de08e52dc6314df3b06ce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

