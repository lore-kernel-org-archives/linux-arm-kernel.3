Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6664DC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBSlTa8P/KxAr5c6zxOP7GPaN5+B4wKRSq/82p7QSrY=; b=0ONploylH3peuWj7p3VQdeJl2e
	cIbXsaeqf5Gp5/y3kHFumQtHKVc6h1hBLcKFoupiaFCI6OdlUZ4gPX+c8DFOdgY8RA8MeT4/kaj+P
	8nQojFhFafTNxDGZL20KFlRJ/WgFhGKTI3hRMEugeXY3ftePOVkiZBze+hTA7wZ1xLiFA/DXhlQSv
	zT0gudOSS3oXAAsM9SomxD1vRYjPGZK4T6DlxAmHLxOsf8U228inZBrd6QTybYpohygD0KA2PREwk
	Wy1zlRXxpszPoZAYYySVIbP0tdwW5k6lqVj8x3UGhDZNFR1WegOjMCmY3jIhgVLMuXi22L2V8SqUE
	9qO6JpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc444-000000083y0-1MqG;
	Wed, 16 Jul 2025 15:29:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3wm-000000082PJ-1Li2;
	Wed, 16 Jul 2025 15:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D90D55C6624;
	Wed, 16 Jul 2025 15:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74D37C4CEFC;
	Wed, 16 Jul 2025 15:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752679287;
	bh=+5nBuTaHK2eqj8Sbjf7jOgP+gLLgEVm3azLVcfpx7Wk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OS9vTLlExI0ev1o7vTPmfJqaiGDqDFdXLIYU/2oNar9+GE0p2sFREnmEPM9tchhJs
	 L1Y2aUgJ4GkDvZyEazbL1L4zjmorIK5QnLjOF5jQ53IdaQ865dzJqVFtTLE1IAo27A
	 RvDAwYt17LRGns6LsX/cnluz58W0pJAFqXqJ7Vr/bV7i/gQg+DN7Sp0ck+1Yd2EW66
	 KAiEFjBbdQKlsYfAto11NOc+gChFKfdj9FN85e4nGDbF2oMyRkkXd2lKBnS4GyIP7N
	 yAaR39a7tCBwUcM5duceF2G1CYskt7SaW0TbDtgxAdJVQX0D5dotcL1wbeoKPl8FH9
	 KBOFS1Hs7+Khg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C64EB383BA33;
	Wed, 16 Jul 2025 15:21:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] PCI: host-generic: Fix driver_data overwriting bugs
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175267930756.1224517.4628176951767870692.git-patchwork-notify@kernel.org>
Date: Wed, 16 Jul 2025 15:21:47 +0000
References: <20250625111806.4153773-1-maz@kernel.org>
In-Reply-To: <20250625111806.4153773-1-maz@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-riscv@lists.infradead.org, bhelgaas@google.com,
 alyssa@rosenzweig.io, robh@kernel.org, mani@kernel.org,
 lpieralisi@kernel.org, kwilczynski@kernel.org, j@jannau.net,
 geert+renesas@glider.be, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_082128_398287_3953A87A 
X-CRM114-Status: GOOD (  14.36  )
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
by Bjorn Helgaas <bhelgaas@google.com>:

On Wed, 25 Jun 2025 12:18:03 +0100 you wrote:
> Geert reports that some drivers do rely on the device driver_data
> field containing a pointer to the bridge structure at the point of
> initialising the root port, while this has been recently changed to
> contain some other data for the benefit of the Apple PCIe driver.
> 
> This small series builds on top of Geert previously posted (and
> included as a prefix for reference) fix for the Microchip driver,
> which breaks the Apple driver. This is basically swapping a regression
> for another, which isn't a massive deal at this stage, as the
> follow-up patch fixes things for the Apple driver by adding extra
> tracking.
> 
> [...]

Here is the summary with links:
  - [1/3] PCI: host-generic: Set driver_data before calling gen_pci_init()
    https://git.kernel.org/riscv/c/bdb32a0f6780
  - [2/3] PCI: apple: Add tracking of probed root ports
    https://git.kernel.org/riscv/c/643c0c9d0496
  - [3/3] Revert "PCI: ecam: Allow cfg->priv to be pre-populated from the root port device"
    https://git.kernel.org/riscv/c/ba74278c638d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



