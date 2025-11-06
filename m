Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A3CCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 20:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1z7IXcNI+WCvem6I/6u6h6/VFROdKH0gPIXP+dPyj1s=; b=tHiGUDzbITXtSB16EuWYThVaOm
	WCTq0Iy6W90Rlu6F/kN+IYzzOErPeZQyDUdp466RcdG9QjDqMPuQIkPUuYYlPlsEcHceVhCuWKbUO
	yqmNMhU+/9PxEVbffFup1rSi7n/8zPXGjugxjyjP5DFwCzLiWLVyFBdLCdYE+5FFmfjUnHFnCn7q0
	DKEUSHMAPTNYZwbP/Q51XPz7FjkeWsGetFJQ3WKJ06mWegI5jTGMPY/tndGmGtL/4qPgEmC4PL5sA
	XUAM4GH2vCwR2lMabPuDbEAisu4yj9KP9cgbAHox7NbIrNTteUZpnFVJQGUFP7XO1qPKcAmQeJYt5
	Xkv3RyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6zh-0000000GFst-0dfb;
	Thu, 06 Nov 2025 20:54:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH6ze-0000000GFs4-2SwE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 20:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 575E643ED1;
	Thu,  6 Nov 2025 20:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336CCC4CEFB;
	Thu,  6 Nov 2025 20:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762462445;
	bh=Vv3eueX5Yzwe8L22S5wqi1JNwoPSkSmIv6GaWGqcWO4=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Xrs1F4QFVdTPj/X4JAoddy1czp0pDIhdc0U/doAWQgWZ/ZfXHR4wLJuZ92iWsJZKk
	 /GcYzRbC0zT8Q5w2nt+D9C1GW3+NZyCCmC5OjDNasODHfgVRLamODsBdfUbyg4wdRB
	 6oEsNQSZB4+t3UFclfsSNZRAUe3FJ2t2zspvN+ewOzNdCl+b80QRcXv4SqnO82pfK/
	 D1MCMQYuVrqRL+fueealIWGdhnBBid8Cu9Kgvecz9lewuai2p5edkp1fhvguJtCBab
	 4J5DK74F3dCdMlLW6MW8XB5oseCLNT9K/To8RMpv/K+t/TcS1M3dW9+xD+eOxFHauh
	 GkkNBuoaJmLaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3464E39EF96A;
	Thu,  6 Nov 2025 20:53:39 +0000 (UTC)
Subject: Re: [GIT PULL] Crypto library fixes for v6.18-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251106203136.GB7015@quark>
References: <20251106203136.GB7015@quark>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251106203136.GB7015@quark>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-for-linus
X-PR-Tracked-Commit-Id: 44e8241c51f762aafa50ed116da68fd6ecdcc954
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1388fcb52fcad3e0b06e2cdd0ed757a82a5be30
Message-Id: <176246241786.354628.3357961680437143105.pr-tracker-bot@kernel.org>
Date: Thu, 06 Nov 2025 20:53:37 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Nathan Chancellor <nathan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_125406_643463_762F0522 
X-CRM114-Status: UNSURE (   5.32  )
X-CRM114-Notice: Please train this message.
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

The pull request you sent on Thu, 6 Nov 2025 12:31:36 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1388fcb52fcad3e0b06e2cdd0ed757a82a5be30

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

