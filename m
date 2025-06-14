Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B77C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 19:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTpiv1YdjxrDc0OigpxNwYQ3dijrPjUvNVxZo97MeZE=; b=qujlLnDWM+1mQ6i2Mp+OD14eil
	nmBZurCeJai30tn3Ca0yqzFXWkyZWBQhPbOh6QNAaukbjH7y6DwWlJKSZG3FQB63OUJLYtw57LtZM
	uXbJAXa/mL46Syke+NejFLB2VteSzeUVlIu9fz4OSduME4VXjKmzLB8EWtudgVTLp8hkF4WEw/2g2
	xgs7mI9J5IdBjSj2gSpZ5XjSxiw4l4IxUUJSri4m0prc/InbNByi06kL8EUGOVIKyzc7ZRxFJ3bP4
	qgMCGbrCtRvgg1u81/OUoQPzBnG0M0PPrPNYSH0QRdxlMmSCQ+sx04GJw1VnQ06F1xDA0tKnBK35A
	UILHw/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWjA-00000001kll-4AyE;
	Sat, 14 Jun 2025 19:39:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVdm-00000001fMH-1SAr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 18:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B169F4AACC;
	Sat, 14 Jun 2025 18:30:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900F9C4CEEF;
	Sat, 14 Jun 2025 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749925803;
	bh=gu0e+p4eb+oX+aP2FAx21feQ2rKQw2GjfLJjZ/kU1EU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KWPn6g7eBs5Sqxau7XJCPrrXmIF8AooWqPumMjRra17ckn7zIyG5quFnMcpm1wICS
	 UJwWT8bwGsnmYeyunX1jOTZmEsOKQZQmqZVM6tVNSsxtI4IfKMOoLBqtinqcOWpCP7
	 pB4RGWdOSIWX9GVnXVz/fxSZAdLdic3/+AVRK5qamgf8sbfEIZWSO2AdR0e7wzg3QL
	 zsrp8qNqY44DuY9fjKc2zOROuSt5N/fEMdES3E3f5VpVgYecmcdb5ze/fm/4/JXux9
	 QHLWumz43fXoCo+Qu0mGnSsxExik6Hl1B1t1oyYM+H44XTif4UBMiyFpucm4zogWs+
	 p63w9K9LFFqOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33FC9380AAD0;
	Sat, 14 Jun 2025 18:30:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Read firmware-names
 from
 device tree
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174992583274.1145273.14132783904581639503.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 18:30:32 +0000
References: <20250613064547.44394-1-danishanwar@ti.com>
In-Reply-To: <20250613064547.44394-1-danishanwar@ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, m-malladi@ti.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, srk@ti.com, vigneshr@ti.com, rogerq@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_113006_402473_F98922AF 
X-CRM114-Status: GOOD (  10.56  )
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

On Fri, 13 Jun 2025 12:15:47 +0530 you wrote:
> Refactor the way firmware names are handled for the ICSSG PRUETH driver.
> Instead of using hardcoded firmware name arrays for different modes (EMAC,
> SWITCH, HSR), the driver now reads the firmware names from the device tree
> property "firmware-name". Only the EMAC firmware names are specified in the
> device tree property. The firmware names for all other supported modes are
> generated dynamically based on the EMAC firmware names by replacing
> substrings (e.g., "eth" with "sw" or "hsr") as appropriate.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: ti: icssg-prueth: Read firmware-names from device tree
    https://git.kernel.org/netdev/net-next/c/ffe8a4909176

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



