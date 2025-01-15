Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C706C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 21:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Date:Message-Id:From:Subject:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkLcnhql8a96A60BHSfkKs2E6DaIk53/sc0MbOHAsjI=; b=0zu6buugucqG2JX0pZbRnOkyzp
	O3qKwTW2C7ICwNWjGfkLiyLmVbXJHXwmuMDHK4jt/gBAFioRHPy08ODt3DUSct8I+y9LhC0CVlfe6
	uaCzKbiIN7Ch5BQTabDTMqrRcSo8Ohk57iBoxEADonbsviAj9C12XHBLKOMLQYY5+jJUXYJ6aEhlb
	uGdgVqQlmYJ990NDa/3chvQReyjepfJN8LL6f52oshFac9fyk2086vtuJ7wwQuVmVxu4GpnkfLNdJ
	8/lHWkFfDL+6b326paFSljvTyHjV5+Ti4NEsVjpktr3o2fcSujieKAkZQhkuPCCF3RP7r6uarq3w1
	0JjuArnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAzM-0000000DAOw-24VG;
	Wed, 15 Jan 2025 21:31:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYAy3-0000000DA9F-0UgK;
	Wed, 15 Jan 2025 21:30:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 601BA5C5DDD;
	Wed, 15 Jan 2025 21:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D10C4CED1;
	Wed, 15 Jan 2025 21:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736976625;
	bh=LE8fA2hAMhhDI5KwgEq05/0LGmnaeWzG7l9oulZaTgk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=P8yxRWF12yA+CipCEyGIzKRv4g5Vac+F7zE50cg22snFi5j0Jzw+R0LlAaq7GM8xs
	 0hu70OOCza20MDg9Of2KKGaLlUIACrqeaG3dSmH8T2fUWUgdGI2Iy6pw44BjTcpQbC
	 7ake8LkLQaVusqCkJ9FjYGLYm+II0P9kFKI8qIk0FDtqcTEB1JByFtJvyhl2RM3aJS
	 Y4auUQTxemzxvGUjmo1AvO7xaIlxNxhcfWTgyNML3LK3Y/DPZJF0XSyw8Wg9bHPKwC
	 qTSmNipXmZ7rIe0Lr1a6A1zv13pgAW+vwBoqI0MFRmJbcS9kG4N7KFtV7Un/8Bi+MU
	 q9j2EyvkM0Mmg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEB7380AA5F;
	Wed, 15 Jan 2025 21:30:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/5] net: phylink: fix PCS without autoneg
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173697664846.885620.3750328889492102157.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 21:30:48 +0000
References: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
In-Reply-To: <Z4TbR93B-X8A8iHe@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_133027_203863_1E6E434B 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: taras.chornyi@plvision.eu, andrew@lunn.ch, marcin.s.wojtas@gmail.com, madalin.bucur@nxp.com, alexanderduyck@fb.com, daniel@makrotopia.org, edumazet@google.com, ioana.ciornei@nxp.com, horatiu.vultur@microchip.com, radhey.shyam.pandey@amd.com, florian.fainelli@broadcom.com, sean.anderson@seco.com, Steen.Hegelund@microchip.com, lars.povlsen@microchip.com, kuba@kernel.org, pabeni@redhat.com, Jose.Abreu@synopsys.com, sean.wang@mediatek.com, daniel.machon@microchip.com, kernel-team@meta.com, dqfext@gmail.com, lynxis@fe80.eu, matthias.bgg@gmail.com, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com, netdev@vger.kernel.org, claudiu.beznea@tuxon.dev, UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, ericwouds@gmail.com, linux-mediatek@lists.infradead.org, olteanv@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 13 Jan 2025 09:22:15 +0000 you wrote:
> Hi,
> 
> Eric Woudstra reported that a PCS attached using 2500base-X does not
> see link when phylink is using in-band mode, but autoneg is disabled,
> despite there being a valid 2500base-X signal being received. We have
> these settings:
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/5] net: phylink: use pcs_neg_mode in phylink_mac_pcs_get_state()
    https://git.kernel.org/netdev/net-next/c/0f1396d24658
  - [net-next,v2,2/5] net: phylink: pass neg_mode into .pcs_get_state() method
    https://git.kernel.org/netdev/net-next/c/c6739623c91b
  - [net-next,v2,3/5] net: phylink: pass neg_mode into c22 state decoder
    https://git.kernel.org/netdev/net-next/c/7e3cb4e874ab
  - [net-next,v2,4/5] net: phylink: use neg_mode in phylink_mii_c22_pcs_decode_state()
    https://git.kernel.org/netdev/net-next/c/60a331fff5e8
  - [net-next,v2,5/5] net: phylink: provide fixed state for 1000base-X and 2500base-X
    https://git.kernel.org/netdev/net-next/c/e432ffc14b17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



