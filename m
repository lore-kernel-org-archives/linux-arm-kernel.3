Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6916FC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zeFpIkzo0Wyq768tyw/OemiA7+E+R4gy3J0xUS5yaPk=; b=mTQixHCu8ELJ23igROhiJWF6Ed
	3EiSyCmmybm1cs27rHzEwzTJJMUyt/zIJNm3doQCTQ+5FibrQr8W+FxpiKuUrqutNZxXfH/JCrBpM
	dTw+E7p8K7ux59KTfpUIJlSOryH0fSBd53PWhnYDPRecKCXaCRtKLOGJdRRGS7RmLPhptSFjvnrCP
	+Okvcj8H/ipZr7Ksi3l/REp4/M35ekENG3rx7iaTj1AOVSV+wNFnOHLlKlCZa7PQm5pTDzhiN8wQ7
	bCgLG3yuFzP2NK/8A8/Bbql7njNZJWe2A6CfhpP+NJMI71PJgZsE28/NSl/xntKVS69weIuB7m5lB
	LIKNcpaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqOR-000000000n2-0sT3;
	Tue, 29 Jul 2025 19:53:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugqFf-0000000Haaz-2SjQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:44:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 16BCE43BC2;
	Tue, 29 Jul 2025 19:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A76C4CEEF;
	Tue, 29 Jul 2025 19:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753818282;
	bh=tcDsuAoiaaM76wFOzY0SxBKTvoLfG7AMBnUMYwUV4O0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JeAO7L88FzPGI7BaY21czmYhqSf+u3bTcREGIZoPadRvepFiUp8sa/Qxb5LsljYC2
	 W6rE4j0NxTLAkwDh845cBFmDG+aGzHt3MpXM1eCYnH4Rv50mImaB0IksIfFY22vEKK
	 GFyKs5otNo1knw9SNA++V+titfbeS/YG6qP8Bw3x9ertLJ+ov2b9Aa26LOvgJRK36r
	 TIL0gLzP2y5BgykGTFpUKaHJKSNUC6yuAIQ+YS75N8cNlD+GRQr+fbnpp00mhfKEhO
	 V/uUJu+tBV/uFo+FS1G/qzsCotxDrkbIWIuImzBHdFxs64wV9et4WvWkTc8VgvdODm
	 mCcLM+Q3ERIkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710C3383BF5F;
	Tue, 29 Jul 2025 19:45:00 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/cpuidle-psci updates for v6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250729111743.14723-1-ulf.hansson@linaro.org>
References: <20250729111743.14723-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20250729111743.14723-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17
X-PR-Tracked-Commit-Id: 05e35bd07d56780f0a5119973995b97a16843579
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fc8f5028eb0cc5aee0501a99f59a04f748fbff1c
Message-Id: <175381829885.1616007.17630324003432809799.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 19:44:58 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_124443_650446_3C984B66 
X-CRM114-Status: UNSURE (   4.64  )
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

The pull request you sent on Tue, 29 Jul 2025 13:17:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fc8f5028eb0cc5aee0501a99f59a04f748fbff1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

