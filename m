Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6E1CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 07:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTKBt8PvHsFKzkLrcA+CPpdxHiWQEG0VWl/B6OlMjD0=; b=SnNywm2rs19bNfdvmHcNVLHYps
	dCGpS4nctxjNYA6/pQGkFpRl8LglVtbMuUTcqiNJ0DNVk3+yxaxn3GMx3OZUtpuDbHMwEdbaKuwTl
	hSnXD4A7aELjiYOVzEg/+YfOoyfIYEHeLXS7wMYof/IBmS3eBfn3NXKMMOciIZ3Xu1CuytzduC1MC
	oFkev1j/siiMtniUL8Q+vCGO9FYyyC7cs7EbmIAOoBcjE/S16rrDzKxwkQZmOr8FLhl9xUwrGEfsc
	uHZCFPCofG4GV2svWco8gaKfAvi4wegtACtHjRrFgpAwtd9CLTIW2ZzyXlp9B81YWyj/3dvieh2Ie
	pOEwW42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4E2V-00000009ouj-0M6I;
	Thu, 02 Oct 2025 07:47:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4E2T-00000009ouE-0akg;
	Thu, 02 Oct 2025 07:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759391262;
	bh=dI0wrkAckMH7G1m4ya3Dj7swPNyC71r0eGahUHaJytU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fc5bfpOIErakjiawbB16GBvXBuIlkWOx6lN+lhFFd2c2EYdM3RMGjx2N67KBbKkpN
	 7PkU3vq1K8q9COKVq2uAXa1j5uyXD2eGedNVXUKGmLGUHYpAfB7wTnnJJoQJoQmGTk
	 Y6S3qS+xhO5/at0687V8duOoCnGKnvI9krkjVN7g7cuRHKh7UMRyGxzBS2XncgBzoz
	 PywfQNyp3y4GBa7mDDAYnxXj8lDAIUBetdeUNt5WEyn2B80LOA/K/3lu6eqOfR4Qyb
	 C24m2gWXQV8n/Cetp0eecCloTXmxVouVe+ERYiQvXBIztkFsDT8B7X3FvaUwukC5j9
	 tvZ7jYtqHpuMw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3D22817E0AC3;
	Thu,  2 Oct 2025 09:47:42 +0200 (CEST)
Message-ID: <6d5553da-4c0e-4957-8d74-314a9ef23301@collabora.com>
Date: Thu, 2 Oct 2025 09:47:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] dt-bindings: regulator: Document MediaTek MT6373
 PMIC Regulators
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org,
 igor.belwon@mentallysanemainliners.org
References: <20251001111316.31828-1-angelogioacchino.delregno@collabora.com>
 <20251001111316.31828-6-angelogioacchino.delregno@collabora.com>
 <20251001155300.GC1833526-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251001155300.GC1833526-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_004745_364012_E204B1D7 
X-CRM114-Status: GOOD (  19.99  )
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

Il 01/10/25 17:53, Rob Herring ha scritto:
> On Wed, Oct 01, 2025 at 01:13:12PM +0200, AngeloGioacchino Del Regno wrote:
>> Add bindings for the regulators found in the MediaTek MT6363 PMIC,
>> usually found in board designs using the MT6991 Dimensity 9400 and
>> on MT8196 Kompanio SoC for Chromebooks, along with the MT6316 and
>> MT6363 PMICs.
>>
>> Link: https://lore.kernel.org/r/20250715140224.206329-6-angelogioacchino.delregno@collabora.com
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../regulator/mediatek,mt6373-regulator.yaml  | 137 ++++++++++++++++++
>>   1 file changed, 137 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
>> new file mode 100644
>> index 000000000000..cb721d81b77c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6373-regulator.yaml
>> @@ -0,0 +1,137 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6373-regulator.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek MT6373 PMIC Regulators
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +
>> +description:
>> +  The MT6373 SPMI PMIC provides 10 BUCK and 23 LDO (Low DropOut) regulators
>> +  and can optionally provide overcurrent warnings with one ocp interrupt
>> +  for each voltage regulator.
>> +
>> +properties:
>> +  compatible:
>> +    const: mediatek,mt6373-regulator
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  vsys-vbuck0-supply:
>> +    description: Input supply for vbuck0
>> +
>> +  vsys-vbuck1-supply:
>> +    description: Input supply for vbuck1
>> +
>> +  vsys-vbuck2-supply:
>> +    description: Input supply for vbuck2
>> +
>> +  vsys-vbuck3-supply:
>> +    description: Input supply for vbuck3
>> +
>> +  vsys-vbuck4-supply:
>> +    description: Input supply for vbuck4
>> +
>> +  vsys-vbuck5-supply:
>> +    description: Input supply for vbuck5
>> +
>> +  vsys-vbuck6-supply:
>> +    description: Input supply for vbuck6
>> +
>> +  vsys-vbuck7-supply:
>> +    description: Input supply for vbuck7
>> +
>> +  vsys-vbuck8-supply:
>> +    description: Input supply for vbuck8
>> +
>> +  vsys-vbuck9-supply:
>> +    description: Input supply for vbuck9
>> +
>> +  vs1-ldo1-supply:
>> +    description: Input supply for vant18, vaud18, vcn18io
>> +
>> +  vs2-ldo1-supply:
>> +    description: Input supply for vrf12-aif, vrf13-aif
>> +
>> +  vs3-ldo1-supply:
>> +    description: Input supply for vrf09-aif, vsram-digrf-aif
>> +
>> +  vsys-ldo1-supply:
>> +    description: Input supply for vcn33-1, vcn33-2, vmc
>> +
>> +  vsys-ldo2-supply:
>> +    description:
>> +      Input supply for vaux18, vcn33-3, vefuse, vfp, vibr, vio28, vtp, vusb
>> +
>> +  vsys-ldo3-supply:
>> +    description: Input supply for vmch, vmch-eint-high/low
>> +
>> +patternProperties:
>> +  "^v(ant|aud|aux)18$":
>> +    $ref: "#/$defs/mediatek-mt6373-ldo-common"
>> +
>> +  "^vbuck([0-9])$":
> 
> Don't need ().
> 
>> +    type: object
>> +    $ref: regulator.yaml#
>> +    properties:
>> +      regulator-allowed-modes:
>> +        description: |
>> +          Allowed Buck regulator operating modes allowed. Valid values below.
>> +            0 - Normal mode with automatic power saving, reducing the switching
>> +                frequency when light load conditions are detected
>> +            1 - Forced Continuous Conduction mode (FCCM) for improved voltage
>> +                regulation accuracy with constant switching frequency but lower
>> +                regulator efficiency
>> +            2 - Forced Low Power mode for improved regulator efficiency, used
>> +                when no heavy load is expected, does not limit the maximum out
>> +                current but unless only a light load is applied, there will be
>> +                regulation accuracy and efficiency losses.
>> +            3 - Forced Ultra Low Power mode for ultra low load, this greatly
>> +                reduces the maximum output power, makes the regulator to be
>> +                efficient only for ultra light load, and greatly reduces the
>> +                quiescent current (Iq) of the buck.
>> +        maxItems: 3
>> +        items:
>> +          enum: [ 0, 1, 2, 3 ]
>> +    unevaluatedProperties: false
>> +
>> +  "^v(cn18io|cn33-[123]|efuse|fp|tp|ibr|io28|sram-digrf-aif|usb)":
> 
> Missing '$' anchor.
> 
>> +    $ref: "#/$defs/mediatek-mt6373-ldo-common"
>> +
>> +  "^vmc(h)?$":
> 
> Don't need ().
> 
>> +    $ref: "#/$defs/mediatek-mt6373-ldo-common"
>> +
>> +  "^vmch-eint-(low|high)?$":
> 
> vmch-eint- is a valid name?
> 

Whoops. No, that was supposed to allow vmch-eint-low, vmch-eint-high.

>> +    $ref: "#/$defs/mediatek-mt6373-ldo-common"
>> +
>> +  "^vrf(09|12|13|18|io18)-aif$":
>> +    $ref: "#/$defs/mediatek-mt6373-ldo-common"
>> +
>> +$defs:
>> +  mediatek-mt6373-ldo-common:
> 
> The name is local to the schema, so 'ldo-common' would be sufficient.
> 

Okay, I was trying to avoid pollution - but effectively being this local it's not
necessary to make this name that long.

Will come up with a v7 sooner than later.

Thanks!
Angelo

>> +    type: object
>> +    $ref: regulator.yaml#
>> +    unevaluatedProperties: false
>> +    properties:
>> +      regulator-allowed-modes:
>> +        description: |
>> +          Allowed LDO regulator operating modes allowed. Valid values below.
>> +            0 - Normal mode with automatic power saving, reducing the switching
>> +                frequency when light load conditions are detected
>> +            2 - Forced Low Power mode for improved regulator efficiency, used
>> +                when no heavy load is expected, does not limit the maximum out
>> +                current but unless only a light load is applied, there will be
>> +                regulation accuracy and efficiency losses.
>> +        maxItems: 2
>> +        items:
>> +          enum: [ 0, 2 ]
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> -- 
>> 2.51.0
>>


