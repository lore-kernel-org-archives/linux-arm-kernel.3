Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFF6C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 19:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfLsnjsG875odJIWOIJA+BApswV+ncC47DF2bUVj3WU=; b=ZLfR0RuyIXPv9XI99Qq9OqjQ37
	JlULfL3ZiVugeb3nJ8DGlBu9Yfxa3ncD8ZKJ4ofPUjQKdXIu1BDHOwmcPQdXhIaj03kWkka9ubbzk
	txiA5bcg2GQeK3+UDcHUZ2vj2FSKsVWTQn0gktnbCOZoHz/rEsHitbTApp9+6yC/Sen0K53CXiaVk
	UfO7TQ8ijKdYx3q3MZqal+dPPknfNRmjyckkd57cRad+hBEpZMyuQ+8cidx3uRLAK4EGry8QgnYGB
	S8D030wmKWzjcX2565DkEhPreTsmND744CP2CSWZcyqmV4YeQIpRPDwr2BMF+HErd6jFL0Si1b1kL
	JbHL/DHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucqYv-0000000DMvD-0XnJ;
	Fri, 18 Jul 2025 19:16:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucqWV-0000000DMkd-0EHS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 19:13:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D8F2DA56074;
	Fri, 18 Jul 2025 19:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8905CC4CEF5;
	Fri, 18 Jul 2025 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752866013;
	bh=WEJPoZzdxFI+5M0fe+AGUXYeK9JEwJbiABJ/YI+lrr8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=unzB9/qGcHxp1a6jPZZlxEe4mphBQeo+m43Xni5m88Z6s+9fFJkDiD2/FGlag/v3w
	 0yjatYcYO6nCPB0ZLbXZvWpbKDR5o0UpchG4YcO3tOxrKnMmVIWW5hFPJT0skToyCv
	 D91HV+nDtVnGpnAzbJSJVlcyx/ZE02waq8PoVOec8KHUCY0ntZ55/cflHwy8H/v4pe
	 bSmO/dbk1lNmNG2r9J46NgYE23mttOXGHlg0Yfr3ZARUHFhE/9rO7W1dgM+jR/Ao19
	 haNFOi90QwOqgRFEa199a4pg7I6G56T8PkyDE08j1WqRd2NzpdbUZOA1LVIjZQDSLX
	 sd029BObUgIVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7104E383BA3C;
	Fri, 18 Jul 2025 19:13:54 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/cpuidle-psci fixes for v6.16-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250718113501.80851-1-ulf.hansson@linaro.org>
References: <20250718113501.80851-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-pm.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250718113501.80851-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.16-rc2
X-PR-Tracked-Commit-Id: 621a88dbfe9006c318a0cafbd12e677ccfe006e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7abc678e308467ab60ffb8c31f4638a47ee3518c
Message-Id: <175286603301.2766060.11715333521087216502.pr-tracker-bot@kernel.org>
Date: Fri, 18 Jul 2025 19:13:53 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_121335_159861_C0E91B0A 
X-CRM114-Status: UNSURE (   4.63  )
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

The pull request you sent on Fri, 18 Jul 2025 13:35:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.16-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7abc678e308467ab60ffb8c31f4638a47ee3518c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

