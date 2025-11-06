Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DF5CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 02:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qv1OT09aYRomIA4YqdCUeZn3/r8xW53dsgMrWL/Rkyo=; b=njljaUpgLtUUFBAFrUwWex8nTX
	ICsF7eudMRrKusvGtbf9ga3IxQc83Dk+3yewAm0gbXogiLIPtmFbOhAxyOd6Sq3wNwDDBqP1FobDF
	JdWCw0JAVKkJMWJRQCBZp7c+2Zi6iiTCbHtNiEL/Zv1zy/5hmOm/oun/WLoC7h8OWd6lLB6LhXhHk
	7Qi2BSLmspIvY1GyW8Xa2ZJqjppZtrunhmaVQdMuGp3akOVzi3MMh7Rx7rJFXsjfNCf8j2v0Xk4PW
	NnT5x8PG6Vg7M+lLstCyY9H6a4HX23jtInMDpnT6qgX8P32vOT68Av1P1Cpp71O3DBw/+HOIPYNN0
	TsPtE2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpvV-0000000EmCy-2A5E;
	Thu, 06 Nov 2025 02:40:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGpvT-0000000EmCY-0fgd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 02:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2701B44946;
	Thu,  6 Nov 2025 02:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 037F8C4CEF8;
	Thu,  6 Nov 2025 02:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762396838;
	bh=GxAFBY0FuzXylt3WKOzyYIHU0Sz+s/MVF/ONHT3Sg0o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UHNircHWcHy3PSqdTQHRBGrQqufuaIO7vo9bAJHYDavrkSDS6yd5KUQWNWgxTGwug
	 ce5X2nKkdAstgwgC8PrTSBfOWA0OsfZHrPD7Q8EcVs/0HDhe3qJicv7h0LKF9mbYPd
	 trKNLNtgaGMIeMRM+DpX8KdBIeM7TliSUDBCXFZID8JSYEaLXrei5t9PJHlZh1QfGe
	 0BBOBaMPALeSeAR0D+oBJ70s27Yly4HDNijFHkFnT0d7oNT53Ec6a7aaDcNIWUZocr
	 DS5yLFR9608fokkKIj6gCWZX2ETBeX8BJ7IrN+Kyd0TJtqin22QDAOzFz8xsPWv8/4
	 Tg5FQ/wedVDlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CFC380AAF9;
	Thu,  6 Nov 2025 02:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/4] net: stmmac: socfpga: Add Agilex5
 platform
 support and enhancements
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176239681110.3843222.1196366168534081089.git-patchwork-notify@kernel.org>
Date: Thu, 06 Nov 2025 02:40:11 +0000
References: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
In-Reply-To: <20251101-agilex5_ext-v2-0-a6b51b4dca4d@altera.com>
To: Rohan G Thomas <rohan.g.thomas@altera.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, s.trumtrar@pengutronix.de, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_184039_217619_202B1F34 
X-CRM114-Status: GOOD (  12.16  )
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

On Sat, 01 Nov 2025 01:27:06 +0800 you wrote:
> This patch series adds support for the Agilex5 EMAC platform to the
> dwmac-socfpga driver.
> 
> The series includes:
>    - Platform configuration for Agilex5 EMAC
>    - Enabling Time-Based Scheduling (TBS) for Tx queues 6 and 7
>    - Enabling TCP Segmentation Offload(TSO)
>    - Adding hardware-supported cross timestamping using the SMTG IP,
>      allowing precise synchronization between MAC and system time via
>      PTP_SYS_OFFSET_PRECISE.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: stmmac: socfpga: Agilex5 EMAC platform configuration
    https://git.kernel.org/netdev/net-next/c/93d46ea3e984
  - [net-next,v2,2/4] net: stmmac: socfpga: Enable TBS support for Agilex5
    https://git.kernel.org/netdev/net-next/c/4c00476d4480
  - [net-next,v2,3/4] net: stmmac: socfpga: Enable TSO for Agilex5 platform
    https://git.kernel.org/netdev/net-next/c/e28988aef70f
  - [net-next,v2,4/4] net: stmmac: socfpga: Add hardware supported cross-timestamp
    https://git.kernel.org/netdev/net-next/c/fd8c4f645496

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



