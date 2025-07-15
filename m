Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029AAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jy7PA3qNQMRcp4Zu5n/JEVScZp8bxdQd7ISHfmC/Tng=; b=yZM7f3yqmJeEE3DnVsIloaar3G
	/5zQtpuseB2MqGXUzgP5IEG9RVdVKlvdHUmuN/uaE7Fgg9Hte0fbC1pfbWZs5YbZenI1J96fsl7ZX
	SAuRU1ZdOVzl4SbiLGvgry1Tt8AONbumsAmVww0kP5YWWkKaLR7mXKgOa4Q932oXqi1m0sOXoxdIA
	5rrTZkooLou75XxvKxjhIyEEG2zAR9VL7fipCUoRHVT9Yh5y5dQAcfTQbNYh3uLgwEYrX+gBYGmVJ
	yFR3MjmLK7mYsFDiM5sNJvGW68j9HXa9g0St485Z8LF9CVRf+LQl+83zi7Dta4InJLtXrhNQ9WQGi
	qVfApzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubhZJ-00000005aqX-4B68;
	Tue, 15 Jul 2025 15:27:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubg9g-00000005Hgc-1gyr;
	Tue, 15 Jul 2025 13:57:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752587830;
	bh=VcoITfCDsF67h3hBQmDuBarBljyPQh2YV8UKRsZfVmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQlBVBSMdmKKKX3dY5vPWcDUMiXRwa8DBqYjx2o5An3IXCbDXsBri6CUZUaaDSCT1
	 D6afaCOZhejdPJyj6mKp1UKMgF3rUX70AUNYmS8PcqTEtfgjjzlgUM08C+yy/o/Riq
	 w7bVG+lg6xbtaZ4N3JMWsGWoXupNJomHfFG+Ry5cRZjCI99eQVEBGSxF8OZ7fEghcW
	 YWDueW5aCWEhItpy+8luatBmaqdCMmnfSMu75gominLtK4KUOinCy1rcPa2VVXtglS
	 JryzLWDVyKCFdIkfGDNTDyMgCfRVs9t6G7oi1ZQkdB4XULWLzlfMo/U23SNp85E8ot
	 tBCXuotie9wYA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0962317E1293;
	Tue, 15 Jul 2025 15:57:09 +0200 (CEST)
Message-ID: <4facd10a-f46f-4cb9-bdef-71cc88ebc059@collabora.com>
Date: Tue, 15 Jul 2025 15:57:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: broonie@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, conor+dt@kernel.org, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 krzk+dt@kernel.org, lgirdwood@gmail.com
References: <20250715115718.176495-1-angelogioacchino.delregno@collabora.com>
 <20250715115718.176495-8-angelogioacchino.delregno@collabora.com>
 <175258775126.1133153.9935401889666941502.robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <175258775126.1133153.9935401889666941502.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_065712_592319_A16BA32B 
X-CRM114-Status: GOOD (  17.98  )
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

Il 15/07/25 15:55, Rob Herring (Arm) ha scritto:
> 
> On Tue, 15 Jul 2025 13:57:17 +0200, AngeloGioacchino Del Regno wrote:
>> Add a binding for the MediaTek MT6363/6373 (and similar) multi
>> function PMICs connected over SPMI.
>>
>> These PMICs are found on board designs using newer MediaTek SoCs,
>> such as the Dimensity 9400 Smartphone chip, or the Chromebook
>> MT8196 chip.
>>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> Link: https://lore.kernel.org/r/20250623120038.108891-2-angelogioacchino.delregno@collabora.com
>> Link: https://lore.kernel.org/r/20250707134451.154346-8-angelogioacchino.delregno@collabora.com
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/mfd/mediatek,mt6363.yaml         | 110 ++++++++++++++++++
>>   1 file changed, 110 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): adc@1000: 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): regulators@30: 'oneOf' conditional failed, one must be fixed:
> 	'reg' does not match any of the regexes: '^buck-(sshub[124]|vb[1-7]|vs[1-3])$', '^ldo-v(aux|m|rf-io|tref)18$', '^ldo-va(12-1|12-2|15)$', '^ldo-vcn(13|15)$', '^ldo-vio(0p75|18)$', '^ldo-vrf(0p9|12|13|18)$', '^ldo-vsram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$', '^ldo-vufs(12|18)$', '^pinctrl-[0-9]+$'
> 	'reg' does not match any of the regexes: '^pinctrl-[0-9]+$', '^v(ant|aud|aux)18$', '^v(cn18io|efuse|ibr|io28|sram-digrf-aif|usb)', '^v(f|t)p', '^vbuck([0123456789]|4-ufs)$', '^vbuck4(-ufs)?$', '^vcn33-[123]$', '^vmc(h)?$', '^vmch-(eint-low|eint-high)?$', '^vrf(09|12|13|18|io18)-aif$', '^vsim[12]$'
> 	'mediatek,mt6373-regulator' was expected
> 	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: regulators@30 (mediatek,mt6363-regulator): 'reg' does not match any of the regexes: '^buck-(sshub[124]|vb[1-7]|vs[1-3])$', '^ldo-v(aux|m|rf-io|tref)18$', '^ldo-va(12-1|12-2|15)$', '^ldo-vcn(13|15)$', '^ldo-vio(0p75|18)$', '^ldo-vrf(0p9|12|13|18)$', '^ldo-vsram-(apu|cpub|cpum|cpul|digrf|mdfe|modem)$', '^ldo-vufs(12|18)$', '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: adc@1000 (mediatek,mt6363-auxadc): 'reg' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250715115718.176495-8-angelogioacchino.delregno@collabora.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

Uff. I've sent the wrong series. Sorry for the noise.

Sending v5 asap.

Sorry again,
Angelo

