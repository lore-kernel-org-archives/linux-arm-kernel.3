Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0E7F433CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 22:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zKnCtQY8K829WOgvYcD2s//rkc4nVa+9t32e0iwibWs=; b=Ax8GL0i/C9bI0wBbn06xBVkwB0
	4+kvz/wGw+LdBZaGVLA0nhdVU7V2GXozsdB8NRwTl+oKTKq89Q7GEpvYoprv0p1Q/iyd4Jy5DOPjv
	DhEWAsTF0J1uC96xCip/A0UOAccqfnI3V/bk6KjRbHsN2wLQqBOaLCW/EQbnKZbm+sRkCCq1rL4ju
	q8p4tgq+LIBCNJyQEApXvSgngNBJnSg9BoE+kpCkaccq7LTnK/tCUhvtGGf0+fjhTWGYfh6gunVUJ
	SSMoVK4UVvV4GBJqQJIM2ODfFo2Rcv3NP5+JDYN+iB/8j4O9bDDlL0ZRlArbYcfNdUAcwLx3OAirN
	zrdNz/UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8IQ-00000001evx-18t3;
	Wed, 15 Apr 2026 22:01:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD8IO-00000001evq-3yzc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 22:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 017EE60123;
	Wed, 15 Apr 2026 22:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC416C2BCB3;
	Wed, 15 Apr 2026 22:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776290475;
	bh=Cvv7WMMiVOX5VAT00vi45hE1b91zrk1QdOSZLpJBYvQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hOMc+B1Q896nnOl46V6R2Mi4zZ64HgnTC1WnopyYt7QNb90Gi0Owruf6fQR8mQYwJ
	 9idLR6RHx+x9yyi/1+rpKpI//fyrBMfdhyqtZXfMK6iKxDngKYWWAubiUGFABteqFi
	 7CdMAK7NvgIcdFQ60XxU/Oh2wRgVkLUu7kRTcf/E67SB4dlIrfHKqbFyM7izViSmKq
	 JEt3WpLjqeUaB5mwFjVQg6KXdm2D6F1J5XJonZy0knJUlzz/NlGMwusY2DYSrMRQKN
	 51lqAQf+qjIp5YJhJTMYee03sonXq6CmlOb625x5Xojz6XHEX7Wqp2uoEvXeXrYrK7
	 5k1rsNt55cldg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3B526380A964;
	Wed, 15 Apr 2026 22:00:46 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain updates for v7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260414103826.161076-1-ulf.hansson@linaro.org>
References: <20260414103826.161076-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20260414103826.161076-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1
X-PR-Tracked-Commit-Id: 596ca99cf04f339db2ed18a5bb230ee11a47b699
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e41a25c53f96abe40edc5db1626d37a518852d84
Message-Id: <177629044491.2457809.14724201696656005362.pr-tracker-bot@kernel.org>
Date: Wed, 15 Apr 2026 22:00:44 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Tue, 14 Apr 2026 12:38:21 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e41a25c53f96abe40edc5db1626d37a518852d84

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

