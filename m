Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7456CC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 20:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2WhrpQyzjfizAD7WjiNO5bi7n4CM21BaILhRpMuMmA=; b=EYOhbOH8df4Qb9uRH5H0gVYLTK
	FczYxXeFzE7sVUO++y1mudSYR5rBAKhZjKF0zN82+r8J130dcmI9hvhH58lXFQp3KWdFCNmpafjEC
	tE7Ge6Bif0i/wi5MSmp3UJSYuBQRDpeA0QcKKKM0t3dEuml20xGuybPe5MgTNK0ZryZGHAx2pdL/F
	TY3jVoqySl7A1220DpGWyyJVraEj25SxjYwklWJc74cGgPDazDTclu5LIR5G6hIiBw/eJk2G89ciC
	gDfypJlTYhqxt+qLEMhG5W0qrTcELuuYUcSri6JDvc+7Y5tMiqAzw39t/Z2Ft/9T1pO2ajCuzwPP8
	ATl+TOmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxsN3-0000000EmiV-3I1f;
	Sat, 22 Aug 2026 20:31:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxsN2-0000000EmiO-0YIO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 20:31:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28BE960008;
	Sat, 22 Aug 2026 20:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1A371F00A3A;
	Sat, 22 Aug 2026 20:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787430674;
	bh=U2WhrpQyzjfizAD7WjiNO5bi7n4CM21BaILhRpMuMmA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=IbYsD1B28Snl7Pxro13woCr2Do96Ncq0OUQywwKJzr1KILoT/m8w97s7skvNKOjfO
	 26YIopy3u/XpRFBIrSm75kUkMR0/A6UXITmr9WyGMckXKSc9Gnf1mrGoIFSeiEdvVA
	 RMs3vBsnGncnSL8pWlDq8i9xGjokh3JI3MecdcbaD97DVgrtjVap1DKWZRz7Zwg2GZ
	 CiCqFVg85/03tY03e6/kowwkV7SvcyLbvjdHg/pGc5xC2ZniVkoG82hTiY8aBXlh/o
	 hLay/oQNQhdQzp/dhXB9rerFUpZgpWQijxLvknvzjK90ws1vfJ9Kt7+d+oum6yq+J8
	 zAIRZDnhJpdIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AB5380CEF9;
	Sat, 22 Aug 2026 20:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/2] net: sparx5: misc fixes for sparx5 and lan969x
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <178743062338.1819488.10941044627288151617.git-patchwork-notify@kernel.org>
Date: Sat, 22 Aug 2026 20:30:23 +0000
References: <20260817-misc-fixes-sparx5-lan969x-v3-0-c7c7fef723a8@microchip.com>
In-Reply-To: <20260817-misc-fixes-sparx5-lan969x-v3-0-c7c7fef723a8@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, Steen.Hegelund@microchip.com,
 UNGLinuxDriver@microchip.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, bjarni.jonasson@microchip.com,
 lars.povlsen@microchip.com, p.zabel@pengutronix.de, kees@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, steen.hegelund@microchip.com,
 linux-rt-devel@lists.linux.dev
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

On Mon, 17 Aug 2026 17:41:57 +0200 you wrote:
> This series fixes various issues in the sparx5 driver, which also
> serves lan969x.
> 
> Details are in the individual commit descriptions.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
> 
> [...]

Here is the summary with links:
  - [net,v3,1/2] net: microchip: vcap: use port number instead of netdev name for debugfs
    https://git.kernel.org/netdev/net/c/b7adcc56fd3d
  - [net,v3,2/2] net: sparx5: fix sleep in atomic context in MAC table access
    https://git.kernel.org/netdev/net/c/b62793a7baee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



