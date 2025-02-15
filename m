Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2816C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 01:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0W+3YSjOVKr7mZCE2fE5mJKFoag0r9vF6QtnBhgtPNI=; b=KD03XssV4IY2m/uXVH+DwaCWDT
	Do2MQ/zkeixU6VOvRlT8uyPn7rZUEN+MNvVjvWQpL6ELaVG7HsRQcG/+rI2cUEcgOne7sTzqab/TQ
	W2dSfBE19AEmXghHlqhnMU4Anj8RyL5nsaZ/SxydQc6otp1DaDSu3VU0qMRS7/LPSsLZ2gNkL6U6J
	B5P5WUH3vP0ccA5WuAIH2Nu93FdC/iU4s+RNNXbHnSYOIFrDp0Dbrp86J5c0LkZedyv5nKNoiHUrV
	ffhBZV+1HmKdfS/oXT9vNVhUBenxqvkUV0ymaGzJ99/VMOUhpmnuPtaQVOAap2flJqKw05lPOoUfS
	KboinGjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6su-0000000Gkan-1HzF;
	Sat, 15 Feb 2025 01:22:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6qn-0000000GkCn-3jiS;
	Sat, 15 Feb 2025 01:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B99AFA44D27;
	Sat, 15 Feb 2025 01:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38A9C4CEE7;
	Sat, 15 Feb 2025 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739582408;
	bh=MTMnbHfP7UmJ4+8AVRrDwbtZaMSAaGd1tx0ryrdVYM4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gn57QJf422/GzkD0zjSqMIEpc4JDO1lQpobI8GAIgmrRFp5XifgxlxOwF67fd4n0D
	 pXSTdIQX3RwAZNc4l2uCkXKFrqa+YMo1qVrzC/CrJNDbuKNBPxurYtYcqT86GTjh7J
	 uOuA8QEpBWjMgUWcWYhk6efsdhHMGmUXehZvN/RHGzDca42LR679s6TooPGQB5+E9V
	 G9IDDsQ4Yj40ibLuJVktPoVuuG4d0FJM7ctkOBjOFkYBPXZr9o0nWEU+qftHecf2hw
	 xCIDVB4CiJlOyb+huCG/UvI9/8W5w5NaJNkRT2A31HPnyZ9buOBNNpZv9eKmYi4h/g
	 K9QHtqMFX8DAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E39380CEE8;
	Sat, 15 Feb 2025 01:20:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: remove phylink_pcs .neg_mode boolean
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173958243825.2159741.12525730465881025727.git-patchwork-notify@kernel.org>
Date: Sat, 15 Feb 2025 01:20:38 +0000
References: <E1tidPn-0040hd-2R@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tidPn-0040hd-2R@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_172009_991618_9DF9FE93 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: taras.chornyi@plvision.eu, andrew@lunn.ch, marcin.s.wojtas@gmail.com, madalin.bucur@nxp.com, alexanderduyck@fb.com, ioana.ciornei@nxp.com, edumazet@google.com, claudiu.beznea@tuxon.dev, horatiu.vultur@microchip.com, radhey.shyam.pandey@amd.com, florian.fainelli@broadcom.com, sean.anderson@seco.com, Steen.Hegelund@microchip.com, kuba@kernel.org, pabeni@redhat.com, clement.leger@bootlin.com, sean.wang@mediatek.com, daniel.machon@microchip.com, kernel-team@meta.com, dqfext@gmail.com, lynxis@fe80.eu, matthias.bgg@gmail.com, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com, netdev@vger.kernel.org, daniel@makrotopia.org, UNGLinuxDriver@microchip.com, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, olteanv@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 13 Feb 2025 17:54:19 +0000 you wrote:
> As all PCS are using the neg_mode parameter rather than the legacy
> an_mode, remove the ability to use the legacy an_mode. We remove the
> tests in the phylink code, unconditionally passing the PCS neg_mode
> parameter to PCS methods, and remove setting the flag from drivers.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: remove phylink_pcs .neg_mode boolean
    https://git.kernel.org/netdev/net-next/c/de38503b74e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



