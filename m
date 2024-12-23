Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343D2E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PecEcb1t+E2tYdW1ajNgdY/bK2KIdHS4cTRpqeZetEA=; b=ZoZiF0Pt9slQFb8v4jwYTxUKHc
	h4Y15ywzMA9go41II+7yj8Cih2d+dDNUt0I/xHV7VNIHaoxKMFYWyyVwQrbxg7Wbb8n0VmmCm5yY9
	h1rVVR8eJfmXT6pWVZ1/dLLCGi5hPvAxL+Jt8xRupx5QvE6M9yOTIgxqzPDc5LoTRjt5KDiTyZu2a
	wcnWvPIcpJ3LQw0+cwcx45FGX7dF3ip5Byf53QWIszWpgjaufPgowQIyxLKBfMmo6eHH+m9AfKcBe
	73oXoqxyy5qh8cKNm33ipQW5moXCMJkJjPlQE6wyIgYsNW03vznsm+ed6YsqOsvChRYeEpHSB9C4k
	CxsDRgNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnq5-0000000AbZe-2HCH;
	Mon, 23 Dec 2024 19:11:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnot-0000000AbRB-1ts8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 19:10:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00DEF5C5AD1;
	Mon, 23 Dec 2024 19:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77258C4CED3;
	Mon, 23 Dec 2024 19:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734981022;
	bh=22e0cf0mt6smWzc3GXJN29SgqDBF4lXxlE940Guk1RE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BhCQvYMBrcl8bYr7S+fA9BVNl7tbEQiAN7gc+BUDHhjiF+NXS2jbb2YMac5Z8tdJB
	 Kxj3+t1ofElWoskLWF/1w469IDGOj7iEegjXz+bCNEJKwT7Ex9qqg1N3XN38kzipG9
	 LLNhsHHO553x0kId5TJyBkSutjUmBVlxRe4WEfjMc9ehWc+fKA8+7oic6tfI2PrU5V
	 6+KCrisTIZQSoZzeg/8h7v3Z2UdwhaWgbMIp1EJ06kza2xWsWi6YdCrOTduCwGzwFv
	 55hiPCgM/Pa0TmuuyASh2llQ5Tyo/9e/IEVyWoAXU9zBperO94yI0qWd5IHnyNtbjt
	 JOfylLGYNRQ4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D7A3805DB2;
	Mon, 23 Dec 2024 19:10:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5 0/9] net: lan969x: add RGMII support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173498104074.3934211.3884630987619297533.git-patchwork-notify@kernel.org>
Date: Mon, 23 Dec 2024 19:10:40 +0000
References: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
In-Reply-To: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 lars.povlsen@microchip.com, Steen.Hegelund@microchip.com,
 horatiu.vultur@microchip.com, linux@armlinux.org.uk,
 jacob.e.keller@intel.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robert.marko@sartura.hr, rmk+kernel@armlinux.org.uk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_111023_533337_44BABE40 
X-CRM114-Status: UNSURE (   9.59  )
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

On Fri, 20 Dec 2024 14:48:39 +0100 you wrote:
> == Description:
> 
> This series is the fourth of a multi-part series, that prepares and adds
> support for the new lan969x switch driver.
> 
> The upstreaming efforts is split into multiple series (might change a
> bit as we go along):
> 
> [...]

Here is the summary with links:
  - [net-next,v5,1/9] net: sparx5: do some preparation work
    https://git.kernel.org/netdev/net-next/c/c71b59690aa1
  - [net-next,v5,2/9] net: sparx5: add function for RGMII port check
    https://git.kernel.org/netdev/net-next/c/dd2baee10840
  - [net-next,v5,3/9] net: sparx5: use is_port_rgmii() throughout
    https://git.kernel.org/netdev/net-next/c/05bda8a1bded
  - [net-next,v5,4/9] net: sparx5: skip low-speed configuration when port is RGMII
    https://git.kernel.org/netdev/net-next/c/d9450934f915
  - [net-next,v5,5/9] net: sparx5: only return PCS for modes that require it
    https://git.kernel.org/netdev/net-next/c/9b8d70ecfef7
  - [net-next,v5,6/9] net: sparx5: verify RGMII speeds
    https://git.kernel.org/netdev/net-next/c/95e467b85e69
  - [net-next,v5,7/9] net: lan969x: add RGMII registers
    https://git.kernel.org/netdev/net-next/c/fb6ac1829bb5
  - [net-next,v5,8/9] net: lan969x: add RGMII implementation
    https://git.kernel.org/netdev/net-next/c/010fe5dff164
  - [net-next,v5,9/9] dt-bindings: net: sparx5: document RGMII delays
    https://git.kernel.org/netdev/net-next/c/f0706c04721b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



