Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C791DD2A54F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 22:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aw+8q5H4sqe+dvU2eZvM8MEEkzw3G4w1aIITeluECJc=; b=46Nu4gdMExc/3JiUX0I3wNdF7z
	cC6RLK1MAVawEsaBrlnwfchfgz/XDblvHr4v+YjXujCc7PzD0vza0gJrsEDo9cCaWLxIaCc4Wb17R
	uyBCXEkhf4V7n58f0Ar5a9yJBfFYnNlBoZlbgyH1PezrH8xQPruhUQ8L6uvEhFdm21Bu9Ww9qXGr9
	pRIMR53wyik1mpmQS7IruBZzAtBda6ponkeHj/shGmoLmffay+GjT+zKGGnyopP9IYRUdLR4gLIa0
	VXLyGqZBtnMyMAlG0s6C+6J2SEAybY26mfWRiLjrfbD4iBupWzwpppJIgqEFqA9sR38DXmFlfODWJ
	o7Fl9yeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRHaj-00000008iMf-1BnI;
	Thu, 04 Dec 2025 22:14:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRHad-00000008iLk-2Hrp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 22:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A60B16020A;
	Thu,  4 Dec 2025 22:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A98CC4CEFB;
	Thu,  4 Dec 2025 22:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764886458;
	bh=i1b1OQLbG2VEL7KIHfRWVF/kPVHS15MWLIozPya6duk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=g696lonnyXTQm+KvyJU0HUnTuWHNnIXxh7Hly4cwOqoE1gR8xa0A+iBYV3MZHZbe0
	 Xkoy04ujgnzAhNwERmPf+tWeI1BOanrvwwVi3JG55x7fGSCDejnuwcHd2zEdcFGFte
	 1vklZ2/mm9rZNyDEsNr1+qm9p0yW1DOakQF/Qcu6bprBrdp/zuRCihJh4QkfUZBeYH
	 WPbyixIrC42vb9t4oz44VzTTNxycg2P30UTYz+2jRI+L5yaIlPNrZ3fGyFf76/vXo9
	 cQkVXbYYPDy1C6vrzhGtz5ae+BaWONdV8JmRHb0NCL3+83/Mxi/fuDucH5PkfL8Yaz
	 Havgp7oY1lXtw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B5C063AA9A85;
	Thu,  4 Dec 2025 22:11:17 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain/cpuidle-psci updates for v6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251201175125.34284-1-ulf.hansson@linaro.org>
References: <20251201175125.34284-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20251201175125.34284-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19
X-PR-Tracked-Commit-Id: 1f67707fafa598e2338dba08e3de0db3e468afd1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 52206f82d9244546e5790f5ad64465343aa7ffd5
Message-Id: <176488627629.997489.5449329879391180741.pr-tracker-bot@kernel.org>
Date: Thu, 04 Dec 2025 22:11:16 +0000
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

The pull request you sent on Mon,  1 Dec 2025 18:51:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/52206f82d9244546e5790f5ad64465343aa7ffd5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

