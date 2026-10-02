Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0CACA5FE5
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 20:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IE4LsdhNU5SfiDmJkZ9zOXEwMWjWebrgy9SOZRKi4+U=; b=MBS1cuCouJeLgEFIOFC7uWcg3j
	B6nWT6TqGwGc/XNyZG59K+psTy3x7kykdzqxK30gfoIFp/cIi9WH6xxve2S4cdSbsBgSLZE2krcIO
	bLQ7j6M0fhbMhQK2N6vvfUcNK80lpshZtsLIGOkY80VTmPEAk0e7E7d196T5CrkgtpzyH5Gp+LvdF
	/dYCyb0yxVKgw4HKPXOxRBijIkcX1HSCjdc64Qpui+93vmvRJP+04KrSEe8/Uyput4OEJ6m9UbTHP
	cVlDcXK6qjq6Uv2n0FgVVMX4lWW48Hkgb38cAorLD4pFr23kSmLQhcG9RIRWz6NHDGkGkLlLs2LmK
	YgOXK6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjjp-0000000CTKB-3y1j;
	Fri, 02 Oct 2026 20:20:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCjjo-0000000CTJe-19wy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 20:20:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A40C04372F;
	Fri,  2 Oct 2026 20:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C361F000FF;
	Fri,  2 Oct 2026 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790972411;
	bh=IE4LsdhNU5SfiDmJkZ9zOXEwMWjWebrgy9SOZRKi4+U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PDu9VcR41G9L0rhokPRNyVmGcmPd0vzXeiJCulTtzuiGUx2cc3sO8Y+Nr4zy9Rn+w
	 ShmTvCulR8dFx0vsqLCFquaONxm0OxYGGSdrwpzR007qoqEUrGe70PlI0eeL+F2LK5
	 X2QqW+n7TgDLWxdKs2zieGKAztRUZEGftBVthjf/BML+zl13wPctKnkr1QvXT0jKhG
	 98Q8WRic6c/q6fonVa8n2t30Uq04dy36RXnU3E+Vy7Rdttp4juWVdg15crSZLB3z2Z
	 ImBKD3z42cXPY8kytws8H4iP4jCWGKgUmI1+8+YnU+ATbKiu8k9T0QJcbEOV7Kz3So
	 udcb+OZruFtqA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7747F3811A72;
	Fri,  2 Oct 2026 20:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v9 00/15] net: lan966x: add support for PCIe FDMA
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179097241009.3571263.7855609924848232097.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 20:20:10 +0000
References: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
In-Reply-To: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horatiu.vultur@microchip.com,
 steen.hegelund@microchip.com, UNGLinuxDriver@microchip.com, ast@kernel.org,
 daniel@iogearbox.net, hawk@kernel.org, john.fastabend@gmail.com,
 sdf@fomichev.me, herve.codina@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, mohsin.bashr@gmail.com, horms@kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Mon, 28 Sep 2026 21:32:48 +0200 you wrote:
> When lan966x operates as a PCIe endpoint, the driver currently uses
> register-based I/O for frame injection and extraction. This approach is
> functional but slow, topping out at around 33 Mbps on an Intel x86 host
> with a lan966x PCIe card.
> 
> This series adds FDMA (Frame DMA) support for the PCIe path. When
> operating as a PCIe endpoint, the internal FDMA engine on lan966x cannot
> directly access host memory, so DMA buffers are allocated as contiguous
> coherent memory and mapped through the PCIe Address Translation Unit
> (ATU). The ATU provides outbound windows that translate internal FDMA
> addresses to PCIe bus addresses, allowing the FDMA engine to read and
> write host memory. Because the ATU requires contiguous address regions,
> page_pool and normal per-page DMA mappings cannot be used. Instead,
> frames are transferred using memcpy between the ATU-mapped buffers and
> the network stack. With this, throughput increases from ~33 Mbps to
> ~620 Mbps for default MTU.
> 
> [...]

Here is the summary with links:
  - [net-next,v9,01/15] MAINTAINERS: add FDMA library to Sparx5 SoC entry
    https://git.kernel.org/netdev/net-next/c/91ad754f3c14
  - [net-next,v9,02/15] net: microchip: fdma: rename contiguous dataptr helpers
    https://git.kernel.org/netdev/net-next/c/27470b22eca3
  - [net-next,v9,03/15] net: microchip: fdma: add PCIe ATU support
    https://git.kernel.org/netdev/net-next/c/3318a794bb15
  - [net-next,v9,04/15] net: microchip: fdma: use little-endian types for descriptor fields
    https://git.kernel.org/netdev/net-next/c/9786c387b299
  - [net-next,v9,05/15] net: lan966x: add FDMA LLP register write helper
    https://git.kernel.org/netdev/net-next/c/2e52284420bd
  - [net-next,v9,06/15] net: lan966x: export FDMA helpers for reuse
    https://git.kernel.org/netdev/net-next/c/eac4b8882a03
  - [net-next,v9,07/15] net: lan966x: use a dedicated device for DMA operations
    https://git.kernel.org/netdev/net-next/c/f83ac2d94a2a
  - [net-next,v9,08/15] net: lan966x: add FDMA ops dispatch for PCIe support
    https://git.kernel.org/netdev/net-next/c/5a97c2c00b8e
  - [net-next,v9,09/15] net: lan966x: clear FDMA interrupt stickies after switch reset
    https://git.kernel.org/netdev/net-next/c/58e73ef6a1e5
  - [net-next,v9,10/15] net: lan966x: add shutdown callback to stop the FDMA on reboot
    https://git.kernel.org/netdev/net-next/c/ab6268b958f0
  - [net-next,v9,11/15] net: lan966x: add PCIe FDMA support
    https://git.kernel.org/netdev/net-next/c/e013b82ed3b2
  - [net-next,v9,12/15] net: lan966x: add PCIe FDMA MTU change support
    https://git.kernel.org/netdev/net-next/c/1709aa382db7
  - [net-next,v9,13/15] net: lan966x: add PCIe FDMA XDP support
    https://git.kernel.org/netdev/net-next/c/fbb46fde6965
  - [net-next,v9,14/15] misc: lan966x-pci: dts: extend cpu reg to cover PCIE DBI space
    https://git.kernel.org/netdev/net-next/c/100eead96ed6
  - [net-next,v9,15/15] misc: lan966x-pci: dts: add fdma interrupt to overlay
    https://git.kernel.org/netdev/net-next/c/14b9ac2f189d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



