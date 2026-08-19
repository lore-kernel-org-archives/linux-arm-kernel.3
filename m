Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5D9C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 02:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qL4RpGwgnk9/NidRbhhSgsl91K4IlB43YJ+Xvkb2QC4=; b=kD3IuwnEGp2FCBkrrM98TWuuUJ
	kNQOmkwv+6kp/JcaWp44KonSrLd7TrTMA/y7ZurdDwH0GVcUKj5oSf/ha03k8azVnn8W+Op0z/uw9
	hyZXKzd1J+VlPSdcCyYUBnmurK4kTs+KKqiowMt8c9EjfJmhHYPln1WZfSyf320dy6u4FrQ9sq24g
	nfPtPrmh+SnRX1d7f01Ctc68Ywy2mXIMKKzO28KqZPkSVL4GVUfbeS4TBkFgWZLfL0lqJwXtUfpcU
	q5c0La18ATKKWHsobIQK7s8ryeys5azu+8FFRSVaVllwDGk3yfU9kVEro3EwnZJLZgUohGcc6gRB/
	D6VSCkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWWG-00000008uss-0aYW;
	Wed, 19 Aug 2026 02:59:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwWWD-00000008us8-0qGn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 02:59:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 402B260204;
	Wed, 19 Aug 2026 02:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBF01F00A3A;
	Wed, 19 Aug 2026 02:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787108346;
	bh=qL4RpGwgnk9/NidRbhhSgsl91K4IlB43YJ+Xvkb2QC4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=LMaPCB1Kjn6pG8K+RoFUmS0v9fQuw8aSb0oJ9r2Wxr4/gianIRtyYoH0MaLzu+/EM
	 KaFE5uS24fsaRGQGj5xWOkNOUPRnnUsgG1cZ9CQZFKGSeFlrF10TrzwcCxRITpRgJb
	 +m/U95iD0uEzw3h1qFpEwjM8y5CZhtUwrJxGxyLJqTF+jsswn8+bYyFueXZK79B9SH
	 ePCV9OJUdV6u1lWnq8u6MhR8Uri+tPH5l+G4ROG384wRS1XNZxGjGghJVMI6aYoB3F
	 /JuY7R1Btn/nqoBLksiODZVRWhNjeaYJk4DxF/jnNdkek87hDPe0lNPxE/emXVLtf/
	 pL9NGNXa9K2iA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 69E77392706C;
	Wed, 19 Aug 2026 02:58:19 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] soc: Arm platform updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <714ff494-4bb6-4482-9972-84380d87eff5@app.fastmail.com>
References: <714ff494-4bb6-4482-9972-84380d87eff5@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <714ff494-4bb6-4482-9972-84380d87eff5@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.3
X-PR-Tracked-Commit-Id: acf1efa9485fda84f332c8fbbe7b4453dbec183a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd5f485f3f026225b86573e559af0b7254ef4184
Message-Id: <178710829822.2816674.7570982886082870719.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 02:58:18 +0000
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

The pull request you sent on Tue, 18 Aug 2026 23:16:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd5f485f3f026225b86573e559af0b7254ef4184

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

