Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A5ACA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 15:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZFsMAAio4MyynFkVOwcTl70yzlCaaP6RPy4jzGQ2V4=; b=uXgA0ykSUU2qEFx9E1LslDj5my
	AyDNDXtak8czEIpdHLRSsAY0h5wacJmudNukqWrn9ZQQsKxrabmgk+GTHhMc7882sGmMsPOtslpnw
	CQYRfY6PPS1R2/r0YrOjamH+csP1q8toBw2VSVs+7Nt9j1GAHMz3Cm3aRzkACkHfDDTLF6mHKjW4j
	GQo8yU0xBM3xWldPfkdaM7h8OTgGqUI6oSyw6LLSQx2JgP1iFKw7DGGzexLCr8KkW5ic66z/T1oSL
	yDagCzzghiWHwYXxK5xyDANohMuU9SjtuGG8419Rg7RjWBeXkD96dN+T818W2oLFoIbPwWZzn93/L
	2O1I5z9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1aF-0000000DgHF-1aNi;
	Sat, 03 Oct 2026 15:23:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1aD-0000000DgH7-1lFY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 15:23:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EE7060D82;
	Sat,  3 Oct 2026 15:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433A31F0089B;
	Sat,  3 Oct 2026 15:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791041008;
	bh=dZFsMAAio4MyynFkVOwcTl70yzlCaaP6RPy4jzGQ2V4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=bDgLwrOlpJKHrIZOIejcTJ3yI3BC+pP6zepnXJE8NBinApH5b1fk0u7UuJ/tNPopP
	 cQHItu/XDEDXLqUiQPDZ+ilZz9Sk0YgyJCAWlffm7/DU/bU3QC1GVTCwOKo6nG0kJy
	 45PXr3C0KUjo83d/Q0WgpuxYS/FvXQn2nBhpH8eUzAyFPpK1TTSNJEV6vynkFcxrK9
	 HYbwH4ww4svosJk+45G6ivZFmYv5Ssjvm+THtK9aC7guy4PaPP3TevsUd9ImtyeAc8
	 9Phj+9AMKyc+pzcOKDC3Y4pQCw8lSwD+ZGbZji28b+k0FiEeJ+7dIGxcSjgq5KjLAc
	 6qwCA6lIinvkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3F73924470;
	Sat,  3 Oct 2026 15:23:28 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <asC14CHKGoRQLv6n@willie-the-truck>
References: <asC14CHKGoRQLv6n@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <asC14CHKGoRQLv6n@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: e060d9069b49fe55f38057dfe592068014652671
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c5adb6c8a26d653fe1d0ee52908d998f7471e9eb
Message-Id: <179104100695.114271.9380561947647238848.pr-tracker-bot@kernel.org>
Date: Sat, 03 Oct 2026 15:23:26 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Sat, 3 Oct 2026 08:59:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c5adb6c8a26d653fe1d0ee52908d998f7471e9eb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

