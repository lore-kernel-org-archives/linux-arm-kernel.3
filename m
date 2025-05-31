Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0B9C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 May 2025 15:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTMfePZLXwXsVTlnaj4OaxAGhVBqfDmH7Yd0dTIvY5s=; b=FwhMZwMxYaRc/2lT5zZa7Ul8Mk
	6t2Q3r1b6qfhVxU8LURLVOhmpUFOtreW2jvSRxt5YM4/qQqktKhwDsyDsR8GBW5X3qkMbqsttOVoh
	U7YCUNPmZlMLQVz7k4oTvinFy/ygZVi+2/dYjlWER9vg+47hNQo0GULV2z5PyHV36NXh2OHKtpCMT
	5xhZy+X44fx7zXaY4GCzAsVHWQ4qzWHj97A4NKDZ0VpshQtZiw1GXNH0gQu2Uzj8+HItTSQmNcltr
	C73W0mXo50V70L/MWrasFKZkwNmLhNmzBCH21EpkHXHnWJAlSvKfI2WPo9YHyEmj00AnftCnUrB3k
	Mdl6xbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLODv-00000003yjE-1RbA;
	Sat, 31 May 2025 15:34:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLOA5-00000003xmr-0VGa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 May 2025 15:30:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 141056112C;
	Sat, 31 May 2025 15:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDFFC4CEE3;
	Sat, 31 May 2025 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705415;
	bh=QZs8cZpTJY2GYyXFmJ1cbxgzHKLLlva4Qev0J55Op7s=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=kr+NmFCMehV0biK5Tk/hYTvrUWCfaRfbB6pR2M32fEEPwPKGvlv5SQnUk78m/VKMM
	 NR8bnHd47rrCysdN57DkNNPiQv4l9HN/jIVpskyTJaBuo8FqIfghcUf0hj2yAkODZB
	 XIB8nOGwyR2Ts1l86LvrBMRLrhNnxYzz8vWfhD2ZZz54cjjMy5gUOPyhQrdFohoVeE
	 yqpoEtTBNDalgh5++XtYpBS7E7fZeMeMqHMCLI9Hf4KGbV7r+Bi+dAGKykOrrU71s0
	 mVU64Kg9RwXkMSJCn+Jvj5/8wzpHXos2ecwthnyH+NdgPANq9VoN/a9VWKzX2yaCyn
	 w80lDZYDzXBgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DFD380AA70;
	Sat, 31 May 2025 15:30:50 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] soc: drivers for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <f44d3ad7-b518-4679-8f7b-949680b26ef7@app.fastmail.com>
References: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com> <f44d3ad7-b518-4679-8f7b-949680b26ef7@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f44d3ad7-b518-4679-8f7b-949680b26ef7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.16
X-PR-Tracked-Commit-Id: 5963edd98a2159f2114b08e402a7341c1e7dd293
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 297d9111e9fcf47dd1dcc6f79bba915f35378d01
Message-Id: <174870544866.163157.4319179356868633377.pr-tracker-bot@kernel.org>
Date: Sat, 31 May 2025 15:30:48 +0000
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

The pull request you sent on Sat, 31 May 2025 11:01:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/297d9111e9fcf47dd1dcc6f79bba915f35378d01

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

