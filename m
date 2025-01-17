Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527A6C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 05:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaPuuxL6krq9hFHl10Qvd2GGre9N8Sa7CA7uP9JPl+E=; b=aSviqBt3j2ZqSTXsbh/xmoA2Vf
	PU4v9FfO/DLxwLw5DjQYi9WIc5CzayD1qaXFX+hCW+soQvH3JKiXpynPRy6geYZAgEhCPG9HXVR1o
	TLzc4eQHHwWEjNAlgI3RI2m48lSQyT7RjZA4hcoaHvGA+ij+i0YxeyrNG2YtvuYbB9OHyWYQverRy
	7EOiWLA2h89JtcmzwFCIdoXFRBAeJ8fYUIGZRNAa7HqIU436y1TSwYjrnYSVpWg2AeHwRkbiJeAh5
	/KfyRE6EoZhWzQ6ngzv3mTB1u+/6987Bf+6gEQeBU8MY3uvaXgvcMCW8VFUz9208JrW1aHRgGHoPc
	8xvX85Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYeoB-0000000H2Qb-2zLk;
	Fri, 17 Jan 2025 05:22:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYemu-0000000H2KT-1JED;
	Fri, 17 Jan 2025 05:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83FBDA426D0;
	Fri, 17 Jan 2025 05:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89D7C4CEE0;
	Fri, 17 Jan 2025 05:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737091255;
	bh=LHwHod7bdCR2grreCvjBjvMriFbkIIFPNOvzQK9auR8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=g/ZyMZbRlK8ueBAnkYfQGeK7gVUOilexmC6Bpax6g+M1SflZYnFsFMO/Nftk/Qzkx
	 VsfYCY9EZRbtij9ZaQs0LDweb1HB0oGCud/7Yb/qjfzsF4uS1wCzGNF9COL7bcjJRS
	 3LMopu5/dFA1qVA6lrYo0Abl+p3AomwLopGsDemH0DnSpr6quCUIcitCGQnWYqIStm
	 ikCVSGjuE+3eniYcwzc5/zGY/Cduyrlu/folE/pH5drR8wZCN917evQRWSVFmMHnob
	 YkHh1PdhgXwp4pO2AMDpJVZIS7aGKBrcstdnQ6JcTNb6Nu9QzzQp/iUUs3rqFtZgWU
	 JUqkbq1wTs+Kw==
Date: Thu, 16 Jan 2025 23:20:53 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Simon Xue <xxm@rock-chips.com>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 linux-rockchip@lists.infradead.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Shawn Lin <shawn.lin@rock-chips.com>, heiko@sntech.de, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>
To: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20250117032742.2990779-1-kever.yang@rock-chips.com>
References: <20250117032742.2990779-1-kever.yang@rock-chips.com>
Message-Id: <173709125320.3991625.9909609495384701748.robh@kernel.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_212056_477856_23200558 
X-CRM114-Status: GOOD (  16.91  )
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


On Fri, 17 Jan 2025 11:27:41 +0800, Kever Yang wrote:
> rk3576 is using dwc controller, with msi interrupt directly to gic instead
> of to gic its, so
> - no its support is required and the 'msi-map' is not need anymore,
> - a new 'msi' interrupt is needed.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
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
>  .../bindings/pci/rockchip-dw-pcie-common.yaml | 53 +++++++++++++++----
>  .../bindings/pci/rockchip-dw-pcie.yaml        |  4 +-
>  2 files changed, 44 insertions(+), 13 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml: allOf:0:else:properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'min-items' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml: allOf:0:else:properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'max-Items' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml: allOf:0:if: 'anyOf' conditional failed, one must be fixed:
	'compatible' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml: allOf:0:then:properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'min-items' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml: allOf:0:then:properties:interrupts: 'anyOf' conditional failed, one must be fixed:
	'max-Items' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml: properties:interrupts: {'minItems': 5, 'maxItems': 9, 'items': [{'description': 'Combined system interrupt, which is used to signal the following interrupts - phy_link_up, dll_link_up, link_req_rst_not, hp_pme, hp, hp_msi, link_auto_bw, link_auto_bw_msi, bw_mgt, bw_mgt_msi, edma_wr, edma_rd, dpa_sub_upd, rbar_update, link_eq_req, ep_elbi_app'}, {'description': 'Combined PM interrupt, which is used to signal the following interrupts - linkst_in_l1sub, linkst_in_l1, linkst_in_l2, linkst_in_l0s, linkst_out_l1sub, linkst_out_l1, linkst_out_l2, linkst_out_l0s, pm_dstate_update'}, {'description': 'Combined message interrupt, which is used to signal the following interrupts - ven_msg, unlock_msg, ltr_msg, cfg_pme, cfg_pme_msi, pm_pme, pm_to_ack, pm_turnoff, obff_idle, obff_obff, obff_cpu_active'}, {'description': 'Combined legacy interrupt, which is used to signal the following interrup
 ts - inta, intb, intc, intd, tx_inta, tx_intb, tx_intc, tx_intd'}, {'description': 'Combined error interrupt, which is used to signal the following interrupts - aer_rc_err, aer_rc_err_msi, rx_cpl_timeout, tx_cpl_timeout, cor_err_sent, nf_err_sent, f_err_sent, cor_err_rx, nf_err_rx, f_err_rx, radm_qoverflow'}, {'description': 'Combinded MSI line interrupt, which is to support MSI interrupts output to GIC controller via GIC SPI interrupt instead of GIC its interrupt.'}, {'description': 'eDMA write channel 0 interrupt'}, {'description': 'eDMA write channel 1 interrupt'}, {'description': 'eDMA read channel 0 interrupt'}, {'description': 'eDMA read channel 1 interrupt'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.example.dtb: pcie@fe280000: interrupt-names: ['sys', 'pmc', 'msg', 'legacy', 'err'] is too short
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/rockchip-dw-pcie.example.dtb: pcie@fe280000: Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250117032742.2990779-1-kever.yang@rock-chips.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


