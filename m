Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7F8CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6/QjuRGJWhzJiYsFb4zArvnhQy+cy8hHzkFU94yP8I=; b=I77+zs+0LxtyuuBBj5UYdm2jhy
	OAJ/u8UCVNibFuAGyX5hp8k4/dLcvOGVETVnq++pylnBsxxRp8KCUdYMoyuAShyi4n83J2BvPysQ/
	BOCkE1wEfY2h5u8dGfTvIK+qe+WBubvpmavjNqQnrkSTeSWUrXoZ5locb2DRbVzYIy0uDF8Q+5N0K
	yNu1BXgyKDzjo8oG2G8keIYNIC+cJEmv7MQ+hRNT1ffb7kJx08xzMW5Cdku6TtZiWvEH69mMRVo9d
	M1qd6oE6Jrp6TMAsturEcs0clHXzjG4GpZbsfdPCKdzJy+yWvi2rhnmpxlXg851v88MM7h+khqgR8
	DNhyWcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHXI-0000000F0WS-1tZW;
	Tue, 16 Jun 2026 00:20:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZHXH-0000000F0W4-2oND;
	Tue, 16 Jun 2026 00:20:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ACB36600AB;
	Tue, 16 Jun 2026 00:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6090B1F000E9;
	Tue, 16 Jun 2026 00:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781569210;
	bh=+6/QjuRGJWhzJiYsFb4zArvnhQy+cy8hHzkFU94yP8I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QpkVhquYuDU2AX4DYVJsJvF6u5sRTbsEiNMGAPWWaJlG6UCnS38hoYtGUc7dBOTm0
	 +52AzvGyBxtG66MFnTX9vWRSENnoQ53lz9F2NUBxrlTn6cz6Qz/QCz6nEcgeVQtAvd
	 bvujSVfV8LO49vGBDdv0/DTlxt0PC4g2jAJB8bPLxK/squoKGyObe256Fj/0ZkeafG
	 x14YY2Nq+3rYNDldt2Fg09yqia1Ez62Ot8qqyk9FA7Twnr6ELYLEmjt1nWF6BN4kqx
	 fSQfy9XcxqKW9M4wN6d6rJ7ho3oZbwThFHbPOKnScXVcVJfRcFy9EY8lsOiawOBI7u
	 C9LVxzg/IRMmw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A003839A26;
	Tue, 16 Jun 2026 00:20:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178156920539.351484.2629045688985264535.git-patchwork-notify@kernel.org>
Date: Tue, 16 Jun 2026 00:20:05 +0000
References: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
In-Reply-To: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 madhur.agrawal@airoha.com, aleksander.lobakin@intel.com
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 11 Jun 2026 23:55:50 +0200 you wrote:
> Add the capability to configure GDM3/GDM4 as WAN/LAN on demand when QoS
> offload is created or destroyed.
> Make dev->qdma an RCU pointer so the TX path can safely dereference it
> without holding RTNL.
> Introduce airoha_qdma_start() and airoha_qdma_stop() helpers.
> 
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/3] net: airoha: use int instead of atomic_t for qdma users counter
    https://git.kernel.org/netdev/net-next/c/a459b560e58b
  - [net-next,v5,2/3] net: airoha: refactor QDMA start/stop into reusable helpers
    (no matching commit)
  - [net-next,v5,3/3] net: airoha: defer GDM3/GDM4 WAN mode and GDM2 loopback to QoS offload
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



