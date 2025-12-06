Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D031D3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 02:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCcBzKp104H/t384PRJnhFec+cgjp9eoldUKnGyjBeU=; b=k8pLHaUE8RLzHkRa6NH4QvstpC
	AHshzA7XMJA8/mVGih4sQPZhwlOlSS5lUFreYiEGdUt936GcdJeYiTbhq+SfRGSDE3C7/RrvJQJY4
	Rbg9B0EOPiDqA9FWe8N2epl4pnWMhRRY6R7aRFMiggluYZt+yoCo6l5rf0VZeU51RL/ogohw1sLw7
	+RxxWK4IPW4pZ1+NfDhptuJoZ/yUOUOqe5Kjlv/vm46MOrHoIa432V7s1Xv+GgbNbu0+Y1PQC3eoW
	yLB+AgBSmDUjJPE4mQ2QGptl9TsitKXRpCxa8sWdmoz0LO6jJ6ARFRHsKygtvvjhRC9dFGhxexeVE
	ps45RGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe9-0000000ARVO-2sUv;
	Sat, 06 Dec 2025 02:03:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRhe8-0000000ARUf-1Vsp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 02:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7CF160150;
	Sat,  6 Dec 2025 02:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCF7C116C6;
	Sat,  6 Dec 2025 02:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764986619;
	bh=aGGp/lX1t1Lk68pVkOmI689SPn+RS9weCv6GtkPCftc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=EJjHp5KzsndRR3R94eVPFwkkgLd9ASZF1AV3EJ4YMugZr/IO7dDh7J2Cn2CyTHfAH
	 1m3ikdIuy99q+6TTKN7HJJdBTT7oTp9rbgW2jYbfyWFAC0BM8+nwEd4V5QidnFJwRu
	 YRZAwaqEc5who2TZrEMK7JiR63ELcd+QP9vNp6RM6L6iApw4YBJZC6lnHrmuaO8YP9
	 bMRPJg5/6xY9ePNYpLCFvBUIs5x2aVAqXLeedgcd2iyrdW9r8Vej1AqtrVgX9/7lpV
	 df23W2uI06rxLU/8JHWAPr4QpnL9adDG6EMaQDJmPJ2JgE2Kf6WxzphDPlM4mK8CBx
	 XjFTwApVg24IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 2AFC73808201;
	Sat,  6 Dec 2025 02:00:38 +0000 (UTC)
Subject: Re: [GIT PULL 6/6] soc: driver updates for 6.19, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <16f9deb7-8717-4983-99b7-91a6e84eb560@app.fastmail.com>
References: <334684ec-5796-47a4-b9f4-96c60f449634@app.fastmail.com> <16f9deb7-8717-4983-99b7-91a6e84eb560@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <16f9deb7-8717-4983-99b7-91a6e84eb560@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19-2
X-PR-Tracked-Commit-Id: 68f9bbf4dfc356ccc6586ba6e7dd79576c48f7f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 11efc1cb7016e300047822fd60e0f4b4158bd56d
Message-Id: <176498643691.1925836.6118525304815513749.pr-tracker-bot@kernel.org>
Date: Sat, 06 Dec 2025 02:00:36 +0000
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

The pull request you sent on Fri, 05 Dec 2025 19:33:21 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.19-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/11efc1cb7016e300047822fd60e0f4b4158bd56d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

