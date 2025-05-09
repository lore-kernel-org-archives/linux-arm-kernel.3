Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAA2C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7/UBLCBPT+cSExJFYWPyngJaCpo773rTGRRURQeZZc=; b=XR663qWasXUcJds5swOJsZ6Kew
	pngRp1xwMlZPpi3qzUUU/o9b8k7DuCL+k6aH8KW9l4syuWvmeGfsoWz/CQBzmkp4xXwGx90010jPP
	vLVGSqxNt6rMp2eZWr2OQgRaKwqpP/8KGJtuyrjSXoWqCC4uDCXOhSM+XiaD1prZxgwwwu+VrYRcz
	pfpN/4HdUf/rY4dOFE1fI6AcVtLQ4yKtY6dyczTXoMEN4y2+JAMB/bJ3YonklNPndAvKMw8Gy6I4d
	rUHvuFnDyR7LfMAFI3dj7vfQwgLPq6Mbx53D+jqh5ZAI9kF0Zf/SxVbzhTj8OvgrX2H994R9YfEyt
	SdmlyVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQeb-00000004Ibw-3YIn;
	Fri, 09 May 2025 16:32:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOXA-00000003v4V-1bHQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:17:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B45DF629E2;
	Fri,  9 May 2025 14:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C02AC4CEEF;
	Fri,  9 May 2025 14:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746800222;
	bh=kFuKGQ5an19i2JENb5lALSPRYzO6h5w5ui0WYcZmv8A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iJHrbdPR8UWZAqLmiv7hRO6vG2NXFVUdvVIdB9xoZCRFaAghhDanhQlqLL5Xq9iqA
	 aCm3My/J6HR2Si0UxIf0AhBizihOsfQg0pzwy3384v4hG5CSBu7no0SSNmYAxcjQ1c
	 59GNK2MJXL6yXA+XLTSz9MlieK6p8QuwXJcdKQGRGwtd7ZT+O15ZBGK3C7XoEbBpsA
	 ZBJLd9J5RYAqOJe9YvpE2Ij8vN4wxripauTm7WTQKe+a0eaAH9nVCXFbGLu+SY5jiV
	 sPiVcU+1m3NRHIv4hZy+a8IQPN8+EogveuPGd6bv4K0rJNi1NgPPOJm2pNW/ZnWquO
	 nqGxKACQp+h2A==
Date: Fri, 09 May 2025 09:17:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org
To: Leo Yan <leo.yan@arm.com>
In-Reply-To: <20250508161907.1152054-1-leo.yan@arm.com>
References: <20250508161907.1152054-1-leo.yan@arm.com>
Message-Id: <174679984987.3368571.16872352739655196662.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: fvp: Add ETE and TRBE nodes for Rev C
 model
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


On Thu, 08 May 2025 17:19:07 +0100, Leo Yan wrote:
> The FVP Rev C model includes CoreSight ETE and TRBE support.  These
> features can be enabled by specifying parameters when launching the
> model:
> 
>   -C cluster0.has_ete: 1
>   -C cluster1.has_ete: 1
>   -C cluster0.has_trbe: 1
>   -C cluster1.has_trbe: 1
> 
> This change adds device tree bindings for the ETE and TRBE nodes.  They
> are disabled by default to prevent kernel warnings from failed driver
> probes, as the model does not enable the features unless explicitly
> specified.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  arch/arm64/boot/dts/arm/fvp-base-revc.dts | 62 +++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: failed to guess base

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/arm/' for 20250508161907.1152054-1-leo.yan@arm.com:

arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete0 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete0 (arm,embedded-trace-extension): $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete1 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete1 (arm,embedded-trace-extension): $nodename:0: 'ete1' does not match '^ete(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete2 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete2 (arm,embedded-trace-extension): $nodename:0: 'ete2' does not match '^ete(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete3 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete3 (arm,embedded-trace-extension): $nodename:0: 'ete3' does not match '^ete(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete4 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete4 (arm,embedded-trace-extension): $nodename:0: 'ete4' does not match '^ete(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete5 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete5 (arm,embedded-trace-extension): $nodename:0: 'ete5' does not match '^ete(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete6 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete6 (arm,embedded-trace-extension): $nodename:0: 'ete6' does not match '^ete(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete7 (arm,embedded-trace-extension): 'arm,coresight-loses-context-with-cpu' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
arch/arm64/boot/dts/arm/fvp-base-revc.dtb: ete7 (arm,embedded-trace-extension): $nodename:0: 'ete7' does not match '^ete(-[0-9]+)?$'
	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#






