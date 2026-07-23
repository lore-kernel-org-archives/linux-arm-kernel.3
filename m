Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F603C531D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNXVYN3cdil7jpiILldIIfbm/p5uZSSuGNiGJ8Svcjw=; b=F8D6UZHu8nv/wGzEqfD8Jr7ipc
	FYf7IriBHvtX49W2zmMCCeTS/GqpiMHwOqG0sjWdRKtWadiXcY5IYoROlYhqMQGnrPcF8obrsJbEx
	9p9mpkX9T6hYfs+ywaGMEvdWTnDaPz+cn2KJ3LertXST50yyWW2V+fgNPumeUIooumJyjHspRG+Mj
	3FtQTiBBhXaKHuIsfoVvvmFMWdcJ3r6M15Ysf33YmILIrLTZj2i9T2pJPnG4GpbgClTylBnIYutyL
	/BLoBFyA9k2yBkE+VXMbRSkw3eqYTIMbRPY52/VykLYRinfd3QSD/k1G6CrzVYABOnN3Gs32+PTWX
	D2fEET7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuL5-0000000EUfW-0Z2s;
	Thu, 23 Jul 2026 14:23:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmuL4-0000000EUfI-08qi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 14:23:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C1B360A71;
	Thu, 23 Jul 2026 14:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB07D1F00A3A;
	Thu, 23 Jul 2026 14:23:52 +0000 (UTC)
Date: Thu, 23 Jul 2026 07:23:52 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v3 0/2] net/stmmac: Secure against failures of DMA
 memory allocation
Message-ID: <20260723072352.6db4df7f@kernel.org>
In-Reply-To: <20260715123602.51950-1-j.raczynski@samsung.com>
References: <CGME20260715123609eucas1p276498c4701060ffbb6789cb096696a31@eucas1p2.samsung.com>
	<20260715123602.51950-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 15 Jul 2026 14:36:00 +0200 Jakub Raczynski wrote:
> This series fixing two issues related to fails of
> __alloc_dma_rx_desc_resources(). Original issue from 1st patch is related to
> page_pool that has happened in testing env, while second was requested by
> Sashiko to have similar change for DMA allocation. 
> To have complete fix for all failures of __alloc_dma_rx_desc_resources(),
> merge two fixes into series.

Clashiko is not impressed by the second patch.
Is it possible to avoid calling the functions in semi-consistent state?
-- 
pw-bot: cr

