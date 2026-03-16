Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE78EEFCBD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=unkmRmQWwFzEXUNaiEVhayAW0QgPV7pNwEaY7lhNI5c=; b=KjaBEB1TRHEZzSCV8G5aiBsyML
	el6k1nhP7ct6mBdIg+t8mgi+xLdSJS8F2VGq4gv6btTaFk1kiSdFiaEtL9kxE/xTj5lut7xSj2wpp
	WTquHxiacR5EzNq86nQaYAB5uAUaUIN/8PSFOOn+E6O/CiiHuLZsd+U/WioPP/WSmCh/tAuFICUe7
	vBVzpvvzIk/oYQOqkyFzDET0FQ9x89H/sJSDrVn97COm+Fqy7JlKsD9d5ZgEDAj1fWdmBUu2/j3VQ
	JNx/O/irTAXJptcFiOUdzJ5WyoeRa5jOwON5eAmF6ITzQmQzBBx4NC0Qt0DC8uEp5au87QhqosiQW
	w/SuF06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Cn-00000003Y0w-43Qf;
	Mon, 16 Mar 2026 08:21:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23Cm-00000003Y0k-18Ks
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3767160008;
	Mon, 16 Mar 2026 08:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9822AC19424;
	Mon, 16 Mar 2026 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773649298;
	bh=RZArSEGiIi6tf/QaCodiGjnLLyg0p5GqsTdgKr1WE4Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aE+SVbscvLzvPYGR6WULwTrbDzooNL4QaaEnO0yZ3X5OJ89/plQBX6/kS7DNTgWRH
	 MUNy4q3Q+NnyPXMGhRmWa+6PCVCZ5AC0g3399irWHXyBNhvcCjOIseSiWT5+y7MXsx
	 FZ5rFr+oQ3qaLF9VtQTrvNgJybxfgtDUd92YT0VVsYOsCWfVo+vVAsfPhEBLC49oaA
	 TuxefHCIvSqgTzAXauQpP1w/g0kN3A8IqjyBln1Wo6EtEFV27NUgY4mDgxcSFkAV6B
	 94wxS1l7/uf8z3z5fPZsIRS0KApV99GVB71q6IlAzKyirHiqj6G/+kaz0uVMNEA0V0
	 Zvwk4aSlThj6Q==
Date: Mon, 16 Mar 2026 03:21:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Abraham I <kishon@kernel.org>, 
 Jayesh Choudhary <j-choudhary@ti.com>, Conor Dooley <conor+dt@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
In-Reply-To: <20260316070429.1545707-2-alexander.sverdlin@siemens.com>
References: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
 <20260316070429.1545707-2-alexander.sverdlin@siemens.com>
Message-Id: <177364929663.1046182.9727069225111322855.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: syscon: add binding for TI K3
 platforms reset registers
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


On Mon, 16 Mar 2026 08:04:23 +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Add DT binding for Texas Instruments K3 Multicore SoC platforms reset
> registers present on AM64x and newer members of the K3 family and consist
> of the RST_CTRL, RST_STAT, RST_SRC and RST_MAGIC_WORD.
> 
> The planned usage is to provide reset reason information.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v2: amended mfd/syscon.yaml instead of separate reset/ti,am64-rst.yaml
> 
>  Documentation/devicetree/bindings/mfd/syscon.yaml     |  1 +
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml   | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.example.dtb: scm-conf@100000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] does not contain items matching the given schema
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.example.dtb: scm-conf@100000 (ti,j721e-system-controller): rst@18170:compatible: ['ti,am64-rst'] is too short
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.example.dtb: scm-conf@100000 (ti,j721e-system-controller): rst@18170:compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am64-rst'] is too short
	'ti,am64-rst' is not one of ['microchip,sama7g5-sfrbu', 'microchip,sama7d65-sfrbu']
	'microchip,pic64gx-control-scb' was expected
	'microchip,pic64gx-sysreg-scb' was expected
	from schema $id: http://devicetree.org/schemas/soc/ti/ti,j721e-system-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260316070429.1545707-2-alexander.sverdlin@siemens.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


