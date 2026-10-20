Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6D2606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 21:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FRPoJwi1;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WVS6CcEP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBE2dw1g3Eh9EqgFtNRVCB1b68R/t5j3Hg9J4T+07Jo=; b=FRPoJwi14pBL4dT62Ei15d8N6G
	P3APtpcc5QIX7njvHRXEdDGAqjnCcCWnnDwB+CjviOwRmT9gPFFZvUhNrn03N+IVAQqKRR3bWNzxc
	cKh+xhoXip8KHti4zuZeHjAuyr3G3PqsAg1FogB6r94mqdSn1vUhEf9c5cfe/EZ1HRM7rgO09LT1q
	W0phHdHbeVRvn/Beoac3jTijWxJtTpkOBqdrBibav432Iz8wqeyq2XERjjCh1Di56I24x5mWdwgiC
	XViUcSOEdheyqvc1ruwA7BS13AFVeGVhs71ezO31Y/pi58yZodd50u2tlDpgZB09BTkDDchpE/vYS
	DP7MwtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHXM-0000000AgSu-2CrE;
	Tue, 20 Oct 2026 21:38:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJHXL-0000000AgSo-0ua0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 21:38:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FAB260142;
	Tue, 20 Oct 2026 21:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 086C21F000C9;
	Tue, 20 Oct 2026 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792532302;
	bh=cBE2dw1g3Eh9EqgFtNRVCB1b68R/t5j3Hg9J4T+07Jo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=WVS6CcEPNYTpDVdKv39RJJJ1EIRG8Wwa5HeMqxgLTg0zVUlNjX06yRwiqzn5mE98Y
	 RFHTpWvuIYCfN1nQfzeu289r5v1abLlxPzR00/qv/oc0zLjlujzv4fF/h/oB02+2lH
	 loLw3R4LPfmTBSTZfCuxYzs1tI4TGC16VEvpqA110LPKac/RTx16L448dPmqib+cDA
	 Jw49x/2lmsSsGRYPK6jTMeQJc2wLqO7GBEdU6FCkN0azPwTld7SImcCofQTN2+I6RN
	 hoxKzNbUmE+u/IEc9nsDMrJRrsvmtB7NXcG/jAWeEYaaTSso5waIQMd/pM3h4Td/DU
	 K8OLtEMAo/HyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F37473809A09;
	Tue, 20 Oct 2026 21:38:21 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261016144012.547221-1-catalin.marinas@arm.com>
References: <20261016144012.547221-1-catalin.marinas@arm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261016144012.547221-1-catalin.marinas@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
X-PR-Tracked-Commit-Id: d0de3a73194a250a2e5ffbf1dc604c0bcbb16e8a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 303bff3637d13f0ecbb280c7cb403470c440a2a6
Message-Id: <179253230073.225072.10707551340990264293.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2026 21:38:20 +0000
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
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

The pull request you sent on Fri, 16 Oct 2026 15:40:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/303bff3637d13f0ecbb280c7cb403470c440a2a6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

