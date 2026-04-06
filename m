Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECC2F46C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCKJcvwdJOyRT4Asc0OHL+oRxWGefQ/ckPTybH/rQVI=; b=Rx7PaLVPf6uzeFTiZj5fUpepIO
	sn/wftmo8s+C9we65/Tjlsm5pHj5wq243zvjl7nWIDwMrgqRZqUNd4Hhtc7DKV1qUWeSrE4TNYTIz
	P6LY3maCU0no9I5EDYTCxIrRj3Pzo5be1YEgvy/BPkl1dGPal3UL5WDMKeWmyrhYd0mIDXvdDVH7t
	chtqAu1gGABfg8thvKmXG6gltEJzMMn+gA/22coFSiHuiLJ0S+g3JL3tgDnZkoDPs98KrStbGcxaR
	FqVLagphJ1O2uq4vkPpI/ZraUUgt51tuGAuhVw6yfoblpmMvCUE1Y2yDUy/q/dvLsUILTcdn4/exw
	AmOm8SjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9nRl-00000005LZa-3rjo;
	Mon, 06 Apr 2026 17:09:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9nRk-00000005LZ5-2PNL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 17:09:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88E8060103;
	Mon,  6 Apr 2026 17:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBBBC4CEF7;
	Mon,  6 Apr 2026 17:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775495346;
	bh=q6gKp785JxKchbmVLWw2lzXRSHeWFhSO6rZ0e3KkhRg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Yszqow0S10EDbtSVWrHM1agNPCadMSsQttmi8+d/hcX+L0BQvWN9zqnOSkH2gUprD
	 v+DacecAAoDFqWV4/F1eJkOxqGtOHHVZiqWZHdmWPbAMeuylMM1Z3edh9py+DaiOIm
	 BxngS4cJUfdx4BKqYi1GOrqEpFNq3r3k7wQVR7A0+e8xBiBuh5RDAs2EwIFbc0D8Nr
	 gpOiJX5X3eM58AM+YgchV7VtwzD829PeUm5acHQXM3MaD3MdDPfudJgzUyF2SydGyr
	 1hqm/qnfTn/Romv58R7Glvod1M2aie3FtW32B8lk2tiyxdc1DLbcwHHY1CjRu/6Uke
	 YMRL7mr6IQmbQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE513809A35;
	Mon,  6 Apr 2026 17:08:46 +0000 (UTC)
Subject: Re: [GIT PULL] soc fixes for 7.0, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <23df0cc0-55cb-4c11-907d-f4d8955c6aa9@app.fastmail.com>
References: <23df0cc0-55cb-4c11-907d-f4d8955c6aa9@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <23df0cc0-55cb-4c11-907d-f4d8955c6aa9@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0-2
X-PR-Tracked-Commit-Id: eaad992e3fa8086db47f2cf05498af518ca5edda
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bfe62a454542cfad3379f6ef5680b125f41e20f4
Message-Id: <177549532487.3192209.5710276572840287983.pr-tracker-bot@kernel.org>
Date: Mon, 06 Apr 2026 17:08:44 +0000
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

The pull request you sent on Mon, 06 Apr 2026 10:03:08 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.0-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bfe62a454542cfad3379f6ef5680b125f41e20f4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

