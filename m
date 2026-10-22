Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE6160A6F6F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0iyCnBCZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aZzx/UeO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tRQv/YsbSLfKDwFmtbLb3Z9s+7jJznoOOv0CN6f2KZ4=; b=0iyCnBCZ9jamOOFbxqbFTtgaTn
	Mkidfhf8QMoRalHIw65Pb8YSHKh6BiivmFd8ExPkrt4+Ixs2iUs2rOdwrGcv8917vr5caEnSktr/g
	cj+In7vQhtyWUPn0iXUJghGZ+IrYcCSNNDc7DvgnBdTkzghTjlwc/5PeoLQ/dyKTI66m4PGPD14gD
	4EnOIBKKiqC4MJM0LhIMpceDQEyj8zm5uoKthDATdCTz5X6+TDjUzIUHJ1PfJacubzBb5DVWqxPvm
	nDn79yU2SPEyrgPL3ISEeMrf5q8pdaDhlJHILc5tXgYDD9nvUGovLcQxiMaJV8VLeW0HgivnqJwyx
	DtqVMJgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZY-0000000Ehy2-3FD3;
	Thu, 22 Oct 2026 18:31:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJxZQ-0000000Ehqt-34oj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 18:31:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E8B44400C;
	Thu, 22 Oct 2026 18:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557A81F01825;
	Thu, 22 Oct 2026 18:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792693880;
	bh=tRQv/YsbSLfKDwFmtbLb3Z9s+7jJznoOOv0CN6f2KZ4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=aZzx/UeOmJHtLa3quSIPKJF/Sr4+3N49XOHzjuwcHVyRqYqvoQmGm7JEp8GmKvf/M
	 Y+nDEWgVSQHYFiZY5K14PUzKC8WbXN8M5CNkdYuf70WlnCZ3eQ5TMRKV/umNI+44gy
	 KOmyHDJrIDS5J+SxQQUQg4UHdkeykFWGFEtN469dFhc8103WVMpro1j2qT/z8PVJev
	 wfEzT4PNkBbUOe5lAvMEmCF1ahxTmPOmzds1Yl0NhvfO2SxfbrPN3mKFo7apxhQQKX
	 rfmsQGPkVK6vDmOcXeY+d1nvSFg+gnvlInEC5EZeyvCEt522Wo7LqsUmVR/ZjCAx5g
	 hvTeYR6NQaFyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4D99D380822E;
	Thu, 22 Oct 2026 18:31:20 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/cpuidle-psci/pm_qos updates for v7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20261019132237.29631-1-ulf.hansson@oss.qualcomm.com>
References: <20261019132237.29631-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20261019132237.29631-1-ulf.hansson@oss.qualcomm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.4
X-PR-Tracked-Commit-Id: 6d318db9ffcb611f9b3b6b3201c963690541a943
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e557fc68a1667183b5f4649ee76e833160c6714
Message-Id: <179269387912.87271.10690902816098280172.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 18:31:19 +0000
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Mon, 19 Oct 2026 15:22:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e557fc68a1667183b5f4649ee76e833160c6714

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

