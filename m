Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9AACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 19:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0Br7sLv5VqlyNL14Kif14CANatVeJSxFXH2SbFcSsI=; b=JFp8YElSfbK3IzjjasebaPd60o
	jbfufRI9puKCP+NPyRoGq4a6eMc++x/d3MMlFGvCE/LXEo4U/ZC1QTXwHoPH7KT0NVO0dX3lta/Qf
	F6WzqSMQd35g3VZp0oA13InaSclFDINoewvqmVjeEglgJFgTwSh2i7A+3qaMt10VBtkO3bdMq+XR+
	78TdFgm4r7YeMXKCeNm48qjyHmbwm6wTPaj9Hj7R7ihqHYopvh2DF+HM0Pl9rTWf8vYRZ0N+PVMXV
	yuu4flhKecdR9KYMHeTAiZJQ0bTlW2Q3lN4+M6U+C8wLlOX4FBrMAi/Iw5u8NYYNptUAKCvgnL5Si
	GqBkSfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgW6-00000003sVm-1HU2;
	Fri, 19 Sep 2025 19:11:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzgW4-00000003sUa-0E5T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 19:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C637435FD;
	Fri, 19 Sep 2025 19:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AF7C4CEF0;
	Fri, 19 Sep 2025 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758309091;
	bh=VA957fqzlDUIJlLOTxEp72yvsjTf9q7cFUI/AjmEfG0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=mUs1oLsDhZr2QPdPuNJZ2Oyqzt1nwopOjtz5r0UkIOd+YFq8ODtBlLj3ZULm5z0T7
	 7ddXNXFp26bWmICTSql9YcHjZZ6K/u/5ZEwBYlsyVqHhIDHXXybUpL4oZUjCQweKQu
	 5DGp7UXWH9EOCrVcuKVUMQzHBq3UdeZ/r/OWQxC/fiSej+B5LLh1cAzl32LejtLoWA
	 tdBTvMn2dg7GovsYI893FFzN70DS1yrYKdOZh4IBuNEfadfy3b4/ZZnIRgWWbJWeDI
	 olLLwBUiDClEeEhTaVy9OZMKHLc4DxgOsxgz5n2+Hbp8RLYB4J/5bpuZf/AOkgPo8M
	 7kJ37OjW8iTRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EADB539D0C20;
	Fri, 19 Sep 2025 19:11:31 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.17-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250919102829.151957-1-ulf.hansson@linaro.org>
References: <20250919102829.151957-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250919102829.151957-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc2
X-PR-Tracked-Commit-Id: 303010f4658cb134eb27cee88026fb5d065a48cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 46d2affdfbb92c383325dec35cef9abe844eda05
Message-Id: <175830909046.3669786.15257917459583423602.pr-tracker-bot@kernel.org>
Date: Fri, 19 Sep 2025 19:11:30 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_121132_121891_B986E00F 
X-CRM114-Status: UNSURE (   5.19  )
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

The pull request you sent on Fri, 19 Sep 2025 12:28:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/46d2affdfbb92c383325dec35cef9abe844eda05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

