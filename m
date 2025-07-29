Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192ACC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQMXYfJZ98I84QEREzqh4OLkxbMbF4QfAfq0QFT2or4=; b=gcDMbyNSBSWZ0O+B41JV1GBzap
	JDD3Hi0UjQ8/Y4nPFZeSdmqA4tQQP91wLlYCP4fV34dWYOhsoXa33hdQ1QtMYAmDgwf6eI1swGzrR
	gDoEIdbCuFoJGPnWPCVomNyVg7fKuBAIO3qSBDJIxqq4WU3AmjSxrBnVBj77uOjSUPHTUUZpMe0RQ
	Sgqn5dqEuLAXTnkP4TVCeYiJ9ChuySsRgAaucab4L2j+X1cUTspcH52L+JjPipREFTTvsbZK8NJ2d
	HqD4EbXtjnmDn9J1sGZnH57abzVwMWobkpDh09gm9fPerRQICseIFz/qGSIs3bj1HPJbUv+we4mC8
	kEFeBn4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpP1-0000000HUVT-0wuX;
	Tue, 29 Jul 2025 18:50:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpFK-0000000HTIi-1yaZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 18:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93F5A60209;
	Tue, 29 Jul 2025 18:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6574EC4CEEF;
	Tue, 29 Jul 2025 18:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753814417;
	bh=HwMOw29Nvr/6NOTZbdz/XHDZl3bQXBT8WmERD6AYZaY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=i2LPOI8QEMVBOJ5FIx3IdcbEEm3PEwodE/BSAvsuQhqMvjBiUqz5ahLsNQddHFydP
	 ljTOaJlP23n2cxJ6WBXAXMLYFBWrgH25WDOBzXe405eVikZL0y+1UR9QrV7ld8VeOw
	 HA7ogL+C893kkXF6pcF7lTSyirPTb9/jQVmVvX5UIZkxvXah3dNd4Y/EIEnZegUtsS
	 VXn+niYQETjXEgTNw7wqlnwgbuzoIQn6R8zgCxuVXVrRd5i6shnCyS/IFpsT8vYXFW
	 3RnkU20wzVrT6Eo4X7mzaPcOzSQpjMrwt296a0zqT1ccXMBVb1j9GH/iN39FgLMxE/
	 a6z0vmw4OgnaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB38C383BF5F;
	Tue, 29 Jul 2025 18:40:34 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] soc: defconfig updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <b64f7af2-f61d-4ebb-9815-73efd8a1a682@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com> <b64f7af2-f61d-4ebb-9815-73efd8a1a682@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <b64f7af2-f61d-4ebb-9815-73efd8a1a682@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.17
X-PR-Tracked-Commit-Id: 5cfe03e1ca42fa97341fde7a8ad53be86a51d789
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4c10d2221122a62f7c181f0c433bc43bfd6f5d3d
Message-Id: <175381443371.1585410.3122912678073878928.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 18:40:33 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Sat, 26 Jul 2025 12:32:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4c10d2221122a62f7c181f0c433bc43bfd6f5d3d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

