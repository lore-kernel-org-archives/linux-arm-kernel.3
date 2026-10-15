Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B03CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 22:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcYacJF0PsVqkRtE2SYQC378jYxe6oYUoHOdDEED3Bw=; b=anMzvMw9qHkIm1EhBujVCVG9F5
	jkSVdcdq1ytfK2WrNw4w9wmnfn6PEZ0NngCDQBYV1gjNQGe1ey8JkItb+PAw40NiIBUIksbwwgadJ
	H4cmRNjWLwLhzmSDJUavxaQkoFKBj3dbma4UJ6heFk99zXr0iA/p41xSpL7Ps8QlvcATL8POCUPS3
	B8oeZuPpBP54Fpln4JZtUoR46ZXdTLUA+n//leVYYoW9C6nuw2bEiFnH8iGROley0yHDHKl6UFqBg
	u9N8IONV3cuylHXiVwmkMfX0VoxM6N7tk8rwZZm0+kbPBlCPOsV/p5lxjVigerp6n58BR9dSqDPas
	aEgE5wUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHTiG-00000001Tzh-2u0b;
	Thu, 15 Oct 2026 22:14:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHTiE-00000001TzY-3zmx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 22:14:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14BB260A74;
	Thu, 15 Oct 2026 22:14:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7DA1F000C4;
	Thu, 15 Oct 2026 22:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102449;
	bh=ZcYacJF0PsVqkRtE2SYQC378jYxe6oYUoHOdDEED3Bw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=FqrQvh6pbypC+99JB3jyNNrswuAU2ywkSSYkMY/sxITGH57hGXbydmNM/2S9zwHdB
	 AxJVp+/z+UzJ1Q3/wgBw2CV1YcXt3jGucS2RRr8o839KIVECoOaBLLUlcxk732IG5i
	 o7ID/J9kQKfbVL85Rk6GPbTTiS5HftY16+96KB2QpOciFXRKOhE7gdoN3gkzVz8K17
	 m7C0ZbeVLmzuC/hvf3B2/gf6tpzWh3qymtIaOG5CSWY2a8yV+q5WGzi66YyRJHmrht
	 6HefBZvNitwijKQXSrhqgK3jYzp0qVm5T4kgOEHlnlUNyn9tZM3XEvHFJD/meHlpKh
	 awXV6PCMqkQ5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B46713808209;
	Thu, 15 Oct 2026 22:14:09 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.3, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <66aaa5ec-c39e-4652-8607-4e2ab6541a64@app.fastmail.com>
References: <66aaa5ec-c39e-4652-8607-4e2ab6541a64@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lists.linux.dev>
X-PR-Tracked-Message-Id: <66aaa5ec-c39e-4652-8607-4e2ab6541a64@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-3
X-PR-Tracked-Commit-Id: 59f522f5a0ece96ce051a27d15533667a1d0dee8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
Message-Id: <179210244821.4132939.991066524806095559.pr-tracker-bot@kernel.org>
Date: Thu, 15 Oct 2026 22:14:08 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Thu, 15 Oct 2026 22:33:25 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

