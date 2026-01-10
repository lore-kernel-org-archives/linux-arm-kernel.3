Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D37FD277CA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 02:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km50yNGDSlteX+qTq3hqGpOiJOLvmDlbCIwAwRJelMo=; b=ZO+pAlZknfWyyQGOASC3gWIfpM
	28uTt8WJX+rAcxdFbZf5IjfMYBtzBIJ46ABOiJJOEMgYpoSMi5wxgAHmrMlPaU9oVx4wEQvcXiDBU
	V5zfXNxMgCEL20/9D+VVQEg6ZK8rXq55VlyepRWrO+/KUAuUKV4aD9q6hKsWMRoowo+NprUurVvye
	+zc1Rk03D8mBcnGiNQzW1zHHt4fbv3AyXlrwsQkjXVgpOqk4ZQB6I4QxQcSIYY+ME+qTjJt50K1Jy
	47NhMbdpTlAezKldUiDS9eE6yw9Y2zbc4ervlDf1ok2Wgk4/Y+mxrJWCTdjd4kF3kMiqrY+7HgHu4
	3DiNtvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veOYf-00000003BWS-1mPM;
	Sat, 10 Jan 2026 02:18:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veOYd-00000003BUV-2ZIg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 02:18:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A93A360052;
	Sat, 10 Jan 2026 02:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E76CC4CEF1;
	Sat, 10 Jan 2026 02:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768011506;
	bh=Pblp3QH78o3dQYj3vAQw8+AT+d1PjJBINN+xsQYU53k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gqOLMdKmV2kELPzbXj69g4J9CZ80ZCO5qRzIxgDtVCeWxiFewBSKECm/1uz28hWjL
	 oR0utACLhEfs0hJR+OTC/RhftfX1z5Yq4bTcYeORax/JkXtOCwXmtsCx2/DXX91dJp
	 EYZLyThEmIDvPJJOJSmbCmNXnzC5mHC1jihAQiKEz8gEchWkN2+cG/y03v+uEnW3mW
	 /3k2jJyk4wId506jyCQ76kS1BmWg3+QiurPhXDGyuUOIT4WSjw9GYEqWsw+PFYCfWe
	 NpL+Urkp2uLZeOssiW+maQG9QCsp7AIfec2c6iz3ITaoiI/j1FGs+K5KoJs7yd3rIL
	 ndla8cWlt+yug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BC193AA9F46;
	Sat, 10 Jan 2026 02:15:03 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <82cf1376-7a4d-4ac4-a874-139ba053b72e@app.fastmail.com>
References: <82cf1376-7a4d-4ac4-a874-139ba053b72e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <82cf1376-7a4d-4ac4-a874-139ba053b72e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.19
X-PR-Tracked-Commit-Id: bf104037ebd5c1774fa736050a484c1f28cb2e6b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e55feea3a03aa1eaf5abb22cc854208813865e04
Message-Id: <176801130195.452892.14399652915308807973.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jan 2026 02:15:01 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 09 Jan 2026 18:28:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e55feea3a03aa1eaf5abb22cc854208813865e04

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

