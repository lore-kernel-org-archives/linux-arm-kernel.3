Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96D1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvoBxDaYcxAyprGRisWh5uNQejdq5Yph7yMgOQ/rysE=; b=tz/xk9Br2GaTmDnTElczc8GbSb
	bKi+4EGbmBjNcfTfLEx5vRUImGAOwIlx9JY7DD4ViTbcgbJ/sLtnV1vznikJAm26/zRtoT4s1SO+9
	3WeChh1JggtKtIbtV+faYGvTAwnaTDtsR3v5xTsYXy/jm4dXwxn6CxGUZk/Xe5kzCnhxSG6M49sSW
	jXYqLdMl8FOwyN6dUt3m805bJ90IWpShUjOFlefI3QWxss7Oxiac0YVnoOkI+YtOfAKNsEPYI6zDP
	qFxu0gfdKI4JqFxpe67CnWM+rzFN5aWdd9j5xRYW2UK3ZfYkpVV86FKNzEhKbuDDROGGI1TaHI2Fy
	YfWIPZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Ek-0000000E9lo-0cHh;
	Mon, 29 Jun 2026 09:25:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8Ei-0000000E9lh-2s8P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 09:25:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B57C360008;
	Mon, 29 Jun 2026 09:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ADF1F000E9;
	Mon, 29 Jun 2026 09:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782725103;
	bh=BvoBxDaYcxAyprGRisWh5uNQejdq5Yph7yMgOQ/rysE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Sw7wKvlLu0TQrgS+9IhOHufpEfsY4J0es1JGOsIvejwypUNwzzY/4mdIhpuLqb7vU
	 fHor2wITvy9smgvb4mnHTsHqSJp7ujrNqwPfiudbJibgTX9MsS+isx9N2n8hu5JrGi
	 CGHnIV3if9NBrg0Wirioju4ZHVL8O6+hg2sCKYC9d64EJ0b3oAcb/9ltB1IFms0J9z
	 1w3R5DKqiL6dE7yyxByXIWvHK9GAWgmsyQXqrHxG0njGkP3KnIHiuYtTOXJDkwU+hf
	 2Abmm5fCXFh7N/Wg4jWZNTgW761FjTuUwTbbhMng2u77D7N0aUyOxz/VLpjBLTSVkF
	 UJfyY36kk2XGg==
Date: Mon, 29 Jun 2026 04:25:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, festevam@gmail.com, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 krzk+dt@kernel.org, kernel@pengutronix.de, Frank.Li@nxp.com, 
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org
To: chancel.liu@oss.nxp.com
In-Reply-To: <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
 <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
Message-Id: <178272510234.1491191.9572770485267787597.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
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


On Mon, 29 Jun 2026 16:47:31 +0900, chancel.liu@oss.nxp.com wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> The NXP AUD-IO slot represents a physically present I/O connector on
> the base board. It acts as a nexus that exposes a constrained set of
> I/O resources, such as GPIOs, clocks and interrupts, through fixed
> electrical wiring. All actual hardware providers reside on the base
> board. The connector node only defines index-based mappings to those
> providers.
> 
> This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
> where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
> same add-on board can be reused across different base boards that carry
> this connector.
> 
> [1]https://www.nxp.com/part/IMX-AUD-IO
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../bindings/connector/fsl,aud-io-slot.yaml   | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map-mask: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: clock-map-pass-thru: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml: Unresolvable reference: /schemas/clock/clock-nexus-node.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.example.dtb: connector (fsl,imx95-19x19-evk-aud-io): False schema does not allow {'compatible': ['fsl,imx95-19x19-evk-aud-io'], 'gpio-controller': True, '#gpio-cells': 2, 'gpio-map': [[0, 0, 4294967295, 8, 1]], 'gpio-map-mask': [65535, 0], 'gpio-map-pass-thru': [0, 1], '#clock-cells': 1, 'clock-map': [0, 4294967295, 1], 'clock-map-mask': [255], '#address-cells': 0, 'interrupt-controller': True, '#interrupt-cells': 2, 'interrupt-map-mask': [65535, 0], 'interrupt-map': [[0, 0, 4294967295, 27, 8]], '$nodename': ['connector']}
	from schema $id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260629074734.3643227-2-chancel.liu@oss.nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


