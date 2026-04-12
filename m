Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97784E937F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 18:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/wzw7uIYdaxudaglIH2J9UznWiy71S4q36mUbzo1/Y=; b=BhLSGnhaaoNdyVn1jiPwRNRHxv
	WvppavcCgZemBmbZ3fb8JGAYSHxKzXdNP1cMXG/93wQB5/Le0VRSTFxH0LbCmR61v5WVx8B731qvx
	4EmJ/ZUZuvkummeWbPRVZxAedreizlFC7dWDUQ6+BaB9WbgG1nvBIKVxcD1JtNb7mlitrHe0QFOwS
	GIaIfEQ5I2niWsUcw4ahSwZBdkC51XWLXkXVY+8cAhLKT6rsuuFdo3wO7+0p7HvM5TbFC91iaHiEA
	PfZzsrxgr9hHU8vu0k4vm5+Mvaxa5W2Sf56UnrgQ8tTy0cFa2zGKtafNK6B93+1jJr6NsEdrnIXz3
	LHK0eM3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBzje-0000000Eb2Q-2v7V;
	Sun, 12 Apr 2026 18:40:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBzjc-0000000Eb24-2KN5;
	Sun, 12 Apr 2026 18:40:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A0F844537;
	Sun, 12 Apr 2026 18:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14721C2BCB0;
	Sun, 12 Apr 2026 18:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776019239;
	bh=COsDTpK+goKtZ6v+1Eg3O5mezNOOSNJXILqQG+OL680=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fyFbOPefESr9S9R10KtfTKx31mwLKY1l2YXY3Okb2t4icf0dAZ7EI7c/4N1DeAluc
	 +4mDvrZX/gCAhHDISQs52gYmVxxzk5ASj1s+vqeReby/izDfaWcEyDWkSp6/cBI3WR
	 GhkB9fTBOcenrOz/IPuvY/O+LmsWeHzTESRd9KYoRmIGwTwi8ZAG4sbeMJDggvg+44
	 Fagib4jdfGvlcZr3mTRhKtERc2Ze2cET3w2N9fKQjKTwl/logTm0V49GSR1Y/DjxKQ
	 ZHXp7l6uqT8Qy8ggo9jCFPTRHzcNng5rQVR69WcKfkHktLY/Karu1JL4XneJdtgxwy
	 YNF6R9JDIctOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9DDB3809A8C;
	Sun, 12 Apr 2026 18:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: airoha: Add missing RX_CPU_IDX() configuration
 in
 airoha_qdma_cleanup_rx_queue()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177601921154.3370691.1789981504047499151.git-patchwork-notify@kernel.org>
Date: Sun, 12 Apr 2026 18:40:11 +0000
References: <20260408-airoha-cpu-idx-airoha_qdma_cleanup_rx_queue-v1-1-8efa64844308@kernel.org>
In-Reply-To: <20260408-airoha-cpu-idx-airoha_qdma_cleanup_rx_queue-v1-1-8efa64844308@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_114040_614441_C7945993 
X-CRM114-Status: UNSURE (   8.08  )
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

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 08 Apr 2026 20:26:56 +0200 you wrote:
> When the descriptor index written in REG_RX_CPU_IDX() is equal to the one
> stored in REG_RX_DMA_IDX(), the hw will stop since the QDMA RX ring is
> empty.
> Add missing REG_RX_CPU_IDX() configuration in airoha_qdma_cleanup_rx_queue
> routine during QDMA RX ring cleanup.
> 
> Fixes: 514aac359987 ("net: airoha: Add missing cleanup bits in airoha_qdma_cleanup_rx_queue()")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net] net: airoha: Add missing RX_CPU_IDX() configuration in airoha_qdma_cleanup_rx_queue()
    https://git.kernel.org/netdev/net/c/656121b15503

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



