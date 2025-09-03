Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1561CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/bxOd/pvA8nkpdvK621llerDyTWRW+ZZwj+f7ZhNYs=; b=PksJGAZ5vN5RumcmaPYBVw7zLk
	4sxRWMAHE8SBkY8fMGjjzBKWXYF6itAgb2SN9oVuqtmpYNIaUPdUOIGeVe69eO8P5NyqPLN/In2wt
	DRiss7bU3vqsgIrxHcdldQ/zF0yobFqP7gLWW+k/37dbV4Z+oSAsHSPjfkvQFl9xZY/wO68XTFNQG
	8/Ji4hF3VydgRHoAong2X+1AQxsW3OfjiiJURqXIK4L3GEEyMsGgqwn+loZhOw2jBLaN0V1JYIJpm
	w1hvFKrb6WwLP8MMBT5rvNXVY9Q1BR4FiVK7JKuzrCZVAXF6uxmLgI/vniiXFyp35Uvs2gJoGDFAz
	no3lifTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bi-00000008fKt-240o;
	Thu, 04 Sep 2025 03:25:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utvPR-00000007ixw-2TyK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 21:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7ECEF431CE;
	Wed,  3 Sep 2025 21:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD26C4CEE7;
	Wed,  3 Sep 2025 21:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756936372;
	bh=rOo20K73wsMPXw6ozpBRygvXugSlqznRaSINt2TqRhQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cNUuf2o/403/LVG/8dFO4Xv6QNFGK4ienYZpv+kS79bUrukdQNdaOdogdzIX2zOdO
	 gnbqLrAE84uFCYxzw1bV1998vZ8SPZ8FsrjC3akJwyVvs2oBI5ZOIvCmOPliHQDz2H
	 n2r/SPWV/OTWdk5yooCLew/Oy5N1kIi/YKHlROEo9oqVqXZvwPpQ4nymyKn0l510mi
	 4cfxIQGZ+tKirqpEOBwqG//U4GFZhwy7QzvF5UrQ8vzaFJbQbS3sqHEHq4Hpf27Ne0
	 ViWrrT6EA11//oM9Hqrr3XfjtMk2UW7ZHK7ZEgLwqMX6LjGpk61IwAumQeYGllKtuy
	 c+FeOK4nGUfyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF92383C259;
	Wed,  3 Sep 2025 21:52:58 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.17, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <0baf22fa-281e-4f56-a807-917152f0bc79@app.fastmail.com>
References: <0baf22fa-281e-4f56-a807-917152f0bc79@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <0baf22fa-281e-4f56-a807-917152f0bc79@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.17-2
X-PR-Tracked-Commit-Id: 875691ceb8bd619de7791243b1cf6184ab534865
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b9a10f876409bf3768178f4aded199e193ddbe33
Message-Id: <175693637733.1212561.11065269005033782414.pr-tracker-bot@kernel.org>
Date: Wed, 03 Sep 2025 21:52:57 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_145253_649493_3DC7FB37 
X-CRM114-Status: UNSURE (   5.47  )
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

The pull request you sent on Wed, 03 Sep 2025 23:21:19 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.17-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b9a10f876409bf3768178f4aded199e193ddbe33

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

