Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A556AC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7pmL1JiCQuKcTU9dY6vrebiTYaqi3TIxs//E0Ypwtc=; b=3CuWhpMeewpoAARzoxMJo2vSEv
	TqlNBYcZXh7DVimrnmKPlCRDmpwL/KKgG7ySezYXZCkQ/qNfF5z9hUNKSKIL4nInIlXcKeXrphs+D
	KBEypVB2rFYHoG6i1Gla619rO95qOGdcsbIo9faT4hbd+ay/943MyUnwOrwNFy33BfabsrGsRxZGj
	QHZ4q90Rs0X5K6+541v9XlHpxhjWyzIfwKnBsG7OVt3oN0JKBZ8urss9iIsEUo0/uMohRasYFsuoF
	l4D5d97/EdZlLSz/e0UBPuex4MV0ZxQ0G+nnnHdKT2O4EEGj8h4Rw4BX6sctmxGyQya5Y39RSA4gN
	kvBvvobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5FO-00000008gyc-221E;
	Tue, 21 Jul 2026 07:50:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5FN-00000008gxw-0apU;
	Tue, 21 Jul 2026 07:50:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9495A60A9E;
	Tue, 21 Jul 2026 07:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F901F000E9;
	Tue, 21 Jul 2026 07:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784620236;
	bh=U7pmL1JiCQuKcTU9dY6vrebiTYaqi3TIxs//E0Ypwtc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Oh0FPs+FTlYST2EQ72ESSOHdE2ntqhwRfq/XQSw70OssMZE62IQl7xFQwLD271Ehp
	 z7ibL7COJwD08Ai+Q0G2cBJZlcj3gk7KXdlGyQ+vZ0nQy7YR6SS0Xqfhpam7+/GI2B
	 5uHACu5/47GrhzTEkDlkJDyylniDm7CzcL+MaKxDpcEaI1lB5sjIwn/H+z9YrpkX71
	 31TXn+rSX0vEmE66z9tSdpl7yfhTKZd0q+r16sarWiejQVH6krpUlbxpTSpznXyQQs
	 qH+UeY4SIwauJ1FewfBa3BB5mYla601RwVUp1J/AwNKj1kTklPHPe7QE+PSTrFbjOC
	 5wogdagyX8gjg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568FD3924A28;
	Tue, 21 Jul 2026 07:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v5] net: airoha: fix MIB stats collection to be
 lossless
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178462020592.138517.6199339592479066921.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2026 07:50:05 +0000
References: <20260707152639.105628-1-aniket.negi03@gmail.com>
In-Reply-To: <20260707152639.105628-1-aniket.negi03@gmail.com>
To: Aniket Negi <aniket.negi03@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, aniket.negi@airoha.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ansuelsmth@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  7 Jul 2026 20:56:39 +0530 you wrote:
> REG_FE_GDM_MIB_CLEAR after every read creates a race window where
> packets arriving between read and clear are lost from statistics.
> 
> Switch to a delta-based approach instead:
> 
> - 64-bit H+L registers (ok pkts/bytes, E64..L1023): read absolute
>   hardware total directly into a local variable; clamp with max(new, old)
>   to prevent torn-read regression when the counter carries between the
>   two reads.
> 
> [...]

Here is the summary with links:
  - [net,v5] net: airoha: fix MIB stats collection to be lossless
    https://git.kernel.org/netdev/net/c/d163725af84a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



