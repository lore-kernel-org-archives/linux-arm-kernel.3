Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4628C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrhxc0H/XGoYlJh8SlFmw2T34wZcGT9x+brFdbw5dOs=; b=VJ79ZVCEEqpl6jrz7eJYMPmnr8
	Fyp8WQ+GptRahf1vy6CuM5BcvZQriyL/ZQizjGFe4CHXdRIsRqSmZywygvFG7x9MiLUCSeWbahtoo
	f/qajUcao3wjr+RdbqcW0CSccOT0Jlr39GJhL76OWjfRsi+8G2botzNsPxnqk1Myi2AoGERKK9uwS
	EeiYgdNLatbDHVamldbkFmJzq9WFhGx1ImdK03NnI/VCob7yQ9T4+MI8GfzBRkpmxEnvUHQySLJng
	DYDFgrhMFDbYsFo2yb3wQANwZKN159Y9Xp6aAHaE1ozfxB9S9PjV7btPF7Gk32eXzzh3ZwSj/vSOQ
	ladE1mGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wre5z-00000004F8P-0tYJ;
	Wed, 05 Aug 2026 16:03:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wre5x-00000004F8J-3oNl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 16:03:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 88A9442DD9;
	Wed,  5 Aug 2026 16:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C79E1F0155A;
	Wed,  5 Aug 2026 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785945831;
	bh=wrhxc0H/XGoYlJh8SlFmw2T34wZcGT9x+brFdbw5dOs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=lT0Nl+by0YF29eQaK40raQuWlFYb9Cv2ovcAfhZQp2OUVNy72nxUu6ynhyHs4Jn+O
	 U8HakinMBYjKeBtfhXojQ4tnQA0oc3SvEZ1FGKnMOgtk7yDw7NAwXMBPG5zhTcIBND
	 ajJIMjohIeGPLD7PxEPuwNgZJrHmD6MZex8381k3QiAQg7WR+jQCxVoDxiaKMrtZRg
	 NqxgUzFTLbR2G2qH5lrQ9bXGqF4Z2dWehXhzm3cKhK8IMD5ihfxh/tbpMKZtWTzeJN
	 IdWG9HDCP4e9yWQAn/9+RE8UeJ3zN1ajF6K8mxuja7rULI2gsVL/BDwMc3PubAVBPK
	 Kow/TBd9zPvrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B81392EE0D;
	Wed,  5 Aug 2026 16:03:12 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 7.2, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <8dac10a8-ed0c-4ee6-8e72-3e6a71b01c9a@app.fastmail.com>
References: <8dac10a8-ed0c-4ee6-8e72-3e6a71b01c9a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <8dac10a8-ed0c-4ee6-8e72-3e6a71b01c9a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-2
X-PR-Tracked-Commit-Id: c7a127371ce5dc3d073cc69ba70145c2c420d8e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0d839570765118029aa8bf4a95444c6a11aacf85
Message-Id: <178594579126.427447.3027242150664486307.pr-tracker-bot@kernel.org>
Date: Wed, 05 Aug 2026 16:03:11 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

The pull request you sent on Wed, 05 Aug 2026 10:03:52 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0d839570765118029aa8bf4a95444c6a11aacf85

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

