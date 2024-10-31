Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4508AE68942
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 01:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HW+xSPQzF0wMBa9NbLflXeeMSm7IjQ0T0dGTALb5Nwg=; b=WgiL05j2locZ3KZM6tmk+SuPsN
	15zfxjhvOcdNb+hBRXtHyR2juZWy1Qu401ef8xQzxfJFBTuTG46wyOsXrjJGVXdSUQ+gnqDQWuvaq
	+DP7xAL0Il791fRH3UzqSXwCWke9vWaD+ESCU3IAjo/6d5tAOrkuRhw/WQCMRd+eZdX7WR+CE0xTi
	M99pofEmrDtdX9uA9P5kyxkfeKA3ur286SQHciGy3db+LMvpgigHjMqfjK53fqsPU3L+TwoMdRRMF
	Uno+JGR/fEdphGCHErHGPbUZH4/H06sooP70SArNfSFrVhMWq/hEBKiJmlenLnxXZL1DG98vUNO3z
	eJj/uGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6K4X-00000002Fx9-3nA4;
	Thu, 31 Oct 2024 01:34:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6K1N-00000002FP2-2SGF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 01:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D134AA43D01;
	Thu, 31 Oct 2024 01:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B39CC4CECE;
	Thu, 31 Oct 2024 01:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730338244;
	bh=3AkpnkAU3IsEbaxp6htaiE1AJG2SN4xBnZhnxjmpP9Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bNU2CaehVVEg+dPDVPghUoByiNpjPgY4MVhFlXIPtruAemCLLKzf9UeVDekXytMa0
	 SEJFYU7X/WCWN31WskhkRPGkFu2fHbGjIxjiFLVYW+mniu/iOoQR5qeBWodXiki9y5
	 iqM4XZ/Mnlo8otKGMjLi41ToXGlrfymo+H5eaDrwH0sRWpEM21SdUTPRrkkBM6ygzY
	 r5uF0wiPv/wGfN7d6iDny5sQdF8F7/mi5j92vfVU95VeUeiYNSIVzsGCfPOb1WWZp6
	 qmjDMM/2569KPibfsxzqs/33NUcyFboeJmDpgR3TRF/xDac3txPlqNAxfTlHwEzH6D
	 yuKxRGnUNKK8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34180380AC22;
	Thu, 31 Oct 2024 01:30:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 00/15] net: sparx5: add support for lan969x
 switch device
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <173033825198.1516656.6226177365029071964.git-patchwork-notify@kernel.org>
Date: Thu, 31 Oct 2024 01:30:51 +0000
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, lars.povlsen@microchip.com,
 Steen.Hegelund@microchip.com, horatiu.vultur@microchip.com,
 jensemil.schulzostergaard@microchip.com, Parthiban.Veerasooran@microchip.com,
 Raju.Lakkaraju@microchip.com, UNGLinuxDriver@microchip.com,
 richardcochran@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jacob.e.keller@intel.com, ast@fiberby.net,
 maxime.chevallier@bootlin.com, horms@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 steen.hegelund@microchip.com, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_183045_787501_8AAE8B1C 
X-CRM114-Status: GOOD (  11.12  )
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

On Thu, 24 Oct 2024 00:01:19 +0200 you wrote:
> == Description:
> 
> This series is the second of a multi-part series, that prepares and adds
> support for the new lan969x switch driver.
> 
> The upstreaming efforts is split into multiple series (might change a
> bit as we go along):
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/15] net: sparx5: add support for lan969x targets and core clock
    https://git.kernel.org/netdev/net-next/c/1ebaa5e18915
  - [net-next,v2,02/15] net: sparx5: change spx5_wr to spx5_rmw in cal update()
    https://git.kernel.org/netdev/net-next/c/9324881cef51
  - [net-next,v2,03/15] net: sparx5: change frequency calculation for SDLB's
    https://git.kernel.org/netdev/net-next/c/728267dc46d3
  - [net-next,v2,04/15] net: sparx5: add sparx5 context pointer to a few functions
    https://git.kernel.org/netdev/net-next/c/ead854c46359
  - [net-next,v2,05/15] net: sparx5: add registers required by lan969x
    https://git.kernel.org/netdev/net-next/c/199498490cac
  - [net-next,v2,06/15] net: lan969x: add match data for lan969x
    https://git.kernel.org/netdev/net-next/c/7280f01e79cc
  - [net-next,v2,07/15] net: lan969x: add register diffs to match data
    https://git.kernel.org/netdev/net-next/c/69b614251784
  - [net-next,v2,08/15] net: lan969x: add constants to match data
    https://git.kernel.org/netdev/net-next/c/c1edd1b23e90
  - [net-next,v2,09/15] net: lan969x: add lan969x ops to match data
    https://git.kernel.org/netdev/net-next/c/d8ab8c637049
  - [net-next,v2,10/15] net: lan969x: add PTP handler function
    https://git.kernel.org/netdev/net-next/c/24fe83541755
  - [net-next,v2,11/15] net: lan969x: add function for calculating the DSM calendar
    https://git.kernel.org/netdev/net-next/c/5d2ba3941016
  - [net-next,v2,12/15] net: sparx5: use is_sparx5() macro throughout
    https://git.kernel.org/netdev/net-next/c/b074c5e6c542
  - [net-next,v2,13/15] dt-bindings: net: add compatible strings for lan969x targets
    https://git.kernel.org/netdev/net-next/c/41c6439fdc2b
  - [net-next,v2,14/15] net: sparx5: add compatible string for lan969x
    https://git.kernel.org/netdev/net-next/c/98a01119608d
  - [net-next,v2,15/15] net: sparx5: add feature support
    https://git.kernel.org/netdev/net-next/c/207966787b71

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



