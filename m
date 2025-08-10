Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABF6CA0EC1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVxLjzFbRrwVzxTwWIzGdNseAtTQ8Nsve1oNe5rfTZE=; b=mV31nUYFjzoLrzj5YtUBtYBnv6
	TwSO5NAZvfllZiBT9GIPzSddPLE0zx7VQKfpnGJ72rJeMYVLiFyh+0GJUf0sZQyHiz8A9pEAsO/Lg
	ZXwhV3ZyHMH13W31+by8+7lgBSq8OhoK/eavQDLBmkxzloY7ZOruZcvQ0y3dC5di4pV/ChwJ9Mqs+
	X5EgzERzvPvvIxxKalycviZQfgWGK2cN3x0nP61vZqf3D4MU+eto0+gxscVfTBHk1hPe9gwR2VpXW
	+/dNd0vlcAvuUyojVdOTxHtzwmR+5Uy1iJr5cCaCdVAF5Cf/aGoBs9OOUHyx21TEe4jqy5DZm7ENB
	oLK/aWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDNP-000000060Jd-2S2L;
	Sun, 10 Aug 2025 21:14:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulDKn-00000005zVe-25TN;
	Sun, 10 Aug 2025 21:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 148D14186C;
	Sun, 10 Aug 2025 21:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED3CC4CEEB;
	Sun, 10 Aug 2025 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754860322;
	bh=XrfQgl5l4McAsqhy747liDQB2Wk7PKkiU9eU9e0wRRM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gwjn8bTbzGhzzolmVUPo9n7gcBleM2ZVFGDflhWOkdwNBJ0e6wotBLuXD0buvnF7g
	 aXoNaKfXoEDoNj4lZ/8pa6odo8DFWObVF3OfZG3lrpWmvwF9AJmOUqEzkaWzOeq7Yd
	 DpcJnBQo9Z4JNU1FE++ilb7nhN/t2KWXk7okkwr6WQvrfPpvZrLhMXDkZ6HQcXTy6q
	 oJdFW6I2y1cQ+XGdnxUPHqxnZ8SZfN7pdNeHUDKckOniwED43a0ZbSyUveH+xY3V9p
	 M3Gg6vutVvVco0CLG4wUKYmINApUE8HUs9Uyk6Lbw9URsrzxtpmDb+/V1rKT1fuakD
	 n8BmE1Qp9O4Dg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE7439D0C2B;
	Sun, 10 Aug 2025 21:12:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/12] irqchip: MSI cleanup and conversion to MSI parent
 domain
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175486033550.1221929.7725164280675452092.git-patchwork-notify@kernel.org>
Date: Sun, 10 Aug 2025 21:12:15 +0000
References: <cover.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, maz@kernel.org, tglx@linutronix.de,
 atenart@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, anup@brainfault.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-mips@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_141205_575064_45C3BE52 
X-CRM114-Status: GOOD (  10.74  )
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

This series was applied to riscv/linux.git (fixes)
by Thomas Gleixner <tglx@linutronix.de>:

On Thu, 26 Jun 2025 16:48:57 +0200 you wrote:
> The initial implementation of PCI/MSI interrupt domains in the hierarchical
> interrupt domain model used a shortcut by providing a global PCI/MSI
> domain.
> 
> This works because the PCI/MSI[X] hardware is standardized and uniform, but
> it violates the basic design principle of hierarchical interrupt domains:
> Each hardware block involved in the interrupt delivery chain should have a
> separate interrupt domain.
> 
> [...]

Here is the summary with links:
  - [01/12] irqdomain: Add device pointer to irq_domain_info and msi_domain_info
    https://git.kernel.org/riscv/c/858e65af9135
  - [02/12] irqchip/bcm2712-mip: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/91650ca5efcf
  - [03/12] irqchip/riscv-imsic: Convert to msi_create_parent_irq_domain() helper
    https://git.kernel.org/riscv/c/59422904dd98
  - [04/12] irqchip/imx-mu-msi: Convert to msi_create_parent_irq_domain() helper
    https://git.kernel.org/riscv/c/c7cc7b122a4c
  - [05/12] irqchip/loongson-pch-msi.c: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/7f91d608cc43
  - [06/12] irqchip/sg2042-msi: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/7c0dbd80de03
  - [07/12] irqchip/alpine-msi: Clean up whitespace style
    https://git.kernel.org/riscv/c/6e44ac411255
  - [08/12] irqchip/alpine-msi: Convert to lock guards
    https://git.kernel.org/riscv/c/71476f915f92
  - [09/12] irqchip/alpine-msi: Convert to __free
    https://git.kernel.org/riscv/c/f7c2dd9f4c2d
  - [10/12] irqchip/alpine-msi: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/7a91ad7ebd61
  - [11/12] irqchip/armada-370-xp: Switch to msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/bafb2901317f
  - [12/12] irqchip/ls-scfg-msi: Switch to use msi_create_parent_irq_domain()
    https://git.kernel.org/riscv/c/94b59d5f567a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



