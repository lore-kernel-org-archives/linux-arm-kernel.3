Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29179C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vmXCt6ya0mUDM3tmOji9Mkco1rXEOXdIhFzW5qA5Qsk=; b=vMgdlaATPhocxAIWoU4u4JxADf
	ccuflsGQY0wTGYP0+i/ORrH5FzHQyr5W2ewXrFV2lczcrrCQtn0gdpr5GhjKa4h/qYTSgYkJ43b5e
	CiZM1yz8EgF7Cn+ihViYPS1UIaFfV2mhEl9eMn1PkwNFg9RJ9vlhZE8lU0NFPjumlNyvicFFu7YP0
	Macm1MTY3YIjlip2GWbFoDzhbFqJab9abcSEBuUA/fLAtCAtP4v9RwS/yyaLVol5gGWNFTS7aCEXG
	F6yg6byWkp+zjPXnZKGsfWuJYiF0BWWaQgo2t4K0Qyv8eiwZ3ZOVYznWHm8uTtYrGRYIS5pf9wagx
	WiuO0eXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBu-00000002bUh-2Sf6;
	Wed, 01 Jul 2026 16:53:38 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weyBp-00000002bHP-463a;
	Wed, 01 Jul 2026 16:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782924811;
	bh=F3uHPVS1XECBg+1FJgBsfQzbfVfb5e4T+gqzbMq2A5Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=foSZak7+BxtLEwRYgivu+0IOUXwZ3OQ04aj+NCtX/mR7oZk0d2+9TLw6JHLv9hqvH
	 gD+XAmcBQwF9Oo0c9klBThjh/SCCPAsGPNYZvpyVx+o+lBUT9/m3TPgWlvBT64AESc
	 1VYYtkRp2dAH/mYKaR93afRjTL1tHfoNvFgEK3LH0j/n6D8lm89ZeViVFCEzORlOM+
	 NO6a2s0LYpYd1YW3iAgo9LPKspHAlUFw/CVSibbOudHrMQUoG3fqEVt3205ewyFn69
	 a+j72Ht3QSFWjtbjkcndWh+WwsAmy/6BqWzY3mmuyvE8chms1hnDugSMwuCq/S4Le6
	 LfnTMMuWfCOpQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A56B317E0CA2;
	Wed,  1 Jul 2026 18:53:30 +0200 (CEST)
Message-ID: <f56fcbae-3ff5-46c3-bbe7-7eac462f7dd2@collabora.com>
Date: Wed, 1 Jul 2026 18:53:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/42] dt-bindings: display: mediatek: Introduce Digital
 Video Output HW
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, kernel@collabora.com,
 tzimmermann@suse.de, chunkuang.hu@kernel.org, simona@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, jason-jh.lin@mediatek.com,
 airlied@gmail.com, conor+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mripard@kernel.org, devicetree@vger.kernel.org, justin.yeh@mediatek.com
References: <20260701122057.19648-1-angelogioacchino.delregno@collabora.com>
 <20260701122057.19648-24-angelogioacchino.delregno@collabora.com>
 <178291581273.4115171.8214844308967079622.robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <178291581273.4115171.8214844308967079622.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_095334_207169_1CEC30E8 
X-CRM114-Status: GOOD (  18.27  )
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

On 7/1/26 16:23, Rob Herring (Arm) wrote:
> 
> On Wed, 01 Jul 2026 14:20:38 +0200, AngeloGioacchino Del Regno wrote:
>> Add documentation for the Digital Video Output (DVO) IP found in
>> the newer generation SoCs MT8196, MT8189 and their variants.
>>
>> This is effectively a more capable block replacing the DisplayPort
>> Interface (DPI/DP_INTF) one found in older SoCs.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../display/mediatek/mediatek,mt8196-dvo.yaml | 142 ++++++++++++++++++
>>   1 file changed, 142 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 

Those errors on literally all bindings are quite embarassing. Oops.

Already fixed locally, but since this is a huge series, I will allow some time
for reviews before compulsively pushing a v2.

Cheers,
Angelo

> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: ignoring, error in schema: properties: compatible
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.yaml: properties:compatible: [{'const': 'mediatek,mt8189-dp-dvo'}, {'const': 'mediatek,mt8189-edp-dvo'}, {'const': 'mediatek,mt8196-edp-dvo'}] is not of type 'object', 'boolean'
> Traceback (most recent call last):
>    File "/usr/local/bin/dt-doc-validate", line 8, in <module>
>      sys.exit(main())
>               ~~~~^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 66, in main
>      ret |= check_doc(f)
>             ~~~~~~~~~^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/doc_validate.py", line 37, in check_doc
>      dtsch.check_schema_refs()
>      ~~~~~~~~~~~~~~~~~~~~~~~^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 242, in check_schema_refs
>      self._check_schema_refs(resolver, self)
>      ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
>      self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
>      ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                              has_constraint=has_constraint)
>                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 212, in _check_schema_refs
>      self._check_schema_refs(resolver, v, parent=k, is_common=is_common,
>      ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>                              has_constraint=has_constraint)
>                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/dtschema/schema.py", line 203, in _check_schema_refs
>      ref_sch = resolver.lookup(schema['$ref']).contents
>                ~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^
>    File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 682, in lookup
>      retrieved = self._registry.get_or_retrieve(uri)
>    File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 422, in get_or_retrieve
>      registry = self.crawl()
>    File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 500, in crawl
>      id = resource.id()
>    File "/usr/local/lib/python3.13/dist-packages/referencing/_core.py", line 231, in id
>      id = self._specification.id_of(self.contents)
>    File "/usr/local/lib/python3.13/dist-packages/referencing/jsonschema.py", line 50, in _dollar_id
>      return contents.get("$id")
>             ^^^^^^^^^^^^
> AttributeError: 'list' object has no attribute 'get'
> Documentation/devicetree/bindings/display/mediatek/mediatek,mt8196-dvo.example.dtb: /example-0/dvo@324c0000: failed to match any schema with compatible: ['mediatek,mt8196-edp-dvo']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260701122057.19648-24-angelogioacchino.delregno@collabora.com
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


