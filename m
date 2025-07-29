Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07411C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JNndKXOLNhXTcdvEVNAXukgLf95QzwwXGw4YPuTgXM=; b=sP5imN8kNhwRmGjjsKpe3ImHZm
	uiHXeq5HerYYTmQr5xr5W+82NMSnI5iQ8wYhm5obTsb0NdIzG5bAS5B7BDweOqc+QSO3nc7HJ8tY9
	GhsZz/2v30318KbsooRnmk5IikpsH09U/smOSrw456uJ8xHikEkp0Iqw//8c5yzTf9OykkTBWddhg
	yhj7ERR60vkaw9z8DhjJKWpfO9u0QP6pGNv662FGkHiENtFjaoQZGmCMJ6yacEznWfpehgIFcj/4+
	Ht+GDJ3B1hw78jWl0mn2kVlCF7OAOEy5VdQJxRKU12yvoAQdNXJfEp78Vu0H8xKwiaggcyliUnOUs
	m4np41AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpKA-0000000HTzP-2hhH;
	Tue, 29 Jul 2025 18:45:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpFH-0000000HTIU-168F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 18:40:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DCE360209;
	Tue, 29 Jul 2025 18:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DE4C4CEEF;
	Tue, 29 Jul 2025 18:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753814414;
	bh=UX/MJHveA5Ap7yrrdOCX+32Dvup+AZC66ZpXumjdzJI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=IW5a5HLFNUbpJV9YSo0ppPquUGqclUWY4FfMwpZ8vkSy/5MHDewUm2sGdc8UFyFb1
	 +0rRyVDeU9IXh8QO6Qlnzi/w6ze+ebQDImVhhITsoTm4nwxqMlGA0az0Rs75lEQ9oa
	 YByWarWwZORUdpV9ZRLC0uM++V7VEXVh/JwJ0roOkABRHep2VjWyiPc0V1s4pALQcq
	 o37Pa+5YfbU8vuX4spb/oPOlObqhGIGeFD1+EROo8/kRwID/inxjNnhDYbEbRIFJUZ
	 mdbsvTnVKmfZddKCK9ctZPVfUhbN7FQmNVWjYmxwPh/gzKVlhDGisabdllsA6T1wRj
	 NRw2GAhplJmUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD10383BF5F;
	Tue, 29 Jul 2025 18:40:31 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] soc: driver updates for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <60aec956-e650-43ab-ace2-52e21d7892f8@app.fastmail.com>
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com> <60aec956-e650-43ab-ace2-52e21d7892f8@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <60aec956-e650-43ab-ace2-52e21d7892f8@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.17
X-PR-Tracked-Commit-Id: 4507d205f10216d3a6b873f0a2e9c634e23f35ac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f46f50845ce75bfaba62df0421084d23bb6a72f
Message-Id: <175381443063.1585410.3215815371242007157.pr-tracker-bot@kernel.org>
Date: Tue, 29 Jul 2025 18:40:30 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Sat, 26 Jul 2025 12:29:44 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f46f50845ce75bfaba62df0421084d23bb6a72f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

