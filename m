Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C3CEB5961
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bN/6B2lYjShD172LfoEUFCwrkEfdQQzS6q5j9EsCz90=; b=mjTwXeT0p+rV60GLNFNT0hYB0w
	5TwZ3D91fx3JGM0DXgChCnlV9bfJBrX3IEtpDbRaYThuI6p8RVUNWEj/EFU3Vzuot/cJOTECooPJj
	F4SGCa4EMIm+oq4hXxA45l9yiTl5pJZhWh+Q7eJ1qGCE9tyPSBPZESsYt7ML3EnXwu0nSVtkuVYdc
	+QZ785HjzFv+pq9jleCTtDSpCJii6dMipOAAkROxOomn2Pup3yJAmtoU+q662jh6hD0c2O4gL2OjJ
	MJ+N0t7Ma5DNlELGGv9+s/fEKN3Ah8Ub4eG+KW586gIyrTooWg01uUjpKdqGfySGoL9vNz9A+R9Rj
	Z3HyfUeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2cZ-00000000Dtb-3Qis;
	Wed, 11 Feb 2026 05:18:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2cY-00000000Dsl-2OPV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 05:18:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 019A46013D;
	Wed, 11 Feb 2026 05:18:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDCAC4CEF7;
	Wed, 11 Feb 2026 05:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770787117;
	bh=HGKpmO3WORsOmpGiepKUWk2K7vzNd7+196hKvaikgeI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=CQFexxlqoulQf34KxsdXUAjO0isxEHkmImPb3vaPHbKRMxNzTOjjdLYOwOiuP4vnx
	 z4H4jekGLWphMCbQ+vwxZiuuOpHKtCr2bTmck3wrt0OCvdEA6rhmHjjl/k8Ddq7Pg+
	 qq2XMnEL7eixvSYzF39K9GUat10KivIFpMDTUZzXVTUr9ZlpUs3UjXGSZihJrBlfjO
	 WdQ+ipR40KowEG0iYm70zoz3k39BJyOWT0NRD6p/c+cKjR/t3Aur9RJKYIV4eB/WK3
	 vHFIcknY9DZ9bnbAoGCy3UuYE+KJu7tPps4Lg5RwgLIoP/f/OMYB3pyHvaCnk3nShs
	 vtCcKu0qSoDuw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AEED380AA50;
	Wed, 11 Feb 2026 05:18:34 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: arm platform code changes for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <8964e89c-0cf1-4184-920f-5cd852ba782a@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com> <8964e89c-0cf1-4184-920f-5cd852ba782a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <8964e89c-0cf1-4184-920f-5cd852ba782a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.0
X-PR-Tracked-Commit-Id: 16868b35b915a8a0fc810cd14b3b4927a5fb2213
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 60dc45dde44e0b5c433d8db574daf86b59eb6dc3
Message-Id: <177078711271.18664.13401446700095291121.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:18:32 +0000
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

The pull request you sent on Tue, 10 Feb 2026 18:08:25 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/60dc45dde44e0b5c433d8db574daf86b59eb6dc3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

