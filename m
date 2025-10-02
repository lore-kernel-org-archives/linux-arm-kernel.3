Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C53CCD182
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 01:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nhyyow5JmqmwHF1Qfc4Rynxlc45GQwkXWvNQ41bd8QU=; b=ry6bK/OsKktTR1973AtIRmoBHG
	GBqVv3rptg7C1twmbeSpbhHYuxZVK+eWT2Ao/EYvDDjaptRed/LEKXPpujElaXkuwdq32TteWZdvN
	thKDlqz556tK60Cs4UGXj1XCa2giF7RNujN8/3P/fAAW1/CAFV7OVeAOJWZ6LkQnz9NCRx38XuYqn
	kvV7508ukBnpMwhSCqbC1sYQMgPwi7IycIlKlQEydCJ7GzvIYSWg9XVdIL0FBaXPIjxb2ZeeZK2QS
	brJdwvXkysAaFNOhb9lWUqdtXw9JnnxdVpe/uazUGdio5Z8FQfSRSBBaOJ+124v+/jrxynl4MHunP
	y5Gq/dUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47qA-00000009N1O-36kA;
	Thu, 02 Oct 2025 01:10:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47q7-00000009MxM-3rVp;
	Thu, 02 Oct 2025 01:10:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 947A9406B8;
	Thu,  2 Oct 2025 01:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7428CC4CEFD;
	Thu,  2 Oct 2025 01:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367435;
	bh=+x0fvBVIGPNSDIdjP3Feex7LOIFLT537dE2aAMtpkrA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=cI8RDaRNaIMX/Ez0cD1Q9J6J+uTieduswBztm2bWcnHoWI4JqzdeaWtioD8ou1Fpa
	 zBlr+RKHHI5iXhs93pJe9ZjU0w1+ox7YBwiUoCEiH6AQ7Hqi/Hf/JqU3QKEELdkmiS
	 wZvk1oDPkeo2zomtWg3hwNTkSduXo8S4GCnpygVbupHfdpjX3wirPeqaimDvH5kgq2
	 w6IoEKsaVNf229zDYokX7mxLFIUJ8HOA08wzBrOU4dOqvcluP7bgw6+t2hugPKbosw
	 0SdM0w7dpk95iGUhu5szaEVF8cMTTvpdjCO4piTHKYPdV8S/QF+SJ+/4kMqmj2IuOb
	 tljsj4DP3Aslg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0D43439EF947;
	Thu,  2 Oct 2025 01:10:29 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] soc: driver updates for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <b94bf376-2653-4726-bc51-9c608f55fff4@app.fastmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com> <b94bf376-2653-4726-bc51-9c608f55fff4@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <b94bf376-2653-4726-bc51-9c608f55fff4@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.18
X-PR-Tracked-Commit-Id: c4ebd661282df563a0c83acacbc35cfd4d8da541
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38057e323657695ec8f814aff0cdd1c7e00d3e9b
Message-Id: <175936742769.2689671.1927573859561448403.pr-tracker-bot@kernel.org>
Date: Thu, 02 Oct 2025 01:10:27 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, soc@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_181036_003034_23DE86E5 
X-CRM114-Status: UNSURE (   4.20  )
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

The pull request you sent on Thu, 02 Oct 2025 00:27:57 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38057e323657695ec8f814aff0cdd1c7e00d3e9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

