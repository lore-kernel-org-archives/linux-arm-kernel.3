Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5D2F531CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 00:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJtrisspqjgmeTW7UJ+g/XzDw5DydKMTCfc+7vJlKkc=; b=E5S3+Yj86bYMdNIwymZjQxkNdp
	S77C1Mcg7n8D1KNxOvLFqzYts4HYBJOvqC8haRAgTnmHegALQKtBUWk5ygvvQ4is81X7vZbwjiNV9
	g22CTBh5XutBkfh7axGuzoKO6qbKJOyMkMFBQB4+vXFY2DHrTx4b+aywKwv8sXr9wd3KsH0nA9xR9
	7qskwrcpuUQCvnBSCIdxBh3d0vh81m2PE2PQgtj0XFIgFv3YX1vsM934DiFH0SOJhJ4Qk8aPb7mtT
	jCZ+boUVHRe8Eyze6GLknWDxKSBblOtXjRI03QXH27EjbYSaeVNE6REiGV9MlWK2FXyWWMdggfOSl
	Z+zACprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRnO-0000000GXKI-3eut;
	Tue, 14 Apr 2026 00:38:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRnN-0000000GXK1-0cWA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 00:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24D1160126;
	Tue, 14 Apr 2026 00:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB618C2BCAF;
	Tue, 14 Apr 2026 00:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776127103;
	bh=Gc6PfR8mg78bc2nZBSOOeXTxrqwjLV39hOWe/+ycSm0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=JZCkTh8FzLgkqnG+HxOg6tccMBA5tBfIgRtuUykc0wE16SvkBU2aPpIKeI3wHvGNF
	 N9nWdAYPKnM8k8xWq0r+H6PO266XY3MalNKfMRYzDHL0GVxER2Of66U7mVVV0dRUje
	 6+Ofup54e/PQbCfSsCDSaFYVa79azUiOMvtWotKo4EJsCtyGEu6ISYf5OzadMHe6M8
	 6SzCbxSqgjOuCrB5GNeYelf4Ac9UaHFk43uuLLxCv/1dgz+3HEPRjT1XH5eEw17wO9
	 Tj9q4vHXkrMm6tK7QXJOtjCbhpFauetGF9zjUQITCPWKx9uXx+W2Q5lfZ+04qMag75
	 REhyTO0EMF8IA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD5D3809A0B;
	Tue, 14 Apr 2026 00:37:56 +0000 (UTC)
Subject: Re: [GIT PULL] Crypto library updates for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260412003225.GC6632@sol>
References: <20260412003225.GC6632@sol>
X-PR-Tracked-List-Id: <linux-crypto.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260412003225.GC6632@sol>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-for-linus
X-PR-Tracked-Commit-Id: 12b11e47f126d097839fd2f077636e2139b0151b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 370c3883195566ee3e7d79e0146c3d735a406573
Message-Id: <177612707471.625472.10128103824010012548.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 00:37:54 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, AlanSong-oc <AlanSong-oc@zhaoxin.com>, Arnd Bergmann <arnd@arndb.de>, Dan Williams <dan.j.williams@intel.com>, David Howells <dhowells@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, Randy Dunlap <rdunlap@infradead.org>
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

The pull request you sent on Sat, 11 Apr 2026 17:32:25 -0700:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/370c3883195566ee3e7d79e0146c3d735a406573

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

