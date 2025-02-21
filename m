Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EA4C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 21:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nx85NbKlJdlF5pvee/Hd7OAZG2GS7Uk78ZIkV+ipX2o=; b=1r5mls1/TSgR5Ne66GB5xgugrh
	FINdYcSIH8p7VPMbAvwr67h6IWz8yX3kfOl+vvOaikg/Gr5T/wpcDMf96RrYUBfr0hNoNrRTblW3H
	ff+QniPVmz5quV3mQzZHxo/WKrg07XdxE/rN0yE0vpnn/KTXoeOW7k1PnXxRCnZI35flqnP4drk38
	FCqXFRYN5McQvD8LlV1YMyFIR4dqPj8+S3vqkZIXLtOp5pxu4i2ZWDpdGxvoMj6PiohRvR8zeAVNi
	1yWfL/9U9BDaheym8ZRjGQOxfoSAkShf2SA/sfaJmwll+aWauhdkLdjtihqeJ/pjAMMa06tlvRzVc
	/b8VPdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaWT-00000006upa-1DSR;
	Fri, 21 Feb 2025 21:25:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaS6-00000006uOY-2M4f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 21:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0F82061648;
	Fri, 21 Feb 2025 21:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD9FC4CED6;
	Fri, 21 Feb 2025 21:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740172853;
	bh=GvH9sbf7BjzVWFctUss3vdfXB5v/gMmJhuXeWp5vhR4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ehGHcpZLA82BG3NeQW1mzIokptL1heZNAKn2OlmevvNA4nJyEBeEXylo+8B9kjTIK
	 F1DfXEjDDalkhK1qTXGJrWq82SLTzF1H2OqtkhQRG4IfQqnmaG58QLAvAp1FCLBY7h
	 HrdI4mTPOkKZmYYUKeW+xb7KguWMoUWOSNvh2uLwP2NuBTWa630S4Yjag1uq5E5KFf
	 iMi5TLctaDQslRa+2SoqJA6dGHP4C4vY71rlgjMuwmZxrsneVfScIQ4EAa2DB1Bux3
	 l2P85JHdo4DIjtVSy+c6n4w0BHq99qdrf4FCFFqZmChaDASpdDhkBlZul9CphPXQ9r
	 yu7h98jPP9ALA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 860B3380CEEC;
	Fri, 21 Feb 2025 21:21:25 +0000 (UTC)
Subject: Re: [GIT PULL] soc: fixes for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <22f7e0e5-1ccc-41bf-a474-6cd09b23a26f@app.fastmail.com>
References: <22f7e0e5-1ccc-41bf-a474-6cd09b23a26f@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <22f7e0e5-1ccc-41bf-a474-6cd09b23a26f@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.14
X-PR-Tracked-Commit-Id: e31e3f6c0ce473f7ce1e70d54ac8e3ed190509f8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff202c5028a195c07b16e1a2fbb8ca6b7ba11a1c
Message-Id: <174017288435.2210212.11849723681477106984.pr-tracker-bot@kernel.org>
Date: Fri, 21 Feb 2025 21:21:24 +0000
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

The pull request you sent on Fri, 21 Feb 2025 22:04:42 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff202c5028a195c07b16e1a2fbb8ca6b7ba11a1c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

