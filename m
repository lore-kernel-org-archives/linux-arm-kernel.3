Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E321EC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4bzm00zvEaFAPsu+rlxZVavvC2QugQbZMzQyLJ4fYQ=; b=WR+pvNDonEmdLa1Bl/oLZ8m+K3
	t7WYCHBTBLgkylXajTgtz7uvvYxTdxyG8gEGejPHFc8Cu3IVcBT/VCKsWTfDldwQGxgM0JHzdp+xD
	4VBIxcwjJw13Rv6wPDokzTsbr/o2CNUakD+wSLYw3OBZ+cEvyh+VBKs8zoPsW9eei2sR0WcEUVWob
	PauLZODKw0pi/Ze8zN9/T8Y9NVXo6XTB70j8b2gebm7YiIkQtavWpFXQBLQAOuaXIoOKm0G8gULeq
	L2ro4odTQr7vDvYQEgaES4+ezmLj7R8hQPwxQyD38+9LETa0IhBvm9ulxUlY3BUyK7VCBCBkFXk4B
	GuLBeUUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2W2U-00000002Ydy-49Qa;
	Fri, 04 Sep 2026 15:41:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2W2T-00000002YdQ-3GP1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:41:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D5AB2600C8;
	Fri,  4 Sep 2026 15:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAB71F00A3D;
	Fri,  4 Sep 2026 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788536472;
	bh=/4bzm00zvEaFAPsu+rlxZVavvC2QugQbZMzQyLJ4fYQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=hb49PqMw8wZMa52iz4c2/+aVqfzbS3MToE/lhIyvCoiR4ekM9+DJDL+z3LPv8Pj6y
	 NoNcLtULYcBUFRCmUYVOUggYHpusaa2aqG+kD7iMrrQOkT5BDeEBiECetHylKoqQjA
	 L5rLusNYDCGGJjWVC8b9UG9zHGaYUxYWu+l1rckC6RqNCHiZw0/gjWKA7D9iMf8VFc
	 yaGjrDxxQhDU/jjeHduY15K0oj+5iV0sXBfKKf5830o47IohD//u5KoMP79Gzsp08W
	 NUWlPrXu8I3jnYFSO6vv4j1ph/oyAsFi2+o4FHTC/fR2QlEEjQoILz2lpIh4y8S4V6
	 Zyu22CIcGQVcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A4A392446F;
	Fri,  4 Sep 2026 15:40:14 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/cpuidle fixes for v7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260904081215.215528-1-ulf.hansson@oss.qualcomm.com>
References: <20260904081215.215528-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20260904081215.215528-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3-rc1
X-PR-Tracked-Commit-Id: 2b0ac85512b7f67479127b2713254490662eb13d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 65119e86fe463cdc96455539020fa75b02f2cf91
Message-Id: <178853641318.344944.1977702652031876231.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2026 15:40:13 +0000
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Fri,  4 Sep 2026 10:12:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/65119e86fe463cdc96455539020fa75b02f2cf91

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

