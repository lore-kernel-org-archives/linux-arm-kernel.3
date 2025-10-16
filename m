Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14D3CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 23:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuLq+NlRRVIUcSYUnocl+2W8IFUY40gNlOjSM2ug/R4=; b=bfdf4ilt1bSdoLwEIlE9UIw0mL
	W+0PxezvdOgB0KAPFmdZjMdxAwlvEcAIos6WCjbIT9K1aj/WhZj28PJv2gpwbX+aXDwZJcyJ9zhvI
	Bb7s+3FmGsU09dhXuiN2RT8giY7pDKXZlA5l+bjxEyQV7KK7JDxsjI+jCK+erj2vwC2jOAiAar8Dz
	7eD72rIBt7P8lS+ZmvQg3y7dS4TOFVG46Wp1S2MPO2dH9bLUml09+9YIiusHJyuozFEQGYJzcYfkD
	Rl+3ybWA2Sc7kTJ28u2JzUREifcKaNsaB1VyE/grc7yV9QFF3wIPbovrNGBuyHbNiOjITWN6+yNCI
	1D7M4iPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9XGp-0000000681M-2biS;
	Thu, 16 Oct 2025 23:20:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9XGn-0000000680s-46OW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 23:20:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47EB76048C;
	Thu, 16 Oct 2025 23:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C2EC4CEF1;
	Thu, 16 Oct 2025 23:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760656829;
	bh=XmFZ1aCPOavivGFm2MY2rpuXNMGOSeXgUjkf7jQ4ZSY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NdX2/npyuApB04JWfGhacNAQxh7Odc9VcysylDLj6xMk8iShYkL+ZSQulPbmVQnBP
	 K5pg+2x4rOXIYLy6/MyMYeS6YblWpBHbRxa85mGx9Tk6J6BtgBwZEvq73JTA0pytjx
	 ArdCtEq5O8mdevH4P1QWpfnYtEyun22mdyT+Cb4iSUuo1rXgpb8dsxGPZS5jSmxjI3
	 JisiJn9jyFWATdHaf1lUoFioBvz9dCMI6MtKCCLWPD+H59kELGRRS+ljXrFV/Gdpm2
	 y3F5YA3qkcYciAK53CnN5e8x+tQREXUYNusfIxLgbYaK1Oiu7vSYJxbtxC+7PBPOPc
	 dVhsyg7mVesfg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D7739D0C31;
	Thu, 16 Oct 2025 23:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 0/2] Add driver support for Eswin eic7700 SoC ethernet
 controller
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <176065681299.1942659.16205838065637894819.git-patchwork-notify@kernel.org>
Date: Thu, 16 Oct 2025 23:20:12 +0000
References: <20251015113751.1114-1-weishangjuan@eswincomputing.com>
In-Reply-To: <20251015113751.1114-1-weishangjuan@eswincomputing.com>
To: =?utf-8?b?6Z+m5bCa5aifIDx3ZWlzaGFuZ2p1YW5AZXN3aW5jb21wdXRpbmcuY29tPg==?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, yong.liang.choong@linux.intel.com,
 vladimir.oltean@nxp.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 jan.petrous@oss.nxp.com, inochiama@gmail.com, jszhang@kernel.org,
 0x1207@gmail.com, boon.khai.ng@altera.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, ningyu@eswincomputing.com,
 linmin@eswincomputing.com, lizhi2@eswincomputing.com,
 pinkesh.vaghela@einfochips.com
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

On Wed, 15 Oct 2025 19:37:51 +0800 you wrote:
> From: Shangjuan Wei <weishangjuan@eswincomputing.com>
> 
> Updates:
> 
>   Changes in v8:
>   - Removed config option patch dependency from cover letter, because the patch
>     was applied.
>   - Modify the theme style of patch 2.
>   - Remove unnecessary dependencies, such as CRC32 and MII
>   - Add "Reviewed-by" tag of "Andrew Lunn" for Patch 2.
>   - Update eswin,eic7700-eth.yaml
>     - Add new line character at the end of file
>   - Update dwmac-eic7700.c
>     - Provide callbacks for plat_dat->init/exit and plat_dat->suspend/resume
>       to optimize clock processing
>     - Use devm_stmmac_pltfr_probe() instead of stmmac_dvr_probe() in probe
>     - Remove eic7700_dwmac_remove()
>   - Link to v7: https://lore.kernel.org/all/20250918085612.3176-1-weishangjuan@eswincomputing.com/
> 
> [...]

Here is the summary with links:
  - [v8,1/2] dt-bindings: ethernet: eswin: Document for EIC7700 SoC
    https://git.kernel.org/netdev/net-next/c/888bd0eca93c
  - [v8,2/2] net: stmmac: add Eswin EIC7700 glue driver
    https://git.kernel.org/netdev/net-next/c/ea77dbbdbc4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



