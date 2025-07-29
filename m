Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CBEC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjOZUzSpGLWjsH2Ko4RMwZ4gESCThc/tnZm3ptKives=; b=SwfVZW/AVGl5A9Zth19i8stM8w
	umOBGdoJaeZ8zghmurjR0f39OdcKfhU5tLyVg6nDQLnECjCeD5RyDBq8swgdu9wrhEAb/nXTGackN
	KX9pt4RepxwAeTY/opjwBo9X+5YcAu1xzC5gbedk5eKxoHc0TPCfB6EpZm+fW7K2PtJxNpcSlb/zu
	qPtPY9Jf8YzBeEfBPEvASZxS8sJxadSkLjibdTN9j8mBOiyIdP442u3JoALQgCQAQ61gwxZuwf0fW
	+RLAByHDR+n9bKiRNNXBQxfii6s1XDFErUSwJ4MSd84koPdpxnRpNn1sCj8dFqj/o3+ldat+R5Ru/
	v588plgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpHj-0000000HTbk-3DKc;
	Tue, 29 Jul 2025 18:42:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpFF-0000000HTIA-0j3S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 18:40:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C415945836;
	Tue, 29 Jul 2025 18:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B86C4CEEF;
	Tue, 29 Jul 2025 18:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753814412;
	bh=evXIhNwfoSdAgvghJsAnRiqCWO5j4bPeXDPhUZPO7qg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=lJM7ykPZ7V2MnN/GxXuj2yWrHQH/qzmr80ECII/hu0oBso9r7pX39EBox6oZVTFg0
	 zbUsOvB+6zVWBS+ikoe9FVT/E1cK7Yff1MHStLpKr2puZd55ovDQ664oySRCInLOL3
	 bFOYj+5SV67tmg60qHel5bUbiQVI8+lI3KqbNtMyjQXGKmwbMnG1LxB/ig6KHj8t7t
	 TiGa6XaHN3QBdhpXFJwCcOktqH9Svly67bWj9o4TZv/1TD/3V4rO/qmNOTzE6TrbmV
	 eGpZexL3Ikt/QVeVu6ZRJxnCIxhRIwdeK+OoIKzgdllSFc5vypPWImGQEaeca1x+YG
	 n+hUWNDdbyiMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34446383BF5F;
	Tue, 29 Jul 2025 18:40:30 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] soc: dt changes for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com> <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.17
X-PR-Tracked-Commit-Id: ac75da105eb38d7c48ee3421d116282d8c44b690
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 115e74a29b530d121891238e9551c4bcdf7b04b5
Message-Id: <175381442898.1585410.6262605657034973054.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 18:40:28 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_114013_236144_FA217AD9 
X-CRM114-Status: UNSURE (   4.76  )
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

The pull request you sent on Sat, 26 Jul 2025 12:27:05 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/115e74a29b530d121891238e9551c4bcdf7b04b5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

