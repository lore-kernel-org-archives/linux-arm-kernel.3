Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C2CDE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=414B2bdnV7pewwUPGUuaXFA0gzrVEbGJRzz6VqMGWLc=; b=g0JD39omMZnT9itA+YDe1LZghv
	/hO97M5jubq+TFRZnT/K30AYNl8Q28RZs/dwSqZNPU0yooqa0ydusBc9NAjK0/j6ilsBCVTQsbVbD
	554UzxPjnDjjm3qN8nUZ0c6PGmS/S+a7cPjcObNaXs1Bg0ECSFCoaa2xfXbgkvfXSMSIeRJOMOuKr
	KVaLtmrwkVYSPOiy24YAWGPeJD5LK4yieMe5BrHGFO3ry4bNjYd0CfT3ATherjnjOvamJvTOXhImn
	flwdf6tVWHrbopXsQWtCEDwHN8UYCaBuqqGHYXy1mC05bcrNIboG/QpPUwDgYN+kXWHLu8wFsVBc8
	BQowh/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgOf-00000002qO7-3sNr;
	Fri, 06 Dec 2024 22:02:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJgNd-00000002q9H-2FEa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 22:00:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4CC275C626E;
	Fri,  6 Dec 2024 22:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6217C4CED1;
	Fri,  6 Dec 2024 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733522456;
	bh=t/6GEzQk8jo4ExFTy0KZr9Z+7vMsm9jKpU2nCTRdKZ8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mj8xPExIQ0lpSzBkPF6xTzhSVCWdwyUmwBDtbtvs/zZI+bl5PwCBnDwOmFb+4u2+U
	 m3SsN121xZLNkAgCjlxEg2wlPJXGCqAqYeCjZtMj6qMiym0O2aprd9ryxmwnAHgasS
	 miPRHjp5+6y8vUYdrRqCGnXMJB5UTFCf2X25waQLlheiR148dCMfVbzEHjoI52CA3z
	 EMlbfWvtdLuTKmHX9cLB0Pwd5OJvtZdW54WJEKmFuzDURjtGFb/Uo+TBFLcVCV/DNv
	 Lped7mNBehxciDz7hH18OArMYgpmd/jY+YjR/uxgSqxxO1dqI56nqlCwBW1ZYt62Jo
	 x921MXOsoPsNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EC16E380A95C;
	Fri,  6 Dec 2024 22:01:12 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 6.13-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <Z1NCFeR4iBm5Bxqg@arm.com>
References: <Z1NCFeR4iBm5Bxqg@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <Z1NCFeR4iBm5Bxqg@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: d60624f72d15862a96965b945f6ddfee9a1359e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f3ddc438a29f78f0642bfcf84407c236a0b2bdc7
Message-Id: <173352247159.2810195.14014493447586884302.pr-tracker-bot@kernel.org>
Date: Fri, 06 Dec 2024 22:01:11 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_140057_634124_D078A6DC 
X-CRM114-Status: UNSURE (   3.91  )
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

The pull request you sent on Fri, 6 Dec 2024 18:27:33 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f3ddc438a29f78f0642bfcf84407c236a0b2bdc7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

