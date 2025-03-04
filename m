Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FA2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPnJSvOpXFl9Gvkycauini8xBrYy98lKMs5zuJB99Oo=; b=aEVsNvM1hzVhLPmPVTDKPVCP8V
	0Jbvd3B4nXRmZfIsIpTxjbAlTrAmTQ4pJ9LGN0PZoA95k/GYRnjpW4oUZWG+PWgA0Q5HLkBjLSrIX
	AZQ0Gzbh+iMetsgZT1Pgr8H7ePRXi87YaP5E9u9XXdi/Sh6ReD55lwFYtRiNciy4+A53KVpv0vxGO
	FQFe2M/WxraB7qAPAvQnCuinmzLoC8e3grmDMJ7woSaunPJLOHKc19foM3Nu2U1OI9pLtX7cYzOOj
	FEp0oa2kX3Nj/6u1yywo+O02B08TFazOTh1HkP5JjoqzD02/Hlt360skORGCD77OfpCO8YyIIH5xv
	a6qLYg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRSj-00000004eFT-1XlQ;
	Tue, 04 Mar 2025 12:33:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRPO-00000004dqS-3m55;
	Tue, 04 Mar 2025 12:30:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41F675C5BB0;
	Tue,  4 Mar 2025 12:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EC3C4CEE5;
	Tue,  4 Mar 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741091401;
	bh=rJKGNfM/s8QAQjXFzZnxlWs2DFKcY9YmiOImWJPI/GQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=TMo2Q3EpOctKaoJW9GG7S6AMYjIDFGNjCQj4bJsSZCI9aqh/qYV4ejHAlDb9RLKnP
	 M1csSwvOvpyYuoLzNbdiOSskin8i1N64VgsfpIBdZmAAbz5+TRZLfil0G9953jUhUh
	 IFBtS/SB89C0+avIAkVA0DnGt0g5t9Bsk0D0NsgrRUIV2lK5TuG7+WKG7B7fyHSfcl
	 9n8w8hSOw7iZiEvXgMHZmcmUgNFVj73T4Zci4/koyKbeOkbKt4nDC/VRHbkEgdelGK
	 10XmL2sNZ9QGlY4ENh2ChRmU+IHBOqKWhqvmeYlTGseMDIoQQAwGaAdyzoqN/AOD5c
	 ewoyaowLH8P+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE2D380AA7F;
	Tue,  4 Mar 2025 12:30:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 00/15] Introduce flowtable hw offloading in
 airoha_eth driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174109143450.124302.2708662777154071510.git-patchwork-notify@kernel.org>
Date: Tue, 04 Mar 2025 12:30:34 +0000
References: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
In-Reply-To: <20250228-airoha-en7581-flowtable-offload-v8-0-01dc1653f46e@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, nbd@nbd.name, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, chester.a.unal@arinc9.com, daniel@makrotopia.org,
 dqfext@gmail.com, andrew@lunn.ch, olteanv@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, upstream@airoha.com, sayantan.nandy@airoha.com,
 ansuelsmth@gmail.com, krzysztof.kozlowski@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_043003_030059_7CDAC438 
X-CRM114-Status: GOOD (  10.02  )
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
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 28 Feb 2025 11:54:08 +0100 you wrote:
> Introduce netfilter flowtable integration in airoha_eth driver to
> offload 5-tuple flower rules learned by the PPE module if the user
> accelerates them using a nft configuration similar to the one reported
> below:
> 
> table inet filter {
> 	flowtable ft {
> 		hook ingress priority filter
> 		devices = { lan1, lan2, lan3, lan4, eth1 }
> 		flags offload;
> 	}
> 	chain forward {
> 		type filter hook forward priority filter; policy accept;
> 		meta l4proto { tcp, udp } flow add @ft
> 	}
> }
> 
> [...]

Here is the summary with links:
  - [net-next,v8,01/15] net: airoha: Move airoha_eth driver in a dedicated folder
    https://git.kernel.org/netdev/net-next/c/fb3dda82fd38
  - [net-next,v8,02/15] net: airoha: Move definitions in airoha_eth.h
    https://git.kernel.org/netdev/net-next/c/b38f4ff0ceac
  - [net-next,v8,03/15] net: airoha: Move reg/write utility routines in airoha_eth.h
    https://git.kernel.org/netdev/net-next/c/e0758a8694fb
  - [net-next,v8,04/15] net: airoha: Move register definitions in airoha_regs.h
    https://git.kernel.org/netdev/net-next/c/ec663d9a82bf
  - [net-next,v8,05/15] net: airoha: Move DSA tag in DMA descriptor
    https://git.kernel.org/netdev/net-next/c/af3cf757d5c9
  - [net-next,v8,06/15] net: dsa: mt7530: Enable Rx sptag for EN7581 SoC
    https://git.kernel.org/netdev/net-next/c/ab667db1e601
  - [net-next,v8,07/15] net: airoha: Enable support for multiple net_devices
    https://git.kernel.org/netdev/net-next/c/80369686737f
  - [net-next,v8,08/15] net: airoha: Move REG_GDM_FWD_CFG() initialization in airoha_dev_init()
    https://git.kernel.org/netdev/net-next/c/67fde5d58cd4
  - [net-next,v8,09/15] net: airoha: Rename airoha_set_gdm_port_fwd_cfg() in airoha_set_vip_for_gdm_port()
    https://git.kernel.org/netdev/net-next/c/c28b8375f6d0
  - [net-next,v8,10/15] dt-bindings: net: airoha: Add the NPU node for EN7581 SoC
    https://git.kernel.org/netdev/net-next/c/266f7a0f81c0
  - [net-next,v8,11/15] dt-bindings: net: airoha: Add airoha,npu phandle property
    https://git.kernel.org/netdev/net-next/c/9b1a0b72264c
  - [net-next,v8,12/15] net: airoha: Introduce Airoha NPU support
    https://git.kernel.org/netdev/net-next/c/23290c7bc190
  - [net-next,v8,13/15] net: airoha: Introduce flowtable offload support
    https://git.kernel.org/netdev/net-next/c/00a7678310fe
  - [net-next,v8,14/15] net: airoha: Add loopback support for GDM2
    https://git.kernel.org/netdev/net-next/c/9cd451d414f6
  - [net-next,v8,15/15] net: airoha: Introduce PPE debugfs support
    https://git.kernel.org/netdev/net-next/c/3fe15c640f38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



