Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10BEC3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 19:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rx7UYY+6C0ONCTcrP8wJmWs9LM4+z2QAJf99skm4y+g=; b=4j7VY3py17MstHMJpy27f9i2zn
	PhmaRu7gBj198MphZuE/TUuEoY6zuTvsXVolyvAhgjx43Cd7wAqRUpaLdhvBXnfDGOIZAZpF9Z3Xc
	WCLO5WbpXJBgABLkTz0Ba9TjqbJuN2QpP5Np7CqMCriQQtUIIEVUPeFeTTLNuepAKzWcZke3LI2b4
	bXxKKlaUJbSPcMvnme09CQXjMxhtAqOyzriA7wkyjFb7HHBkGHiR5mEVoGs7/wpduLv9eBBVHks36
	+P23puwfs2b/IuSdAmm83N1rlBUNG7BlYsghM/9MxVZHcRwFto3F5aXNejOksvQgANtHYUgTMGJFW
	wyCsVMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsgE-0000000BnzZ-1tdZ;
	Thu, 27 Mar 2025 19:14:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txscE-0000000BnR3-0fHK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 19:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6FDC5C5475;
	Thu, 27 Mar 2025 19:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F3AC4CEDD;
	Thu, 27 Mar 2025 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743102608;
	bh=RAMEZYMN0fhU9juCLYu0gwCyHolq9UhNycNWv/OYy9I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=LuLFIOv1UGdoZLK8p5CMd8KhTEXVKtIxxEZ7z+rmDNvZaEOdASCVJvu7JGYB3qrdx
	 NLysmq5sS4vR61qXy0S4Iyw4KKeTWChHD2a+9FmpvSSuXC5zXjHwL1Mil2SH9miCIU
	 1rfNuN84Xc96AXWYuqP6Z+Z0Uk/SZlO+TNNm3nQklY88R7g99aTNjXwFxwgtBzZT1x
	 W6wa4oe7F6enwrPo1Vw2hUEeUppRndz5lyAJnfZzS5P7e+dtMh+NZDpjCqaoOLnGv6
	 lgPIeoM07k747lkS6+7Bv6s4xyNhO8i2q4qPJKJS5b3VKN3/st5SMlebtywM+a9FMS
	 quon4Bc1ZoHRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4DA380AAFD;
	Thu, 27 Mar 2025 19:10:45 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] soc: devicetree updates for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <cd6b28a3-7e46-40a0-b846-8b44031eaed9@app.fastmail.com>
References: <1ef00af5-0196-46c4-95f3-7c6b90f3e293@app.fastmail.com> <cd6b28a3-7e46-40a0-b846-8b44031eaed9@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <cd6b28a3-7e46-40a0-b846-8b44031eaed9@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.15
X-PR-Tracked-Commit-Id: b82310b5729ef3ca0aefdc0cf0c575d52f227235
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f24482304ebd32c5aa374f31465b9941a860b92
Message-Id: <174310264465.2176831.17533773837336548574.pr-tracker-bot@kernel.org>
Date: Thu, 27 Mar 2025 19:10:44 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_121010_249224_4D325CB1 
X-CRM114-Status: UNSURE (   4.54  )
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

The pull request you sent on Wed, 26 Mar 2025 18:59:28 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f24482304ebd32c5aa374f31465b9941a860b92

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

