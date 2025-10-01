Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A20CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tmWBtCQ5FM3m2ahIitDPYeTYcSr89lsWktImTb8UiNM=; b=FdYvVPQYPfhbrh6ytgj25KydZh
	VhfxP6o+8smzRNAtqotgb+gcXf0lJFxLl3dCAq4GRRFSwUB0DcxHTwp1W7ktDFHGL9oANS+OO9anA
	HhBCKioVGimz7fHEgce6ACyMVoneZ1KfLaLxcAapzGjihV0vDqKlPx3fjUwP7ok1pb7qqftPpJHpc
	Hv+JEUMjbQ4Q31p5CIK+5to+eGMmra2I1u4viD6/ZsTazN7/zsNdQ8Tp7PyTklZocj6JAiK5FuJvR
	9tYhzsSccyY0QI23lTJ6lNtLktVUcMN+OTdwD3dxBaTtENtvioL2ST37yFBe+Wt+YSwu+lLi8lAaY
	dtlDKFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v427g-00000008nrF-3miV;
	Wed, 01 Oct 2025 19:04:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v427e-00000008nq7-2LqP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 19:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A18841A1E;
	Wed,  1 Oct 2025 19:04:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7937EC4CEF1;
	Wed,  1 Oct 2025 19:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759345457;
	bh=ZzWQQ23t+Oh41+lJWDrZci6bgWU9+Kedo327I1QB3Q8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=G46p9OW8VhysssJ+WxIWQOwC7YG1ifdirgLwDhZOnmOnRfL/yQoaBj3jdvsWqGkZF
	 Af7Il9wSSPhtriGMYI67wE2zN66THvbAo2eIj3FZ8iV/6qxTmnRdq4I5v0qssVgMYF
	 XzUAT0cGoZe9PMm9DBG5JaLrtr/o4lCIFjBfHE4W+QJqxPFrf2uG4+z3Le76pdWqZu
	 tOWv3dhiOmatk/MX7bdxvn5CyXNzT7x1LgHdtCPXAkIF/qYrJmihPlN6oh/+mTLeg5
	 Js0gKFBrRTunwLO9Pe2i1wslJFPdmaZ7HGE70ZsyEGPneZbfWXIyTT9KPMwrK6wg5v
	 TX0bLdbFBQ0Vg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3356839D0C3F;
	Wed,  1 Oct 2025 19:04:11 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain updates for v6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250929114655.226466-1-ulf.hansson@linaro.org>
References: <20250929114655.226466-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250929114655.226466-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18
X-PR-Tracked-Commit-Id: bbc3110823eca23b066e75a920bdc8118adda0d2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e93bcbaa71f47bcee4972ae3b2ddb5964238bb96
Message-Id: <175934544970.2583066.11245987367020611745.pr-tracker-bot@kernel.org>
Date: Wed, 01 Oct 2025 19:04:09 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_120418_616381_BA7EC134 
X-CRM114-Status: UNSURE (   5.17  )
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

The pull request you sent on Mon, 29 Sep 2025 13:46:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e93bcbaa71f47bcee4972ae3b2ddb5964238bb96

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

