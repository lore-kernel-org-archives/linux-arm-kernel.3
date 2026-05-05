Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E40CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 02:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9C4YQiTr1heKLzM5wcYC994nNBRKDFtPuR7TzCPolqc=; b=3RN6LLLRw6/Z6iAIrp73ngqYOJ
	FrqWeVj8/JI+X/p1HdFFlz+7cnedWAOUNb8BGZ0x+QzthhOjisnB8NmGCnkkV1fxJQMZxKrsxKoo0
	yPs7v6SEGCEll7SpujE2dEQlG8ELCD2DyfaTQIRNSlIqBNaWbCibx2idepbw4Uhdrqf3s4BYA8Upi
	POEbJ0cv89yonnH2QI+R+CyaO2rKQuacCMZuB9sAUx7lDqV5hnk3IJx9NXUG+ms5QIhxZiroCEysR
	XbRIu9dBwqZOLIJBQ31dwPzVp0shoMJShELw+IIG0+pzJds8/xGCDBmUTBMvXQCqpgL0F0VnrHpEK
	QHhQk/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5ij-0000000EvvH-2XuU;
	Tue, 05 May 2026 02:41:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK5ih-0000000Evu6-2Yw1;
	Tue, 05 May 2026 02:41:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D11344516;
	Tue,  5 May 2026 02:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E6A5C2BCC4;
	Tue,  5 May 2026 02:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777948870;
	bh=cz9PCzZLbGqRc2okSEJXwOQyt7dx65kZ5KjOSudA1Jk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cU/GhPcLoOamlka9r0DQet3iRt8gZ2zjfr+DAQcwSdM6y2VkMIX5H2zjx1a4TJYVc
	 7vq2t+OFrD/+inDWqWn2COiXLLa6SzGymBBQe+q/Zkj55C2LRHkGaVSe5ufnNPW044
	 m6y7gVs9zb2UOTph6bL+t/3HF8vfx0jqwqUGCbSnQFY3Cj3ZS/dvsOm5X312KroaTT
	 fMH0i7KdUf++XpERCNAjtdl3AIZ6dig5q6kV8dVVrBWgOBNiaZm5xPLsXPKbnu4Amb
	 OtH2KyKUr2e3/UcATnuIyigbBwL+0RhQ0iOAvz1WWa48ApFevmvnmFMIosFejVaAnP
	 jlbE1Q9WLe1yA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE7739301A2;
	Tue,  5 May 2026 02:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3] net: airoha: Introduce
 airoha_fe_get()/airoha_qdma_get() register read helpers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177794882129.1397274.6642429130537078994.git-patchwork-notify@kernel.org>
Date: Tue, 05 May 2026 02:40:21 +0000
References: <20260501-airoha_fe_get-airoha_qdma_get-v3-1-126c6f647ccb@kernel.org>
In-Reply-To: <20260501-airoha_fe_get-airoha_qdma_get-v3-1-126c6f647ccb@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_194111_671432_B92737A2 
X-CRM114-Status: UNSURE (   8.91  )
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
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 01 May 2026 09:49:11 +0200 you wrote:
> Add airoha_fe_get() and airoha_qdma_get() as utility routines for reading
> a masked field from a specified register.
> This is a non-functional refactor, no logical changes are introduced to
> the existing codebase.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 
> [...]

Here is the summary with links:
  - [net-next,v3] net: airoha: Introduce airoha_fe_get()/airoha_qdma_get() register read helpers
    https://git.kernel.org/netdev/net-next/c/98e490930de3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



