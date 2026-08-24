Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1B7C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62nqyVIxBlg6+4lpbd2oJmqrhuKyMAdbCBEghkHxbjA=; b=REdXn3BCZtjEDnFExrNXfQqmhE
	1TQYCa9BokWELv3D4vtFmmq4FwmpThukKZZEvFqa3KCE0UJyUttotyr28Lkypp92zZYafbrIhUcpr
	keVpc2+SaGEj3cvyF2J0x4eTosgGoU1vKSah6Jgy98UKFCgBmPuWTnhkf5Y5pyJNyAUB16vHDrSEp
	MmOyW/sWVfCc07LB3IZII1aDJ/aWeRajww0DiKQcHgD0kAhiJAbaVQaQJgHrXpO8kscbRyI2JYXn+
	84HBtTfNGpfqt8XIKCPyKBphwkk1vEaToSMoguqEPCLliAY7Ll8DpQAm7EKIgJCg4ItZrl8esovEG
	xZOkDV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaCA-0000000HImA-397B;
	Mon, 24 Aug 2026 19:18:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyaC9-0000000HIlv-3rh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 19:18:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B49444011;
	Mon, 24 Aug 2026 19:18:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F7DA1F000E9;
	Mon, 24 Aug 2026 19:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787599137;
	bh=62nqyVIxBlg6+4lpbd2oJmqrhuKyMAdbCBEghkHxbjA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=e5IKGurNu8DYxMcN2x94VS7yxTCzucRDnaFZXDkzxcOuRv34ztjuYF1Jvds2Nk6CG
	 keCOvlXp6aUMI5rLh5E1UfaT9uaAY+yrD2z2Wg63BKLBrbFjJ5bKvZUy0ER/8BbLuK
	 HkRvGqA3HyglcdzRS8g27dAEbitChf95m3aYVFjO5Gk5S/2G/QtbI53EdTPUkVqo2R
	 FVWOPNgP9nogvDm9CdE2gwwR6SIvo+u2TDMZoY2vc7054FWD/cXi04EnriDo6wl8AJ
	 KUmjx7aHLEDJRbNl2gFa6f4ZoKTOjDPXvmxJC5kmYjQ28MY7cIgGqzvI/NQdYu60vm
	 AAgwQ1N0jSGDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A5E3924A4C;
	Mon, 24 Aug 2026 19:18:05 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox changes for v7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY10r9s2czQkkz8BPjhUy+kcAgxjqhFCiBEAwPv2ha6S9A@mail.gmail.com>
References: <CABb+yY10r9s2czQkkz8BPjhUy+kcAgxjqhFCiBEAwPv2ha6S9A@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CABb+yY10r9s2czQkkz8BPjhUy+kcAgxjqhFCiBEAwPv2ha6S9A@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.3
X-PR-Tracked-Commit-Id: 14af7a96afa39f4f3c1972705489b9ba15c01857
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8bfab832ad6905ba70e69bad87a78f6d90cce64a
Message-Id: <178759908440.3075085.10094272050651721719.pr-tracker-bot@kernel.org>
Date: Mon, 24 Aug 2026 19:18:04 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

The pull request you sent on Mon, 24 Aug 2026 09:50:22 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8bfab832ad6905ba70e69bad87a78f6d90cce64a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

