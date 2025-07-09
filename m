Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912ECC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 02:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6d6mrXkcQ61pMrpM5kPsuHlNIFPwxqOFCuXcVr5k2B8=; b=Dt5fcD+L/LVNCRkSfi8WsAigPC
	K5rXaJJD4NxbEqTL8W7i9OZgYM4Wp4Z3+h3hc89OKxRPzHVztyTSVMN3VzBawq6AU8RdIxUK6X6Nk
	wWIDHe4Wvz5vGRDMjoIf/TN9k1c7SiuX4BTYY1jXNngWbYSOtdd9SZncT42etxPVEyZcu3McbgacN
	8KjTcA7ZrsfZzcGtqtrZvrqBxDqEod3dPXpexGPyCxJ1Ae1zu/eeMf6t7p2XoZqG2p07/ZMx2clJ6
	LDs39gDIWTV1Enxg50XJrGVPeSzIFxXlYTz40e/78iNeCrHuyo9VmQ33ueqsJi0u8voHMe1owX9v9
	9juOB5og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZK9A-00000007915-0yjc;
	Wed, 09 Jul 2025 02:02:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZK6p-000000078sK-2xG1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 02:00:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D811C61151;
	Wed,  9 Jul 2025 02:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614DFC4CEED;
	Wed,  9 Jul 2025 02:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752026429;
	bh=SCd2Rskvq412sYYjzoMaYjBEDDWKuLbV0h++4NRJ7Hs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vPp/d4xmieKxl3KV4U+NXVMO0UtLsKDJYyTkoEpjqNWtAzrJyoM/zofD8TJXrbAPm
	 SWnAnNcwkdNkA/zFbs1EHhiobFGc3f3wk9LJM303f27o49ETNfZRnriXDIL5rX7/tB
	 UO9TKqLMhcq1N2vtM72KRIBoasNtxtoyas7T35Rz96orCLumUejoob5PinY1+cmdtb
	 Dfw93GcD1O1epJevRBYtH+tuGkhau9TpxKvsp4S2GL66e5OVjBRcOMSxChCkLKzTqK
	 J6Vg3BY7OhyWCFMaV+1F6ikOwi82usmJmxaYfqGD4hZ9aszzXiGqy9hcmb72CVO8SB
	 YYaXQi7gnQ5BA==
Date: Tue, 08 Jul 2025 21:00:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, 
 krzk+dt@kernel.org, s.nawrocki@samsung.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com, 
 broonie@kernel.org
To: ew kim <ew.kim@samsung.com>
In-Reply-To: <20250709001239.379695-1-ew.kim@samsung.com>
References: <CGME20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19@epcas2p2.samsung.com>
 <20250709001239.379695-1-ew.kim@samsung.com>
Message-Id: <175202642853.1975547.14734415377016191511.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Add samsung,abox-generic document
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


On Wed, 09 Jul 2025 09:12:39 +0900, ew kim wrote:
> Add soundcard bindings for the abox generic of exynus automotive.
> 
> Signed-off-by: ew kim <ew.kim@samsung.com>
> ---
>  .../bindings/sound/samsung,abox-generic.yaml  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:4:6: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:43:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:43:21: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: maintainers:0: {'name': 'Eunwoo Kim', 'email': 'ew.kim@samsung.com'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: properties:ranges: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/samsung/abox-generic.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dts:26.11-18: Warning (ranges_format): /example-0/abox_generic@generic:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dts:18.44-27.11: Warning (unit_address_vs_reg): /example-0/abox_generic@generic: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dtb: abox_generic@generic (samsung,abox_generic): ranges: True is not of type 'object'
	from schema $id: http://devicetree.org/schemas/soc/samsung/abox-generic.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250709001239.379695-1-ew.kim@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


