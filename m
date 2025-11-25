Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5597D0E6C8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 11:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3q4QAXxw5qYmSm3JOhxGmlmUFZPBVIaZaJkp8SpF5fM=; b=NwiEi6Ww8dPUVZm+zjoXo3WkvL
	QYDSeScdgil0Ebr/9Pw7pwP8KrRQxvXv8eNh2pXF+UD82PhZ2ENvxOZJffwGrZilPbjYr0YNmHd9d
	T2EZEeEbtYvkSMXD+SJJpMTGddfKgN1TIw9LEQ5ZYgXKlVwhb6Z0k+c8T15/6xKX4P+Fc6Mwmwh1I
	W9IfCLuVLNBhcYk5M3DVfNDc1FY5+XuCwg5d46GyEHVdoSslk7eAOqP4xVklFsl9Uhh/Fg+kmqIUx
	XSr22mDIVCQ+WORAevumCPOyGbUUkpzsn9qPL5thLR8O7ht4jW3t/yqqX/JdvuWJo8Kb4BvsZq+VP
	RDOZ56Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNr6K-0000000DCoa-2IKQ;
	Tue, 25 Nov 2025 11:20:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNr6J-0000000DCoU-1UuY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 11:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C0F3601A4;
	Tue, 25 Nov 2025 11:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE6AC4CEF1;
	Tue, 25 Nov 2025 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764069650;
	bh=XYrx8RmeHb7aOA0CRDqH8AU6e14CroGHa3JB6p/8Hwo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oaPS1q62knOE86v73tj8F0OwlgiXC8DDnxnXWuNNzxJtIfVDndEWU/Jgc2boBDHp0
	 apzOhF0F+qhrSLQDUdm+bd3rsX/F7jW42rnqF23lz6pC9y3pDoMmHWw2ig4JJOscqM
	 ijQKpXH8HCa7VRENGJpMkSCulaWc7lQS21dbllP3L63hl9bLBNkh20h0+JwSRgxQHw
	 e0jEjaAVyRPlNyHC8t2UsHZuw6QEM4ID2Icky2NBPwqs/SI6DU5RaJ+SumF/2vGlyQ
	 LEzOAeij94Uk3Dx1LLLtRPMdeiQ2/STxu5IvTp5YPI3VId+UP6u/JfXrnOyK7JkQFy
	 JbI8tJKJ8ByJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB4C33A8D14D;
	Tue, 25 Nov 2025 11:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] dt-bindings: net: aspeed: add AST2700 MDIO
 compatible
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176406961249.690498.6624376735038476395.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 11:20:12 +0000
References: <20251120-aspeed_mdio_ast2700-v2-1-0d722bfb2c54@aspeedtech.com>
In-Reply-To: <20251120-aspeed_mdio_ast2700-v2-1-0d722bfb2c54@aspeedtech.com>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au,
 andrew@aj.id.au, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, conor.dooley@microchip.com
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 20 Nov 2025 11:52:03 +0800 you wrote:
> Add "aspeed,ast2700-mdio" compatible to the binding schema with a fallback
> to "aspeed,ast2600-mdio".
> 
> Although the MDIO controller on AST2700 is functionally the same as the
> one on AST2600, it's good practice to add a SoC-specific compatible for
> new silicon. This allows future driver updates to handle any 2700-specific
> integration issues without requiring devicetree changes or complex
> runtime detection logic.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] dt-bindings: net: aspeed: add AST2700 MDIO compatible
    https://git.kernel.org/netdev/net-next/c/e3daf0e7fe97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



