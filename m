Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D05D3B996
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 14:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bu0xWIOHg/kch0tDd6T57D6XaEPKGxVRlC4lB4V+8c=; b=ShiBkJn2AkwckU3HoIO9zZ5kyK
	dPsNRMKe8LHeo+wVflkK9Jde7ZBn9REszjCOXacGVYNAgdG3S50sIwZPmwu236G2YAs8nc1i/Aoko
	h0WZPfnwxEpP9+cd1vuyUDWp05lAWPapCN/MR+lllRINYwxhDgH7bmV6U21IhRcN4gxCm/rpgvtq+
	h68VaoWPzEsT/we2fZYioTHNDIe1nWWrL7ip4xb6GZ39eQn4pypg4QZPe7qofrLSOPTt9nVEFAab8
	6/qlsuFlvybWIeaDIK5kIIsvPmcigfuqUhffJVW/h1eVRxs4l2gadGLUiEyKh/M5hIXnwNB2frof4
	H0FrbW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwjm-0000000AtQe-0mfg;
	Tue, 26 Nov 2024 14:40:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwi4-0000000At7e-0CQL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 14:38:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A4A85C04FC;
	Tue, 26 Nov 2024 14:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A0CC4CECF;
	Tue, 26 Nov 2024 14:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732631913;
	bh=gaEdBLAIz7P49l/o5H51QYLoUNT4ajXgna3oxySU6X0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QWGqYGU+7lxDyWQ8GeVwa/EskJ57WuPDmJc0ZGG66OFNNvafWBoJ8aT/8lI8IH+3p
	 2JIycrGmAyWX72drR7fejKuWiLjLnrXMX22HviT0VACSLoIa578e28lkp+11Abjxa2
	 o0s9QLoEruipfKCI+6JkM16sxH1F9R7yYWPIK/B9ggQA0SET3+qyBgrmkb2FU/Vpwh
	 ZJaUHYwB/AUh0ypc/4DMGeTZH4I0thXfJVdrI96162zNPbQIsB6T+yMcb+31Yhk03a
	 WkgOUV4u90G7dE+WIZSKkmjL8FyvwcJjU0zMEcgQzVdpCo5nCnak43MCmOq4GMeBmr
	 nAc0kUCrFYyug==
Date: Tue, 26 Nov 2024 08:38:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: bhelgaas@google.com, cassel@kernel.org, fabrice.gasnier@foss.st.com, 
 quic_schintav@quicinc.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, kw@linux.com, conor+dt@kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 p.zabel@pengutronix.de, mcoquelin.stm32@gmail.com, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, alexandre.torgue@foss.st.com, 
 manivannan.sadhasivam@linaro.org
To: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20241126130004.1570091-2-christian.bruel@foss.st.com>
References: <20241126130004.1570091-1-christian.bruel@foss.st.com>
 <20241126130004.1570091-2-christian.bruel@foss.st.com>
Message-Id: <173263191160.224313.7510313063987746316.robh@kernel.org>
Subject: Re: [PATCH v1 1/5] dt-bindings: PCI: Add STM32MP25 PCIe root
 complex bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_063836_126185_F0F47BA4 
X-CRM114-Status: GOOD (  11.79  )
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


On Tue, 26 Nov 2024 14:00:00 +0100, Christian Bruel wrote:
> Document the bindings for STM32MP25 PCIe Controller configured in
> root complex mode.
> 
> Supports 4 legacy interrupts and MSI interrupts from the ARM
> GICv2m controller.
> 
> STM32 PCIe may be in a power domain which is the case for the STM32MP25
> based boards.
> 
> Supports wake# from wake-gpios
> 
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
> ---
>  .../bindings/pci/st,stm32-pcie-common.yaml    | 45 +++++++++
>  .../bindings/pci/st,stm32-pcie-host.yaml      | 99 +++++++++++++++++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml
>  create mode 100644 Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml:45:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/st,stm32-pcie-common.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241126130004.1570091-2-christian.bruel@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


