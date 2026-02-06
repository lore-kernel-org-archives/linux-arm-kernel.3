Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D975EE6B6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 23:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxmC+QqdYq1E18IaUVjr4WY+9tf/unNaTuXUIO478gM=; b=G49vKzxhE4CXy+5uyo9tfjrE7q
	P8G+/npPINE4ZJWnXH2aSd/RHr+53mTTKA8BHd3iE/tYVEWyICkrESo7DoKVnE9hVvuF0juYwMHX3
	JyHEgE81J2VUtbI1SjQvS4WaadAOhPCmeX7V0y2OBjXHr8dLU954qqLJe+/raaJ21lAiYvsYOzxQO
	eaxeGbBLyNPwqA9Cdn2N4aTNNn+yhjmdTyUnRUNHamJvFZ2kOxXcafZswPyH8EA0X8zjTgzEk05Re
	0EnyL2fPHzMWdtTZ0Ri+W5Mw8svGBVYHD1+o8e53SdM1CCTXwtZKob9u+j/ebKGvTRfrLYfgRc2Ht
	9jze5F1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voUxU-0000000BuAf-13sZ;
	Fri, 06 Feb 2026 23:09:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voUxS-0000000BuAZ-1nIt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 23:09:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7862A600AA;
	Fri,  6 Feb 2026 23:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5CBC116C6;
	Fri,  6 Feb 2026 23:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770419389;
	bh=vyqHlPcIjJzfjfUclMOSj5CAGDDQYLSQb6hr9O6C4tg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=J/7s/ocrhVq758pfRLOV1vWxxtyoVXM/JUO5tDRHFoz6u9dIQSfgIu86xs7+3hFO6
	 fhtwBO0B79e3mXTxdMAAy4C8fQ4sCACjcG46JHEdIFIqcTk9CHkOkZZWJWBbhkGTyr
	 u1RAmCZCTwTIsK/Mlig38laDtzsOhFCuxC5KvwVxTKEqJVta54oodPgro/PsZA0T0y
	 IQR+7dmBMoH+S0TpG8SIVCGX59zoepPryFhWEeVNrCMQlNFdf+8FCiBm77JtyEjHkE
	 NdBpwV8Owc3RROqCo7OFAM5ENjkgkcDSIdU4Z3pZ6ik3DQeepvNTO5ppGCORwhCKCz
	 D81SCq25MDZkA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8553C3809A17;
	Fri,  6 Feb 2026 23:09:47 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.19-rc9
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260206110555.539300-1-ulf.hansson@linaro.org>
References: <20260206110555.539300-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20260206110555.539300-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3-3
X-PR-Tracked-Commit-Id: e2c4c5b2bbd4f688a0f9f6da26cdf6d723c53478
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0dbc3577107008883a9d4275e4b67cd3b4dfacf5
Message-Id: <177041938605.1109628.5377895406191503833.pr-tracker-bot@kernel.org>
Date: Fri, 06 Feb 2026 23:09:46 +0000
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

The pull request you sent on Fri,  6 Feb 2026 12:05:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0dbc3577107008883a9d4275e4b67cd3b4dfacf5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

