Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BE4CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 11:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+wVA+Y8ZRjs8khCvkibhIqHLBC+tv3RGaU5s7skx3g=; b=nQpQTh84a59rmAV/gx/BueuDMA
	+Iw4tIQD42HE2cr8whbr3Ix6vMQIYvEBhSuN+3q5n+PB1DJ/ZBfg+H3mACITTwAR6ztraYzjs4dJk
	+bkQ3PL29+WubZiJDkBCr83+2MONnfDH4/YMKZ6jMEhhfGQ836cDRvueMax/asacYJmwtr8BU+tVE
	FYZRzuPDJvbhBUBqPCqSeMnAITk+iqBvujL9YqYUjY1MlHrgP2sMGWooiwu6HQ5EN0cNcgcNAYS4u
	iOW8TPKjaV4qMXCGudbljh8I3pJii99ohieitljHpLsScRf5yjY1svy/kWJkutNSwTONiXAMSYbGP
	WQ2RKlyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAQC-0000000GkT6-1kEa;
	Tue, 21 Oct 2025 11:20:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBAQB-0000000GkSM-13ej;
	Tue, 21 Oct 2025 11:20:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42E78623CC;
	Tue, 21 Oct 2025 11:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4677C4CEF1;
	Tue, 21 Oct 2025 11:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761045639;
	bh=+VaSZVBmZz5ORjS1Wb6KdbQodfWLfvpUe4sWk4+bHv4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YW1znFsumFVytyxSSC/x9NGDtSKDa95wxqD2GVitcp9zBDvj58z7i4UVfsYqyMESb
	 0756yvamIZ5JBhICt1yrOhmGulkkWKUjuXg9nEXtxL2d1R5NXWyktgM1ONo1BM3+9D
	 eM3u7SzC32ZvUTi8W9M9Npo2v2ZkjZ9NH1QfoVbSzjcBX6tRiUSkmRnEQsffdaiw0y
	 na/QZqlQUaeMUVNggBSrFzt607Gl9yD8TApx2OmB/txPEG33msJMaGvo4oi432rB/6
	 EsFxp0BhffTuDlM20IErb2ih6IgyYqB8TfoMmyUlMdQAgug5V45/0r9BQMV4F9FUx1
	 C9mqq2/7zXWdA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE3A3A55ED9;
	Tue, 21 Oct 2025 11:20:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 00/13] net: airoha: Add AN7583 ethernet
 controller support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176104562151.1030909.1115814969731162849.git-patchwork-notify@kernel.org>
Date: Tue, 21 Oct 2025 11:20:21 +0000
References: <20251017-an7583-eth-support-v3-0-f28319666667@kernel.org>
In-Reply-To: <20251017-an7583-eth-support-v3-0-f28319666667@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org, horms@kernel.org,
 ansuelsmth@gmail.com
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

On Fri, 17 Oct 2025 11:06:09 +0200 you wrote:
> Introduce support for AN7583 ethernet controller to airoha-eth dirver.
> The main differences between EN7581 and AN7583 is the latter runs a
> single PPE module while EN7581 runs two of them. Moreover PPE SRAM in
> AN7583 SoC is reduced to 8K (while SRAM is 16K on EN7581).
> 
> ---
> Changes in v3:
> - improve device-tree binding
> - rebase on top of net-next main branch
> - Link to v2: https://lore.kernel.org/r/20251016-an7583-eth-support-v2-0-ea6e7e9acbdb@kernel.org
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/13] dt-bindings: net: airoha: Add AN7583 support
    https://git.kernel.org/netdev/net-next/c/51538c0c9d8c
  - [net-next,v3,02/13] net: airoha: ppe: Dynamically allocate foe_check_time array in airoha_ppe struct
    https://git.kernel.org/netdev/net-next/c/6d5b601d52a2
  - [net-next,v3,03/13] net: airoha: Add airoha_ppe_get_num_stats_entries() and airoha_ppe_get_num_total_stats_entries()
    https://git.kernel.org/netdev/net-next/c/15f357cd4581
  - [net-next,v3,04/13] net: airoha: Add airoha_eth_soc_data struct
    https://git.kernel.org/netdev/net-next/c/5863b4e065e2
  - [net-next,v3,05/13] net: airoha: Generalize airoha_ppe2_is_enabled routine
    https://git.kernel.org/netdev/net-next/c/ef9449f080b6
  - [net-next,v3,06/13] net: airoha: ppe: Move PPE memory info in airoha_eth_soc_data struct
    https://git.kernel.org/netdev/net-next/c/5bd1d1fd48ea
  - [net-next,v3,07/13] net: airoha: ppe: Remove airoha_ppe_is_enabled() where not necessary
    https://git.kernel.org/netdev/net-next/c/41139125f5c7
  - [net-next,v3,08/13] net: airoha: ppe: Configure SRAM PPE entries via the cpu
    https://git.kernel.org/netdev/net-next/c/306b78f5035a
  - [net-next,v3,09/13] net: airoha: ppe: Flush PPE SRAM table during PPE setup
    https://git.kernel.org/netdev/net-next/c/620d7b91aadb
  - [net-next,v3,10/13] net: airoha: Select default ppe cpu port in airoha_dev_init()
    https://git.kernel.org/netdev/net-next/c/c71a7a861ef0
  - [net-next,v3,11/13] net: airoha: Refactor src port configuration in airhoha_set_gdm2_loopback
    https://git.kernel.org/netdev/net-next/c/9d5b5219f672
  - [net-next,v3,12/13] net: airoha: ppe: Do not use magic numbers in airoha_ppe_foe_get_entry_locked()
    https://git.kernel.org/netdev/net-next/c/63f283d36b1f
  - [net-next,v3,13/13] net: airoha: Add AN7583 SoC support
    https://git.kernel.org/netdev/net-next/c/e4e5ce823bdd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



