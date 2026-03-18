Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83FAF103E172
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AKdpx8PuslMX2EqG13+jX9PJ7O+IaDVJgy6GG66IX4=; b=1N4BqSN+mTgRJoRq6x3/1dzd2i
	FvebO952wKTgzDdq8Ya6g7zAp+mSv0dnLLNrpigc3hWZ5PsKpJMFme8h5TOmgFEQAcZcbV1cZyT2d
	8MvXuY9ieaNkOyAG4sRq6OEFpGTenOMOLo5+lNLJu/1Z92Q2MjjsU2z8hmCZouVWald2SgNyUQCbL
	7dU9xhgSZJGQBXRE5YnhHoko+/Cr2zLfjEiYhUF1olQCFqgr1n7nQejfIBTcbsrjYpDIR2PiFdH/U
	mqNurQM/10Sk3W8d3YREtADKs1iTeEdF4y3qs2WQ/LOBSM4J7zSQ94xtBbE1P2OUXsSeFzVP3CMsg
	Zpo0Lzaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qBQ-00000008PKD-3kQC;
	Wed, 18 Mar 2026 12:39:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qBB-00000008P7J-1Ncp;
	Wed, 18 Mar 2026 12:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837555;
	bh=RBuqnVZJEy7b5iSK48Q0ap0YOczP8iWoM+/YF46iV9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mnxz28RiDchaD+WKXdz42ZRrqmZbt3YNm0LrfuHQbCBHfT3eGvwEAgiHqzovfMPC5
	 WI/wVfdCoNCibGl8iCCnua0DDfWy68ucTCTA1acHaQ1g14PHiyeWlwwT5rML3lby2l
	 k+71Du17DZ4vz66j7kd/5rMRpZq4g6Z7mOtEpV37eEPLI807izbd9fkFRGgSelTp/4
	 UQ/CcNBmW35c1WUV2j8vAI27EwZLk8JOiotIYGnfbwGjq+R0rV5iaB4ISNzEpG4HOu
	 iBtGLH1z1HfcShn0NFsUp7Myld8KpdsQnfHl6tksSMMF3lDOAcNEjfpObG29k9j/bs
	 jDByGaCI2HxSA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D4CD17E1355;
	Wed, 18 Mar 2026 13:39:14 +0100 (CET)
Message-ID: <62b1463b-3d32-4d5c-8af3-f09202f96fb5@collabora.com>
Date: Wed, 18 Mar 2026 13:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Julien Massot
 <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-4-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-4-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053917_709998_CFAE6D25 
X-CRM114-Status: GOOD (  18.67  )
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

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++++++++
>   .../regulator/mediatek,mt6392-regulator.h     |  24 ++
>   2 files changed, 342 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
>   create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> new file mode 100644
> index 000000000000..fa4aad2dcbe8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> @@ -0,0 +1,318 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6392 Regulator
> +
> +description:
> +  Regulator node of the PMIC. This node should under the PMIC's device node.
> +  All voltage regulators provided by the PMIC are described as sub-nodes of
> +  this node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt6392-regulator
> +
> +patternProperties:
> +  "^(buck_)?v(core|proc|sys)$":
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
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(adc18|camio|cn18|io18)$":

There was a discussion a bit of time ago and we decided to drop the "ldo_" and
"buck_" prefix from the regulators.

Can you please drop those?

Cheers,
Angelo

> +    description: LDOs with fixed 1.8V output
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
> +  "^(ldo_)?v(xo22)$":
> +    description: LDOs with fixed 2.2V output
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
> +  "^(ldo_)?v(m25)$":
> +    description: LDOs with fixed 2.5V output
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
> +  "^(ldo_)?v(aud28|io28)$":
> +    description: LDOs with fixed 2.8V output w/ mode
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
> +  "^(ldo_)?v(cama)$":
> +    description: LDOs with fixed 2.8V output w/o mode
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?vusb$":
> +    description: LDOs with fixed 3.3V output
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
> +  "^(ldo_)?v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
> +    description: LDOs with variable output
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
> +    mt6392_regulators: regulators {
> +        compatible = "mediatek,mt6392-regulator";
> +
> +        mt6392_vproc_reg: buck_vproc {
> +            regulator-name = "vproc";
> +            regulator-min-microvolt = <700000>;
> +            regulator-max-microvolt = <1350000>;
> +            regulator-ramp-delay = <12500>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vsys_reg: buck_vsys {
> +            regulator-name = "vsys";
> +            regulator-min-microvolt = <1400000>;
> +            regulator-max-microvolt = <2987500>;
> +            regulator-ramp-delay = <25000>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vcore_reg: buck_vcore {
> +            regulator-name = "vcore";
> +            regulator-min-microvolt = <700000>;
> +            regulator-max-microvolt = <1350000>;
> +            regulator-ramp-delay = <12500>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vxo22_reg: ldo_vxo22 {
> +            regulator-name = "vxo22";
> +            regulator-min-microvolt = <2200000>;
> +            regulator-max-microvolt = <2200000>;
> +            regulator-enable-ramp-delay = <110>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vaud22_reg: ldo_vaud22 {
> +            regulator-name = "vaud22";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <2200000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vcama_reg: ldo_vcama {
> +            regulator-name = "vcama";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vaud28_reg: ldo_vaud28 {
> +            regulator-name = "vaud28";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vadc18_reg: ldo_vadc18 {
> +            regulator-name = "vadc18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vcn35_reg: ldo_vcn35 {
> +            regulator-name = "vcn35";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3600000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vio28_reg: ldo_vio28 {
> +            regulator-name = "vio28";
> +            regulator-always-on;
> +            regulator-boot-on;
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vusb_reg: ldo_vusb {
> +            regulator-name = "vusb";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vmc_reg: ldo_vmc {
> +            regulator-name = "vmc";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vmch_reg: ldo_vmch {
> +            regulator-name = "vmch";
> +            regulator-min-microvolt = <3000000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vemc3v3_reg: ldo_vemc3v3 {
> +            regulator-name = "vemc3v3";
> +            regulator-min-microvolt = <3000000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vgp1_reg: ldo_vgp1 {
> +            regulator-name = "vgp1";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vgp2_reg: ldo_vgp2 {
> +            regulator-name = "vgp2";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vcn18_reg: ldo_vcn18 {
> +            regulator-name = "vcn18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vcamaf_reg: ldo_vcamaf {
> +            regulator-name = "vcamaf";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vm_reg: ldo_vm {
> +            regulator-name = "vm";
> +            regulator-min-microvolt = <1240000>;
> +            regulator-max-microvolt = <1390000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vio18_reg: ldo_vio18 {
> +            regulator-name = "vio18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vcamd_reg: ldo_vcamd {
> +            regulator-name = "vcamd";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vcamio_reg: ldo_vcamio {
> +            regulator-name = "vcamio";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vm25_reg: ldo_vm25 {
> +            regulator-name = "vm25";
> +            regulator-min-microvolt = <2500000>;
> +            regulator-max-microvolt = <2500000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vefuse_reg: ldo_vefuse {
> +            regulator-name = "vefuse";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <2000000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +    };
> diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> new file mode 100644
> index 000000000000..8bd1a13faad8
> --- /dev/null
> +++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
> +#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
> +
> +/*
> + * Buck mode constants which may be used in devicetree properties (eg.
> + * regulator-initial-mode, regulator-allowed-modes).
> + * See the manufacturer's datasheet for more information on these modes.
> + */
> +
> +#define MT6392_BUCK_MODE_AUTO		0
> +#define MT6392_BUCK_MODE_FORCE_PWM	1
> +
> +/*
> + * LDO mode constants which may be used in devicetree properties (eg.
> + * regulator-initial-mode, regulator-allowed-modes).
> + * See the manufacturer's datasheet for more information on these modes.
> + */
> +
> +#define MT6392_LDO_MODE_NORMAL		0
> +#define MT6392_LDO_MODE_LP		1
> +
> +#endif



