Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A277C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ULHJncbclFN+Oby0G/PlAUSGTTMmtf/dX05p0zxqfU=; b=BeObULsh1PXXZcQzy2a5E3MGvb
	elL4SwL8NfbxQP9lDdvOsTF2tfelpmzrGv48A6HY8+6ey3PVBXkunJJruD0sPJhSwR69QS3T9fgnT
	KnyVFWQ9ZAe/7VTi6yuK9q3e7HkbFFexksb8oGP3mK/TaYYj6i2Gy20uh/FkzlOejsCyEuGW5/m31
	I2JTkciZWFW/BNoLPFIy/So0ohmWA/QbKzVbfNBPGrMUPgfRB2xtijhuN41ih6og8A/E+OTr1YQZJ
	2/WCDhhAZE2staOntD9yeypuJlmf/08036JxUnevVsKreXuDQ0kvYxkA6vv7+ZtBjco8ngpOcWtoA
	nIBfaGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxp-00000004ujU-2uzw;
	Fri, 09 May 2025 21:09:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDTzG-00000004ija-2ZAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 20:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9797A4D359;
	Fri,  9 May 2025 20:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A8AC4CEE4;
	Fri,  9 May 2025 20:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746821185;
	bh=7czinXDnCEWVWxNwkXht/YYDypJNm4GoG0nc7ZRa6A0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tUxtQ+LakGbpTHi0q+mG4WVdS49q7WHfbDIybQSB9Y5OkdYI5kHB3PX/psy2zMfdJ
	 /kPoCj5gGGAdwYZOZOHxfG9LTHpAvLo5NEEmUApPgJgUCZd1fBajr+dK+lpnmS6GQl
	 y8gLXwPL2ttsAXeNq5BkjXF0M+2cqglgCctVU6t6NZNGIrU20Cs8ruHOReMH4+aXSI
	 o9aAZ+ym+U3PEWRB1W1CuJLLpkHKMOF62UxcEBETCv0rXocK2ouiYDaEwrdXDpoJHZ
	 Zhqq+6SoWODzFj4qAprWRLm2ZfcDjpEGa9NennWwnEmfsLriwG5L1kkepF/WhWON9P
	 3rF7i/py8q3Vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C7D39D61FF;
	Fri,  9 May 2025 20:07:05 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <aB42GJfIypFqk9aC@arm.com>
References: <aB42GJfIypFqk9aC@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aB42GJfIypFqk9aC@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: 363cd2b81cfdf706bbfc9ec78db000c9b1ecc552
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 50358c251eae19a2b2fc54b6944e362ef2fefff0
Message-Id: <174682122390.3766575.2205153632850936764.pr-tracker-bot@kernel.org>
Date: Fri, 09 May 2025 20:07:03 +0000
To: Catalin Marinas <cmarinas@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_130626_723776_15585CB2 
X-CRM114-Status: UNSURE (   5.02  )
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

The pull request you sent on Fri, 9 May 2025 18:06:32 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/50358c251eae19a2b2fc54b6944e362ef2fefff0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

