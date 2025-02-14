Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F18C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTcx2SnDD2C3Let5OKpcHYlSpOQJf/vzuwssUjTTGWA=; b=2smh3/AfZwx7cIcpZspStFlyfq
	tQQo8xlYnZFw1ygqbeSfXS4I1GZCLo1aDGNkJwnIWdmaPDu5j0BeNhV6eZDt9QccOnQXqUkfXKmEm
	8k5ueDjg7TyUN90IIrSf2kSxwrgyDjvB3sOQhRvehYG6VGwRFQM1XWPF9RNqXOwMbpMgO1GPq6U8o
	sdjANL8lnD4r8Xjtm6KpI5YSqXFHq4k8zHymc4B5fxmSKGOxWjOgFVlUQi1bgPU9zNAa/rNtR16Pf
	aTSbtVFgs40cOIv9iZmts7xhCywWrLqemLjRJMigkv5VQAu+wctN1apXFyaKEoTRJNHrdJ23PSdpy
	Q+JlhrIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1ON-0000000G272-0ZQF;
	Fri, 14 Feb 2025 19:30:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj1Mu-0000000G1pG-2hwi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 19:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FC7DA433E4;
	Fri, 14 Feb 2025 19:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BAFC4CED1;
	Fri, 14 Feb 2025 19:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739561335;
	bh=t9EkPDT36vEYRvlk4JqknyHm+B0lAvXvrkbVcUsqtRE=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kPYNfd9OnJambKVJisEXQUjCrktfh5E1344Rm8akgdm9kB+ZSgnv1QxoMQU28na+W
	 wg0pfnSwWNFq5xo9PnqHmoY8xBUatHGfeGUeLu/CbRQRV/R8xgK0HwzGHfWXu1A6S/
	 PX6jHct/MxC8pYy54+RMXnJnQEOMC/8UXOFCFgojJQNhxZz8ifKeby5n5goOwKApES
	 3Q66VKKZ7hscLhgHGeSyd/k1tjrV51QGKNLUD+VnxbeVZc+aK9Y0DWRW4b0W6F7J5L
	 FQijzKx+1MXzsZNXgesgRtxRNlYet2TYWPD6NgFGhSWHvNAjDNcJjIFR2T+FZaSf1H
	 M0ZVloWBa/VvA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC11380CEE8;
	Fri, 14 Feb 2025 19:29:25 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250214140431.GA13374@willie-the-truck>
References: <20250214140431.GA13374@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250214140431.GA13374@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 446a8351f160d65a1c5df7097f31c74102ed2bb1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 111b29599c189247919a514b6c3a93e828db27c2
Message-Id: <173956136427.2081923.9703476748325422748.pr-tracker-bot@kernel.org>
Date: Fri, 14 Feb 2025 19:29:24 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com, ojeda@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_112856_749485_7A42C4B3 
X-CRM114-Status: UNSURE (   4.14  )
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

The pull request you sent on Fri, 14 Feb 2025 14:04:32 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/111b29599c189247919a514b6c3a93e828db27c2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

