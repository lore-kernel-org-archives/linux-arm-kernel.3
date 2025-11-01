Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A86CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 00:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fDbN12Spq3pDZBNMEldXifq+gD7KTFshSgqVoxr2lk=; b=I6vIKNXYE9K1VLY+L6Mum1Aj+f
	AVa82mih87QlG+LeRIxBCh8Ue8YXM9TSJefHjAFL1B/rKEUYqAEWcTgWKTkFEyvn/GCKy+O37kQRN
	J5HKieiPclxXUo0k7dpLgMpOqYQ9RI0OepVQrE8qM8y95vm4Sjg23GKEQavLMIg8l6q1vDjmT8xsi
	WKmfRGUOLOM+ic369AbUyXMSiLVYE/ELZ+V9WKTy28u7PAlYrAOeZQVlqvhP3zCQdKZiXDMUHSTXU
	dkKhx8L5Wfz/2Kiq9b8A5ufo/Nt/5wELHNKw9FwlaD8XcyUusJaSE93j0foqDTAWLZwc2piVh/70X
	B2RLlbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEz2p-00000006vL9-3Q2f;
	Sat, 01 Nov 2025 00:00:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEz2m-00000006vKP-3o75
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 00:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0E4143D9D;
	Sat,  1 Nov 2025 00:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794E6C4CEE7;
	Sat,  1 Nov 2025 00:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761955230;
	bh=yk3VPIdVlbmUTYp0UAYa5Xrpps2+T2/IAQpUgIigqeA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=DlPuYkCbIncnNePeguGMl9kzj+u6izK/5C0oaLQGiBK3DL2/xB0bwRL/KxOd334xB
	 J2UoCVHBO26eF4h/Jf2MZWvGCjFYXJSM+GUow2OQSZIE/GDRgeCsA8f5/6btYStaWg
	 eb93Mb0E+6IwAd1GhU2QUVLcutfsjkcz8sWmFJtsgyyUdbz5qQCiSqLus9gyt+6y5M
	 DhsZIU0UiChHvN4+O9Zgrj7bPXbupDgBQV1MK1GXBzsRKthyxYE/rd3akpy5p1bWCq
	 RBP5ckng562+aGygmINndgCrKwXS6xHRkKCYCakn7MeuROJiekrAHdoXX85q4SRrIt
	 WKUx6mk4iYIhA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0153809A00;
	Sat,  1 Nov 2025 00:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176195520650.673072.17303889570192464247.git-patchwork-notify@kernel.org>
Date: Sat, 01 Nov 2025 00:00:06 +0000
References: <E1vEPlg-0000000CFHY-282A@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vEPlg-0000000CFHY-282A@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_170032_971118_1C14947F 
X-CRM114-Status: UNSURE (   9.48  )
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 30 Oct 2025 10:20:32 +0000 you wrote:
> When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
> modifies the MAC control register in its ethqos_configure_sgmii()
> function, which is only called from one path:
> 
> stmmac_mac_link_up()
> +- reads MAC_CTRL_REG
> +- masks out priv->hw->link.speed_mask
> +- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
> +- ethqos_fix_mac_speed()
> |  +- qcom_ethqos_set_sgmii_loopback(false)
> |  +- ethqos_update_link_clk(speed)
> |  `- ethqos_configure(speed)
> |     `- ethqos_configure_sgmii(speed)
> |        +- reads MAC_CTRL_REG,
> |        +- configures PS/FES bits according to speed
> |        `- writes MAC_CTRL_REG as the last operation
> +- sets duplex bit(s)
> +- stmmac_mac_flow_ctrl()
> +- writes MAC_CTRL_REG if changed from original read
> ...
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification
    https://git.kernel.org/netdev/net-next/c/9b443e58a896

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



