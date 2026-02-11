Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAE3EB596A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 05:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uUXD9Z6h7Lwhv3JgNotJSRKPPKE+CRau0hjngLuMj44=; b=Eg8SmHy5rB3qigFaPoNeB1FBYt
	GWCOxl3p224H7o53UsfjCnmcHbGC7qd5cRybZ2NNsKq5kHMqVOt8NncuNUNg/B4D3jdpTYCyzives
	+Cs69QAHXF387RGXsAUU9/SeW6vIVpW9txAxqMYtixIqaWMPlxvLhoaEArn747aPAvvkU/6QsLfgE
	+2DBE0OfZCvaVCV+/R1InjlDSQ40fHNe3kh6/sYo3yxdClmUQjdeel25D22ameqqz+PfGULwCyvWJ
	vW2ZT10YqQ5cZWkFSqUUOKZOL76iAOx7HSGGEz8NFkhmIk/gEmVSIvmjwcn5IYmIdWrnswobK4QAs
	gk9+KtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2ca-00000000Dtr-0WKd;
	Wed, 11 Feb 2026 05:18:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq2cX-00000000DsI-2Gze
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 05:18:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FAE041904;
	Wed, 11 Feb 2026 05:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DA5C4CEF7;
	Wed, 11 Feb 2026 05:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770787116;
	bh=gatPfKzn6P1pNeuog7ca9NEDlY7DRIhZVUjzFTPEURU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=buqx5UrTyeyN9fiYHQD02jbtBZa9OYPMq/HUyy4VWxB7Bnu6xiHu6N9p9FNTYOXWH
	 T7akkCZGfFX45/a0lmS+y15tI6/aypSuLZIjshrBIRVvQn3WMkcaYP7guyNqPbMet/
	 ZgvN/PBdrIvItjfjVI5v3Aq23r6PvM9vnp97/ZfSsGhaXpVdCIcL03VCmtsn+9I9ci
	 nYJaFCSqc37M0pD/xRCm6A/rbb+xSbdYk969yoRePJ9Js1Wqi1mxtNnBBK0L/+6efU
	 ALqdv3fUaotIg2dcknxiz/00ZCFQ8HOg9HG+k9GHIz9BKl5iGOQrmV4w58yoKSf1ng
	 QU9Mc0IVQT7lQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 84FD3380AA50;
	Wed, 11 Feb 2026 05:18:32 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: driver updates for 7.0
From: pr-tracker-bot@kernel.org
In-Reply-To: <0f7a14cd-de06-4b7c-b29b-cd827f688cb4@app.fastmail.com>
References: <a34ea40f-e0d3-459b-8233-9f87f6cd73e5@app.fastmail.com> <0f7a14cd-de06-4b7c-b29b-cd827f688cb4@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <0f7a14cd-de06-4b7c-b29b-cd827f688cb4@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.0
X-PR-Tracked-Commit-Id: cfd00b7e26c8331e3bb0f03ca770888866c15ff4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdbddf72a2ab1cfea699959795d70df3931eefe7
Message-Id: <177078711120.18664.11712890111989648418.pr-tracker-bot@kernel.org>
Date: Wed, 11 Feb 2026 05:18:31 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_211837_603975_2748D6E3 
X-CRM114-Status: UNSURE (   4.51  )
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

The pull request you sent on Tue, 10 Feb 2026 18:07:27 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-7.0

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdbddf72a2ab1cfea699959795d70df3931eefe7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

