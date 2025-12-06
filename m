Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC11D3ABDC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 02:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yh8/34fh3QOO2qiVgcdhw0gc9EsVTnYV+8DJLuOBfyE=; b=bajz9xwLIqucEYgPP65g56OgO3
	jz/OjOMUEcYoQxAliThKDE9AiMONwAbzv6madjZ3RIHWre9tAKgil4NhUxAEOduI9FPhXyI244gzi
	a0Nx+FgzbGrJrwazm8c+B5H5bVVbd2Vxw2xL1ukXQZDW0Ba96VN0ml4QeTxHmu9SEvgSfQ3KjDzDb
	KbJsPkD3KIJyxHKEcNDCM69WliqAzN2133GHY+xNngvmdx3y8/gPpcZInYF++hMNx82lfXJKnVOc6
	V1+UQK32c/8z+B6EogtI/Sa5geNp3j1jkR+6Yr5CvDO472vaYHpih+J4DFkH5GQxVeAK4hAYgTmOc
	fqF5QCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhfM-0000000ARxt-2d9k;
	Sat, 06 Dec 2025 02:04:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhfL-0000000ARxM-2xzC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 02:04:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 224A6600CB;
	Sat,  6 Dec 2025 02:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB455C4CEF1;
	Sat,  6 Dec 2025 02:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986694;
	bh=u6cLUcMzEjeVwQxf/zmCrhB1K0X30gKF2KGIrgpFW/g=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XLzeRmHseeFZd9o7Tq0ZwGRuQm5KMnvWqzSr9Kwz/OoAopbRPHixAXsRACUEIvfGL
	 M5bsLuGRZixgRSqPaZQ/6an7teUbD2RPO8831WwM45+IjBXxWbeARb46B2eBOJz5FJ
	 Np+uXJAufHFFnQLtiUJG4wHRD4/EM1CnHftq64sS015ywOUh1bulxX9WrpunIZ2G6/
	 6n6WW5lmtnWNDNYB+OlO2gAd4UCPqADYkO6DTGxYPT3gwj0afjaeFDmhJNmQB4piGi
	 YvdOYEeDLz3ITeyM9dheThS1cArc4WWE/rBwhFg0ZclmNefzJcbF+yo8FwjboYLLPP
	 k/7jjUnFJLexQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 786CC3808200;
	Sat,  6 Dec 2025 02:01:53 +0000 (UTC)
Subject: Re: [GIT PULL 3/6] soc: devicetree updates for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <52068d9c-d677-4fa6-8ced-6a7fb190a935@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.19
X-PR-Tracked-Commit-Id: 79edb7f596db99c01b25c1deebeffede6b48b505
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0cac5ce06e524755b3dac1e0a060b05992076d93
Message-Id: <176498651213.1925836.5364884915425790784.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:01:52 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Fri, 05 Dec 2025 19:28:03 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0cac5ce06e524755b3dac1e0a060b05992076d93

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

