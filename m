Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C31FC6160
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 18:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dj8SJC/FY9MGs3eCsov6MQpr9CBa8T6munzj1sK/N4s=; b=xebZYk6/eZ6TXog7V9kbyd5yuj
	KpLDODCAUEtRv9qaDYi2Ivg4LFkB8JLIEQu1f/5skdO2vkssHpDucolfh4nhrrFzjQJ+FtD/hmVKw
	oyk6ij0nBQZHOQAXnGluFbZCAN8SghMFh6YsVEx1VmnasazIR7Um31eouGbPW+Jfi6sK6hLfRQbdh
	F/VM0tGNmzYwdRVqlO5bHlH+eFT5W/TQ4mjFfrLzKXX3HK3XcNziEYLq/2Hlu6u+oGmNt4G999EBp
	rmQzmUNGFQajH9A4Ta8FZ85QqKJ3IfjbHxZqG516v23uKGMa+moySCA+k52auZovPRpXw5+zSK1Zo
	QFHbrqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc6A0-00000009giO-1eWL;
	Sat, 03 Jan 2026 18:15:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc69w-00000009giG-1vR2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 18:15:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76DF460017;
	Sat,  3 Jan 2026 18:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEF8C113D0;
	Sat,  3 Jan 2026 18:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767464127;
	bh=hFpX56ln6Yt9IaSkek/+j4UlTv6P2fbyqZTt/s4bWGA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZKRScet5qiaSNilXdLTXMT6RgzRGv4La34DKPCcWvLBLdjWpgjPA5mnjr1GsK+FNL
	 rQVDv3igC3150/n5ePRsp/daUmcBPmU/Vf2j+XDY2NKSLgBQKrVAcHgyIo9POF2TWs
	 KW3I7q+4ZYZO3abXxij9pfhyERVPESbJA2GLCe6AaK99a7ILdnRbsx4XS3/ooRaP4q
	 J0MGnmpooUvjBgVKoTaIse2kRa+E2oR+xSL9wJ3lETlCO145dlrNzxgA8ovKqBFvMT
	 d3aZ0CwMiCIWjOczPANRJbxiEDpL+MqyUNRd4JkLfPfSoZflZWjEzUatztvnW05Eio
	 Yzb7i+baoOEeA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BBBA7380A97D;
	Sat,  3 Jan 2026 18:12:07 +0000 (UTC)
Subject: Re: [GIT PULL] pmdomain fixes for v6.19-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260103093751.58526-1-ulf.hansson@linaro.org>
References: <20260103093751.58526-1-ulf.hansson@linaro.org>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20260103093751.58526-1-ulf.hansson@linaro.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3
X-PR-Tracked-Commit-Id: 73cb5f6eafb0ac7aea8cdeb8ff12981aa741d8fb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aacb0a6d604ac9953b261963efe25ae7521b7c58
Message-Id: <176746392631.4169496.6609966638803957076.pr-tracker-bot@kernel.org>
Date: Sat, 03 Jan 2026 18:12:06 +0000
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

The pull request you sent on Sat,  3 Jan 2026 10:37:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.19-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aacb0a6d604ac9953b261963efe25ae7521b7c58

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

