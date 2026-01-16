Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C27DD4A5EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 03:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hiz45fyBoPGTyFol0iLWEwkTdZoN3MkpAQNLtJeSd9c=; b=x8JrbR3+u29D66cog/Y7cHKAF0
	ckK4NVL0fcm+ocPUIV1ekwjLF9eOtCXd9GuMeHCGkrZuF0QI/faIU4jnQg0VLK+cYlAvKaJiadVHb
	c3L4DUjseZkg9tR7Vdlq8jUFLX84GsCakKmWXzOVEiEI+LYrdmGmQxPcTDHdZhGdtj7jwDTy6rMty
	LdB6Bv1MWqy6oxu9Y7TujmrrxrBxj0z+mAJWLeGc48h560zFP5Da3bEkjvx2O3AYhrfTVhmRPvwT3
	GLTBUfDEgx6AheHJYeWRBxFKZW7PvRwYcqLZMUakYAujaUxcDV2ft8ga4W0rxmmX3Fqoky8mVUv7j
	JH/qnS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgakd-0000000DXX7-25sk;
	Fri, 16 Jan 2026 03:43:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaka-0000000DXWj-2vL1;
	Fri, 16 Jan 2026 03:43:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F3416441A9;
	Fri, 16 Jan 2026 03:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB3FC116D0;
	Fri, 16 Jan 2026 03:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768535031;
	bh=Rk7ul3+7Pd2L2LKtycBrWaYq9U5m4oqexjF0isWTsys=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ur7ou9TVo1Wkks1IlPV3IoVZDFs90ZBFQ9xfnfHgHr/GgEGqm8PAr9kL+Hsu2C60L
	 zPP9c0xe0EfsfPUHW8o/kW1aL5dFzsGNYuJXiWXpeGOudoAYN1TBsIWsCvAs8sxawy
	 qcKI0oWPXc0hw8RaKO9QRYtBTRDpFgiOTQeHjS2q/SYoi9DftkutaofhoqhbyyYISU
	 Rcps+E1ceyw40H2zSR50kWbdimDVpahi8M0RK2IzxzYbpsy68D2pQ8Npcmm4nVBVt+
	 GO0KOPNtN7XalXX981ewAP0GnkqVbDcfLRFTu/cMTykqxQkVTXzP+aeXL0TbqFNAZr
	 oYMmKKr8XVuWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7894F380AA4B;
	Fri, 16 Jan 2026 03:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/2] net: airoha: Init Block Ack memory region
 for MT7996 NPU offloading
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176853482227.70930.3785577053167700341.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jan 2026 03:40:22 +0000
References: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
In-Reply-To: <20260108-airoha-ba-memory-region-v3-0-bf1814e5dcc4@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_194352_782759_A998A5A0 
X-CRM114-Status: UNSURE (   8.65  )
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

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 08 Jan 2026 16:05:06 +0100 you wrote:
> This is a preliminary series in order to enable NPU offloading for
> MT7996 (Eagle) chipset.
> 
> ---
> Changes in v3:
> - Add missing minItems for memory-region-names in airoha,en7581-npu.yaml
> - Link to v2: https://lore.kernel.org/r/20260107-airoha-ba-memory-region-v2-0-d8195fc66731@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/2] dt-bindings: net: airoha: npu: Add BA memory region
    https://git.kernel.org/netdev/net-next/c/40f9e446033e
  - [net-next,v3,2/2] net: airoha: npu: Init BA memory region if provided via DTS
    https://git.kernel.org/netdev/net-next/c/875a59c9a9e5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



