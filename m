Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E578BCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 17:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KPuwksocBMVjZiBCm9XmF4wYAizizjpxFEw/IROWOF4=; b=Ro23cYT0EfmZcrv0C84rAIpSCW
	h1AM223vmnU9Cw264UtskbQqvJAOEAbfgvVT9VEUusm4SPX2Jjlr3CPXArM4rKC1N5q63izSYKkZ2
	Rdt1ITTLA849Lxl1nVPQV9IAxRd4kN+hZkXogQKf1HaMM9u7vgXaBDnMJz1OfhQ1+gwBMb5cAnVhe
	gdcilTyVLRko0GYh9Kn+cypCMQ9ywDRk5kQX4AcDfSOn8V79a122ExtJeDaUE9Pyx3B5kDI87FJ3u
	i6pYRhmr6CiXqfjE3RTyCUps6HyjO08aCvboYMBSXOF05bxxqMifkNc0CH4dG3+VDYTRkIHgAiv8+
	IFOQX4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSL5-0000000CRzc-43Hw;
	Sat, 13 Jun 2026 17:40:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYSL5-0000000CRzL-0IeB;
	Sat, 13 Jun 2026 17:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F8EB4398B;
	Sat, 13 Jun 2026 17:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F3B1F000E9;
	Sat, 13 Jun 2026 17:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781372410;
	bh=KPuwksocBMVjZiBCm9XmF4wYAizizjpxFEw/IROWOF4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=iNgSVq6LBZLSSfUuHVqPXNtVGtT7sE7jPfHpK/CQ7/s/rVRv2H8rmUv3KB+8KpSNo
	 eiWx14T/FcXWeQJz6JxGYfljkWmbNQwrdjIRvfEAcZjYgaOahyU/JnibEU27EkEnz1
	 TaYllza2zkN7vD/mIg0nUM2d5VDlXHine+wyJZe6QKKbC0l3pPEKDQkJ7ceRY3AclB
	 E+EfZvkgHE2jvJHBRHLos64Vgfx7J2f/Mx2yZMqh5YKFV2qES5bzrpUlbxo2CunTZI
	 U9ilaclzU8NPuW5i7zboZSnoleamyA/ORk60jxg5y7uOw4KfAD1Nj2IResMKHTg86b
	 zhiidw0jlw5qw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09833A40FD9;
	Sat, 13 Jun 2026 17:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: airoha: Fix error handling in
 airoha_ppe_flush_sram_entries()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178137240639.1545867.1534966931117017277.git-patchwork-notify@kernel.org>
Date: Sat, 13 Jun 2026 17:40:06 +0000
References: <6a2bd37a.4034e349.1b41bb.1caf@mx.google.com>
In-Reply-To: <6a2bd37a.4034e349.1b41bb.1caf@mx.google.com>
To: Wayen.Yan <win847@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 12 Jun 2026 17:37:00 +0800 you wrote:
> In airoha_ppe_flush_sram_entries(), the outer "err" variable was never
> updated when the inner loop variable shadowed it, causing the function
> to always return 0 even when airoha_ppe_foe_commit_sram_entry() fails.
> 
> Drop the outer "err" variable and return directly on error, propagating
> the error code from airoha_ppe_foe_commit_sram_entry() correctly.
> 
> [...]

Here is the summary with links:
  - [v2] net: airoha: Fix error handling in airoha_ppe_flush_sram_entries()
    https://git.kernel.org/netdev/net/c/d7d81b003013

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



