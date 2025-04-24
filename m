Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0521C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 01:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOxi7oS9LRq68sN9re4elCduK/AF3AZplRcgGzoQ7OI=; b=cRq4wOZYxTzpvyFFLPFA1YxF6A
	jhC0faNXfBuYjLtVaw6Jn06XaQdV8oNLstQgSdRJfVLhc+6vwY0C4BWwY1sLtuv34R1BOqUHNRmvz
	Saj98Z/iLcgD7uZu4Y/cTky27XGa1+fjKyD0BUSRN256n1stcwsWRMrqFLjHvVH9HsKi2OhE7RtJk
	+MyBgodynXkwFywbU0bwOypWCyak/G7L1D+Sb3w0VjJcc3skoM2N16GRp6rvbyIOpHqKOaoQcZ19W
	b9AUEtitOlVq+gKyxR6eO64S4PV78/Vv++0dxBAB958FMvLkM9AnmqEcN+9ntQFT2EnZqYJ7Hyy6s
	xkOrVgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7lmp-0000000CZfR-3wFn;
	Thu, 24 Apr 2025 01:53:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ljD-0000000CZEg-0Gos
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 01:50:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 087A64A313;
	Thu, 24 Apr 2025 01:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B52C4CEE2;
	Thu, 24 Apr 2025 01:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745459410;
	bh=r8x30VuoJOYhodsigVM6Ux1MiJ1evECurEW8hJ8Qqu0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B7aulUTmFiI7vI3fViJXFOPtN1evrtUsUOFHDvwYzrrB4kKepsqL6rIy15Q8WholK
	 4PMQsVL8Wy7qNWcwBHi/rcvt/vkU1D4cLCB895U4mtI4npXZKATUrIpg6hYMIlHP+t
	 JOFnqa3QFtUTHuVjJAxSbPwhlu3CjH4FIohYlUgJ19m+9kNq3zYJllAZm5RSUEu6Co
	 59LyORrmh6u2hkcXbbA5yetS4qfGQwMJpz8sDlKZKBYbpY9B5GA7mWCxYwS5lBqPO1
	 IBdcoLg8FshAqvlkC4Wa8lYLXVtF4d7tlfS9KrMlOEfzXLqTQKjQ4yPST4OWRMj1kA
	 aOng2+lPepk2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D53380CED9;
	Thu, 24 Apr 2025 01:50:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 00/14][pull request] igc: Add support for Frame
 Preemption
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174545944873.2829412.16224274758028926959.git-patchwork-notify@kernel.org>
Date: Thu, 24 Apr 2025 01:50:48 +0000
References: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
In-Reply-To: <20250418163822.3519810-1-anthony.l.nguyen@intel.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 edumazet@google.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org,
 faizal.abdul.rahim@linux.intel.com, vinicius.gomes@intel.com,
 vitaly.lifshits@intel.com, dima.ruinskiy@intel.com,
 przemyslaw.kitszel@intel.com, chwee.lin.choong@intel.com,
 yong.liang.choong@linux.intel.com, vladimir.oltean@nxp.com, horms@kernel.org,
 linux@armlinux.org.uk, xiaolei.wang@windriver.com,
 hayashi.kunihiko@socionext.com, ast@kernel.org, jesper.nilsson@axis.com,
 mcoquelin.stm32@gmail.com, rmk+kernel@armlinux.org.uk,
 fancer.lancer@gmail.com, kory.maincent@bootlin.com,
 linux-stm32@st-md-mailman.stormreply.com, hkelam@marvell.com,
 alexandre.torgue@foss.st.com, daniel@iogearbox.net,
 linux-arm-kernel@lists.infradead.org, hawk@kernel.org,
 quic_jsuraj@quicinc.com, gal@nvidia.com, john.fastabend@gmail.com,
 0x1207@gmail.com, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_185015_145078_EED2FD17 
X-CRM114-Status: GOOD (  10.34  )
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
by Tony Nguyen <anthony.l.nguyen@intel.com>:

On Fri, 18 Apr 2025 09:38:06 -0700 you wrote:
> Faizal Rahim says:
> 
> Introduce support for the FPE feature in the IGC driver.
> 
> The patches aligns with the upstream FPE API:
> https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.1156614-1-vladimir.oltean@nxp.com/
> https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.73054-1-vladimir.oltean@nxp.com/
> 
> [...]

Here is the summary with links:
  - [net-next,01/14] net: stmmac: move frag_size handling out of spin_lock
    https://git.kernel.org/netdev/net-next/c/b375984f0df0
  - [net-next,02/14] net: ethtool: mm: extract stmmac verification logic into common library
    https://git.kernel.org/netdev/net-next/c/9ff2aa4206ef
  - [net-next,03/14] net: ethtool: mm: reset verification status when link is down
    https://git.kernel.org/netdev/net-next/c/dda666343cc8
  - [net-next,04/14] igc: rename xdp_get_tx_ring() for non-xdp usage
    https://git.kernel.org/netdev/net-next/c/19d629079c0e
  - [net-next,05/14] igc: rename I225_RXPBSIZE_DEFAULT and I225_TXPBSIZE_DEFAULT
    https://git.kernel.org/netdev/net-next/c/67287d67bebd
  - [net-next,06/14] igc: use FIELD_PREP and GENMASK for existing TX packet buffer size
    https://git.kernel.org/netdev/net-next/c/425d8d9cb092
  - [net-next,07/14] igc: optimize TX packet buffer utilization for TSN mode
    https://git.kernel.org/netdev/net-next/c/0d58cdc902da
  - [net-next,08/14] igc: use FIELD_PREP and GENMASK for existing RX packet buffer size
    https://git.kernel.org/netdev/net-next/c/9cd87aafc7a8
  - [net-next,09/14] igc: set the RX packet buffer size for TSN mode
    https://git.kernel.org/netdev/net-next/c/7663370e32b3
  - [net-next,10/14] igc: add support for frame preemption verification
    https://git.kernel.org/netdev/net-next/c/5422570c0010
  - [net-next,11/14] igc: add support to set tx-min-frag-size
    https://git.kernel.org/netdev/net-next/c/55ececab9885
  - [net-next,12/14] igc: block setting preemptible traffic class in taprio
    https://git.kernel.org/netdev/net-next/c/e9074d7f3768
  - [net-next,13/14] igc: add support to get MAC Merge data via ethtool
    https://git.kernel.org/netdev/net-next/c/10e2ffe10e43
  - [net-next,14/14] igc: add support to get frame preemption statistics via ethtool
    https://git.kernel.org/netdev/net-next/c/f05ce73cc3b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



