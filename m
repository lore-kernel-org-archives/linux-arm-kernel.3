Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843F2CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 01:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIKpROeOIm42imhRYGS4/jTz/8sfeP0qUqwt/tE0GYE=; b=dAfFQwNYsbA+pdcFVQumqNr/Bl
	C0LjNI71/8tjLPkTaG8NVwQkHAsc3OnkUlRWoEMX9QN2tGQWPz0BXzcl1R8jEgifdz9U16aDtJrmm
	dqEOIXPHgwUBV39ZveJcvkUSkeBOHCAKZIxDTZOjNsWOK62Qkth7EBGqxhW1GhBldoog4/goNHhTu
	qq+olkc+oY7D5J9Y33Y/BHIcoTxB5TMpsn2T+O6W+cv1w0R+s2AGV7+Yu4EkGYZ/DZ6yhoUszN+Q4
	ItFgcEBA3ii8/yrv9HM+qKJgl5kSbLCBZLzEDvYvYvdjjxv3VVBsC/x10l7b4npWnOd7SMepl3A8g
	eibABPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4sF-0000000DWW0-0l36;
	Wed, 27 Aug 2025 01:22:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur4pX-0000000DW4j-2uOW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 01:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFB4D419EB;
	Wed, 27 Aug 2025 01:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8285C4CEF4;
	Wed, 27 Aug 2025 01:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756257602;
	bh=p+ihllgmoY+nsmIVwqerK8uRJ7BnZjZqB4wY9eVZWy4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FEHm7nRf0liNFVqr6IVBtN+Llmi1Z4YAbD2qMwydFCjWh2geKyAneXXuk17OyxvJ1
	 Y9F9xSU0dGkd9F5z0plz08DKXmEIb++k1irI8ke+THqNR7W1RaztyC52sr4YAdtA9W
	 qDiBV8d1/cY/xO8eL6qDHpHVmd1I1iUE4W351RuAUWhQeq3yUrgjza7ntOSKTd6IZo
	 LEciZ8b7cmkoOK5wqKaHgFgXQAjsTJNKDEdiELdI3abqBkWwFeX/61lM++xTlA0R+/
	 fG9SadpAePOC9negjclit5RgltKkOvfZljDJrvFB4AOyJCY8HDtkSDzDw7VnhsXjeb
	 5pgK7pK2SKN1Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D89383BF70;
	Wed, 27 Aug 2025 01:20:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 0/3] net: stmmac: xgmac: Minor fixes
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175625761031.160020.12871390130445211831.git-patchwork-notify@kernel.org>
Date: Wed, 27 Aug 2025 01:20:10 +0000
References: <20250825-xgmac-minor-fixes-v3-0-c225fe4444c0@altera.com>
In-Reply-To: <20250825-xgmac-minor-fixes-v3-0-c225fe4444c0@altera.com>
To: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, Jose.Abreu@synopsys.com,
 romain.gantois@bootlin.com, fancer.lancer@gmail.com,
 boon.leong.ong@intel.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthew.gerlach@altera.com, andrew@lunn.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_182003_750549_96414AEC 
X-CRM114-Status: UNSURE (   9.05  )
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

This series was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 25 Aug 2025 12:36:51 +0800 you wrote:
> This patch series includes following minor fixes for stmmac
> dwxgmac driver:
> 
>     1. Disable Rx FIFO overflow interrupt for dwxgmac
>     2. Correct supported speed modes for dwxgmac
>     3. Check for coe-unsupported flag before setting CIC bit of
>        Tx Desc3 in the AF_XDP flow
> 
> [...]

Here is the summary with links:
  - [net,v3,1/3] net: stmmac: xgmac: Do not enable RX FIFO Overflow interrupts
    https://git.kernel.org/netdev/net/c/4f23382841e6
  - [net,v3,2/3] net: stmmac: xgmac: Correct supported speed modes
    https://git.kernel.org/netdev/net/c/42ef11b2bff5
  - [net,v3,3/3] net: stmmac: Set CIC bit only for TX queues with COE
    https://git.kernel.org/netdev/net/c/b1eded580ab2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



