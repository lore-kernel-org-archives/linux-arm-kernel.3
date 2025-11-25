Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FABD0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 16:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec+PJsFNScKvid3I88r05kROVZ4/3JFFDun+if0yz3c=; b=RjbQ4aulTZ71kF2uG+lCBJZfUC
	4BThY+yTibT0BL8cBrZifLwqFE8ouxhkN7k+BIxhibAM/Ten1AvDTLkWR3d6lkc5P1TC/TvSPUyEN
	E+gPa3VZh+OmCds0nyW/npgUsepbe3j73+MrgcClVouOV+aDA13+/L/ppAsdo3Sbp37isTnQ8LmuV
	kHJioClpsv4kdsBI2C4dl6+9uu76j/Hx1f6mdmHxckHuLjERFHEIggKBxfiaAmcFeU5YeJqIFO7q+
	dy8no4fMStILNKu+s9x1j9oklDBxhHRZzEvBKav6DNpMZQGLq8lMjg6wZH/BO1oebGZbQwFn+C5pQ
	siUfrg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNw4u-0000000Dbma-28Z7;
	Tue, 25 Nov 2025 16:39:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNw4t-0000000DbmT-2sgK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 16:39:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D41CE60052;
	Tue, 25 Nov 2025 16:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F33C4CEF1;
	Tue, 25 Nov 2025 16:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764088782;
	bh=iZThQimlsG8TKf8OL5N1/FhDLMdo23++qLMrXiXLtk8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=g1/vOXSZCwGZaCMPNAmXKnRzLFBmx8j4bua4bdiOJd1/9LohGj4iNLeXVlMwj/OPp
	 92rIrqjqWjv0hq1BhO7CE32ez4RKMsXWgSEzE3w6sZTBgNK5TLldtopDr3lot4VMcK
	 R/GUcdHoyNOIsz4hlemBOBhdlKkeBneGHcmiDqNe4hi8sH+ykBRsnTOGi0kOyykcLg
	 Xgfu4Q7XvY7GtbgK1CTRLK5HxZallq+mtACq6QdH1+KfPP9+SluD1pQHhNvDq5ciQE
	 gZ1cqskdY+n53mLxNkMipzhT36VkCtqIXYIhlDCvA7hnq2KI/PT6/2iuca4oQBikVG
	 iLWGWgyjD5FXg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BE3380AA61;
	Tue, 25 Nov 2025 16:39:06 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <aSXVXLWDyDguHgiA@willie-the-truck>
References: <aSXVXLWDyDguHgiA@willie-the-truck>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aSXVXLWDyDguHgiA@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 165eb13e485c5c25c7cb276ac85f788a2bd200cb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 30f09200cc4aefbd8385b01e41bde2e4565a6f0e
Message-Id: <176408874468.833675.2451392502687434129.pr-tracker-bot@kernel.org>
Date: Tue, 25 Nov 2025 16:39:04 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Tue, 25 Nov 2025 16:12:12 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/30f09200cc4aefbd8385b01e41bde2e4565a6f0e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

