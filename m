Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF28D743F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 23:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auBxib4CoavQM86gWNYEDHo/cyAqdA9xDVMasxCsD60=; b=1znJLN+Ozhf1XY4Kdm73iVyhay
	GvrIiMHl6GOYTJFrsiOybAA2hfHcY2FmHYN8EEcbZBqVU1GG5xCMamem+U4gHHEBYR4EFS6MfE93G
	NTxAkBc/0Ojoi1pBT+97VlfLK37we22ArCKXhqeoWfULQiEoAjots++f4h2jAJZhWXvO8F43jPjCX
	/1T4aiDlAEDlM+3xdwt9SDGgUHZEYklw0oHQzwXm7H2R74eLE3P01hmGr7Kuq+YTU7FcukOHMtKSq
	6tvfvLj0nJs4TYlLs9vCd5iCFtJw/mqGpNW1u8dYbbwEblDSDYeZL4nAoHnrCPDesDi5Cu3Y3IttA
	IacUaEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuUP-0000000GRcA-16Q7;
	Wed, 20 Nov 2024 23:52:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDuSa-0000000GRM4-2pHY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 23:50:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4874C5C5D2B;
	Wed, 20 Nov 2024 23:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7A4C4CECD;
	Wed, 20 Nov 2024 23:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732146611;
	bh=HQ5A1yokKPCHV5kFD004ybZN4KKPgyiDvQvKow7LwEM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=V6izKz6M/8jvz7usGh9IMmiBql2nzbS28yC3Lkg319TrcyimDKrtLIKbAMdcKZ3xB
	 wEt8vIjJ6ssWHcjp6W5JkKsZCxG/RichdyXdOlcjW1a1JuFQdKGQrjkXgojpUi1alC
	 hV0p+0mtsNsv2BaCt3jj9WOhC3dwEnwOw3sdiTTN4Dz2bjmDCnF77r2oqs1XZ0Zy+n
	 8yh1wpGga3nfbHdwVEFMKbJkQj4HO+UyDXxc7OvLdt8EPdDsCZsp3P8zzP0oM+XGUM
	 hJxMVmLRhMxHN+K9j4GIZdb1qyGVA/aBAz+qQb/T6xEo4ThJI0Hg8o9OEm06jfAY1S
	 auWo76uSEvi9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB5193809A80;
	Wed, 20 Nov 2024 23:50:24 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: driver updates for 6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <0fe1a527-1c58-4ae5-963a-3becfb8ba28a@app.fastmail.com>
References: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com> <0fe1a527-1c58-4ae5-963a-3becfb8ba28a@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <0fe1a527-1c58-4ae5-963a-3becfb8ba28a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.13
X-PR-Tracked-Commit-Id: b77587ac51d2fe4b9d5751662ddc083d19153662
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 14d0e1a09fe97a7524ff36baa695900cb0c10c23
Message-Id: <173214662369.1393168.4637739267331948761.pr-tracker-bot@kernel.org>
Date: Wed, 20 Nov 2024 23:50:23 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_155012_752401_FCDDF477 
X-CRM114-Status: UNSURE (   4.72  )
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

The pull request you sent on Thu, 21 Nov 2024 00:01:18 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/14d0e1a09fe97a7524ff36baa695900cb0c10c23

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

