Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDBDC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ov+1Wob0QBuvsqXdN1qpPMtK60fwLO/ji9nDDwrzuug=; b=qyZ7msE4cnDdeCHX1qxATjxd9+
	u4bBN8MmiCsMflKoLbIcUgdyu4ojJSS4LC4PcicSzksixeYaGGzTYiCaw6lQn4kKmO5BBqXjSF3sF
	TJ5kTfGXLBxVyVbFgQ+gO8wk6FljVol1mmPauRIrH7cYxUKcc916rfIIsQx4A4+ckeVevtFalINLw
	M/FUl0jTOkRgyO00Ej15A8cAwqzpVbUgtksXJiRAHhASVqUlpAnBCnervLNLMQ5ohAOwOcSfZlOHk
	1+TRB6E9PTwTeip352YpNMgyTW8QC1ROwNLOWiDrSTg34URgHnNrsGC1yIUWKo8TunkEgqsaKR6dd
	fH/ylARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLvG-0000000F219-48oL;
	Fri, 24 Jan 2025 15:48:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLtz-0000000F1oN-1O7h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:47:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D6FC5C6026;
	Fri, 24 Jan 2025 15:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3640BC4CEDD;
	Fri, 24 Jan 2025 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737733642;
	bh=qLAtR9FOE7rE55w/MOgIXJieoK9jo4797vMjVE6Ydzs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=NPQHM61F9y9gK6zxxDmghn49+ecM9ly+UAPtvm43vnGY3+jbcFHaLtDhiMDk1+Vac
	 m1QDhNqMMx8qan9MpXFyd593m2mfYGcpMdxIDObAYVLt0VbB7b+yDf91oe2dYsHNl9
	 9nz9AiHmiV8I6wjfYxMjipSgW08/XzKHfHEDfBd7S3HnzWBW0wTvEawNkeuqG4sKfV
	 AnFvwyIEiUx27oliZimrG6fHZReEfhwj0jfaaMwY21JR7jnyNzoqC3Uz5VrM7hZlGV
	 iku60X8STttd2k26im1PshJfR/zE0RbOmQNNETRbMDGLxnZ742P5OrP5j8Qq9WFxoC
	 sHSld54YUfcTQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3470F380AA79;
	Fri, 24 Jan 2025 15:47:48 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/cpuidle-psci updates for v6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250123141540.265172-1-ulf.hansson@linaro.org>
References: <20250123141540.265172-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250123141540.265172-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.14
X-PR-Tracked-Commit-Id: 885f5669f2abd0db34c9832259f77240d5350e36
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 68732c0bf97cf946ad08660203e8eabfea11463e
Message-Id: <173773366681.2077644.4429059783175392610.pr-tracker-bot@kernel.org>
Date: Fri, 24 Jan 2025 15:47:46 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_074723_410871_78A6B81B 
X-CRM114-Status: UNSURE (   4.41  )
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

The pull request you sent on Thu, 23 Jan 2025 15:15:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/68732c0bf97cf946ad08660203e8eabfea11463e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

