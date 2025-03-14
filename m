Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4BDC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lut9N6M+9bFFGRjiz/lHliEh/bkOXCgieDj0PdBtkUI=; b=AW7b4r1lEE17ohI0DfV3RsnU8X
	F4uDjvIYhsLFVqu/Um2jH33VBDJvw6CTTQiKxPqj4xZbCi9OSUu8/hG37xuuQk7TAEiLmVZDwyz6K
	g8BgPlMEWHXT0FP0VV6Ci0yQ+/Tb5KsAS6uRO4I1pE5TBuEBqx17NtUFJPDXO1/uJCnlScHjuCMdn
	3T9SOSRNPvsms1+P/g6LrFCoKmqdnoU1/2AbXMrWV7BivDp6gm3Puo1KNY686mcZPJs7BN1bN2ONR
	dE4tOpjzo2+N2yNi50lXjcEmPsDpXfDE7Wv3T4hSJRhsh4uxJ5Jk90ZkkD926myqAQHO1sBCEVCmz
	L2G92urA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0Z0-0000000DVgB-3mp8;
	Fri, 14 Mar 2025 08:38:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0MC-0000000DS64-2ufY;
	Fri, 14 Mar 2025 08:25:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47FAC5C5A50;
	Fri, 14 Mar 2025 08:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94DF0C4CEE3;
	Fri, 14 Mar 2025 08:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741940727;
	bh=0n02eITWIzf/++JmvY0KKczZbmpT4M52h+UOP3gyX1g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=ernyX5AhaKGHwsNYKemwwl6b7FOv05dkpRXhpU5QS+zhW5D7DNpEo5YRcsxACotTO
	 dxDHIIcVX9E10h2Rzz5V4Kq96KUxuFuxvpb0S6mVtXF+Z5vYsWxpHGxjAMzuMDu0+C
	 StPKm+3Rz0/sbTXytr5TzT6kF9aATfKUbLTLUSjJQbghCxcokeUANygDzT8bohdsFK
	 XLQ2ubvepmUDzbNSJeQ4CYGwI4QpYthXPSdS9ni+dgdfKPhDzLJQFoe12XoHlUp/vw
	 jX28yQDa5nkawQdXf1hGV3ASGoxbetnLybGPSphwAt079jT71u8Btk+GbGko8d6bNA
	 Q7MHme6WdhGsg==
Date: Fri, 14 Mar 2025 03:25:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-input@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Chen Zhong <chen.zhong@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 Sen Chu <shen.chu@mediatek.com>
To: "Lu.Tang" <Lu.Tang@mediatek.com>
In-Reply-To: <20250314073307.25092-6-Lu.Tang@mediatek.com>
References: <20250314073307.25092-1-Lu.Tang@mediatek.com>
 <20250314073307.25092-6-Lu.Tang@mediatek.com>
Message-Id: <174194072655.964967.9270640013940045148.robh@kernel.org>
Subject: Re: [PATCH 5/5] dt-bindings: pmic: mediatek: Add pmic documents
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_012528_844326_1D037229 
X-CRM114-Status: GOOD (  11.50  )
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


On Fri, 14 Mar 2025 15:32:31 +0800, Lu.Tang wrote:
> Add new pmic mfd and adc documents for mt8196
> 
> Signed-off-by: Lu.Tang <Lu.Tang@mediatek.com>
> ---
>  .../iio/adc/mediatek,spmi-pmic-auxadc.yaml    |  31 ++++
>  .../bindings/input/mediatek,pmic-keys.yaml    |   1 +
>  .../bindings/mfd/mediatek,mt6685.yaml         |  50 +++++
>  .../bindings/mfd/mediatek,spmi-pmic.yaml      | 173 ++++++++++++++++++
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      |   1 +
>  5 files changed, 256 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/mediatek,spmi-pmic-auxadc.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6685.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dts:25.17-31: Warning (reg_format): /example-0/spmi/mfd@9:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dts:23.19-28.15: Warning (avoid_default_addr_size): /example-0/spmi/mfd@9: Relying on default #address-cells value
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dts:23.19-28.15: Warning (avoid_default_addr_size): /example-0/spmi/mfd@9: Relying on default #size-cells value
Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6685.example.dtb: mfd@9: '#address-cells', '#size-cells', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6685.yaml#
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dts:31.17-31: Warning (reg_format): /example-0/spmi/pmic@4:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dts:29.31-109.15: Warning (avoid_default_addr_size): /example-0/spmi/pmic@4: Relying on default #address-cells value
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dts:29.31-109.15: Warning (avoid_default_addr_size): /example-0/spmi/pmic@4: Relying on default #size-cells value
Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,spmi-pmic.example.dtb: pmic@4: '#address-cells', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,spmi-pmic.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250314073307.25092-6-Lu.Tang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


