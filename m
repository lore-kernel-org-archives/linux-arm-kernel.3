Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FF2C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEDTZKOI1zKmVzVESeetHAjqEmshg9hQhE5xi+j+Pd0=; b=zM506jIFIN5DMou5SFNMMHgWGA
	HQvtpS8o3ee2L689khM6hLb6SaxX5G3UgUeu1gtwBIgQXb9g441iUCHl0OyThw4IjyOuCy7PPepT2
	KG1sjEuSGf5LiLNQOn6ovoaq3Ns+9NRrUeoumOEtoJh555CQ1gJuoymR/llVG6tj1mzQwrz5kGwIg
	oFTuiderAuKpjOkMcc5LukEClX1Am7kZVLZmmInsyMyYEse7/XsFfVHTC1/eGI9s/1xeJbcXZJdye
	Y0wPeUwaHU6hHTw4Qw0F/NU4udZPRkRLIIFAk70+xL1NJhcbP0Xk0MToe5BFfr1spKV6RXC2a1231
	B/68wdtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2b26-00000003ICz-2sVo;
	Fri, 04 Sep 2026 21:01:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2b25-00000003ICt-421j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 21:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF6574386E;
	Fri,  4 Sep 2026 21:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15331F00A3D;
	Fri,  4 Sep 2026 21:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788555668;
	bh=MEDTZKOI1zKmVzVESeetHAjqEmshg9hQhE5xi+j+Pd0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=EEpMlNpFw0IL38ZHdn42REVxD2A251H6p60xhpZ8yzmMP/TysVkr6HucDkXO603ru
	 X6Je3epVzH68SjbSE3w4JJEW1fmvlJ1xOBKjaM/iVlh5P6zqbWJvTOy6qVRAC7yvym
	 8uKySO351xHDPZEmVFszjttF4ZXJhPZpc7cBtpuLU1UIcv4tas/wA0GjfTIz/t6QO7
	 7X64yYlwVNl4iSA/lwzXezK3G6IauH26ROHWkPHH5YfPEXSBeJZKWlfRVioWZgDuCE
	 /GK93tVfl8y89F6FlfDEJcSKZeqBd4WHF7Tc6RPMuxHro6eUoMzxLkwWz/2SqrP14k
	 XpbXq4fyqvRmQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 953D63924A72;
	Fri,  4 Sep 2026 21:00:10 +0000 (UTC)
Subject: Re: [GIT PULL] arm64 fixes for -rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <apsL0Jd_RUiP20Vd@willie-the-truck>
References: <apsL0Jd_RUiP20Vd@willie-the-truck>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <apsL0Jd_RUiP20Vd@willie-the-truck>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes
X-PR-Tracked-Commit-Id: 5445d64199626974269fcdf347769ad44b0bb53b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f17a52d47ed39c89cc8429307cf246e781ec979
Message-Id: <178855561017.966019.6559448602205792725.pr-tracker-bot@kernel.org>
Date: Fri, 04 Sep 2026 21:00:10 +0000
To: Will Deacon <will@kernel.org>
Cc: torvalds@linux-foundation.org, catalin.marinas@arm.com, mark.rutland@arm.com, maz@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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

The pull request you sent on Fri, 4 Sep 2026 19:20:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f17a52d47ed39c89cc8429307cf246e781ec979

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

