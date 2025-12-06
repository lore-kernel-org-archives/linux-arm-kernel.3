Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A9BD3ABD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 02:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ao04JN2Z8h/Wv+1fHmCi+sYg/X0Ob0b3P45UJIXIazM=; b=ZyJypwaLasvezKiyHwY3JOXqh5
	/e22DnRCkruBIw4O7fwNRBmzHl71sqmMktPg+lTbjlXrZwcuTVgkvYiw6U37lWCZG365YP3kpCZTG
	jiLRH86VGJdyRGv9dQ/fcWYXpBClrFy480AlG4ItPFu6wnIBPgO50Il533DrWW/bFED2t8lDCPVI+
	kyCaLY7bMLEZxlRT89LCkSyu48k6C3EBwx59gzZ2+fh6zOIZwWZDgUUCYN+S8PtXvyQf5gxk9nJDe
	2dcqWfx2SzjR6lcdnGigNUfbbFnoBPgVnV0q2oZKHR02O1VEW3NxwlGpIA/b7qTQ9507XfHcnLT5p
	4LiOWvBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe9-0000000ARV7-1i34;
	Sat, 06 Dec 2025 02:03:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe6-0000000ARTZ-3j1x
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 02:03:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DCF2B60156;
	Sat,  6 Dec 2025 02:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93244C4CEF1;
	Sat,  6 Dec 2025 02:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986617;
	bh=sOxfTz5XX2KHn1yU4OcAJyg+SrCT9QXAYx7dCLcwwzE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wef6TiQNMCPPpKeuLTFqjWlhMe7KMbrFs61vvEF3/Uc/BWbW+Na8075aPnP+pMfpB
	 fvj9NPkIF4QuCjAL7PMsQ7tZI5jUFMlMpWS+Kol3shJwDQlXZi3KhvLjsdKkO+brCK
	 Yv7gHQzpVzc+592zzHW9vNE3J/L7TDLG/S0mcmPrRsotM4VIJjALzGqC5qQzyHeGD/
	 OpB3Ca/cod+CQdjUQKD2emSjCiVq98Sx2O/1jrex9gsKniw8hBVf9ZV8pPzVCIk1Yk
	 qaP70fvRwrn06eF1BEtMXttNIHHmnzNFeQe0JagfYj6yrmuUygTGVCSFbCbivpF03F
	 6bcvXzKcKz3Lw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B7643808200;
	Sat,  6 Dec 2025 02:00:36 +0000 (UTC)
Subject: Re: [GIT PULL 5/6] soc: driver updates for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <dceb9f99-cb69-498f-9717-34e3f28c8fc1@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <dceb9f99-cb69-498f-9717-34e3f28c8fc1@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <dceb9f99-cb69-498f-9717-34e3f28c8fc1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19
X-PR-Tracked-Commit-Id: 4b1e81570144f03521482f7659fee060d8f63481
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 208eed95fc710827b100266c9450ae84d46727bd
Message-Id: <176498643469.1925836.14273165403476324157.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:34 +0000
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

The pull request you sent on Fri, 05 Dec 2025 19:29:18 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/208eed95fc710827b100266c9450ae84d46727bd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

