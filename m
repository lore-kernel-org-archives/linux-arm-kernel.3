Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A74CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 18:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwNqzZhDav6G0K8R3d3rn3EEFZ7UfykZqJM2o4QK144=; b=t3uBhhBh/0m1UDSUk/mHo4oAZf
	PS48aSBqdTSVdXhFgWAmrAtZmaWQX7CK8Vo0kR7bOdfNFqQTUK9XfJfSHFIiMb/dwxYT5yTZitZbN
	OffwRMpB35/pUa6rjXwbxEE/yvYksdTqbtd1FTbAfEjtnVUI69IgnrHsSRdNsW0rFa9p4KC5p++ej
	hdITTk/eUl171MF2BJE9lwVPoTogYqEoigtD1RGN//5aXENixomETR7FJVxw8S/FQS9nod7kRIhEA
	EYB/DUIJL789zF8kihPjuGouv96I1DvieMVBEFTMxiqmW2lECx8KZhhmPMAWd9qf8WAX191ZHGoGJ
	hb5jEbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTYA-0000000Dce1-2ysO;
	Tue, 02 Jun 2026 18:09:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUTY9-0000000Dcdv-3hj0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 18:09:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 060B160126;
	Tue,  2 Jun 2026 18:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35861F00893;
	Tue,  2 Jun 2026 18:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780423752;
	bh=uwNqzZhDav6G0K8R3d3rn3EEFZ7UfykZqJM2o4QK144=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=jeEySSWi9iTphlLtihYV/kOTw4630E2gUIUFxb1MMTn8ZrxLkUx0+NB8klUbttdZk
	 n/I+fjU3RuU3yhMtBS9IVGmLJdfNtFn/UFADKlZMmayvKwYEtagdhUux6C9xa8YTNt
	 17tGkIQ2zPjHCdax8xH0LLMpQzBPqfpsU3cK82OkSLIJTYnYnVDATbud2yHNwel0jJ
	 uL057WCLpKMYP58U/NTu6wdXp/d4RwJz1i7AlO3xXV/JBp4iG+BIRuQQGUCHta03zf
	 vAA8M4E2xVV1QrOCwvPzTfETicxlSbwrbEFJN0G1T+DXJPSdAk9ZXmUuFqMHGOFMpx
	 4254w2kHpXfcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AD23811A6C;
	Tue,  2 Jun 2026 18:09:15 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 7.1, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
References: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-2
X-PR-Tracked-Commit-Id: fce4668a01227abb2c60e3202cf866137fbfcef2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
Message-Id: <178042375435.983785.13583312706640781660.pr-tracker-bot@kernel.org>
Date: Tue, 02 Jun 2026 18:09:14 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

The pull request you sent on Tue, 02 Jun 2026 10:03:23 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba3e43a9e601636f5edb54e259a74f96ca3b8fd8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

