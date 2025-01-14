Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648C5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 00:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69NwRHPDpUPhrQVlnwmwVJ/LoaQPQWrcqlUlf4HPYdY=; b=xLSKA8jrwNlR3sA5C+h+aXvXA4
	Cg+wIn8jeh/I+DYjNTs/Uex+FMEMXRKQ39QtgUd7IgGAxBPzWruZXNgjQ+mYjPI1XQKdVu/3zqFmg
	H0F/Hjg7ITeUi6kYJzAktkxbyJkN6mAspXVS+iA7TPH+xqYnMG/D7Mb0QqRShGO8I6JS52rGBtdRG
	snbEN1+U/q9yd5uJJwk2IiNBbrevMJwllb+ohmfbjjg2eaMsPRAlAv1br/KOZ/0g9Yb69Wbq9e2VY
	RAJhFHGNm1Llm1kD8/aqx3cbuIx9MiJeV1euD0lbDlqdgrgeMV84CI2vdPEeisMDgYLf5J7oVP/Tn
	l17Pu+Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUUC-00000007135-2LTw;
	Tue, 14 Jan 2025 00:08:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUSw-000000070iY-1cIJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 00:07:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 235C3A40883;
	Tue, 14 Jan 2025 00:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8A6C4CED6;
	Tue, 14 Jan 2025 00:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736813249;
	bh=YFHHVZRBvQPdmgWH/zLMVMHmLYNVEI8tzbQwTlW2Ih0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOTFj0wRO1DfGUp6+VPCpqUafTsi7L81Xr/N1PyvWv1a0wb1I4O86uruKRYFwp/yb
	 igPuym1uXdVCyaO46OsTWZUuJAeWGwjtlxxC8TFV3UYQ7vSkFlpWbKNa+ttNjOZmS8
	 DqED6du4VBtXZGo24cMncrjO+hPNftFqjQ2ivI/4lO/jbzA89ZglO+T2AL/lgVeyl+
	 ri9/TJeJp7GMU4FOlVQfq5iRNAJHTgDVY59qI3DaMhQXZ6DWnW+B3v2AiqX+EF7MvC
	 xzTniRwae/Ojf+PxOth+YwBTUMArkHFSH4ZpuPDAh+QcNg4CK4BoHzKC4ZKB/x+ki5
	 M53UnNGvTfAmQ==
Date: Mon, 13 Jan 2025 18:07:27 -0600
From: Rob Herring <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: linux-aspeed@lists.ozlabs.org, davem@davemloft.net, edumazet@google.com,
	andrew@codeconstruct.com.au, netdev@vger.kernel.org,
	kuba@kernel.org, joel@jms.id.au,
	linux-arm-kernel@lists.infradead.org,
	openipmi-developer@lists.sourceforge.net, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, pabeni@redhat.com,
	ratbert@faraday-tech.com, eajames@linux.ibm.com,
	devicetree@vger.kernel.org, andrew+netdev@lunn.ch, minyard@acm.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH v3 00/10] DTS updates for system1 BMC
Message-ID: <20250114000727.GA3693942-robh@kernel.org>
References: <20250108163640.1374680-1-ninad@linux.ibm.com>
 <173637565834.1164228.2385240280664730132.robh@kernel.org>
 <a8893ef1-251d-447c-b42f-8f1ebc9623bb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8893ef1-251d-447c-b42f-8f1ebc9623bb@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_160730_544995_36872D3C 
X-CRM114-Status: GOOD (  22.67  )
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

On Mon, Jan 13, 2025 at 01:52:01PM -0600, Ninad Palsule wrote:
> Hello,
> 
> On 1/8/25 16:34, Rob Herring (Arm) wrote:
> > On Wed, 08 Jan 2025 10:36:28 -0600, Ninad Palsule wrote:
> > > Hello,
> > > 
> > > Please review the patch set.
> > > 
> > > V3:
> > > ---
> > >    - Fixed dt_binding_check warnings in ipmb-dev.yaml
> > >    - Updated title and description in ipmb-dev.yaml file.
> > >    - Updated i2c-protocol description in ipmb-dev.yaml file.
> > > 
> > > V2:
> > > ---
> > >    Fixed CHECK_DTBS errors by
> > >      - Using generic node names
> > >      - Documenting phy-mode rgmii-rxid in ftgmac100.yaml
> > >      - Adding binding documentation for IPMB device interface
> > > 
> > > NINAD PALSULE (7):
> > >    ARM: dts: aspeed: system1: Add IPMB device
> > >    ARM: dts: aspeed: system1: Add GPIO line name
> > >    ARM: dts: aspeed: system1: Add RGMII support
> > >    ARM: dts: aspeed: system1: Reduce sgpio speed
> > >    ARM: dts: aspeed: system1: Update LED gpio name
> > >    ARM: dts: aspeed: system1: Remove VRs max8952
> > >    ARM: dts: aspeed: system1: Mark GPIO line high/low
> > > 
> > > Ninad Palsule (3):
> > >    dt-bindings: net: faraday,ftgmac100: Add phys mode
> > >    bindings: ipmi: Add binding for IPMB device intf
> > >    ARM: dts: aspeed: system1: Disable gpio pull down
> > > 
> > >   .../devicetree/bindings/ipmi/ipmb-dev.yaml    |  44 +++++
> > >   .../bindings/net/faraday,ftgmac100.yaml       |   3 +
> > >   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     | 177 ++++++++++++------
> > >   3 files changed, 165 insertions(+), 59 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> > > 
> > > --
> > > 2.43.0
> > > 
> > > 
> > > 
> > 
> > My bot found new DTB warnings on the .dts files added or changed in this
> > series.
> > 
> > Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> > are fixed by another series. Ultimately, it is up to the platform
> > maintainer whether these warnings are acceptable or not. No need to reply
> > unless the platform maintainer has comments.
> > 
> > If you already ran DT checks and didn't see these error(s), then
> > make sure dt-schema is up to date:
> > 
> >    pip3 install dtschema --upgrade
> > 
> > 
> > New warnings running 'make CHECK_DTBS=y aspeed/aspeed-bmc-ibm-system1.dtb' for 20250108163640.1374680-1-ninad@linux.ibm.com:
> > 
> > arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: gpio@1e780000: 'hog-0', 'hog-1', 'hog-2', 'hog-3' do not match any of the regexes: 'pinctrl-[0-9]+'
> > 	from schema $id: http://devicetree.org/schemas/gpio/aspeed,ast2400-gpio.yaml#
> 
> This is a false positive. So ignoring it.

No, it is not. You need to define hog nodes in aspeed,ast2400-gpio.yaml. 
See other GPIO controller bindings that do this.

Rob

