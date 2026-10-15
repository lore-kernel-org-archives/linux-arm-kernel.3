Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11D2CC6B2F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 08:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQ5ecVPNy31vU8tc5VU+V4etDkTRdGoX/2WdYTpz/+A=; b=lBAU1Yhp+sPI6u2xCjGEMSmq41
	l4VFpG9M291fL3gxtTkCKyzM6FlQoKpqfBjAQ1FkYCTx2jfo+tfIm4JFc27oWn59qasDtpqF1l3KJ
	aHhs0XIptvIUqU7rKOAdSICJFnIt/0qqSzdGqWdGlmmP1s5/jpbqKShbLFx1qUPu7kZEDK1MlUQ4S
	SM0VlVZmm5HY6Z8zUByAzfDBv2133T3dvF0IsPaB5dJUcOZ/RFRXN+i16H0vY9Zc5vurRsTCTnbFf
	O3UiNDiNcpMQaBwjw4fkWpj/BUP6HbQXopvh6r4n+ptXyC8woJdp4+SR3LHOph6zHzBOzo17Lw/u7
	GkMITH7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHAA-0000000HBzL-2hya;
	Thu, 15 Oct 2026 08:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHA8-0000000HByr-1KZS;
	Thu, 15 Oct 2026 08:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A514F43E3D;
	Thu, 15 Oct 2026 08:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830541F000C4;
	Thu, 15 Oct 2026 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054207;
	bh=iQ5ecVPNy31vU8tc5VU+V4etDkTRdGoX/2WdYTpz/+A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=b3AH3KelbwRFgVeh4Vhsc+l01AwMf9zHvNYO7Q1KFKpz/lYDv3AepmfnVa7xD5k+m
	 8IMco0ZtY4kMDqeVaJHOJjxoDPii5e85+OsN55Qin5z1ytZ+NjKRCrV4F+ZuH2Pyit
	 NB2z+rv4Qz2M6hTh9t6jVbvv7RfHgsW+steohOT4P0KQxF/P4X/RdakSZcQvmJlr5M
	 KslpU8WeuO5Dq0L6YwxCJQbjqHqrmHq4Dbg0CbZHhywctjKe1e6Uqx5YncbBWQE9qG
	 P+qfQ6HwgTPtNUM9hfnhwPmCjYlJp7h57aHJmSBDCPIgXqnfTVCX32WN2CRqVvuUwc
	 D8afj4GJsWm0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 774C9392E9EB;
	Thu, 15 Oct 2026 08:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net 00/10] net: Move setting of netops to fix crash
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179205420627.3286272.11847066903047422427.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 08:50:06 +0000
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
In-Reply-To: <20261008022656.3592191-1-mmyangfl@gmail.com>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, afaerber@suse.de,
 mani@kernel.org, ciprian.regus@analog.com, andreas@gaisler.com,
 shenjian15@huawei.com, shaojijie@huawei.com, sebastian.hesselbarth@gmail.com,
 parthiban.veerasooran@microchip.com, danishanwar@ti.com,
 parvathi@couthit.com, rogerq@kernel.org, pmohan@couthit.com,
 runyu.xiao@seu.edu.cn, horms@kernel.org, jacob.e.keller@intel.com,
 sdf@fomichev.me, nb@tipi-net.de, maxime.chevallier@bootlin.com,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org
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
by Paolo Abeni <pabeni@redhat.com>:

On Thu,  8 Oct 2026 10:26:42 +0800 you wrote:
> Commit ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev()
> locking assertion") put a netdev_need_ops_lock() check on the
> phy_attach_direct() path, in phy_link_topo_add_phy(). With
> CONFIG_NET_SHAPER enabled netdev_need_ops_lock() reads
> dev->netdev_ops->net_shaper_ops, so any driver that connects a PHY
> before assigning ndev->netdev_ops now dies with a NULL pointer
> dereference at probe time. The breakage showed up in v7.3-rc1.
> 
> [...]

Here is the summary with links:
  - [net,01/10] net: hisilicon: hisi_femac: Move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/444889dfa27b
  - [net,02/10] net: hisilicon: hip04_eth: Move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/0d9342701f14
  - [net,03/10] net: ethernet: actions: Move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/c2c482431985
  - [net,04/10] net: ethernet: adi: Move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/ea1565cbf063
  - [net,05/10] net: mv643xx: move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/a3eef3d2cca0
  - [net,06/10] net: au1000: move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/beabbafdd0f6
  - [net,07/10] net: ethoc: move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/c9f8ce62a5fa
  - [net,08/10] net: ethernet: aeroflex: move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/d71483f0716e
  - [net,09/10] net: ti: icssm-prueth: Move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/955bb7cf680d
  - [net,10/10] microchip: lan865x: move setting of netops to fix crash
    https://git.kernel.org/netdev/net/c/2a3f6d2a9ac3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



