Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA54EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 12:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezFHCfyuUPn67ziE8Iz/wJL6GkhlMglyYJG+In7mY+U=; b=dVDuFCjER4J00VftpZRdo0MF/0
	YC16VB5igbzYR0WuCHbXcUqbFOH0kujC4z7ttS84Okv8laGrp8x2HijTa8ymY1+63Q8TywSh0WlLl
	gk8Xrh5yQ9p3ID4535Ay5cc7Y3nDrwkXSMqOceQVdzdebc4BmMX0No0UWTvP525mj7UtnBedilPFM
	87QxCl1Zd2i+gMWshBYWHbjAu4qyZNCcfRYhXcH2z2ij8J0kBZgbHc/EKOJMd8SBMyQwoQRg6d3jy
	I+d54v9NVFzS1ha9kiTa8YGxwL4FZbAxbDT8wEIqsZWjjlxAzezhWAFASf7+IfSr9g0V8fb56tqTD
	QJqVUpOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSBI-00000005TnD-0yEx;
	Fri, 21 Feb 2025 12:31:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlS9q-00000005TZy-0dfe;
	Fri, 21 Feb 2025 12:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FDCB6128A;
	Fri, 21 Feb 2025 12:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E56EC4CEDD;
	Fri, 21 Feb 2025 12:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740140969;
	bh=yeXSTli4MjZbx7FP0/Y3On8xKZiLQ1Wgmzdq+wGSUmg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KDWs/cKwawUW6RUJpFTguLvs6ax6RrAFU9bAFB2Om9yvjH2i/1RXMvDs1s8x4ilad
	 VpGg8HGVR3Aq6NUzjMe9PdYjkvcf7chFBOkkGIM99T+MV2ena0gM+qXFq40b0Z/way
	 IdZKWm58LDy9pIWGoEU7LHLhRbcJO5xmQ9gekIP1+tsqH24cS5RZaaSg8XXbiqxkhc
	 oyJolu1DDUQ3jl54N+KARxpfxIE/NO3bSe9tVeI9uSdMF6kJLz1reojsuHsawo3Jt1
	 AWNg7/t7+UsgL4Od+JmS96abev+jaYpMT6Tj9EESw7hyvV/G3n3fw4ax2x7DGMBnA8
	 G7F9/Hy1W1leg==
Date: Fri, 21 Feb 2025 06:29:27 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 heiko@sntech.de, linux-rockchip@lists.infradead.org, 
 Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Simon Xue <xxm@rock-chips.com>
To: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20250221104357.1514128-2-kever.yang@rock-chips.com>
References: <20250221104357.1514128-1-kever.yang@rock-chips.com>
 <20250221104357.1514128-2-kever.yang@rock-chips.com>
Message-Id: <174014096734.2508114.17981034112064393929.robh@kernel.org>
Subject: Re: [RFC PATCH v6 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576
 support
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


On Fri, 21 Feb 2025 18:43:56 +0800, Kever Yang wrote:
> rk3576 is using dwc controller, with msi interrupt directly to gic instead
> of to gic its, so
> - no its support is required and the 'msi-map' is not need anymore,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v6:
> - Fix make dt_binding_check and make CHECK_DTBS=y
> 
> Changes in v5:
> - Add constraints per device for interrupt-names due to the interrupt is
> different from rk3588.
> 
> Changes in v4:
> - Fix wrong indentation in dt_binding_check report by Rob
> 
> Changes in v3:
> - Fix dtb check broken on rk3588
> - Update commit message
> 
> Changes in v2:
> - remove required 'msi-map'
> - add interrupt name 'msi'
> 
>  .../bindings/pci/rockchip-dw-pcie-common.yaml | 59 +++++++++++++++----
>  .../bindings/pci/rockchip-dw-pcie.yaml        |  4 +-
>  2 files changed, 50 insertions(+), 13 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml: anyOf:1:then:properties:interrupt-names: {'type': 'array', 'items': [{'const': 'sys'}, {'const': 'pmc'}, {'const': 'msg'}, {'const': 'legacy'}, {'const': 'err'}, {'const': 'msi'}], 'minItems': 6, 'maxItems': 6} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml: anyOf:1:then:properties:interrupt-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'sys'}, {'const': 'pmc'}, {'const': 'msg'}, {'const': 'legacy'}, {'const': 'err'}, {'const': 'msi'}] is too long
	[{'const': 'sys'}, {'const': 'pmc'}, {'const': 'msg'}, {'const': 'legacy'}, {'const': 'err'}, {'const': 'msi'}] is too short
	False schema does not allow 6
	1 was expected
	6 is greater than the maximum of 2
	6 is greater than the maximum of 3
	6 is greater than the maximum of 4
	6 is greater than the maximum of 5
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.example.dtb: pcie-ep@fe150000: interrupt-names: ['sys', 'pmc', 'msg', 'legacy', 'err', 'dma0', 'dma1', 'dma2', 'dma3'] is too long
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-ep.example.dtb: pcie-ep@fe150000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250221104357.1514128-2-kever.yang@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


