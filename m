Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5543CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 04:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCYHt+vvTmXq+1boPaMYqJogBHH191aJ/eicoHTrLuY=; b=WcNFk0qAt06ssBdYljHM5PD1LH
	dh+itZ5E7tdB4DkEcy7j2nw8Y81rLNAvMlTV7UjBSPWkYb2kqUXrI433gdrqFwOwR8hXHJPZLailN
	MuNeaFYfNfjj+cNXnELyJWzVLgrVV9cD1/ZXGSrZfTR+Tj0p1VTw6+ZcJc6tEiFECTR4Tlbk0ltVn
	QaBCjqiZr6u5w6m4qvczqUFhbbfoJR5hDZPNUE9TWy7gpBG9GE//P44axSOyCxpVyXApyqFg55EuT
	bDSa40v74HKzU/faMLbQfg6pLaSzlmqfu/O2QfQRXvswWCMZ5PkpiPkbWKPJAaJhIcM9hEqpNuRLA
	Nh9dpVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEg25-00000003WTi-2CRR;
	Thu, 08 Oct 2026 04:47:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEg24-00000003WTc-0hRb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 04:47:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 58BA36025A;
	Thu,  8 Oct 2026 04:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFEA1F000FF;
	Thu,  8 Oct 2026 04:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791434823;
	bh=kCYHt+vvTmXq+1boPaMYqJogBHH191aJ/eicoHTrLuY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=UqxMtOxnOyycNyNiYOKMEJjL6sIyoo6oZl/4ShZX+fS3VqhMazK46eZ2AAAhNBhV3
	 MJi+nGxNqsy2Akn7GpXm5ybHeBniO+sqowOR5dMhtBwm2c071ng0y/7zxAzaU4XL1v
	 PtkSkzy20118Ovto0YAam8iXV2ZnXJunspWnbUlyj/QDMpE+n3hcEfPD8BOCHBWui/
	 CgEio6lb0SbE0FASdkdp2QZAKn75N5Jzfl9e8QQJ+n/QB8W/shyA0ZKdsnKtM8sCwX
	 C+S8GnerI1j3jlRVPI8wyTJAsj+Yet/vR1qely+tMS8rHL0v5Ll8odd77vciBVgE6L
	 jv7vqvLxe9m+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F16353809A13;
	Thu,  8 Oct 2026 04:47:02 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.3, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <1399951d-6afa-4977-8514-ed30c5a2c865@app.fastmail.com>
References: <1399951d-6afa-4977-8514-ed30c5a2c865@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <1399951d-6afa-4977-8514-ed30c5a2c865@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-2
X-PR-Tracked-Commit-Id: 1fc2d80928b706147e371602dabd0ba927dfe4a3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c2669a9f4a1d607e7591ae50ccf3c432a0aff08
Message-Id: <179143482151.3815904.12103311342600646936.pr-tracker-bot@kernel.org>
Date: Thu, 08 Oct 2026 04:47:01 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
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

The pull request you sent on Wed, 07 Oct 2026 23:35:07 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c2669a9f4a1d607e7591ae50ccf3c432a0aff08

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

