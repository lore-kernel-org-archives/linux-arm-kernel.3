Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FA1C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXC405I5b/7aTh83/RYSCRQfr9cDLaT3N8ez4KbxZSQ=; b=hh1k0B+ex57/W5AV3r4/bJEIYE
	NaGF2DjLSdmDIulpGBK3tpZtDB56fB256adkgDApJqNsieqyZ+J2eOUGjzwrSmVHE7Wadv4UecM1I
	/MyEZTrZK6rJdWqJaQW+fRd5wON+P/JBJGhUQYTNE7UGc4OvR5J2CmJUU1LaxgeEjW/KRfLIhAUPi
	P7eUYtvP9aaK6Ks8q13OaXJze977ml1hbf1wn2Xl3qfrSsF1StnlCVpyhjAeLaWsAxvDmXFfwkdD3
	Fs5JZLFV2Wj0Lxb9zFkU4HsumWQfkc539N3MdGSca0y+c33v4tweok/XgK07ef84SPk7RV/pA4E9b
	aGK3KT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIx4-0000000Dmhn-0jYS;
	Thu, 19 Jun 2025 17:21:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHWT-0000000DZMQ-3sNn;
	Thu, 19 Jun 2025 15:49:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86D8A49C39;
	Thu, 19 Jun 2025 15:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D727C4CEEA;
	Thu, 19 Jun 2025 15:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750348193;
	bh=uDshXZbmAr/TJK7xktqLJGVw1ctH6vb0ZJmX6Cflkj4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=fNBRpC2sA0l7+2/B0aZ49Y9iXjGV9gKWeuRyrFvZTK99A14+HJ4zFj4sQRm6aiVzR
	 zPulwdP8JIxdSuKViFYWJCY63HYWC22PvIG1Dow0dgv4fHe26CLbR65QvMXDiH+h2f
	 hfVDzidaU8SbjGKaFFjZPELH/yckDnOS/x08yBfiprZlHE2/t35weKGOOQcGQGC0gU
	 EpUAboIuNSDGwIdlj0gvquaj3mW51WxiVkwk1/S7Ce9pbyN36MO8B1Ca/7QrdoetQN
	 JrZ6JS/aqjQvivId9aurx+iZhz94vUsde6zCYwTULdsPbT/wmCvqwxJnm/wL6iSUL3
	 RjwdgPaCfyrtA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE2538111DD;
	Thu, 19 Jun 2025 15:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4 0/2] net: airoha: Improve hwfd buffer/descriptor
 queues setup
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175034822148.909907.3251330823470236604.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 15:50:21 +0000
References: <20250619-airoha-hw-num-desc-v4-0-49600a9b319a@kernel.org>
In-Reply-To: <20250619-airoha-hw-num-desc-v4-0-49600a9b319a@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_084953_988619_C665EFD7 
X-CRM114-Status: UNSURE (   8.66  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 19 Jun 2025 09:07:23 +0200 you wrote:
> Compute the number of hwfd buffers/descriptors according to the reserved
> memory size if provided via DTS.
> Reduce the required hwfd buffers queue size for QDMA1.
> 
> ---
> Changes in v4:
> - Fix commit log for patch 2/2
> - Link to v3: https://lore.kernel.org/r/20250618-airoha-hw-num-desc-v3-0-18a6487cd75e@kernel.org
> 
> [...]

Here is the summary with links:
  - [net,v4,1/2] net: airoha: Compute number of descriptors according to reserved memory size
    https://git.kernel.org/netdev/net/c/edf8afeecfbb
  - [net,v4,2/2] net: airoha: Differentiate hwfd buffer size for QDMA0 and QDMA1
    https://git.kernel.org/netdev/net/c/7b46bdaec00a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



