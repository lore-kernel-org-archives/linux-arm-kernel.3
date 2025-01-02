Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E001E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 18:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pmkNnsYzNQmiTXcMTg2gwKSj3eb3QqA4hvh+CTG8kU=; b=ilB6O0gaif8Jgl4Fc7C240XZc3
	tJafoc7a2edbnYzwibfu+I9SVwv0rJUkepmu0w1ByWtYxTWBLTeTQZscPKEuMWUwsqs8kqW3b0//O
	iHb02ZeLzHtN4vhepU7rqE+5rFd90YZbUsKpq8wWbLtDSwIDAivwplbV+y9QyD8pSjKUAf2WvD764
	JVUc8EnTQP+rh4c4Rj0kkmFSuBIMKwxefZ0Zxrk7jwPn8yx93Rq9/QFiO8vmJ6qb41CUCTW49zB60
	qiJm1IYBxWs+ehm2l1oCEoKa6r+CegttzuzUQnCnG0qhsql/tlD76WX+YXU4ZxoEY5DCR7p64IUse
	c4a9ZfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQEO-0000000BBhI-1Nje;
	Thu, 02 Jan 2025 18:47:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQDA-0000000BBXT-36IL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 18:46:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B2155C608B;
	Thu,  2 Jan 2025 18:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9490BC4CED6;
	Thu,  2 Jan 2025 18:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735843583;
	bh=ykkhehmAt/0FuI2f/nijeisMxPbnq2PSfkS31wojYAs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hjUXmZACbja8RZyp4g084ol05j58yFUSdnJJMc27KXiDxJRKz/HXQ/H0Oa2XEpt9O
	 zWFljggk8nUPOa9RtFBf1rohPe3iUAswHUpO7bld+Urvo3OznY66SE3Cu/3tvEjBKS
	 uqAiCNR7dRS9JzdAQcOUvRmFjoL6qQvz/XzTnPuwh252/3S3HBNe/DnpHBFFyFprVv
	 zTKsYVlCU4zmLsSW7td+2tTo+r7/VWFgX+hdhklCyu2pn+7taaVMq90r8Qe9xOYp/k
	 TsarIvt0pc3FPN4eENEvPSf6SHQvdDuw55zFwlzXmysNY7DgyZWR/1ww8PZ0jiC5uF
	 z3JBDfagaQBGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B1E380A964;
	Thu,  2 Jan 2025 18:46:45 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.13-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250102124753.50440-1-ulf.hansson@linaro.org>
References: <20250102124753.50440-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250102124753.50440-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc2
X-PR-Tracked-Commit-Id: f64f610ec6ab59dd0391b03842cea3a4cd8ee34f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6b7c8c5a173c7c99ae2222f640e02b5fa822691
Message-Id: <173584360360.2004976.2151413910038737908.pr-tracker-bot@kernel.org>
Date: Thu, 02 Jan 2025 18:46:43 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_104624_819317_5D8C99EE 
X-CRM114-Status: UNSURE (   4.82  )
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

The pull request you sent on Thu,  2 Jan 2025 13:47:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.13-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6b7c8c5a173c7c99ae2222f640e02b5fa822691

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

