Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A468BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 17:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7ZE92hoHvdaouaIo5MEorqtXnwDKTGlSgpONKSgITY=; b=VNWTggvwl4u0iNc8C1AsdSi0Ty
	7QxnJ5tXOC5WOed4wHc4q6G+rmiF6QxUpL641dTXbKi2rtuW9p15LN1/4oowa2n8kuLBqM87hPMNS
	1ftVNrCK4mMJ4R3CpMeCmu+3uafvyZq1ReAND5hTza9yUcc09ahi5in+k4NgbTptPzhCqSf/AOjHr
	t5o4xGGNx+UwmqkO/c3OGfLlpiXobgPv7Rt43SJ5JoRHdD9cTUzNs3AAND7MrTkh53YMZmwXCQjFv
	YfqsTL8jbNtoJ6v2Cv9zzh+ko/ETDCgbIf6Bm1dygs0jU15JhPK4xbCBLvKPqjmfmLkspMKrp4NYN
	5jrjIu6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kQN-0000000CMVl-0nT8;
	Fri, 04 Apr 2025 17:01:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0kOc-0000000CMAM-0Wdl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39E17450DA;
	Fri,  4 Apr 2025 16:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9410BC4CEE8;
	Fri,  4 Apr 2025 16:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743785997;
	bh=dfIttBr1UBv1XFNCaNT+D9E45dvWVGkJ4fwbbwmxtlY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WclBQcBDFqtTubjvXxw+Kpg3f2FSKObSD1fAOYFtOhuHU23c+BXV4Lnjuy4B9sXKA
	 W81nXUKhY+QpqRzf32hyd6mu0lpHND90EB3H2yA5iB3j0o/XocG5fbhJuyy575kdF5
	 WAbB4Mz0/bsd8BUMIYUakXbFgdq1KVD8KzIK31p9wGVVqNDNzrJgWmmoLaMtAxNbIz
	 5DJeMYBLLT7m7liuvmob4EKejx9JtBAMPJjN35rNo+kq6lNIWb7Vryy6js4XWGSK4N
	 Q8PNIVdikC+Rz1OtdvMy4pfgrlK4TWxP+7QhENIUgOlebLc8jrVWP2FzxSZ1rI5lUY
	 JA3EEsIAFwsiQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4BD63822D28;
	Fri,  4 Apr 2025 17:00:35 +0000 (UTC)
Subject: Re: [GIT PULL] soc: drivers for 6.15, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <cfc8fd0d-9d32-432b-a5ba-1477265670e0@app.fastmail.com>
References: <cfc8fd0d-9d32-432b-a5ba-1477265670e0@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <cfc8fd0d-9d32-432b-a5ba-1477265670e0@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-2
X-PR-Tracked-Commit-Id: af34290cdc60a289e43f38a87621a3e9dd63c67b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a05c6e6694c1601bdefd160332d3deba8393644f
Message-Id: <174378603455.3328120.9533370932633245120.pr-tracker-bot@kernel.org>
Date: Fri, 04 Apr 2025 17:00:34 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_095958_179410_6B30867A 
X-CRM114-Status: UNSURE (   4.80  )
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

The pull request you sent on Fri, 04 Apr 2025 17:09:35 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a05c6e6694c1601bdefd160332d3deba8393644f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

