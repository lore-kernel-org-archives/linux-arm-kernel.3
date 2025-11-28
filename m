Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED98D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73qoRagIP9Le8pCvU6L9OAHI70Ceu/0jFLMMnOZxAIM=; b=l1vJL9GczHHi+Ixf0aQcCjQPky
	euOiT/j/uaTSzYUMjva3Z4WuAREU19ivSAo55JrECDrkyxcmfBRaqGFJtgepgUsZo9ac/57twJGG+
	WooWgmWlXqe2eyIQLPA+ZsvQEOwx1lZnP/1bDSV+PVpBFH0w1CQmUcaaJ8B4dOqaDl1Cd9mWm1yg/
	T9vuviJ1oHkbZrLTkA2LqHCnqQ8NMiEpTQMMLIyqz4XIRQ+uLz37zFZHHy5QUVI+E0YPqVyl07d6d
	w0Nh99uyXlh2Ha4jPSXPb3l3Z+i3XZ4M+jq6L+s/I8LwpnfPoYOG66IlkC9TAGbSbmCwUCG5apimL
	UM2NbkYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1Rk-00000000dVw-1ZLH;
	Fri, 28 Nov 2025 16:35:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1Ri-00000000dVk-0fF7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:35:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32F0A60126;
	Fri, 28 Nov 2025 16:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5191C4CEF1;
	Fri, 28 Nov 2025 16:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764347744;
	bh=8AglEL5IwEX/vkqGIeaiCAxI21pxttwEglvsC78jOSs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=O7Tq6josgtJI+PxZngNkQko/k0MtUDmdouXTAbpLHFxHqQg5WuORNOv6H4ZoHIVkt
	 b6Z4bciQuhg6XNI4vi3WvEHShKcGdb740D05ouMN93RNm+kKSm7CNKZwjMbNL5gniI
	 IUJfTjgbZOBPKPqZ9HAWShjlezLtZnybdp2eZRErZSxSClMSLIt3/Cndh2xD0WSZCR
	 1wPvgwrYOm4W1oQNTh4TJUnXXTzrN6AUSWu/zolu+rujDr1MZ7VjMmv3Oq9jK9AxrF
	 RUokBV0LzoVnNxCPtWwlSbZlwATxgF2nt4Z94ntu5NTb8FYpstQLsj5m2WKYCsFpgZ
	 xTTnYhOiIfWWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2AAB3806929;
	Fri, 28 Nov 2025 16:32:47 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.18-rc8
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251128131049.7584-1-ulf.hansson@linaro.org>
References: <20251128131049.7584-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251128131049.7584-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18-rc6
X-PR-Tracked-Commit-Id: c98c99d5dbdf9fb0063650594edfd7d49b5f4e29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f849f26f77205e25f6ad0b9011b1b68a560d35ff
Message-Id: <176434756651.719139.9248716127967964483.pr-tracker-bot@kernel.org>
Date: Fri, 28 Nov 2025 16:32:46 +0000
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Fri, 28 Nov 2025 14:10:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.18-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f849f26f77205e25f6ad0b9011b1b68a560d35ff

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

