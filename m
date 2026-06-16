Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54692CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Xk0PdLiYymMCUqB6kWMCwekoJyvD8MM/ojXTg/ijko=; b=RxjHSJ1soAMszV+iuTqLr6aVmq
	nHgfL7r4+A5H26dNzPRRQA69rI+s2Onu5Gfdr18iwuzOIG76omenkYr7CNQiqlI+GeFCAij9aeaD/
	+/bCa1zj4JQEhjDLayvuyfvH7cH76ppzPiwwsMQsTnUTuvikxceacMT/bjJScTdeaYeSFyM+G/ka2
	cTca7duOhX2bgq7aqzKxEZXGfXlF97jOFBbVxlVmMRhilHHPInw2CiwC2u56hMAagpx8gHrBDpZdS
	blaESKMfStRLmXEzWBCKEqlNxA4/vdAdNv04bB0zzWmz8zz0Lm/ufqiE5Q7Vxaim5u2TGDpC/L4FV
	q9k3CeMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUBK-0000000Fs1a-3xhQ;
	Tue, 16 Jun 2026 13:50:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUBK-0000000Fs1C-0p0Z;
	Tue, 16 Jun 2026 13:50:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B487600AB;
	Tue, 16 Jun 2026 13:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72581F00A3A;
	Tue, 16 Jun 2026 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781617821;
	bh=8Xk0PdLiYymMCUqB6kWMCwekoJyvD8MM/ojXTg/ijko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bctDtHcgCuI3AA4NjgzsGt6xKEfxgIvEO1rFEtIVw0SvA0e8sDjRtlT+QFfGqT4xx
	 MEy8vspJNIdbfF1LCuWkQ1xpygdYURwY68TtcT8h6LoFzLVSiKiqyiYnHsB2mO927Z
	 cxXJIYfaehrwxMRwpbUcC+9UuFaUYuCxKd56iJdtsTzLNYoRVeTU+NWVVF9HsPQJLb
	 fB28TqMMOXyBuextma02GV38UzL0h4FAQoSKsn05nDPunPEWBrguWxTVRj1SzQ8aCR
	 O4G061n0UmZScpEF2jgoDNm+/yC0Uk/WqgFLsrAI5M/TGIvdmAhLDa6tZ1EVmQZ4jH
	 uCBlivyCU/Esg==
Date: Tue, 16 Jun 2026 08:50:17 -0500
From: Rob Herring <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 3/9] regulator: dt-bindings: Add MediaTek MT6392 PMIC
Message-ID: <20260616135017.GA2350711-robh@kernel.org>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
 <20260615071836.362883-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615071836.362883-4-l.scorcia@gmail.com>
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

On Mon, Jun 15, 2026 at 09:16:09AM +0200, Luca Leonardo Scorcia wrote:
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../regulator/mediatek,mt6392-regulator.yaml  | 234 ++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     |  24 ++
>  2 files changed, 258 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> new file mode 100644
> index 000000000000..197041df4ba1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> @@ -0,0 +1,234 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6392 regulator
> +
> +maintainers:
> +  - Luca Leonardo Scorcia <l.scorcia@gmail.com>
> +
> +description:
> +  MT6392 is a power management system chip containing three buck converters and
> +  23 LDOs. All voltage regulators provided by the PMIC are described as
> +  sub-nodes of this node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt6392-regulator
> +
> +  vproc-supply:
> +    description: Supply for buck regulator vproc
> +  vcore-supply:
> +    description: Supply for buck regulator vcore
> +  vsys-supply:
> +    description: Supply for buck regulator vsys
> +  avddldo-supply:
> +    description: |

Don't need '|' if no formatting to preserve. Elsewhere too.

> +      Supply for AVDD LDOs (vm, vio18, vcn18, vcamd, vcamio). According to the data sheet
> +      this is an internal supply derived from vsys.
> +  ldo1-supply:
> +    description: Supply for LDOs group 1 (vaud28, vxo22, vaud22, vadc18, vcama, vrtc)
> +  ldo2-supply:
> +    description: Supply for LDOs group 2 (vcn35, vio28, vmc, vmch, vefuse, vdig18)
> +  ldo3-supply:
> +    description: Supply for LDOs group 3 (vusb, vemc3v3, vcamaf, vgp1, vgp2, vm25)
> +
> +patternProperties:
> +  "^v(core|proc|sys)$":
> +    description: Buck regulators
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]

           minItems: 1
           maxItems: 2

? Because if there are only 2 modes, can't have more entries than that, 
right? Though wouldn't 2 entries be the same as no property present 
because I would assume the default is all modes. I shouldn't have to 
assume though.


> +    unevaluatedProperties: false

Place this after $ref. Easier to read than after indented blocks.

> +
> +  "^v(adc18|camio|cn18|io18|xo22|m25|aud28|io28|rtc|usb)$":
> +    description: LDOs with fixed output and mode setting
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false
> +
> +  "^v(cama|dig18)$":
> +    description: LDOs with fixed output without mode setting
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
> +    description: LDOs with adjustable output
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes: false
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    regulators {
> +      compatible = "mediatek,mt6392-regulator";

Drop the example. Put 1 complete example in the MFD schema rather than 
incomplete examples.

Rob

