Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9872EE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 22:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vLc1xPAL0AFFKPRpUd/UVHpL4aDbiIngxyJwJEuzDb8=; b=mYZ2ySztmfuitbYOY+UlAqfmPG
	HhLf3ksG05u6O5WxyXqOOpf+7BmV3A7YX4gxKLrTWCgbpFddmY9rlm2I+yIyl8xu2A2S6hgq0Ey07
	jTNctQo9UB2nOcLhfiDdQ9fsAljCsT4reYkN2EvSEyMb4Y4SnkRG/BG+loqEBBes5K4HnBPRpGE8m
	G++Yt/kHPc4yOLuJYS7dJiKBAlEDPNmzKyr/elcKcuQ8/lsFwM8+mdA9jIve10/bR/Lmc5qCPv/xU
	wGsofRf0d0yHvvb56klHMsKyzbDDn9ysoE/Zj+lvLacxPWY17QiPoJrgu8eOLy/GFqRkjZCw533jx
	bx4184fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIUH-00000006SZG-2Svl;
	Tue, 07 Jan 2025 22:55:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVIT5-00000006SPP-1TSF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 22:54:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04F595C62E1;
	Tue,  7 Jan 2025 22:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A7DC4CEE8;
	Tue,  7 Jan 2025 22:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736290473;
	bh=dYbF7CHxuuCz2p1jW22Ix5UW0UmrzVjjqtNsyO8jekA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=LJf7DYF3n6cj3pBXooqWfWIUfMxkpq+W8jkF9sAjxC7pNSYms7tQbAQ9ZcS6HULtp
	 0zn6w2Tc9E71TTX19KpDZYeTBMbyqAiqX2S2Hu2uRHXmrV9YkPRDjDDNT/YZ1iRyd4
	 RLWfGOKVsiMoPJvQRWNbHSvi/WyUkvIUR0W9UWq+Ssg6rulAXGwW9oOaNlIbp5xbVs
	 GIdvbuuIr+Us+G0Q9045WfDhoZpZSlHpNytlG/in7WZGCnMGerIXzvaP7nnHXaiF48
	 NZgt0JQEE54lkJtYijy4F9cjWTwzJLBpQqXxWrX4oRw5Vn2gv8MXAoVIprSD0SS09a
	 rRKbWZgYVdhpQ==
Date: Tue, 07 Jan 2025 16:54:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, netdev@vger.kernel.org, 
 davem@davemloft.net, andrew@codeconstruct.com.au, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 ratbert@faraday-tech.com, minyard@acm.org, andrew+netdev@lunn.ch, 
 edumazet@google.com, joel@jms.id.au, kuba@kernel.org, 
 openipmi-developer@lists.sourceforge.net, pabeni@redhat.com, 
 eajames@linux.ibm.com, linux-arm-kernel@lists.infradead.org, 
 conor+dt@kernel.org
To: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20250107162350.1281165-1-ninad@linux.ibm.com>
References: <20250107162350.1281165-1-ninad@linux.ibm.com>
Message-Id: <173629037049.1994533.7630339914217766401.robh@kernel.org>
Subject: Re: [PATCH v2 00/10] DTS updates for system1 BMC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_145435_433261_AB13DD43 
X-CRM114-Status: GOOD (  13.61  )
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


On Tue, 07 Jan 2025 10:23:37 -0600, Ninad Palsule wrote:
> Hello,
> 
> Please review the patch set.
> 
> V2:
> ---
>   Fixed CHECK_DTBS errors by
>     - Using generic node names
>     - Documenting phy-mode rgmii-rxid in ftgmac100.yaml
>     - Adding binding documentation for IPMB device interface
> 
> NINAD PALSULE (7):
>   ARM: dts: aspeed: system1: Add IPMB device
>   ARM: dts: aspeed: system1: Add GPIO line name
>   ARM: dts: aspeed: system1: Add RGMII support
>   ARM: dts: aspeed: system1: Reduce sgpio speed
>   ARM: dts: aspeed: system1: Update LED gpio name
>   ARM: dts: aspeed: system1: Remove VRs max8952
>   ARM: dts: aspeed: system1: Mark GPIO line high/low
> 
> Ninad Palsule (3):
>   dt-bindings: net: faraday,ftgmac100: Add phys mode
>   bindings: ipmi: Add binding for IPMB device intf
>   ARM: dts: aspeed: system1: Disable gpio pull down
> 
>  .../devicetree/bindings/ipmi/ipmb-dev.yaml    |  42 +++++
>  .../bindings/net/faraday,ftgmac100.yaml       |   3 +
>  .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 177 ++++++++++++------
>  3 files changed, 163 insertions(+), 59 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> 
> --
> 2.43.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20250107162350.1281165-1-ninad@linux.ibm.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#






