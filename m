Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 516FCF8E499
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 04:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa+OQOxCY6tcZFRC72r6dqAtgYABL/Qwf2kqlzZjYpw=; b=okaWnVbx1equpJAYrfsko1bXgM
	gHhshx1ByH5hghIML8HxpTe1hGg/sycBkOpZIJ2w4UF3YN9ECdQqyLk5LnjaUFHc1s1ANDRuHctns
	3hXWBte+z4WR6EoADz3DPAas6VkApobWfSM+O24ImECZtumXufifBpNyjZhb8nfZRmnZYG1zmLw2P
	1CwbAWeCQ86cJKKMjKnQvH5GDXRWtaXMYnvUfCR10b/Waf/Oxu3QLOC0MO3w0E2QCGTX8BSXt6k9s
	CZyEZNszNDW7uTRFzHFHM4wHXmlPSRnxI2yQXZJbIMTovDK79O9DdNzzVBuBaraDy/Y+asX1k51oJ
	7wpVqYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaY1-00000003PPI-0j0R;
	Fri, 17 Apr 2026 04:11:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDaXy-00000003PON-0ITF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 04:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82D7260128;
	Fri, 17 Apr 2026 04:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A46BC2BCB0;
	Fri, 17 Apr 2026 04:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776399073;
	bh=h6jmDROY2K9iGN3Uwvf6K761XnTCt9jT4kJ0JvVcoTA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=VDrePJoR9eTziZiU25wzWLUC9y4j5pW8WBWA2bpAxw3wGr4jPn+a1sXGgZBhyGaAV
	 juNfpH4lScuayhandU6SjjUxEAljDCMV6V8D2IbL2FvsSD31Qm6pdhpfH6roozUK6T
	 qeEnMDN15REpBe5HrneDViEK5d91qfCZV5/dSKcQFWvJUZCXCy8mIIjDbUcJqdpopp
	 Wcp8SeAUbMykIFX4uqJU6hqXSsXROKq5azHHKbq9s4Ox9dWsbTaEBudcVa745X1vuC
	 Yucs/GX9edt8Xj5dyA1u0+W+vFtlr2Rcg1L8lBtGA8c1mu3eqeBXu9KGT+QAh5Xm+B
	 POh/9ULBeJeWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD6F380AA7D;
	Fri, 17 Apr 2026 04:10:42 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig updates for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <704b8a79-4fe5-4815-82aa-026de29dcf1a@app.fastmail.com>
References: <c595dc8e-6367-4922-98ed-90bdd4c3c24f@app.fastmail.com> <704b8a79-4fe5-4815-82aa-026de29dcf1a@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <704b8a79-4fe5-4815-82aa-026de29dcf1a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.1
X-PR-Tracked-Commit-Id: 07e1a498ee9a9e715208c06b39edd8f7d22f3b50
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 231d703058b2e2ee59884c8531e02c60a2a109ab
Message-Id: <177639904125.3519243.144554696309829561.pr-tracker-bot@kernel.org>
Date: Fri, 17 Apr 2026 04:10:41 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Fri, 17 Apr 2026 00:30:16 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/231d703058b2e2ee59884c8531e02c60a2a109ab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

