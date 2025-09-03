Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D8FCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjPWkG6VhLgurMupCxK4xsP3gY6vCYInpGj4WkldfQo=; b=dumnJSkVqO+5K/Rs2/dbFyuXDh
	/XvKP7QvTw/PEIgq+CdCW46Agb2PsVl7FWt4QJByG7kYNKZOstc34vZUaA4e7Hl0AiWXW23CEpUCR
	W07VXvN8WinjC7mHMa3fsZxaJn8zpCLGYrnQjZeTrUJQg1iR0AloY1oPvffU4JlLW0Mr2hlxqYWyl
	qgAJ1ToNDV2WSKQlV0LhpKHyS85j/LhyhX/LtTf2DqSWtHuZTpHW9CK0RM5LoWD8N5bu9m55FgUeX
	7Jm/4Vx9QiU3xgpHKyyMw/5WQfNhR7XlcSKIvJV+Sn+O0OU0JfDcTkyPJlrPO4WUbhcDt10lXQLyk
	Ie3hz9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzRo-00000008Gq4-1eMT;
	Thu, 04 Sep 2025 02:11:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utx5I-00000007vMk-49rZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 23:40:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56D9E44C45;
	Wed,  3 Sep 2025 23:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3076BC4CEE7;
	Wed,  3 Sep 2025 23:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756942812;
	bh=2fsTRI0s62XGwnP//OHTQCGU7+WD7rrA5jzNeU4M6lY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=j/GrbPfJgOGjoVeEFEULkY/WrpJF/tT/fFsBDaxhblrMhUkNfDN3pjV/lZbS7go07
	 vTr8xvzguB/Og4SwcemyOQyD0ayGLWI2hva68w7MnDD71Cg/pjKWmJYwpg4yjNeQDa
	 NSrUHpGWLXSUOaLTdvc071RWkpm6ZeJwUsViJ/76gQ77IjstDPzUpNRQIOnDU0J55E
	 pmDD0/0PR7hZ1lsHctmgUU05jJ8V2QHEG/Fv4Rb7t15P541j8LzdnLKvdQAuln5DAl
	 FfNNrtXIPnqfx2MBLQLp1mDPPj9qFUcJPsZchL55js3pAA407/l2Raz9bMs+AyT9zs
	 zN0TsAj8CTzTw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E51383C259;
	Wed,  3 Sep 2025 23:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v10 0/6] Add i.MX91 platform support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
Date: Wed, 03 Sep 2025 23:40:17 +0000
References: <20250901103632.3409896-1-joy.zou@nxp.com>
In-Reply-To: <20250901103632.3409896-1-joy.zou@nxp.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, richardcochran@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 frieder.schrempf@kontron.de, primoz.fiser@norik.com, othacehe@gnu.org,
 Markus.Niebel@ew.tq-group.com, alexander.stein@ew.tq-group.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Frank.Li@nxp.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_164013_049945_D7483371 
X-CRM114-Status: GOOD (  12.20  )
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

On Mon,  1 Sep 2025 18:36:26 +0800 you wrote:
> The design of i.MX91 platform is very similar to i.MX93.
> Extracts the common parts in order to reuse code.
> 
> The mainly difference between i.MX91 and i.MX93 is as follows:
> - i.MX91 removed some clocks and modified the names of some clocks.
> - i.MX91 only has one A core.
> - i.MX91 has different pinmux.
> 
> [...]

Here is the summary with links:
  - [v10,1/6] arm64: dts: freescale: move aliases from imx93.dtsi to board dts
    (no matching commit)
  - [v10,2/6] arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi and modify them
    (no matching commit)
  - [v10,3/6] arm64: dts: imx91: add i.MX91 dtsi support
    (no matching commit)
  - [v10,4/6] arm64: dts: freescale: add i.MX91 11x11 EVK basic support
    (no matching commit)
  - [v10,5/6] arm64: dts: imx93-11x11-evk: remove fec property eee-broken-1000t
    (no matching commit)
  - [v10,6/6] net: stmmac: imx: add i.MX91 support
    https://git.kernel.org/netdev/net-next/c/59aec9138f30

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



