Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB11FED2C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 03:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3oBWEROh2PkFyqoROhd6xHLFfK43ow4rSTMXglL4YE=; b=YeMlPm+wm1IFc0AEeg9s81X1P4
	IgHP9vB/p0EMqbVE8XpW4JRyiV+q3XCN1SFm4HF5QPRysoGDNpKqTCHfz+AOxNLooXB0UR3+v9N/Q
	SDKcyZq8QxtQTrUg1D3ssGTwH1RBwgRBO/ISp5wsb90+N6QLdelDC7fkiybyJ7bjuCKoYk76QkogV
	lcHgLf61r8/fxzml3JuttGVv8IaQUnS/Wmh0k9vazeMwMWBTbWlA/zkkKTQ5EDAUVphUu+0GUo8ia
	T0Fuqp3QreCOs0EVOHWwkcgQb0I8a4zMXifoDZ1niJy6Ml0v7fYNiziscV/FSbzqqMGfuVPW2A3y+
	2JzGTFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0WrJ-0000000D9KF-140a;
	Thu, 12 Mar 2026 03:37:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0WrH-0000000D9Jb-0K4I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 03:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 63F63404DC;
	Thu, 12 Mar 2026 03:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B1EEC4CEF7;
	Thu, 12 Mar 2026 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773286630;
	bh=sJfbpv0cFhrG9HZt+fsACC7pn1MLtg8z11mYBSar9xA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IGbGB67mDMMpmHF3SDOFpmf4xmV/KbBqkj15/sPwkFU6+Y6Wto1mBwMUZfmyotisi
	 /Dt5PDTFZaWT5uY7EZ1/64o4LRAfDhmtyahZ+opdXN3Ys+g/X6vYnUP2Jn6LhKPPqv
	 XtssRw1xT31UjSTPLJF5L1Hl3h0Uud/SYmeNGiusUNtgquVoVaGq2K5Nhn90yHtuaI
	 84lC+XW1hSNT4lBa8e3r5Vm+GMT+Rh8m3IRItGYnl/QA/nthOaRTAzpMWpqZErd4P6
	 zEAS/1wYIxtS5puOktW6fz6FzOtOoJSp9ttNjmCCbru8Lx2Dp+c0Rp6RMuVmgczAF9
	 odhbJxVnfPxKA==
Date: Wed, 11 Mar 2026 20:37:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Cc: jan.petrous@oss.nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chester Lin
 <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, Ghennadi
 Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team
 <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
 boon.khai.ng@altera.com
Subject: Re: [PATCH v8 1/5] net: stmmac: Use helper macro for loop over
 queue-based arrays
Message-ID: <20260311203707.1d5ba94c@kernel.org>
In-Reply-To: <20260309-dwmac_multi_irq-v8-1-f0cc5bc811a7@oss.nxp.com>
References: <20260309-dwmac_multi_irq-v8-0-f0cc5bc811a7@oss.nxp.com>
	<20260309-dwmac_multi_irq-v8-1-f0cc5bc811a7@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_203711_144917_EB1DE021 
X-CRM114-Status: UNSURE (   6.21  )
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

On Mon, 09 Mar 2026 18:55:20 +0100 Jan Petrous via B4 Relay wrote:
> The stmmac driver contains similar pattern for processing queue-based
> arrays, ie. interrupt lines, etc. Factor out the for loop and provide
> a macro STMMAC_FOREACH_MTL_QUEUE(var, limit).

This is macro is neither shorter nor more readable.
I really don't see any benefit here..
-- 
pw-bot: cr

