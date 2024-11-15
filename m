Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E255D68BCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvGXYgRNGV+oR3POspk5Yi994I75oB1TvSocKUCNv8g=; b=KPswp6g1urDGkYte/bwSDyViZy
	w6u/GvBnPPQ99798Xre7W4rK8Y3Lv79VlGZnr1uKyzacpo1eCF5ugJ/xiaYhZ0YzVkUC3Dxg7Dbyj
	lqPdpmXekKPayhwCu4gqf1LLZOy7c30AQXgdWG5hvgrhp/IAqHR1avn8akYgxqEtKGSZ8E7K5i7nV
	QYpmfTlFBsMiKf7KjKA7ruRmOi5iqsk1CywdOfvIPPdqUkYFm4Z7IFpudgEKpbBDU8TBtRlLZ0o+X
	fTiGHief2OvyH3HV45fKDqncfDscx0Fdj2yN0xjuaC9xUc85N2Rizi/5x6X7E9xHzNTFpgZh1uv7W
	+NpKQjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC1Y4-00000003mTO-0l28;
	Fri, 15 Nov 2024 19:00:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC1X8-00000003mGX-0uBg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 18:59:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2BC35C6544;
	Fri, 15 Nov 2024 18:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB91CC4CECF;
	Fri, 15 Nov 2024 18:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731697144;
	bh=VoL9QAjzZoyo11W7X2QGJX+KFhZqxNNuuyRX7ng7k04=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WG9QKv8cNDA1LQvELcFsog+ELv6JKPodpjEjjwrXqhmMbK8jeX6S8CPbXODrwKtJe
	 jz3Etfy7Qc3YZIH/Xr+ltq7XQ6YpJasF1m7rg/zPLGcj3TwuSDv328uc/Y3XNyat3l
	 mqtTW9/3QsbtGS2ld2crVBT76xhzdh2IpX5VFkfg0+/e3MzHIsMzXsvfxHuEuO9Yuq
	 RaLgJZGYh7Bg8I5uw6T54axdNrcNugmYIJ3S5SJQwy5PTOtb8d6AvJTAoxwE/DCwjd
	 OtsQno3Zg4e/F98hbaxRaa8XSQ18np0YgAMvb3aSS3pUIsFjOQDat3PWU6H0fARJYU
	 Enzr2a2MPKZpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE903809A80;
	Fri, 15 Nov 2024 18:59:16 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/arm_scmi fixes for v6.12-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20241115104029.119226-1-ulf.hansson@linaro.org>
References: <20241115104029.119226-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20241115104029.119226-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.12-rc1-2
X-PR-Tracked-Commit-Id: d2fab3fc27cbca7ba65c539a2c5fc7f941231983
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b597e1cf0a226ff1a3b0e117238cfe6c5168de9
Message-Id: <173169715530.2685462.6684041644643108974.pr-tracker-bot@kernel.org>
Date: Fri, 15 Nov 2024 18:59:15 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_105906_312521_F6ECDA8F 
X-CRM114-Status: UNSURE (   4.71  )
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

The pull request you sent on Fri, 15 Nov 2024 11:40:29 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.12-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b597e1cf0a226ff1a3b0e117238cfe6c5168de9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

