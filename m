Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08FEE88D72
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 23:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHHB0bGz103vlY5l17YoTHQCwUaDOgH8XvEazWn9foU=; b=QiKYhjyJ72X70TCceIUvglaUwG
	emZ6CW+vzeGexlNdsEeV/FpBSI2pmpRLd0ChHzwWq04qQp/O+5S57pjVuTtP75zZu/leW1BRU6Ilo
	h9Q8NcrKGlAj5MZ4tIdnZFYz7xxPPfNvqi5VdiSP+3l1VMOgXteMkiupBOc2ko3ath9P0pgKTJZUQ
	++RU3epp/hiVDs65Irdj+L7JsA94Vlo0WgkQqF+j4sZihrY6EW28HTB+Xc1QClyp6R1o2NACDUqM4
	EgI88oedYnn/le/wd5cuEma0HwN6l2YpioxZzG78xaT0WbYTzJPqFkA5EfpB8e6U6SuiOLuVO5Xqp
	KCN+FvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8nfO-00000002iEp-2e0a;
	Fri, 03 Apr 2026 23:11:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8nfN-00000002iER-1ggD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 23:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 314AA60133;
	Fri,  3 Apr 2026 23:11:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C08C2BCB4;
	Fri,  3 Apr 2026 23:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775257864;
	bh=2A0r+UE5+pZzmP0NV8rxJD+zsPZ9QB1jSvMXTLu2Ruk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FyU06L9mYRKB/h2h7IPur11i1Wsp8wXpo+vZmEoNVth2G+LY1gWL/1qE94g72ZI0p
	 Ig3AqnmLV7DYLUmE6O1ZHNLrFfv8jVaegiFaNLxpo9lWRryCV6J2YKeXk4MfrIB/Jv
	 3DYyddrTk9/vn0yH8rYIrlFtxCmIfOgeiVTDXRtkoCFNuCsYH9PtLamSEAaUP/EoIa
	 de2SseFZnafpvd76tFhRWls8kYia35FWrKWlSaMFiOfu/iMsrDUSCe076ddbwmkvXY
	 uURK963UR8ucsigR4FK3bJPnkQdE4zeA8kVsAYkhq/05Mlj/al20ScKB2Hbz9D/M/9
	 LKtmMX+SMQrKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9D923809A14;
	Fri,  3 Apr 2026 23:10:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: set clk_csr
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177525784528.1484550.15000658564250210925.git-patchwork-notify@kernel.org>
Date: Fri, 03 Apr 2026 23:10:45 +0000
References: <E1w8JKr-0000000EdLC-41Bt@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1w8JKr-0000000EdLC-41Bt@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 netdev@vger.kernel.org, pabeni@redhat.com
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

On Thu, 02 Apr 2026 15:47:53 +0100 you wrote:
> The clocks for qcom-ethqos return a rate of zero as firmware manages
> their rate. According to hardware documentation, the clock which is
> fed to the slave AHB interface can range between 50 to 100MHz for
> non-RGMII and 30 to 75MHz for boards with a RGMII interfaces.
> 
> Currently, stmmac uses an undefined divisor value. Instead, use
> STMMAC_CSR_60_100M which will mean we meet IEEE 802.3 specification
> since this will generate:
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: set clk_csr
    https://git.kernel.org/netdev/net-next/c/789ec16eb397

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



