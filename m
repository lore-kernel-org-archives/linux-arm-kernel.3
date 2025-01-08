Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2072E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jkJGJh6qg7gqpG0258mYZWmPB/PDke8D18KXs7aowM=; b=zMeVIrtbzO5WB99hLk4wEDivFf
	iRpI707Y/dQOMo07tG/6i9ucuG0W5HUdQ1xhrSD/8yhruTvwVM0TkvChYS4gOLco98B6zquoFYTOl
	apaozSdVBywoN2YeiZ12Zk1E0/HZdNHk4+JyV4kRZuI/eEK/3dZz6mZHEaIsaeVfvpRs5ln/G6G6x
	PeV4y5SRVbi/EKiE3sM2+7/V0lI9qYDNfcmslUVW4yUGfo3UvWtBcmmxNdKJytFEDydQVxK/ehZKz
	RaJvfD4OIrOAkj4RQyigblfAuMAMnbqLJqJHtl5wIoL/rm6AOydSk4TBVnxRIzu37P5N7KxIyy4T5
	c1JufmNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVegD-0000000A2wX-0I11;
	Wed, 08 Jan 2025 22:37:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVedb-0000000A2Sw-3GvU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 22:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 684ABA418B5;
	Wed,  8 Jan 2025 22:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909D3C4CED3;
	Wed,  8 Jan 2025 22:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736375694;
	bh=bavaJ0imBpiVDIZhMho4cmKy8OAAsoDpvSMGWGk11xs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DVL5qOVZL39UAGjraeHcvN9+EiwMsO5uvCQZuIjivuCx/caoxptFKTqFqZA1Pnlu/
	 oOori9v01SKtm37Tb19Cl9o7owsTUFOSZPuF8lySZN2z4KYY5oAcFg0PeqZo7OjWOp
	 FF7kkNC0eydNPJwl144hT14MUHMyAQ8xzcxK3smzVgu7KiYBsJdty1vVqa9CVViK5P
	 9gAoDmSmuFzudGXdrIc7ip+xq8lP9pDOf07+bJxIj1ZoNQh524/xvpGewpLWCJDhtg
	 DtKVfm/pTNJx6Nrwud6IfixQwB31VRrfK++8NZMWEv4jHf1rGS9QTxvCXmPooB2LAu
	 HFqNdtYQFUB6g==
Date: Wed, 08 Jan 2025 16:34:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, davem@davemloft.net, edumazet@google.com, 
 andrew@codeconstruct.com.au, netdev@vger.kernel.org, kuba@kernel.org, 
 joel@jms.id.au, linux-arm-kernel@lists.infradead.org, 
 openipmi-developer@lists.sourceforge.net, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, pabeni@redhat.com, ratbert@faraday-tech.com, 
 eajames@linux.ibm.com, devicetree@vger.kernel.org, andrew+netdev@lunn.ch, 
 minyard@acm.org, krzk+dt@kernel.org
To: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <20250108163640.1374680-1-ninad@linux.ibm.com>
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
Message-Id: <173637565834.1164228.2385240280664730132.robh@kernel.org>
Subject: Re: [PATCH v3 00/10] DTS updates for system1 BMC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_143455_941086_BC574DA1 
X-CRM114-Status: GOOD (  14.10  )
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


On Wed, 08 Jan 2025 10:36:28 -0600, Ninad Palsule wrote:
> Hello,
> 
> Please review the patch set.
> 
> V3:
> ---
>   - Fixed dt_binding_check warnings in ipmb-dev.yaml
>   - Updated title and description in ipmb-dev.yaml file.
>   - Updated i2c-protocol description in ipmb-dev.yaml file.
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
>  .../devicetree/bindings/ipmi/ipmb-dev.yaml    |  44 +++++
>  .../bindings/net/faraday,ftgmac100.yaml       |   3 +
>  .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 177 ++++++++++++------
>  3 files changed, 165 insertions(+), 59 deletions(-)
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


New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20250108163640.1374680-1-ninad@linux.ibm.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#






