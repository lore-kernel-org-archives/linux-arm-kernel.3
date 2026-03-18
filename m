Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E500810775E7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDwcxRshpAYJqtF5HZcaMWeuFfTHSID1g6dg+ByAXnM=; b=tZP/vLW5a7GGb7+gKeC9cBPcgt
	46XuGn6ZEfjmlkkM91dMRFNfpq1EUsP38QJ+D/jBuU1yJqQS0TKOhGcUizM+0hMyXciJo5kzuLRIi
	zkD2rFmM5o69Xl77OLw6DS1nS/IEDXdV/JQRjj+eNfw2vFx5pZG6sfCAHdeC9SsY2BH3BIRDV5oLh
	Z1r1kQVyVTo8ncVezfKdfIExyheQZRbkRUD3mEupujrAAObfQFw1xO1Vl1wGkIQASccXQSuY0pbJk
	6j4K2QKOBX1Wtn6gYX0QUJ8q+wyFLC5E2woO++eCYw54eyfhnmxi00STRVmPmWC+mSlKzMjGPxi1r
	eARguu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uFk-000000090zi-2FgL;
	Wed, 18 Mar 2026 17:00:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2uFh-000000090zK-1r24
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 17:00:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26A5F44083;
	Wed, 18 Mar 2026 17:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0546EC19421;
	Wed, 18 Mar 2026 17:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773853212;
	bh=i760mwqkf7XS8UNOJTlA5EsOif4zkSFiCYeRZB3e4dw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=YcgZOoRh0A8V7CbduwA7VxDYz6or0Mjo4F17+OGeD/Lq/Tp6nV9g4kO8rZrbn2MRn
	 MCneI3Fg0Le1MFiI+OOQR9jg2TUC/LZOQf6GUO2ex0TOyi/VhytD4EE6n9x+GygvnS
	 iQJoUz4MR8Hj5h7OXxnNxjcpKs8H6oT9EZpiBzY1sMDPRv3661sB6lariujwjKeHu1
	 saRZhAjtP4aDKs8SpjdINcHmv30YJ8y93n8ZVzOWd5xtaOwDR3gCLTwOSKGQXcKFCQ
	 qDO2bGZAVozZzMtRfWQ+RcUp9U5jQ/ZmSK08riIuVs9+QoS9qRGNfxI1PY8wuVqPTq
	 NHNRmRZhR3jxw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCCCA3808200;
	Wed, 18 Mar 2026 17:00:04 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <33f46e61-6f3c-4aa4-9821-a0dca6babb89@app.fastmail.com>
References: <33f46e61-6f3c-4aa4-9821-a0dca6babb89@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <33f46e61-6f3c-4aa4-9821-a0dca6babb89@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0
X-PR-Tracked-Commit-Id: df3ef89d7ef8185fa719812e2d175b83112aa315
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04a9f1766954687f0a1b7a0f7184dc4f86edcb30
Message-Id: <177385320353.796867.6088168841099407408.pr-tracker-bot@kernel.org>
Date: Wed, 18 Mar 2026 17:00:03 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_100013_517364_03F7DC51 
X-CRM114-Status: UNSURE (   4.96  )
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

The pull request you sent on Wed, 18 Mar 2026 15:41:48 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04a9f1766954687f0a1b7a0f7184dc4f86edcb30

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

