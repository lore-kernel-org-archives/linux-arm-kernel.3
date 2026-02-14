Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A571EF5851
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy06XhncbdypgKZfdNnYkDzH+AyayYiXuFnCoBhvhBc=; b=ZsBnPVK8rywyc0MiHF8z+XBzqR
	Wdadc53SRDVdOBkeYHeCiPuYnMeXqDtfJbrYLEM3yjKGxnkZmSacn8S+7su8Hx7EFtf0akbxv4KFP
	DOhY8as58su4yjwnJdxbGo6UH1WKJkTROy3wcUF1WToUghBssa3jd9x+qVsMAOVrKuN4HLoChYcg5
	EyHiWbAbISfg95drKgW0+kugFn+tU/iRsA63HApBGaAwVdHkxd99eguEct0BYjlREQ0GV9xuukvwx
	uP+Kz7bz9Dw+5EpLIu8esABk/voeqLHS+F1sTp/A9mAgo8tTVMs2ENH+kZ9MiRXmgUmBu4hSqTc4W
	d7VvbAwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMez-00000004vNV-0W5N;
	Sat, 14 Feb 2026 20:54:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrMex-00000004vND-0akJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 20:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C8CA0600C4;
	Sat, 14 Feb 2026 20:54:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBC7C16AAE;
	Sat, 14 Feb 2026 20:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771102473;
	bh=jUThX0Hjotf4C0yks4iSt4dfaxE5Zp1fcJr/QTFo2aM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=iCQcK3Xkc4cqOPmVKEjxtmQ7wLX/gmGT8aFY+BmUFPlIjsvt2q9XGPSGLFBDN3sbY
	 4Om8RM1pmFBIgED0zyzs8LQ/qW9dDoo7fQGWB34NIeS/DqMH7a6EOWJNR+znkP/RAD
	 gTmYrmExe/ZjmJranhNnWMhDAUm5KI1GWCk1XSeRxofaE3AzNWLgZRoFObR2VVdhjs
	 5nwYIBEl5ClYXzQpir0wGk4f000NWq7jPMA0nB+lhzrUP0WxWrgYvpvsd3ZfaJ27t1
	 7ycLILDEN6Fj4qsmFEREuEVk+3KwfymMiWAB3vk1UX3OKvwMO+apV3Wc+trWlm33pi
	 S6ySjThffmHWw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AFA5393091E;
	Sat, 14 Feb 2026 20:54:28 +0000 (UTC)
Subject: Re: [GIT PULL] Mailbox fixes for v6.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <CABb+yY0ErLA7X9OgU9OErDSg3Z3zXVLgp8JOrqAAuumTnznJqg@mail.gmail.com>
References: <CABb+yY0ErLA7X9OgU9OErDSg3Z3zXVLgp8JOrqAAuumTnznJqg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CABb+yY0ErLA7X9OgU9OErDSg3Z3zXVLgp8JOrqAAuumTnznJqg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.20
X-PR-Tracked-Commit-Id: 75df94d05fc03fd9d861eaf79ce10fbb7a548bd8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f0a475aedd190db95cf92914ca7760c06fbdb704
Message-Id: <177110246669.2897141.1938643283422716361.pr-tracker-bot@kernel.org>
Date: Sat, 14 Feb 2026 20:54:26 +0000
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

The pull request you sent on Fri, 13 Feb 2026 20:47:38 -0600:

> git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git tags/mailbox-v6.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f0a475aedd190db95cf92914ca7760c06fbdb704

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

