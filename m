Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3C0C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdDuwrNT5nqbnggT94bNnBal0P0MT94FqQjiRpDuoes=; b=keJK8VzUhzcePK5l+eadkujfez
	0WdBl2KjPIlhGOZzGetaRzBE5Cs7zWUFHvb/2/qg58pW+TBXn/rx4bK0FJcfUJzYFXPG0FRkcqDxq
	XTCu8apZhCwjb2Ax4w8UcSl5ssg7g/0PutumJ1shs2kge3C7nqBr0L9w12YMFLXBmFtOROHPgYGxA
	Rz2bKyUTK6pSQdNYSqZVXVXNd34hEPzcUDZ7K8RFZsIttzb6PWpfRQq0eoEVYtT6Gv5eyoZBAeY8s
	aQsGGA9k/pkNlWfjxikcDem+DmLvTp27g6xS2iF69r49qKEs7TnPhvMQIK9iNvxdWDItBC6LCYnAA
	jjhdw/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eFO-0000000ENUU-3oRf;
	Thu, 10 Sep 2026 12:51:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eFN-0000000ENU9-3ULO;
	Thu, 10 Sep 2026 12:51:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D00F434BF;
	Thu, 10 Sep 2026 12:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1B91F00893;
	Thu, 10 Sep 2026 12:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789044681;
	bh=wdDuwrNT5nqbnggT94bNnBal0P0MT94FqQjiRpDuoes=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=k4BBfE6N9JhgZmKsYJCrLKT/4Kamlq6xyP9VaFLhV/nWH+q4kAcV8GbMRy2B28mEF
	 4j1HBYtvEdO0cDfHz5p6MJ9dipXxOOFpV5GR/P9lE/uR9gzg42ib9Wy96guE6ScnEb
	 ZCbGT18R+cZxOlNcG5R7U/7XiRQC+RsVMPvMs4ig5TAd/N3FOgV12yRpRfptAEK52I
	 rZgPZBCl1tvaJvF0K0MrFFrRW/m93+0N3qFOgN2tT7p2H7nwgMdkx99AiLFwDnz+p6
	 EGqtK0VvftGy6WjM06VGIz26Cv8kb3C3gAMuWM22koJbFbrysXNhxpw7gD+G9GFmZA
	 JlH/1Zy66QQRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A04380CFEE;
	Thu, 10 Sep 2026 12:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] net: phy: mediatek-ge: disable EEE on the MT7530
 PHY
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178904461843.1411984.6387257251091474222.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 12:50:18 +0000
References: <20260908145213.3976508-1-vladislav.karmanov.dev@gmail.com>
In-Reply-To: <20260908145213.3976508-1-vladislav.karmanov.dev@gmail.com>
To: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, daniel@makrotopia.org,
 dqfext@gmail.com, SkyLake.Huang@mediatek.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
 sean.wang@mediatek.com, olteanv@gmail.com, yangshiji66@outlook.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
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

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue,  8 Sep 2026 17:52:13 +0300 you wrote:
> The MT7530 internal GE PHY advertises EEE by hardware default, but its
> EEE support is defective: with EEE advertised, some link partners fail
> to establish a stable link. On a 2-pair (4-wire) cable where both ends
> advertise gigabit, 1000BASE-T training cannot succeed, and instead of
> falling back to 100 Mbps the port loops, so no link or DHCP lease is
> ever obtained. MediaTek confirms the hardware is the root cause (Landen
> Chao, 2021): "EEE of the 10-year-old MT7530 internal gephy has many IOT
> problems, so it is recommended to disable its EEE."
> 
> [...]

Here is the summary with links:
  - [net,v4] net: phy: mediatek-ge: disable EEE on the MT7530 PHY
    https://git.kernel.org/netdev/net/c/ccbe7540e4aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



