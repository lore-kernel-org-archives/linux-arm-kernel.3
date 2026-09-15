Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E574C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 02:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4S3VRquMpKlrPOR2TZexhm6DFlDuABWqBf6DlMNhpn8=; b=EARDwZn8tgkVmtOjEcK9uDfkbR
	RPav3s6gV+JNh8GbofayHPhnoQnhPp72W0ajutGMivzMOG3E8AbobnKo7g0DTm1GB4ZH5qkV2bxru
	OuKpWTS3DbXBv/K+ceHXrn0184E0jYUowOjEuDbT/yukW/iW21D7z1rj4xGKv73G5l696XgsuX+Qc
	U5rEdNCEdApPf8xcL5amE5TlfNXl++T20Ki/bD/f7uBAhk8Y6Q4m8LTU4M2SrlGxRqzylayPW/YlT
	oQyrqDPC5q4OHiAMjbAdp+6DuqQ9VmhqqnKPr9d9vAHWuCc8ESpJIGHLWfOQmr5qmHmHXmpaF9hKd
	8bJriCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Idk-000000050zN-3fbv;
	Tue, 15 Sep 2026 02:11:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Idj-000000050z9-2HTK;
	Tue, 15 Sep 2026 02:11:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CF6F543D4C;
	Tue, 15 Sep 2026 02:11:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F6D1F00893;
	Tue, 15 Sep 2026 02:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789438278;
	bh=4S3VRquMpKlrPOR2TZexhm6DFlDuABWqBf6DlMNhpn8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=CH//NHTCmn8x1gykEUMbofNjpPWh/gxQx5+irZwn75xmqYs+GdT6TDwTDj3QJGGVo
	 oAr2tVWgd9AEhC/pEdm71GjPAmiNqTu9IC3fWouXCstbJ0RuynpRhZnuqPDEPb2w87
	 m/E+Dri+eMbVLbFgFQYGBiMVgYBwPDPlR+Z1YZ4IIHArwXkv7Bf/9GyLaJX0Q7JaA8
	 4yffA5qyD8CP6TdPRi1iCepUlXwe+ZV1w627Td6hC0pJrYpHy4sMZh90HIogEncvhG
	 2JHnTC9iPMKKppPhVGabX7pnVxnOYO/lEzUcVrVwWlNq7solbT30hD1XFU/7KR/Ddp
	 jqFOPFtJ3xhEQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A063924FFE;
	Tue, 15 Sep 2026 02:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: phy: mediatek: do not report link and per-speed
 LED
 rules together
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178943821337.1315233.3755940967519255382.git-patchwork-notify@kernel.org>
Date: Tue, 15 Sep 2026 02:10:13 +0000
References: <20260912134306.3544329-1-naseefkm@gmail.com>
In-Reply-To: <20260912134306.3544329-1-naseefkm@gmail.com>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, andrew@lunn.ch,
 angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
 edumazet@google.com, hkallweit1@gmail.com, kuba@kernel.org,
 matthias.bgg@gmail.com, pabeni@redhat.com, dqfext@gmail.com,
 linux@armlinux.org.uk, SkyLake.Huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 12 Sep 2026 17:43:06 +0400 you wrote:
> mtk_phy_led_hw_ctrl_get() reports TRIGGER_NETDEV_LINK whenever any of the
> speed bits in on_set is on, and in addition reports every individual
> TRIGGER_NETDEV_LINK_* bit that is set. The netdev trigger refuses that
> combination: netdev_led_attr_store() rejects TRIGGER_NETDEV_LINK together
> with any per-speed rule, and it validates the whole resulting mode rather
> than just the bit being written. Once the hardware has any link bit
> programmed, every write to the trigger attributes of that LED therefore
> fails with -EINVAL and the LED can no longer be configured.
> 
> [...]

Here is the summary with links:
  - [net] net: phy: mediatek: do not report link and per-speed LED rules together
    https://git.kernel.org/netdev/net/c/bde5212360bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



