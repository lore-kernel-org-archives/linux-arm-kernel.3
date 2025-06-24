Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3136CC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vimXIdEqs+jj2t9c1w64RO1FUjCsWO2UlYt11fWRQUE=; b=ne77tZn3fEggoZ74GYxXjSbyUp
	S1RYkA5fFUG6BmL76voxKk/t6Rfj/2d4mxTX87hMNDDvPgQ7QQLhI2HxmfRBnxcdwPdsgWwgRTVpl
	JKmDZlBUjAdcHFgHhQrWeoOq/8vogFHfddmEKXgkkqSplompDUZxVFg/DAsb9mz9otqIcXuCHHT/u
	v8HWasioOpbKajOlBvmOGHA2KFB6P2mTBDOHHvjhroZu75s7wT2bMArXcnYDtjdJKLm6BpoL9KYqk
	m9N18l5VJUjMBA4ur2fetN040aF7ZPIA6+u6jj7G0hXAKlPn7GXuqR5vJDdbxinxbW3DmRbIxiOF/
	N0k5+0EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyIW-00000004udd-3uRQ;
	Tue, 24 Jun 2025 07:42:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy4J-00000004rer-05A2;
	Tue, 24 Jun 2025 07:27:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750750065;
	bh=2VRlaahf+tQJQsFz0DN32NcUbTYYVROMUttudjfToi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MARKBIXlPxz2c3Aj7cq2Yj9Ci3qEsh1TvnReud096eqPVZ1zy9JEPDEDb5Rw7TZgY
	 nmVnhzQkDecSH1xqCEx+zfoLAGVG+bJ1KUjr8vS1pfECnXeGo6AmRcvWr6xas3T55Z
	 xdA+r2ds2AAhQ6gXDMZnpuoCgD9yhe0tg/CtBKmzqNxUETe7foLF/woYD6yZ/TPUmX
	 eeVNbV9UF2DnbuBAf2NBaUUWRJfN7F+bKOBLDr1VzJwgXHJ0/UsfN1EV4nb7yJBDpm
	 qFKULyxZjxxldJ/ddg5NzqsZ+zAR6H4ZPn1M5jS0hdKUTCY0gTUiFD6/Rg87X1NwLd
	 cHR1Y9d+vmjfA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9811517E0EA4;
	Tue, 24 Jun 2025 09:27:44 +0200 (CEST)
Message-ID: <480c78cc-076f-44e2-bd90-1dcc91a235ee@collabora.com>
Date: Tue, 24 Jun 2025 09:27:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, devicetree@vger.kernel.org
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
 <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
 <175068852802.3230004.1923972457454728043.robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <175068852802.3230004.1923972457454728043.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_002747_246676_10815D1B 
X-CRM114-Status: GOOD (  19.04  )
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

Il 23/06/25 16:22, Rob Herring (Arm) ha scritto:
> 
> On Mon, 23 Jun 2025 14:00:37 +0200, AngeloGioacchino Del Regno wrote:
>> Add a binding for the MediaTek MT6363/6373 (and similar) multi
>> function PMICs connected over SPMI.
>>
>> These PMICs are found on board designs using newer MediaTek SoCs,
>> such as the Dimensity 9400 Smartphone chip, or the Chromebook
>> MT8196 chip.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml:

Yeah, sorry about not adding the information at the very beginning (but I suspect
the bot would still complain), but anyway that's because this series depends on the
one that actually introduces the bindings for the regulators that are referenced in
here...

https://lore.kernel.org/all/20250623120016.108732-1-angelogioacchino.delregno@collabora.com


Cheers,
Angelo


> 	Error in referenced schema matching $id: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml
> 	Tried these paths (check schema $id if path is wrong):
> 	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/mediatek,mt6363-regulator.yaml
> 	/usr/local/lib/python3.11/dist-packages/dtschema/schemas/regulator/mediatek,mt6363-regulator.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: pmic@4 (mediatek,mt6363): regulators: 'oneOf' conditional failed, one must be fixed:
> 	{'compatible': ['mediatek,mt6363-regulator']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/regulator/mediatek,mt6363-regulator.yaml#"}
> 	{'compatible': ['mediatek,mt6363-regulator']} should not be valid under {'description': "Can't find referenced schema: http://devicetree.org/schemas/regulator/mediatek,mt6373-regulator.yaml#"}
> 	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6363.yaml#
> Documentation/devicetree/bindings/mfd/mediatek,mt6363.example.dtb: /example-0/spmi/pmic@4/regulators: failed to match any schema with compatible: ['mediatek,mt6363-regulator']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250623120038.108891-2-angelogioacchino.delregno@collabora.com
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



