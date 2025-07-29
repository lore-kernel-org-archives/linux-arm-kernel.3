Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6382EC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gz/WENjGCCqLpzNcNFj75N9Iw/zwNxqTDt4q8oOMcqE=; b=Ut2MGr9c7089vRnMn7Nw00cZcl
	tbgMlwaKbIgAr8LMjzMm41wc1GS5P8+ldqIjNhq71+/Apu9zpEnK0hgexyzmr3hw5Fd7lvQ/jGT0B
	X6Utzgq/fMCrIHHupU421j8llsArHr1VBqLGykrHzv1L/wXWniT4UK+BOvsCactSB8B85NssWtQ2R
	KSU2YvwiLTy446ta/F9q4gJDk1IFexTOQ1K0pUuZkdL2k/Hd7vEBWH8YcI2/poYefWzy2U6sdbRtI
	2u/1zkYoFJ/aM1kUk7ybjxUh/SUZSTAjrp84VxUxw2i0QtJzAGnf2Gf95FUq0p3Geof4DelQ/nGWj
	6hU0qvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpRS-0000000HUqo-03aZ;
	Tue, 29 Jul 2025 18:52:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpFM-0000000HTIo-0Kms
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 18:40:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DDA7A54A2B;
	Tue, 29 Jul 2025 18:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1910C4CEF6;
	Tue, 29 Jul 2025 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753814418;
	bh=1dmaPs+FhXJ+7saYTQxgTlhRkjHB2WJxPj19M/N+jCE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=bulPrY77kGPrqj/hCo7gi8ql5Didf5Oz2elUjF/zVthzKlzKJh2In4iuSC1aiqi9i
	 LnITHoO6Cur882dajCgn/XAg90WFtkGP7qXb1DliDQRMyisSl/Gl17aSbgyI2bhTSe
	 spY6XJsqEx6HcwR5DseGVm0zY1cA1kZZgfHOWM8eQrT4znZdmLtPIuZpps1iZoruwp
	 VMbSPflfwHcOfUNf9uE1U9VvU37pW1vF5GaBzOBeSL4w6D4uK1XqKW14VP/0ze2wls
	 mrr7tBKYYCswkhXJYNik4y7hns24uJfsv6UdJgmZxE8PeQC9hxJwg5DJV0o4iiMukb
	 bNf+XJG6pOazQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 73BE5383BF61;
	Tue, 29 Jul 2025 18:40:36 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] soc: arm code changes for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <fa83a407-a48b-4a91-8b06-6c9b6074f735@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com> <fa83a407-a48b-4a91-8b06-6c9b6074f735@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <fa83a407-a48b-4a91-8b06-6c9b6074f735@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.17
X-PR-Tracked-Commit-Id: 8c1f5a11dad0a9043c17c4c0240f394e481baca6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0919a5b3b11c699d23bc528df5709f2e3213f6a9
Message-Id: <175381443534.1585410.6519242830135316351.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 18:40:35 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_114020_182511_C94CEAC7 
X-CRM114-Status: UNSURE (   4.95  )
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

The pull request you sent on Sat, 26 Jul 2025 12:32:56 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0919a5b3b11c699d23bc528df5709f2e3213f6a9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

