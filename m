Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02728D41D41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 01:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QkvTHC2KpJrcCZbIvyqy7SzLhuMnK/9gOx1HH4MQmIg=; b=x3lC+7H1Cu11LKYNIiEYbBkjaw
	qWvotzYLWghdvI8M2zpgX1SDLHr2nQzDTrwT9Rim7JQ7VC8LQjH/7IpNgeD/xnPzaq/zCbitgYVzT
	aDJ7EF5eRg/VqvpSSR6WycBFBZDYEbszZXShjyKPGizOy3EeXAKlIx4U5QiSS71Ck1CP/jPERuVOr
	ueKH9dn9wxbfuaps4xsBp8V9zuQpYq5zsWmiEoGHfLSGTCtoZ6TJvc6wRaMSr9pHAsuNyrDoqmz7j
	SZq7kDaXY5h1B+/GNZYI/yVvZOrLpD53QxrXOslIi8qVWieRtY3it81A76GzevSE60HeFbrgL3pmx
	s0TOwENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfOv-00000001ptd-2PHn;
	Tue, 12 Nov 2024 01:09:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAfGb-00000001oI4-0p6I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 01:00:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1942FA40FDF;
	Tue, 12 Nov 2024 00:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2983BC4CECF;
	Tue, 12 Nov 2024 01:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731373224;
	bh=f6WJXrTRDikhQIj250Wnzzvx7X2r/wsegb+H7jPT+kI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=h6/rJx871zpDPJ/Ca+zhF31lB5gWaSHsaGBByy/qf9lBzMVz/FA54LKkzkyQaJzAA
	 /WVvk2D3IVfWM3SxynRcoJE76y/cmj05JlJOKdSb4g6aJVKJTyF6kx7jUFrSXmJ6Xj
	 f2Sn7mBMusNAIx5bkndiAOcbe0ppwU2FA+NN/AHisv+0FcTeM3XdFSPcY7TCwb/QWD
	 6SrlUl/zhqqW8lrliuzaaDNeW/9s95UQHj2CeB7oakRaDVUx5kh42Zpaql3QWJ0GO0
	 C9LaOGiNlkgzDumvtaaNjrPy6rUTojDbeUGuCGzG2Xq8+n3bDL+VNpM6HAIsmLEAvK
	 sLKRGur/fWJgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 713313809A80;
	Tue, 12 Nov 2024 01:00:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 0/4] Introduce VLAN support in HSR
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173137323399.33228.10298561607881644376.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 01:00:33 +0000
References: <20241106091710.3308519-1-danishanwar@ti.com>
In-Reply-To: <20241106091710.3308519-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: geliang@kernel.org, liuhangbin@gmail.com, jiri@resnulli.us,
 w-kwok2@ti.com, aleksander.lobakin@intel.com, lukma@denx.de,
 jan.kiszka@siemens.com, diogo.ivo@siemens.com, shuah@kernel.org,
 horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com, vigneshr@ti.com,
 rogerq@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_170025_317134_138B4BE4 
X-CRM114-Status: GOOD (  13.80  )
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

On Wed, 6 Nov 2024 14:47:06 +0530 you wrote:
> This series adds VLAN support to HSR framework.
> This series also adds VLAN support to HSR mode of ICSSG Ethernet driver.
> 
> Changes from v2 to v3:
> *) Modified hsr_ndo_vlan_rx_add_vid() to handle arbitrary HSR_PT_SLAVE_A,
> HSR_PT_SLAVE_B order and skip INTERLINK port in patch 2/4 as suggested by
> Paolo Abeni <pabeni@redhat.com>
> *) Removed handling of HSR_PT_MASTER in hsr_ndo_vlan_rx_kill_vid() as MASTER
> and INTERLINK port will be ignored anyway in the default switch case as
> suggested by Paolo Abeni <pabeni@redhat.com>
> *) Modified the selftest in patch 4/4 to use vlan by default. The test will
> check the exposed feature `vlan-challenged` and if vlan is not supported, skip
> the vlan test as suggested by Paolo Abeni <pabeni@redhat.com>. Test logs can be
> found at [1]
> 
> [...]

Here is the summary with links:
  - [net-next,v3,1/4] net: hsr: Add VLAN support
    https://git.kernel.org/netdev/net-next/c/d977d7eb09fe
  - [net-next,v3,2/4] net: hsr: Add VLAN CTAG filter support
    https://git.kernel.org/netdev/net-next/c/1a8a63a5305e
  - [net-next,v3,3/4] net: ti: icssg-prueth: Add VLAN support for HSR mode
    https://git.kernel.org/netdev/net-next/c/e6bf1f7aea4d
  - [net-next,v3,4/4] selftests: hsr: Add test for VLAN
    https://git.kernel.org/netdev/net-next/c/75e3f12fa51b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



