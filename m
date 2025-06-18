Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B00BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 17:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwxXgLFZlpC2rywr/Gj1ZKYvUF60UcvPjxc9da18IK8=; b=CE5Cklx5VH+sVm0pLaK5WZanYw
	tjwO0Cd+SijTi5W4iFuql9Lh307tRHeDGugd8g7Szdu6YGReB9MOLBR2CWRk8HTRw6RuM+MZ+sL8k
	xSAHBFNGCtlx5xUmxXRj1l91u8QZ8XmaRMU7Pz/IOiZvwsNGYI1aa86hM/OGtF/+bdKbw1j4UDUHU
	/Wgn7EE7bCyg7NpRz0uHOj/a5roWTme6zeWiKjXo5VZbChZFK0PmcjV7h4YW1X4/ocvk3m2ItmBoi
	3m5+HMleRVzbMtOBGNyoUE+k6OVXtZXsRax+nsrENhoqj4iEIxLQiMjxkNc/q1ytzx8ilAtibI9O9
	7XO7KuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwdd-0000000Are6-1k5J;
	Wed, 18 Jun 2025 17:31:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRt0z-0000000AKeS-1MWr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:39:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49C7B5C5EA3;
	Wed, 18 Jun 2025 13:37:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AEC5C4CEE7;
	Wed, 18 Jun 2025 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750253984;
	bh=vGA6YD3WHkjhX9wh1WJgtfN49JDWFNbiMmPPsBJHMkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0V/Bfh+MmwncspD7LiPiZTApp7b0D8oI9XvxIfia7mKuj5cDz0ONRwb8pCPivdN2
	 eGjhJ7EcWG6QUZfVaqQe1l90HlAwl8qSeTrCPykpr+cgxGixTOMDDwmjenSAVartou
	 2UHPsZKafNgJzgb4y78N/YQ/QDYgAKvm3CX/+SMRIUwQmBPF2w9FoVKVyneNB2Wcpb
	 fBK9mDzI97rf3Qou/jLF01+f7qzh89w8Tlg5f/FD+368J/b54tZ6l8Bo+8V2VkXw3d
	 XH9EWzyajwWXDlHJSCastvIKMwuj3PbyNmBAXkNMPvrwu14eBBBMYKWedp1v/U8yft
	 TJfKWiC8y4NAw==
Date: Wed, 18 Jun 2025 08:39:43 -0500
From: Rob Herring <robh@kernel.org>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev,
	alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Subject: Re: [PATCH v2 0/2] Add cache configuration for Microchip SAMA7D and
 SAMA7G MPUs
Message-ID: <20250618133943.GA1769667-robh@kernel.org>
References: <20250618103914.2712-1-mihai.sain@microchip.com>
 <175025355214.1756305.9442014210793499196.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175025355214.1756305.9442014210793499196.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_063945_445119_5F8ADA71 
X-CRM114-Status: GOOD (  23.12  )
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

On Wed, Jun 18, 2025 at 08:36:25AM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 18 Jun 2025 13:39:12 +0300, Mihai Sain wrote:
> > This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
> > The cache configuration is described in datasheet chapter 15.2.
> > 
> > Changelog:
> > 
> > v1 -> v2:
> > - Remove the cache-unified property from l1-cache node
> > 
> > Mihai Sain (2):
> >   ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
> >   ARM: dts: microchip: sama7g5: Add cache configuration for cpu node
> > 
> >  arch/arm/boot/dts/microchip/sama7d65.dtsi | 16 ++++++++++++++++
> >  arch/arm/boot/dts/microchip/sama7g5.dtsi  | 16 ++++++++++++++++
> >  2 files changed, 32 insertions(+)
> > 
> > 
> > base-commit: 52da431bf03b5506203bca27fe14a97895c80faf
> > --
> > 2.50.0
> > 
> > 
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: using specified base-commit 52da431bf03b5506203bca27fe14a97895c80faf
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/microchip/' for 20250618103914.2712-1-mihai.sain@microchip.com:
> 
> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): 'cache-unified' is a required property
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): 'cache-unified' is a required property
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g5ek.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('l1-cache' was unexpected)
> 	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): cache-level: 1 is less than the minimum of 2
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): 'cache-unified' is a required property
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#
> arch/arm/boot/dts/microchip/at91-sama7g54_curiosity.dtb: l1-cache (cache): Unevaluated properties are not allowed ('cache-level', 'd-cache-size', 'i-cache-size', 'next-level-cache' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/cache.yaml#

You are doing caches wrong as the schema is telling you.

The L1 caches are described in the CPU nodes, not a separate node. This 
is detailed in the DT Spec as well.

Rob

