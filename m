Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42948C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ek1Eb9VkZMykR+LD8Q3zhar8vnE6fcfEC8Ho3sIIKI8=; b=4u5MP5s1DgGecmAKqFXRpLeKET
	+IbudSbAmntORvn3gaRQE7ycvCd8lan3oeMAD5p5samQuC3I+MJNmdMco3bJdc5itz4Qt8QSvIGWO
	X7h18bZ132fnqGo1ZUUJHbTBFlr//AA9xaK+SaO10GgJQdQKIxEdMJrX2SAmlDUOXO8MsUMFR2MNg
	GGiAZV77tw5x1LXqLSV8ne1DvxoRzoSkKrkePIa6SUnYSoqgyz5a/1r0aW7P7btDXjFE2iWOU01pl
	7Qu8YBFIphS1KEBuasoFCfEZY3FR6Y772/4nmjYy0E2MSitfrKgn/XY64oQOX/MqE7180r3qPoVIo
	TMnnsvJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkxL-00000002gYZ-3vUc;
	Fri, 17 Jul 2026 15:58:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkxL-00000002gYO-0sw9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 15:58:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF13D4091C;
	Fri, 17 Jul 2026 15:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B363E1F00A3A;
	Fri, 17 Jul 2026 15:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784303910;
	bh=Ek1Eb9VkZMykR+LD8Q3zhar8vnE6fcfEC8Ho3sIIKI8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FcwqmmSSqQdQdUjB7uqnkE8438w8JX9GiHNTJMOBYIdhqRf/rg3uu4FzIyOb4U3Wt
	 KqMvQ2G3Hc3XlN/ItX+wFYDB1k8VF1nU2nio5k3OhRgEln8U0IgfHspf/l94xISV1p
	 EHurAZnWeUhjORMIx3UTWQMQX4rK0DVI4C1YgSeIRynrbEBQd7TZRayUdstz4b6I+L
	 w2AkjUXz+cxnyOM48lBMlJXuL0NJjokmC4/l2ReI+Jbn4m10cBrRr9MZk7WOvFnrpa
	 ePihVjRZPvy74mtSiCUf7PQH6HCcEneFyeaqwzPj8hVmgnh990+0YBIcFZcAYMgvtJ
	 T7kNBUK5nbh+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568F4380CEF7;
	Fri, 17 Jul 2026 15:58:04 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <69fe5d78-221f-4825-a2a5-fd78f62f3628@app.fastmail.com>
References: <69fe5d78-221f-4825-a2a5-fd78f62f3628@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <69fe5d78-221f-4825-a2a5-fd78f62f3628@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-1
X-PR-Tracked-Commit-Id: 3d9855d114f0955d590420f5670152c1099c1638
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 111e7b23e5b05e2298f2e1a4d2a632bee4dde8b0
Message-Id: <178430388311.1777518.601822504595355660.pr-tracker-bot@kernel.org>
Date: Fri, 17 Jul 2026 15:58:03 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev
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

The pull request you sent on Fri, 17 Jul 2026 17:36:41 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/111e7b23e5b05e2298f2e1a4d2a632bee4dde8b0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

