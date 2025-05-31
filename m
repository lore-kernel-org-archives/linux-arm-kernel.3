Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9791C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evD1btTV0/dSKeSdjD969Rzf+J9+DJnd4gJ08HsTC3E=; b=UKIBGrE5NcuNKkViMKlS0Y3WfM
	56rDvN7JNDnfMaBvm3jFHg0+M/jDIIC5BjYjJ8nXBMHPq3S9W4YUkX6nlH19+Bfs7JbXsXAX9tJ8z
	RCtHmJlW+Tha0znjdHNoS2uVZzCDk0sLtFRJgJhriXtyae/LJGBRRgNhOFqTJSoOUTy4iP+DHf9d9
	RWVs+rLKIXvd7JflHI9JMPqcdXTxb+2dXQmEGTwAlF1Y9Lymfpuuf0m1ADuRroLulpCosRa1HmSI7
	wNFO9w9ziKiAjaCHzy//Fu9CRoi59sd+zDlW7RuHLDoCkAqRRuPdPOEu5kypipgjTrfNKZg33JwsZ
	ZP32hXPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOMN-0000000406T-1UI8;
	Sat, 31 May 2025 15:42:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOAD-00000003xpN-1vhE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 15:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0320A4F04B;
	Sat, 31 May 2025 15:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB99C4CEE3;
	Sat, 31 May 2025 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705424;
	bh=iiL5VxW3Twj1IIHwwMPR65Wl/S/cUTQU/lOhciGZy9g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=khq+2SyKs9dPTLUaY0jJZzmH8OgkAySXMuGx6bADtwkTT42aUJ45lNIUMS8N/jgGC
	 sWHt0Hcel+D3jGA34xiAlh2jRJdZ3iiMai+5pSbkUKt/b4OQhligXaK+N0grYy0ZUm
	 5JNcMxZdnxE2HX5vAm1DMUytk73mdRtZo3ebmcmc36bqDUH3YVD+MChBiG+Ey930O+
	 xUmXq4frg1BsGB/jmM1nWNh22UvJL5SIh+R3kw/LRNGXIH49nJ5fhRItkIUgCsZYbW
	 8oG110uWvjIHjSl9DwzZqxXe9vejnYnIFrHfZXUPzKU75XpVtrXdmeDhyeyo0lnwBf
	 kmi9x5DQ3t5QQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAAE5380AA70;
	Sat, 31 May 2025 15:30:58 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] soc: sophgo devicetree updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <d98adabb-a26a-4962-af9d-5707e1cb3715@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <d98adabb-a26a-4962-af9d-5707e1cb3715@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <d98adabb-a26a-4962-af9d-5707e1cb3715@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.16
X-PR-Tracked-Commit-Id: 9bba618694cc905b898661c18e3e40955573ef5e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 31848987f177a6c0944fd0254a55ffd7c52a8c50
Message-Id: <174870545744.163157.4670024390186583728.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:57 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250531_083025_558139_BE1555E3 
X-CRM114-Status: UNSURE (   4.49  )
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

The pull request you sent on Sat, 31 May 2025 11:07:48 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/31848987f177a6c0944fd0254a55ffd7c52a8c50

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

