Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F2BCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 03:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7wojqlpVbJfc9ZFNdTgWU2YZfWeRZ5UHcPAYt4iY4U=; b=CyibdFdvc/oFFFOTBFTrSWYMR+
	kcmMn3GndzIeAqERQOciNcIWBaxlOt+M/WnykVvNfW2RnPfTzqvCEfB+nQfdEXSNnDGj3YvEQ3gz8
	LoCU6ucz2sh+HCxBkzJbLMp+NjVBz+cqQhxTOYX0I6/ryXsHXhGQ+NQV31bEhYKbPbfBE/2i16oaP
	AkQBUHsZOye1QUaHG2geJiK8cO6NqltK1ZylgOkwbU0xrlHfoh/zdKmqjdTUOO2NsUANgfGmYBvwV
	BYziPnlTnP8VFFe7bFZFmjmcSWNR7+kn30nX+89nZuEqHNmCN8r28+neiV0fGufmUPMDsTCvjDIfE
	fLs0ziEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1mT-0000000CU1S-0ICo;
	Wed, 13 Aug 2025 03:04:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1jv-0000000CTtg-0wKM;
	Wed, 13 Aug 2025 03:01:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEDFC438F7;
	Wed, 13 Aug 2025 03:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B7FC4CEF0;
	Wed, 13 Aug 2025 03:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755054082;
	bh=ah5s8QI5yHtW13rFxqFgRLPbL9Ck1PJlUKhkvkzSQak=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZtaFsfBpGd4++cIB4bzulDyJTU+BzAc+HjH/48RK5e+BPK6wUbQjUptHB+rpDh6wQ
	 dDpxmjbLnJKlG3eoXWwo7sDZLmCkRzYGzH1hsS1dQ/i4n3sFNCCH8hZI6iTVW0eLYD
	 31YhUsdh/x7zHyQxISNMxz2cf+N0R/gZ/fl2w2ffneruvZ37TuK1O6TO0zB7HmyYsl
	 NPGIM56c4rXmAoq5dJB71XU1oq+27uzWrOcJE7v1+UqUW0YKXJVuIKbbBOSocxg0ea
	 Xwe4wSh070Dz9L5uYr+MsJ9e4kzIGivLxNqnCWMC0J3J/brzB87wQBxYX/hoXf50os
	 W70J47kv1lMPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE2539D0C2E;
	Wed, 13 Aug 2025 03:01:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v7 0/7] net: airoha: Introduce NPU callbacks for
 wlan offloading
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <175505409423.2923440.2479531614501125802.git-patchwork-notify@kernel.org>
Date: Wed, 13 Aug 2025 03:01:34 +0000
References: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
In-Reply-To: <20250811-airoha-en7581-wlan-offlaod-v7-0-58823603bb4e@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, horms@kernel.org, nbd@nbd.name,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_200123_279875_620C406B 
X-CRM114-Status: GOOD (  10.83  )
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

On Mon, 11 Aug 2025 17:31:35 +0200 you wrote:
> Similar to wired traffic, EN7581 SoC allows to offload traffic to/from
> the MT76 wireless NIC configuring the NPU module via the Netfilter
> flowtable. This series introduces the necessary NPU callback used by
> the MT7996 driver in order to enable the offloading.
> MT76 support has been posted as RFC in [0] in order to show how the
> APIs are consumed.
> 
> [...]

Here is the summary with links:
  - [net-next,v7,1/7] dt-bindings: net: airoha: npu: Add memory regions used for wlan offload
    https://git.kernel.org/netdev/net-next/c/cebd717d8f01
  - [net-next,v7,2/7] net: airoha: npu: Add NPU wlan memory initialization commands
    https://git.kernel.org/netdev/net-next/c/564923b02c1d
  - [net-next,v7,3/7] net: airoha: npu: Add wlan_{send,get}_msg NPU callbacks
    https://git.kernel.org/netdev/net-next/c/f97fc66185b2
  - [net-next,v7,4/7] net: airoha: npu: Add wlan irq management callbacks
    https://git.kernel.org/netdev/net-next/c/03b7ca3ee5e1
  - [net-next,v7,5/7] net: airoha: npu: Read NPU wlan interrupt lines from the DTS
    https://git.kernel.org/netdev/net-next/c/a1740b16c837
  - [net-next,v7,6/7] net: airoha: npu: Enable core 3 for WiFi offloading
    https://git.kernel.org/netdev/net-next/c/29c4a3ce5089
  - [net-next,v7,7/7] net: airoha: Add airoha_offload.h header
    https://git.kernel.org/netdev/net-next/c/b3ef7bdec66f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



