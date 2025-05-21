Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA954C54E90
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 03:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnP9090xrlib+Yn7hkl6Cgl01zf+cLiiOfsn9BCxvJg=; b=oOj8p07tqCO9tgyaGik4xNAWN1
	P2lSiG1PWhQOsD8Uj6yWw0T8vu1u9Ah3Xs8XodhNMtBcH245USIrsfUIqWzn/BPJL95uX3SyhqWqW
	6HKx5j22Q2MJI58fcWlDvGKYxy6O2d+l9YGEkJriJ+qaXrZ8Qf8Pi5UrdLqN+/Oyn/ue0Ex7FYD1z
	vyGY+NMEWAtbtBR3lMrlMURhHSt9dl6UbuBR7grL+kYiFkUnj3bhOZ5VOPFuc0PfOt5f4AM4cT077
	X0vjtTBWEEAXvokQrHrAxm4eot4NWqPHAgOWananCbrhiz/vzQyhJOEVgT7eEXKWuJzdKvp023fTl
	WA2HxRaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZu9-0000000Eert-41ai;
	Wed, 21 May 2025 03:14:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHZqQ-0000000EeZc-0mfc;
	Wed, 21 May 2025 03:10:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69A545C3FBB;
	Wed, 21 May 2025 03:07:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B7AC4CEED;
	Wed, 21 May 2025 03:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747797013;
	bh=mYCeKj/h9aqZRfQODr/Jf6KORjUNey+07JyzmQoYe04=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=cEEKNSg50kKzC0Wjgu2BSkgq2kF9AiUexsiOvxG5UVZ+2eFXaNuiM5aCOvaGSwzFi
	 76JHYgTVT/1egl0JCMKuehDIcoj0rSn1fEVOdQ2An5lTSMosK/fghzskP2jzP5mf48
	 t4bHFaYSopbNH4Q1Anobd/eTjvFAC3fYXRTKp0fbDVl6v4nDvyk3NFt8ukP9Dt7wss
	 0seO9quZ8iccQYbHrU5KRqVlxNVM20dcuhrxV9fJ8s7h3or+QHViu9iGXxn85eGtCM
	 ojWWgWbv+6V4C7mc07RgkJZ5r1wNQbtpnpyXJkPVKMiIVZaCiQ0AM2p7CYXtRy+VF9
	 +XTFs0u2ek7DQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33B7E380CEEF;
	Wed, 21 May 2025 03:10:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/3] net: airoha: Add per-flow stats support to
 hw flowtable offloading
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174779704873.1552321.963690772773932988.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 03:10:48 +0000
References: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
In-Reply-To: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_201014_267055_65953B5C 
X-CRM114-Status: GOOD (  10.03  )
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

On Fri, 16 May 2025 09:59:58 +0200 you wrote:
> Introduce per-flow stats accounting to the flowtable hw offload in the
> airoha_eth driver. Flow stats are split in the PPE and NPU modules:
> - PPE: accounts for high 32bit of per-flow stats
> - NPU: accounts for low 32bit of per-flow stats
> 
> ---
> Changes in v2:
> - fix memory leaks in airoha_npu_stats_setup() and in
>   airoha_npu_foe_commit_entry()
> - disable hw keepalive
> - fix sparse warnings
> - Link to v1: https://lore.kernel.org/r/20250514-airoha-en7581-flowstats-v1-0-c00ede12a2ca@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/3] net: airoha: npu: Move memory allocation in airoha_npu_send_msg() caller
    https://git.kernel.org/netdev/net-next/c/c52918744ee1
  - [net-next,v2,2/3] net: airoha: Add FLOW_CLS_STATS callback support
    https://git.kernel.org/netdev/net-next/c/b81e0f2b58be
  - [net-next,v2,3/3] net: airoha: ppe: Disable packet keepalive
    https://git.kernel.org/netdev/net-next/c/a98326c151ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



