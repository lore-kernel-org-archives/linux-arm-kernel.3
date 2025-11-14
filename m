Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BE1CEACCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 21:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moIrsZPJc9CVAixrZljYOqI5g+UDDWOLYxzpPKPT1ok=; b=PHQuZYFHylCjJFY5vSMQI/xKpX
	iGnpazMrb2MVu6j8K/xgRyCkDzm4ggSXvVbpFFtLKt4mjJUyRIg+CgEjS+v8jVPST2e9AsGtdTa9l
	XSBbkSLy0o4Np6XDPbyU8NnRM1nMXW83v+uS/qcwN20z1Tpp250Fb8c8GY2U9F76dRbR1cUGRruQ2
	V3HVT6gowY52vBRc8TC0nMp4C0F+87I3KfyMC/12GQtwszd2WiaKmqXzSCdd0TkP1fsEVv73Gl1hh
	+q6zbbavkEg3E8tOQAancno9zh4CLAL6XjAC2Xqh56pboW+OjQbA+9dmwlR75qwpqKA7jm/QWSZH0
	hxLM7a0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1ZS-0000000D8z3-2Lca;
	Fri, 14 Nov 2025 21:43:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK1ZQ-0000000D8yh-2aYj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 21:43:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F48743CCF;
	Fri, 14 Nov 2025 21:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F370C4CEF5;
	Fri, 14 Nov 2025 21:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763156583;
	bh=cXiTKb+J/2SYyIzJUk+sk/CI7+/XXtxQoJeF7Igyxv4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Cwtfw0pbuIHZ+WaTGIuR2giaqRSC8JMXU7zPhUtvGG/SA4oU+j04at2oK34HjYBK0
	 OCYZYlN8sg+6sxGTonxBK7oMXegA69JbhgiUya/+ajTotP8JRlx6BbsLQogd5NzI8C
	 iBfSWauM1kDEq9wXDnhGZ1LJ4suVAYjZDBJZs1Fjz6cvgoKvaJNnfcqZYVQMnS+jpc
	 Ffjvbhr8ZzL8ElCAwO0C0ows9byEsJZUoImqB421/7uuQHoLKRlUnxcMoSCE6rqO32
	 ebf+nN+0qSJqFf2XiF3DFHTUsLAa5DVMPwANcUK229hP7GemOEEtWxNojAKN0BkJSs
	 K9ZgUFXXkARQg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B6A3A78A5E;
	Fri, 14 Nov 2025 21:42:33 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.18-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251114161152.92955-1-ulf.hansson@linaro.org>
References: <20251114161152.92955-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251114161152.92955-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18-rc2
X-PR-Tracked-Commit-Id: bbde14682eba21d86f5f3d6fe2d371b1f97f1e61
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 241e99dbdcdfa715989555fa1d83025a8ce95775
Message-Id: <176315655168.1846194.15632016111013064431.pr-tracker-bot@kernel.org>
Date: Fri, 14 Nov 2025 21:42:31 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_134304_675298_FAA4A48F 
X-CRM114-Status: UNSURE (   4.21  )
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

The pull request you sent on Fri, 14 Nov 2025 17:11:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/241e99dbdcdfa715989555fa1d83025a8ce95775

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

