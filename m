Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CF4E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aF7Lz0G1t6euuFFzKx3dvYSX7x+FbVESB5H0lDz04fk=; b=uwNCpdjJau83oH/3v5mcI6GK8h
	NpS9j/UirU//5gksfZSxniNXoN89xJLLrs/G2LVDhHEX+2ldiSy2OVDiD7wPDWrpEmGTcXIJm1bCJ
	kP8yPZjBldBnxNKuBShJ/LogB5WM7XAjM3Im4OQM2/20RXsVKVizBl1XTEzD0egq9DSaSaDfhnyrV
	OD/s85gXGwnj+RzcVoQ+vox6m9fFs+ey7Wuc2YSK9TzKUtDxCwPubzD2GqiSiqYQ2oCRf6Gydoqo0
	q29FHahunMcGCpUnCtz/ktU+Mp1ZD8Bkshxnot/iuKJJVW+pP9R8bDApHbNbPOKWfFJcPTamKf3Hi
	bmOYG/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6qU-00000004LmL-3Ywm;
	Tue, 07 Jan 2025 10:29:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6XL-00000004HDQ-1S5o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:10:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A284F5C5E4E;
	Tue,  7 Jan 2025 10:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71367C4CED6;
	Tue,  7 Jan 2025 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736244610;
	bh=5bEVFGZ/3kqEH3ft/INVb3O3lfmDpksxz7qJlBKHdfY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tJwqeYPV74pJLrqLp7MKw6n4nCoenPU+Y0Yw5LKIcIf4obY8frYSRwvuD+OKn0BSD
	 hW7hSTajdYCzdObz6uzsP/5ybRlJ8ZmKCS6eUgybs+6uoVx+bhkhhWykC2VbLV0c8f
	 tz4WB6pllPOxh1A9QpyW9jqT+UQqHVqFoCVhPsXWOSjkqICm3M7T7DqWiOB2PgQWdy
	 MWADjcJfgyqCQEuTWh8TCWkC750pjZ9oTMS6h2aLFqJYyzzG4o3B6cz2h0pYNjjnqu
	 /EzfASlao/O9pNb1om+cXXkqXcWshRd5AHUGvO92qnWT6DRCqags5XHgk1aQyrtSuO
	 3bRQfGSQWQghg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB497380A97E;
	Tue,  7 Jan 2025 10:10:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v1] net: stmmac: Set dma_sync_size to zero for
 discarded frames
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173624463153.4094378.15118164239287100695.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jan 2025 10:10:31 +0000
References: <20250103093733.3872939-1-0x1207@gmail.com>
In-Reply-To: <20250103093733.3872939-1-0x1207@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, xfr@outlook.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_021011_430646_A0D4FBCF 
X-CRM114-Status: UNSURE (   9.51  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri,  3 Jan 2025 17:37:33 +0800 you wrote:
> If a frame is going to be discarded by driver, this frame is never touched
> by driver and the cache lines never become dirty obviously,
> page_pool_recycle_direct() wastes CPU cycles on unnecessary calling of
> page_pool_dma_sync_for_device() to sync entire frame.
> page_pool_put_page() with sync_size setting to 0 is the proper method.
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net-next,v1] net: stmmac: Set dma_sync_size to zero for discarded frames
    https://git.kernel.org/netdev/net-next/c/51cfbed198ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



