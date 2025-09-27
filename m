Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56038CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 01:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yV6rb2qU6UxlLPgEqSMmvUt42VQU+/LmKsnF4rRybJc=; b=GxrDhN1NoaXSKD6tZ+ku3eoAwu
	4OTxMG/4VCICEI5jYc5hjMMdEB9N+LIsBm2PABgT0GPElklDOy3Ud7F8NxCdXG4BygaxshL36MR1V
	qfdzViX+LNRyg9EizpaBi/UyzNAi7wuAH7GNjEfRdcjhJ9L8PM86SBQ5A9UhNTWRPeQjwfU/Vx9dC
	V8/fSWlXnR5kA87d4RZ3aFGRm3zMCOx6rRcHD1ewNXgd9lLBlhrGX2KAGgRYsvzPgUan6scuhuPwx
	ZWYHalUkDwhT+QCcbcdiEeB/+oUIiRppLmjWY3ipCyTMeKBZGuQ3mdDNdYWmqxFJysQMTyFYk8EwK
	ECMAL9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JSI-00000005vru-2UOJ;
	Sat, 27 Sep 2025 01:10:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2JSH-00000005vq8-0tEv;
	Sat, 27 Sep 2025 01:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 61E0C61FDA;
	Sat, 27 Sep 2025 01:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B32C4CEF4;
	Sat, 27 Sep 2025 01:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758935428;
	bh=dycmrG8L42shWyOFq1LplDW0kt8JqYvNmyTy5n4cmII=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=npYmKC0PdSzX7/utwapI/6czHnX7CCci2RE2SDWtAPBz+csfL1txtWcozAY8cdOhA
	 yWDMwSUFlUYXp5r8JgBXrTUTtiRKQXSXr7Jwk4E0gH/ODwDMztxneMCUaGakcEkg+t
	 t3FwgJ1P3fMGVgX1ZPD5nfAez2GGysv5u/qTBLNZLI3SbpejpqPKKDbm+Gc6pES8PV
	 /od62rPAXjVETBJ51zGyp27RkfQpylLBzSqVXzsGRHVo7JViwH/ERtQ7X2En9x/6go
	 Bezhk2RwpXP9S4/31kQQnFVEjyFtxM7XEvHw7Uqurzn46P3uJFi8n5qlE7dS2madA0
	 83Qrx3ZJsH/2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710A339D0C3F;
	Sat, 27 Sep 2025 01:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: airoha: npu: Add a NPU callback to
 initialize flow stats
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175893542299.113130.1861554660002474046.git-patchwork-notify@kernel.org>
Date: Sat, 27 Sep 2025 01:10:22 +0000
References: <20250924-airoha-npu-init-stats-callback-v1-1-88bdf3c941b2@kernel.org>
In-Reply-To: <20250924-airoha-npu-init-stats-callback-v1-1-88bdf3c941b2@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 24 Sep 2025 23:14:53 +0200 you wrote:
> Introduce a NPU callback to initialize flow stats and remove NPU stats
> initialization from airoha_npu_get routine. Add num_stats_entries to
> airoha_npu_ppe_stats_setup routine.
> This patch makes the code more readable since NPU statistic are now
> initialized on demand by the NPU consumer (at the moment NPU statistic
> are configured just by the airoha_eth driver).
> Moreover this patch allows the NPU consumer (PPE module) to explicitly
> enable/disable NPU flow stats.
> 
> [...]

Here is the summary with links:
  - [net-next] net: airoha: npu: Add a NPU callback to initialize flow stats
    https://git.kernel.org/netdev/net-next/c/105ce7ad57e4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



