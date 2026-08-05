Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3225C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 01:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDoFFK8k5YTxmRnKscMNyLZY+muzZHuYjeYkOMRXrgw=; b=Q5HbxFwGq9V+lMrVd0vDdljASv
	+FSi7sxYQceGNWHBS6ML0V7/qtAUM4pLghLi5JwLHhGTZ8ePIgScv0KSvFcEilZ/Rk4z88x/RkJ6j
	jGDT24/2r6LXEYWK8afJLPYV6fyOMYVGOIsReojZac7XiLdPehuUxAPTU1STDzCtqNcgiU2a1ZPnw
	C/L1oidPgisYMVFhbI7MKrKC+EtLKnz09lKi8QmN5IqIWbxuec4fZjI/0yYS49ec9NJAN9msHwcZK
	8EOHHR2EoG3EN66vbYhSO1eDL6s6JWLVHsoLXfsnX6gwUK175fpM8GjbHrs7DOqC8pCRKkhSYys9q
	kIljXBog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQ04-000000031oF-2dn2;
	Wed, 05 Aug 2026 01:00:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrQ02-000000031nq-2uSD;
	Wed, 05 Aug 2026 01:00:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E901843B31;
	Wed,  5 Aug 2026 01:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92EE1F00A3A;
	Wed,  5 Aug 2026 01:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785891648;
	bh=wDoFFK8k5YTxmRnKscMNyLZY+muzZHuYjeYkOMRXrgw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=RF85tYGhiHjm4uKEo6TkqefkpcwefKhKJq9/2Jlh8vaqy6UKnmGfglB6gY4WtX+RB
	 g3uMxUym+TA80Pcie3lZ6/FjKqvM134zsd5ySqspot8vYK3oVDvkuBDe4F1MSjY1tP
	 tMPfXZf/mLT6faoINwrYE9u3oeQ9vMaeKNi+Mf7xTdgwzWxcVDu0D9LfPQB8B7kzk+
	 68TLfFuLW+eZN+heFN1zkWLtcThdT2/mT8CRfzjstHj2yfiRw0AQ0PhCK96/2NhUaw
	 sCIgFltDMj64gGpqSTbyDwmm1oLoM2rC4m4979s7z3U5e68pfEagOi/MMH6AGxI9hP
	 K6Y0lPpuZgGSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5691F3926663;
	Wed,  5 Aug 2026 01:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: fix ARRAY_SIZE() division by zero
 on
 UP builds
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178589160888.3856351.13210051056800049801.git-patchwork-notify@kernel.org>
Date: Wed, 05 Aug 2026 01:00:08 +0000
References: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
In-Reply-To: <20260731-airoha-spinlock-array-fix-v1-1-863a7e239a5f@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 horms@kernel.org, aleksander.lobakin@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, llvm@lists.linux.dev, ojeda@kernel.org, lkp@intel.com
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 31 Jul 2026 17:47:38 +0200 you wrote:
> airoha_alloc_gdm_device() initializes the txq_lock[] array iterating
> over ARRAY_SIZE(dev->txq_lock). ARRAY_SIZE() expands to
> sizeof(dev->txq_lock) / sizeof((dev->txq_lock)[0]), but on UP builds
> (CONFIG_SMP unset, CONFIG_DEBUG_SPINLOCK unset) arch_spinlock_t is an
> empty struct, so sizeof(spinlock_t) is zero and the expression is a
> compile-time division by zero (undefined behavior), reported by clang
> as "division by zero is undefined [-Wdivision-by-zero]".
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: fix ARRAY_SIZE() division by zero on UP builds
    https://git.kernel.org/netdev/net-next/c/c509971352a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



