Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F9DC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97+PgD8FzLfLLOMcNonn+uaxaz0XSMxd81fdr1VR+4c=; b=mkSgIChWImVSIxCaTZg94ZFOQu
	YeaOGDwCBCr7130ziauJZg8/67Syp5AKDsa3AUD+9ydicI3NBxn+ySdzYw5OSQ0silfTlaJ4SUQ4X
	EYx9XUIKu3NWAjDekkSws6v/et62BeCmapoxjSwmnsUtkvKaDyKn5rwT9/I4RsUvk0O9eEXHNbaDO
	makFpZaekfNjc6kgYAV4Z6Jv62nfmfTpI+wt4jU2Dr9q8cjNV1d7Ik2KEF8vPTh18Y5FYpaNhi+X9
	bvhorp9XOgdByua4uAP1hZ24Tuv7j+qI68j/tU9Q5E+mZgwu67aasZsCZRK/Zb6skSqA9IDM0Uuz2
	8RNATX8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AA3-00000004RDn-0f9U;
	Tue, 08 Apr 2025 14:42:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u282Z-00000003z0O-2AfP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 12:26:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BADA16842A;
	Tue,  8 Apr 2025 12:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC91C4CEE5;
	Tue,  8 Apr 2025 12:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744115214;
	bh=F1wj3qpVgo1qr1BveM6Zq/QNOkaTsdEvxE8GsgIH80g=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=m/gJTstgQA1my9A3PxtSag5ErhPe+ieuCHFi+wlAw/Jpczvrzw12lI+xmMQpfEMST
	 7BjqvM0rhlJ8QlBD4fVh41Gz6+00Go3c7jLSjASzAqoS1WU4vTf1DFtdeEyPh2dil5
	 zwrZzxuwQwqZt775I4uU9MTU0L/bac5d8QL6O5fj/ZwsGXR4JIoCo8pBNRzfVveZkc
	 tLTmrdfbsK936NHN8dFk6o8QqHDWmUVGw3R4imaWpPw4jF0bi/G4zYwbhEppdgtyW/
	 AnwqWFfvEK5vK8bCcEEWQBpr/F2JmmQwbpWXMmelLSJKSLrPEJfx31AOgyCSKRc9HT
	 Tp0VWYCg+vhYg==
Date: Tue, 08 Apr 2025 07:26:53 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org>
Message-Id: <174411521311.1639476.6777663294037851144.robh@kernel.org>
Subject: Re: [PATCH 01/24] Documentation: devicetree: bindings: Add GICv5
 DT bindings
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


On Tue, 08 Apr 2025 12:50:00 +0200, Lorenzo Pieralisi wrote:
> The GICv5 interrupt controller architecture is composed of:
> 
> - one or more Interrupt Routing Service (IRS)
> - zero or more Interrupt Translation Service (ITS)
> - zero or more Interrupt Wire Bridge (IWB)
> 
> Describe a GICv5 implementation by specifying a top level node
> corresponding to the GICv5 system component.
> 
> IRS nodes are added as GICv5 system component children.
> 
> An ITS is associated with an IRS so ITS nodes are described
> as IRS children - use the hierarchy explicitly in the device
> tree to define the association.
> 
> IWB nodes are described as GICv5 system component children - to make it
> explicit that are part of the GICv5 system component; an IWB is
> connected to a single ITS but the connection is made explicit through
> the msi-parent property and therefore is not required to be explicit
> through a parent-child relationship in the device tree.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  .../bindings/interrupt-controller/arm,gic-v5.yaml  | 268 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 275 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.example.dts:43.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1522: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250408-gicv5-host-v1-1-1f26db465f8d@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


