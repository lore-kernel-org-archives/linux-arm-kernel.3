Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A356CEA7951
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 02:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pa28/wnhEsoYG9d18FEma6nR+QTv7+m8l24hRkiCMs4=; b=3gmkrU8EKt+sTYLi5J27+Sv1Wy
	bS0vliq48QiPhPGVwKqmAj3sZ1d46IceDf7vRc54/wMqXDC/T9aIno3h8YmV7+jw+jqVhp3GezWtN
	ffL5kNixiS/mfrdHT/ACzP+DiJuglhzZS+vqrFN+OwHpS2tPaIJe6CpWoI3DTskdMT5NR/UTx+Gpz
	dVzEMu8w4VHCrQAwYlLZUUKkyx6u6xRDFgsUYwuz/oyUw567p9dO637WkuGcb4z0uM3dYVNDZ1Uq9
	M71VuxJStssiSF4kbR/+rmE+HK8eJBOLD81rUvF4PeyGlIaWZb28QTzSI7Xx6JTICRmEQQHXUapBp
	fR2wZCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnp8G-00000009K7H-2Ybe;
	Thu, 05 Feb 2026 02:30:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnp8F-00000009K75-1OI7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 02:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AD20600AD;
	Thu,  5 Feb 2026 02:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07902C4CEF7;
	Thu,  5 Feb 2026 02:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770258610;
	bh=1wc5PdUchyOEUz6O/c6N92zSn0zymMQmvEmSPDBdI3Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lSJZ1K8pWyoZfCz15uTLU2VKgg/HklYNXvSckVy89SHs4Ke0gd/rqOnMWLH6e4uEU
	 M+yyKOGwy4C+KVeYO3/gb8iIusHcsmpGf6KJVqCTwGilMtJXzs25w6v3vIzCnWhSMb
	 K8ks0kcuSEO06vUoNHxbeSKuCsVl9bqYwLbVjJXjQ18zlaxLBYYDXP4LweAhmvo6q2
	 /omtSTMAsW2MvKvE8egqpYrUQoopmHK6ruX2zn9PFWXaIrDGh/NWivab2WmntryQeD
	 DMJ46ue5kztpaMwCcMskTfbvi9IFNt7knjYvbutm3eCgB86/L6CcyfAqRjFbzo1yVg
	 Zbxe81BUO/Ing==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4838E3808200;
	Thu,  5 Feb 2026 02:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/3] s32g: Use a syscon for GPR
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <177025860808.131667.13084016124799705995.git-patchwork-notify@kernel.org>
Date: Thu, 05 Feb 2026 02:30:08 +0000
References: <cover.1769764941.git.dan.carpenter@linaro.org>
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: chester62515@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, conor+dt@kernel.org, davem@davemloft.net,
 devicetree@vger.kernel.org, edumazet@google.com, festevam@gmail.com,
 Frank.Li@nxp.com, ghennadi.procopciuc@oss.nxp.com, imx@lists.linux.dev,
 kuba@kernel.org, jan.petrous@oss.nxp.com, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mbrugger@suse.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, s32@nxp.com,
 pabeni@redhat.com, kernel@pengutronix.de, robh@kernel.org,
 s.hauer@pengutronix.de, linaro-s32@linaro.org
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

On Fri, 30 Jan 2026 16:19:35 +0300 you wrote:
> The s32g devices have a GPR register region which holds a number of
> miscellaneous registers.  Currently only the stmmac/dwmac-s32.c uses
> anything from there and we just add a line to the device tree to
> access that GMAC_0_CTRL_STS register:
> 
>                         reg = <0x4033c000 0x2000>, /* gmac IP */
>                               <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> 
> [...]

Here is the summary with links:
  - [v6,1/3] net: stmmac: s32: use a syscon for S32_PHY_INTF_SEL_RGMII
    https://git.kernel.org/netdev/net-next/c/b0eeeb1b70c0
  - [v6,2/3] dt-bindings: net: nxp,s32-dwmac: Use the GPR syscon
    https://git.kernel.org/netdev/net-next/c/0d9588039543
  - [v6,3/3] dts: s32g: Add GPR syscon region
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



