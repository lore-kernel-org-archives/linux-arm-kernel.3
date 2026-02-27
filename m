Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51ACF104891A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 21:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdit9rnJF8eSORyu/nJ/Mtjyh0rlLRr6VBSIXP/Auw4=; b=dOwLivgnzheb/NYAwHqQIwWvU0
	EmEH85GYn9cSfZSTBG+gOtBm1DPgpbqyyF4Onug7i5Nn7g15VivSwuqAePK2u2c5FQslHyxVv6+mR
	bBWDwNkBFBrdu/ruaDthaUpEt4s7zBGD8BMeyR1w8YYb66jDX8BLa79QFzCjYvLxJ60YdzL06eviu
	/cinMm437qycb9mM6e0wqRnhdfM/p0KLyn57F8IR6rBNhPcZ/5ZwfC+IWxH62nUpW6qptYRB3QLRe
	Tgi0IyXLrl9BH3bwxWrQ5ma6Bd6/+lVTfPO/cqMX4r3rPRYTfX4medrjkk8E9irptJ1sTkdLkI7DB
	xxLk9FVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5fc-00000009Br6-38fE;
	Fri, 27 Feb 2026 21:46:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw5fa-00000009Bqn-34Uj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 21:46:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 106B8434E9;
	Fri, 27 Feb 2026 21:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB74AC116C6;
	Fri, 27 Feb 2026 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772228804;
	bh=Oc7FnAa8sZ1HAoEvQv7uyzKwSvB7MMonYKgNfCrH6Kc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=HZI/Ct+m08OcQpmkkEmDMvK//uG9nMa6GiGQrTV2tTZoCpppgDduQ/VzBGyCIaa1h
	 c0w0caH7xO10QfBAi0jG+tDFgIF5MzRWNv22T+Ql+IYJY8/C8Trv2euPbaCwIMsLuU
	 gG5kNoWQq3+DXGDq2K1MGMurA9RjUQ4OlsckvO2evh85ks4AySPbuUWpf+UBgQBrp6
	 EJWf0ENstiCk01LcupOoc2Xzh8lKJ1qBGq+7JF4RxvWw9oR7BF5Pgyq2vJQrnGSLX7
	 +7u+aBqYxHU47oOtzggDLdnFIyyrc7Zeqy2ifWSIFBrgSM0B2lthTm82/B2J2rcbuf
	 bawrP4uQSvfAQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA11239E961E;
	Fri, 27 Feb 2026 21:46:49 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <aaIKmlW2xm8EgoyV@willie-the-truck>
References: <aaIKmlW2xm8EgoyV@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <aaIKmlW2xm8EgoyV@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: df6e4ab654dc482c1d45776257a62ac10e14086c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4d349ee5c7782f8b27f6cb550f112c5e26fff38d
Message-Id: <177222880837.2772866.7227227339792724251.pr-tracker-bot@kernel.org>
Date: Fri, 27 Feb 2026 21:46:48 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_134646_814273_2D967166 
X-CRM114-Status: UNSURE (   4.46  )
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

The pull request you sent on Fri, 27 Feb 2026 21:20:26 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4d349ee5c7782f8b27f6cb550f112c5e26fff38d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

