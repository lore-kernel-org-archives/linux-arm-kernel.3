Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D3FC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAmFkJlIHv0RsDxFcKtQiZcM/gJjJy7hZjwhPvCI5tI=; b=APKR9DZQ9DnFfqtBBAqBpmUwU3
	gizHauzJ3BCGS5xcuEqbrzTJJvcUjNeT5S4HTk4sNA6vtBNIdCcaF7M1tuXWrLGtAQUwL11eNd5q0
	YD9uzoj9UGVepk2i7/lld895IpQy6R3cN+6OIPWVK1PF++1ibkKYDY3Y7mgFVsZSRY0fyHK2C221P
	UJsjsCO1iyKp6BpcnsLYtvcPDTsIOokiiGJ0ZxThpDyHCk3qgTRm6zrC9sxOcqgsuvMZ6q7jdzEu8
	DEJOgf+QIdYchg5warYT4nAPlVeLh979pVzKHo+a2TRXOUnl8yROS5qe7RnNybC2hWVlijO8YoeBA
	ooJk9gEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkB0-0000000Gn9J-21tj;
	Tue, 29 Jul 2025 13:15:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugk8Z-0000000Gmsd-1gr7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 13:12:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21812601EE;
	Tue, 29 Jul 2025 13:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A2AC4CEEF;
	Tue, 29 Jul 2025 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753794776;
	bh=ZYf2Y5Gf2AmhWIYZ16idIUzzM0Y2potg0/rjZjCDgJc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=uf40uzF+GvhUO93onC6SIES/BWmFXoppojG6HmARmQlGzA/cm5Q9q+JVsbPpCgBpr
	 A4Dz6SS3hc447U3R86lapPlTUpegI42cKyWp3bnwxYIEF7wl/ZCU1UnldCaOBW36BL
	 Doi72w57H6KwfDKvFAmYs0e/H4mrRMFXGeKyPqYSQc95WJo2xMBSFdnaTKjxw5dzdH
	 fnzWDoL5HLCUH7sJB/cCm2nqIzY38p3+ItXWeI3K/3LF4qYsFQrQvFv317PV7h59cK
	 q/OzxlgsGz4ZeTZNL72DGZDDvAM2hQJHyIksAlFZuQJpid5qcQtErs6QLZI7iK0LbC
	 dRv6TCPQ2S7og==
Date: Tue, 29 Jul 2025 08:12:55 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, john@polyhex.net, 
 imx@lists.linux.dev
To: WangErQian <WangErQianY@icloud.com>
In-Reply-To: <20250729031351.3875406-1-WangErQianY@icloud.com>
References: <20250729031351.3875406-1-WangErQianY@icloud.com>
Message-Id: <175379477491.387965.6675785034730375913.robh@kernel.org>
Subject: Re: [PATCH v1 dt-bindings]dt-bindings: debix-model-a: Add bindings
 for BT and audio
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


On Tue, 29 Jul 2025 11:13:52 +0800, WangErQian wrote:
> Add bindings for Debix Model A Bluetooth and audio
> 
> This patch adds device tree binding documentation for:
> - fsl,mxc_bt_rfkill.yaml: Bluetooth RF control node
> - fsl,imx-audio-es8316.yaml: Audio codec interface
> 
> Signed-off-by: WangErQian <WangErQianY@icloud.com>
> ---
>  .../bindings/bluetooth/fsl,mxc_bt_rfkill.yaml | 70 +++++++++++++++
>  .../bindings/sound/fsl,imx-audio-es8316.yaml  | 88 +++++++++++++++++++
>  2 files changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml:2:1: [error] missing document start "---" (document-start)
./Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml:40:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml:40:21: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml:41:14: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:2:1: [error] missing document start "---" (document-start)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:21:14: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:12: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:19: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:38: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:56: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:36:65: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml:37:14: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: ignoring, error in schema: properties: pinctrl-0: type
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: ignoring, error in schema: properties: hp-det-gpio: type
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: properties:pinctrl-0:type: 'anyOf' conditional failed, one must be fixed:
	'phandle' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'phandle' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: properties:pinctrl-names: {'maxItems': 1, 'items': [{'const': 'default'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: properties:pinctrl-0:type: 'phandle' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml: properties:status:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-routing:type: 'anyOf' conditional failed, one must be fixed:
	'string-array' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'string-array' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-cpu:type: 'anyOf' conditional failed, one must be fixed:
	'phandle' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'phandle' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-codec:type: 'anyOf' conditional failed, one must be fixed:
	'phandle' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'phandle' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:hp-det-gpio:type: 'anyOf' conditional failed, one must be fixed:
	'phandle-array' is not one of ['array', 'boolean', 'integer', 'null', 'number', 'object', 'string']
	'phandle-array' is not of type 'array'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-routing:items: {'minItems': 2, 'maxItems': 2, 'items': [{'description': 'Source endpoint (e.g., "Mic Jack")'}, {'description': 'Sink endpoint (e.g., "MIC2")'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-routing:items: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'Source endpoint (e.g., "Mic Jack")'}, {'description': 'Sink endpoint (e.g., "MIC2")'}] is too long
	[{'description': 'Source endpoint (e.g., "Mic Jack")'}, {'description': 'Sink endpoint (e.g., "MIC2")'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:hp-det-gpio: {'type': 'phandle-array', 'description': 'GPIO for headphone detection (active high)', 'maxItems': 1, 'items': [{'description': 'GPIO specifier (controller + pin + flags)'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:model:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-cpu:type: 'phandle' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-codec:type: 'phandle' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:format:type: 'string' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:hp-det-gpio:type: 'phandle-array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:audio-routing:type: 'string-array' is not one of ['boolean', 'object']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml: properties:hp-det-gpio: 'anyOf' conditional failed, one must be fixed:
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'items' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	1 is less than the minimum of 2
		hint: Arrays must be described with a combination of minItems/maxItems/items
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
Error: Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.example.dts:21.17-18 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dts:26.13-26: Warning (reg_format): /example-0/es8316@11:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8mp-sai'] is too short
	'fsl,imx8mp-sai' is not one of ['fsl,imx6ul-sai', 'fsl,imx7d-sai']
	'fsl,imx8mp-sai' is not one of ['fsl,imx6sx-sai', 'fsl,imx7ulp-sai', 'fsl,imx8mq-sai', 'fsl,imx8qm-sai', 'fsl,imx8ulp-sai', 'fsl,imx93-sai', 'fsl,imx95-sai', 'fsl,vf610-sai']
	'fsl,imx8mp-sai' is not one of ['fsl,imx94-sai']
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'dmas' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): 'dma-names' is a required property
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: sai@40031000 (fsl,imx8mp-sai): Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/fsl,sai.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: es8316@11 (everest,es8316): '#sound-dai-cells' is a required property
	from schema $id: http://devicetree.org/schemas/sound/everest,es8316.yaml#
Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.example.dtb: /example-0/sound: failed to match any schema with compatible: ['fsl,imx-audio-es8316']
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1526: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250729031351.3875406-1-WangErQianY@icloud.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


