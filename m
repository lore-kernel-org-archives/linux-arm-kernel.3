Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A7CCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 20:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFTtr1a4Nc6rMkWfly5OMHeOwOpj87d2rhEO9whfhRI=; b=kADb5NrSv9H5Lp1sFShVxTTtSa
	qP5gnx5BlLLQlrzsFSl9PQghP0ARsVimvx0k92QPUvhwQElxHRni16n7+PNhanyQ1KUCn8SeHo0d/
	oKhMzym2D3SMAIZco7IbB8kT5ox450gEk+zSSDyQSxmd6qCP8DKuQJveDBpgK/cw/slcOsQjcXeVl
	5gmJs0DE8aAZ5FjVA4ITzxRQiaAHCBpGyvrlIRWp+CHbgstgCIrGHOE9MejoGNdFw4JtCVSvl7GBQ
	rxhT1jTy3OmA28A8fVI7AW8E7pVPqUnsT0e4etXaRXOWodGSTX/69b6bLhjMSNdxXYirXr/6OmE99
	574zL1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmUA-0000000A4YD-0C3m;
	Thu, 11 Jun 2026 20:58:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmU8-0000000A4Y7-3tCp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 20:58:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F8C1601FE;
	Thu, 11 Jun 2026 20:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DABF01F000E9;
	Thu, 11 Jun 2026 20:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781211523;
	bh=UFTtr1a4Nc6rMkWfly5OMHeOwOpj87d2rhEO9whfhRI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=kOM1yLePdZXw93nw6vS5RaE74CgJusUVEEanUXxwwzEXtujfm2ZdWloBk55fNmH8V
	 SpRaK9bYBmsvqXaigDw469yIxEQqU56sij0q6o8NH6+CwhH83tPksTF7dH7SbEgnW4
	 KFGGjLl1FTzgqCuXUDRKFGYo6XbJ6R8be81cjuODMqc9vNaFzoOrWpS8tUkfpaBXI5
	 7CRmfeaWSF29HWCsL8um7gStN8xblReXwshTQYp1Ej7jt23FLDwOCA9XXlgyUU8k3F
	 hphX+hBNwOznzE4PPaE6mS72/0tz4PpKhiBXdhbmc/TtL0HTHliX0WXP6sWcSvvpL7
	 y3EYrZXjQnY8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5691F3930FAA;
	Thu, 11 Jun 2026 20:58:42 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v7.1-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260611110557.120619-1-ulf.hansson@oss.qualcomm.com>
References: <20260611110557.120619-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20260611110557.120619-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1-rc3
X-PR-Tracked-Commit-Id: fba0510cd62666951dcc0221527edc0c47ae6599
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 79f2670da86722d075633d20fa57418994ee6940
Message-Id: <178121152085.362744.15549221223768274381.pr-tracker-bot@kernel.org>
Date: Thu, 11 Jun 2026 20:58:40 +0000
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Thu, 11 Jun 2026 13:05:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/79f2670da86722d075633d20fa57418994ee6940

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

