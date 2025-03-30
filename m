Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48835C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syr05g8Esk/lQmNw3oXkWrWCumkEPfLz/MHSo3QLb6w=; b=PhpWoqG9DSc1umDU3vJdhjw0mx
	2BQrM5pdggt43riC/yxrm5sYOPHWGPn9cNb0s/O68m+ZH/t/qDkiDRds5G48OLTfMS4dB3QRIo30D
	rj/Gu6yGlu+W2DAf62uKw0/GwFXXtYv5IhG2d2mEPCOFwHH3VzKaBMzbRHqfM3HKMtL+VjwT7QCxy
	tmIs4HfuznAOoHKouGPAVPZtcPfNjU+IO/NdCCW3c4iN5CX6sNMT3LY8brcN0I1Oz9Ln56R1g1in8
	lXQvtL0zvhTHQp3TGtXRH0cjI9zjBgZEpeOz5JL7poeuxl/wl/30wuCiyCX//EO40DzbSf5E0ykT4
	Rmjy1GEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzsy-0000000GgyA-3dvP;
	Sun, 30 Mar 2025 21:08:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyzqG-0000000GgaJ-364S
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 21:05:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1ECB0A403AC;
	Sun, 30 Mar 2025 20:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B90C4CEDD;
	Sun, 30 Mar 2025 21:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743368715;
	bh=w/qYlK1L5/+ougRius8bQPAiHYP4utsiOPviZ/mp58c=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=P7Csb/T3mB/gnxCTTL13sBdoRm78QAs872OqSlkCyoXh6LP1llvhG4BDYu6pl1WJ/
	 7prVafo6jw6RLhGKZKeEJJkfI/ir3tbrIXG8Ovi8SIUQAStAmzLCqeuVkkqFW5IG1j
	 Gfh+4Q/I7UUEtl2u8ZFR5yjY6UA0aAZby9iTWZvorH+DTR6DkYt2kULtLHXvzje3Er
	 +yrqPDCmRD0KcQg2BO9a0ax/HNov/VPo46Po0hcTl1QgqNDJJEQaUH2dzgU4dmYAmV
	 OpuTUZg9WjeRbmSPHjO5Ow4XHzTWBQvFmX4KHQ48zxW9fv80pZKpEVURBAZyWc1loj
	 GQJVJHx91zfVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 712EC380AA7A;
	Sun, 30 Mar 2025 21:05:53 +0000 (UTC)
Subject: Re: [GIT PULL] BPF resilient spin_lock for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250327144823.99186-1-alexei.starovoitov@gmail.com>
References: <20250327144823.99186-1-alexei.starovoitov@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250327144823.99186-1-alexei.starovoitov@gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git tags/bpf_res_spin_lock
X-PR-Tracked-Commit-Id: 6ffb9017e9329168b3b4216d15def8e78e1b1fac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 494e7fe591bf834d57c6607cdc26ab8873708aa7
Message-Id: <174336875198.3547747.7647221152816620619.pr-tracker-bot@kernel.org>
Date: Sun, 30 Mar 2025 21:05:51 +0000
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: torvalds@linux-foundation.org, bpf@vger.kernel.org, daniel@iogearbox.net, andrii@kernel.org, martin.lau@kernel.org, peterz@infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_140516_836122_17004E6E 
X-CRM114-Status: UNSURE (   3.71  )
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

The pull request you sent on Thu, 27 Mar 2025 10:48:23 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git tags/bpf_res_spin_lock

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/494e7fe591bf834d57c6607cdc26ab8873708aa7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

