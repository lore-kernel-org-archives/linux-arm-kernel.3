Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E82F5A8CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 00:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR63zmqq4lCSCoZiqtCAqMtqowb0Lu1TfZ3kggEKP6Q=; b=0xzvOFM9J3xo+61X1xymKYsjCk
	dvo2CxdrduCKX69ny7J+2VDJY6S1O0OH4a8+9wQ7xKkWMmqEyj3m89N/Y5pKp3oeyRvtgapiGO5Wm
	Q9MHdmL5KLWLbJhjiqqnApsl6NAbezSneTs1W9pkbvB2R21vBwR9zKw/6bF3jfNatLhxq4kzOMZha
	9vuBppUiDrLQbYR0Fq/YLkbekpYir0ZjhmuuJz3mKm7z5XucyY9WdL5qvEOa9hz66mvo2GStWMj36
	LkVKBNcRG1fsM32kTqX1NM7aTCpHqtvuqoG0jWpQjUgA2kLCSagg/luy3nTK5m2/UtUT9HXlhgBeA
	sPKZt1WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEz2B-00000007s3C-47C9;
	Tue, 21 Apr 2026 00:32:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEz2A-00000007s2d-1tsg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 00:32:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EEE56013B;
	Tue, 21 Apr 2026 00:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F361C2BCB9;
	Tue, 21 Apr 2026 00:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776731528;
	bh=NPMse8LYUeAYak05tpBTb8l6kf0L0T9GXKTuCgMtde0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=PueF2vHFgrWwcsYFy+iL9lS7tg84HXSs0kpcYfu9Kvrp0Lzh28y3oDhPBEYVkfDl8
	 zffhCwlMWUJ8k9AfHpNtZDxGc10PV1hZ5L/KMVg8Zf0PE5fGo1wINGSDjJ0Ld6Vf94
	 PMdIJRwFi5wQQC1NlKuIQYX3yA3IXCSkha8G+2sZFi/lHgP2+Z/+ovzL7wFFyyiU7O
	 OazNnSepfqhquIg6oEtV5dv/ZYJ4a2wjYwE8nO5CHhyUGiH/2gx+CrvdxmnoGP06Fo
	 yY+24ifJvn7oJZN50AtbBRXtFoxYGioFck+tyyNFEK0QwXy6jcK2ToruiNdyCXxqEq
	 a+BSGN0c6sQEg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEA33930023;
	Tue, 21 Apr 2026 00:31:33 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 updates for 7.1-rc1 (second round)
From: pr-tracker-bot@kernel.org
In-Reply-To: <aeaDFH0-2zhOQTxy@arm.com>
References: <aeaDFH0-2zhOQTxy@arm.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <aeaDFH0-2zhOQTxy@arm.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
X-PR-Tracked-Commit-Id: 858fbd7248bd84b2899fb2c29bc7bc2634296edf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 13f24586a292e35c9cc71e649dc4e4ea1895c5e5
Message-Id: <177673149221.2145745.4949652672914812221.pr-tracker-bot@kernel.org>
Date: Tue, 21 Apr 2026 00:31:32 +0000
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Mon, 20 Apr 2026 20:48:36 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/13f24586a292e35c9cc71e649dc4e4ea1895c5e5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

