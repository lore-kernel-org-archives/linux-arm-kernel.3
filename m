Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEF4C1B0FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 13:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4MoQ9cEAhkqGNwSMRKP2vAO1WBCM7nRNILdvnioR+M=; b=Ynw7T1Gdk7NrC9dRZ35PKSiWXB
	vfw460hIRWfVy9sXYOJ6I19qAfTwmT5GRVyxqCQIMOAyx0sDw+0IhDcL3mV+6a399Kkg3V5SQGjNq
	7XcuZXm7Ly31HosZZ6T6ZLH3mclaJS0k2l1pBWFtzrhZ8SRG6C0GtUBR/zWBwWEPrwCyeRgO6aN2p
	2M3oAWjlBpr+3m+hRbxFBkPuU8PwWkbXnNosWlHppxkYoZOKofn5Fv82sOLcYt0qSyrXenPgLqNmS
	UMgwcF9WvWT+dcoKoqAy23C7jBWo56apimA9JSLjLDRbCALaab1sZ/isfcSWtV1FTBnNc8H7tCK6U
	tmdZKpEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tneFf-00000007b2k-1kWV;
	Thu, 27 Feb 2025 13:48:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tne7L-00000007Z4C-2D9i;
	Thu, 27 Feb 2025 13:40:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B69645C584A;
	Thu, 27 Feb 2025 13:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E04C4CEDD;
	Thu, 27 Feb 2025 13:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740663598;
	bh=cHUQXYpMECA1CrjD2oF3utlXd4IOvTws7zBps4QG/YU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IUdi2pHsnjtC3+oCFGu6yr3FYLbI3gp7NuuthL2YRkCo7aVzirJzZhkujCiXeQETp
	 9XTt5Rgej4zUn5LYmcH6/guD1uS4xm0ggMl0rwSO5v6ybcuf0hMgM/54K3NGl+EVRx
	 qmbKwkeclEETmkS5opO3f10HRN8zOd7RGgNHbgWAUx00KW78XxQXFIM5+VqIE4GSl6
	 R3/rrDP0JOZW51rh273W9yDcHM+uF2/gz3evgGulQP066tiHOCMPoqh/NQCv/Q1lZQ
	 HUP3/dt9ej9u0nKc1kRzz3nBMTIc82I+7XlRwpuPaBMkUL+bLHnKC7VvRGSA/Ajj4K
	 ts9cEsAGnJDJw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C61380AA7F;
	Thu, 27 Feb 2025 13:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 net-next] net: ethernet: mtk_ppe_offload: Allow QinQ,
 double ETH_P_8021Q only
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174066363025.1432096.10317097850381047661.git-patchwork-notify@kernel.org>
Date: Thu, 27 Feb 2025 13:40:30 +0000
References: <20250225201509.20843-1-ericwouds@gmail.com>
In-Reply-To: <20250225201509.20843-1-ericwouds@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, frank-w@public-files.de,
 daniel@makrotopia.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_053959_612797_6B05B388 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, 25 Feb 2025 21:15:09 +0100 you wrote:
> mtk_foe_entry_set_vlan() in mtk_ppe.c already supports double vlan
> tagging, but mtk_flow_offload_replace() in mtk_ppe_offload.c only allows
> for 1 vlan tag, optionally in combination with pppoe and dsa tags.
> 
> However, mtk_foe_entry_set_vlan() only allows for setting the vlan id.
> The protocol cannot be set, it is always ETH_P_8021Q, for inner and outer
> tag. This patch adds QinQ support to mtk_flow_offload_replace(), only in
> the case that both inner and outer tags are ETH_P_8021Q.
> 
> [...]

Here is the summary with links:
  - [v4,net-next] net: ethernet: mtk_ppe_offload: Allow QinQ, double ETH_P_8021Q only
    https://git.kernel.org/netdev/net-next/c/7fe0353606d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



