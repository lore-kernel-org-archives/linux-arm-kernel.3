Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A85CD70DF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 20:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32h8haryUPMer31+QcNzuX3kRxN7pUXPZbBxKbfMImM=; b=3VZcgDy7uRFy7rdPkvDsW2IEFF
	GtZxNtmL1Ma6NGmfzUBf+/qXYhNkAkzZ/O90UOmg+/AIZgDPXfteFeEC88vsteL8Yi0pf/opW1p+o
	l0ukd3bAKipeYhVWb0J6P7vQglvHiqu9DhJGA8YBM3f4mwCzPYj1Jl8vjhWBUfR0IvDonrFpJqKey
	NZ4WhZminKUXhdEXdA9YA5iHuwMdl0NceKbMlp0NWxlKIOzuU2H4KpJ1h7O4fTUIccWvWMeLRtaUL
	C0kx9Pox7RvZgOkc2CGgQzDlhZSX7r9lv0pmDh3HJHOytTfRsyH1qXqgbT9/9Qs04TjiwJQcWuukb
	h2xYBAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWKqJ-00000009AvN-2wh6;
	Thu, 18 Dec 2025 20:43:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWKqH-00000009Auk-0NBo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 20:43:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6BDE41A1F;
	Thu, 18 Dec 2025 20:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58BEC116D0;
	Thu, 18 Dec 2025 20:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766090599;
	bh=0nkt7N5KegtpAu+94CKpharYA0igULECgqJAOFvjAsI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=hVQ1ZwcoLYJHTXlQZ2wM+x6UzI74TRKy6um+0b1VEuexyWo79/cKyxK1Uwd6CmPkV
	 stxUA1Sa6wWyNZqYciy4eHzebsXd+7qdZrsevCJVSRNxyfEapUx6UklQdHPHDiV2DV
	 +S58uB6A0VkzeGqN1lf2phN6cCvia29aDecBRMFu5EhL/ojwGzrErB7zL8FS+yGJRH
	 JjPU02xNhnacCuqck8P8UYZskALvS2xvJZnQQ4n/Id23TNG4LTX+kx2H4URpc3MXwL
	 yT4askEFRczEoy5s7Dgh+6N6f8tG0hKTcGjuAG3+JSgkNSp7q9HqO+6gzG+8Z6yzvw
	 cupaUnS+NAOPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3CA3E380AA42;
	Thu, 18 Dec 2025 20:40:10 +0000 (UTC)
Subject: Re: [GIT PULL] Crypto library fixes for v6.19-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251218190606.GB21380@sol>
References: <20251218190606.GB21380@sol>
X-PR-Tracked-List-Id: <linux-crypto.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251218190606.GB21380@sol>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-fixes-for-linus
X-PR-Tracked-Commit-Id: 5a0b1882506858b12cc77f0e2439a5f3c5052761
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 516471569089749163be24b973ea928b56ac20d9
Message-Id: <176609040923.3123986.7208501276249795784.pr-tracker-bot@kernel.org>
Date: Thu, 18 Dec 2025 20:40:09 +0000
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, Catalin Marinas <catalin.marinas@arm.com>, Charles Mirabile <cmirabil@redhat.com>, Kees Cook <keescook@chromium.org>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_124321_146767_3E6AC1FC 
X-CRM114-Status: UNSURE (   5.37  )
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

The pull request you sent on Thu, 18 Dec 2025 11:06:06 -0800:

> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git tags/libcrypto-fixes-for-linus

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/516471569089749163be24b973ea928b56ac20d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

