Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B342606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 23:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ti8ysfP/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LFPq0KXD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=T/z4ZyG4Jm0IpSKIxE26QgcgJ4ZFld30kq1R279Lk/I=; b=ti8ysfP/ENJFUtx/9Qu8sDqHvZ
	MVAOc+wRDCFRqGVB9viQ28HFPFWg6NSLQKvSyd4LBG8mRFdIQmMu5sYMVkDyOt4mPdcSBdmqDKAZD
	7lZHSYfDeREpfB9iex5+N72rSR1nFpKyJaj7lmTys/ugKkcjFljjRjqYucXtXtIP/VxgvsXxZBs+Y
	ArG2rL3/C7qlTVvKSJgQbSZVYJyMZ02vVdRaEQbAfpSUSxJzZyvCnGT/4+c5w1JiH7jvYhsyAU0YE
	1Z/9pwcL7OBIef1llHt+asUZwTtrVRJpXJXqZPhvTsTY70c92g49lI0jr4ZILWNtloXB6bsCTWK5A
	/9pa4hSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvk2-0000000Cic5-0J9d;
	Fri, 30 Oct 2026 23:10:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvk0-0000000Ciby-35B1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 23:10:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E436A43E96;
	Fri, 30 Oct 2026 23:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57D81F00A18;
	Fri, 30 Oct 2026 23:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793401831;
	bh=T/z4ZyG4Jm0IpSKIxE26QgcgJ4ZFld30kq1R279Lk/I=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=LFPq0KXDS/E1aIVTwRCDdcNEIJXLTu1iNBjPEnifbQEwbF5GAzSLKT5RI16ow7Trm
	 MhT6LUDFbByTw0VVFmldIPRRvC9a9Pje5b/bVOGmZIK3xf1/+3wpCNFtK89N7FeE/q
	 TfpULuNCitLyCqnVzaVGd7IvbNLBAGvVgwnGYNbe9wMt1JWWNCDdWv1j2ExoYsQKsN
	 LJ5xEX7OQo3aHuDsIhluVAhoObLmNEAmmkkbX2vByLKlGs/GJT1RubyR7mPcF5QO3p
	 xC+vKFSYDYhtU02LcokdX/Cw6Kboy5icp9HUSZ2U0rRZib7TPWYbK97+V0iTJL9IF9
	 mL6nLI/d8d6Ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA3843800478;
	Fri, 30 Oct 2026 23:10:31 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <auTg9t-da3RFo9nx@arm.com>
References: <auTg9t-da3RFo9nx@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <auTg9t-da3RFo9nx@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes
X-PR-Tracked-Commit-Id: f46be4da2cbb17574b5369517a9a1e1b414063b4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e07889d8fedf729282ed14ff202e06dbb67444b
Message-Id: <179340183071.1820250.17892758964850630795.pr-tracker-bot@kernel.org>
Date: Fri, 30 Oct 2026 23:10:30 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

The pull request you sent on Fri, 30 Oct 2026 18:24:54 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e07889d8fedf729282ed14ff202e06dbb67444b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

