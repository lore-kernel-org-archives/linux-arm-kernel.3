Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169D0C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skGK14kDuFSyE1TtzV+xMR9SO4GW+u75a1PWuUSPa1g=; b=JL0abVh4DNK/4SpR7Ei8OzQ+Qc
	XCfe7YoWEmXpnr1uMNvIX9AJ/qIA1b0f3cG/IYqBEq3gxPXUsB1nUjR/ycRJfXomeQBOxGmFESnSK
	z6x7EECl73sIddIMPjAua+W4VoFHmkbCZ7bLvVRd8+LaIyS0o8q+HpvUJLGAxzUJ541Q0/zaV/5nA
	yNCo6bD7sA0uXLItjAYt8lndcaRox7B/HQAwndiSeTcRKMllKg+5j15OonKoe1wnobwxlgFOpzLl9
	lF6eHdmCrde0lJJ5wqgy2YpY1uHlMnIFBxyHNOnaFL21MpmwS7SlsH3173yAydRQ85PW+gjD/dpMe
	BmOq0CuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SKv-00000003jle-0O3t;
	Mon, 14 Apr 2025 22:31:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SJ4-00000003jPQ-1ua8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 22:29:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AFDA95C0345;
	Mon, 14 Apr 2025 22:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359CDC4CEE9;
	Mon, 14 Apr 2025 22:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744669773;
	bh=MVlqs/ATqHLPaxxaiCF96uREsAduXa5I6ciuYSAoyY4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=QBkQLXzjgmTSicJ4PFikso2I2Z5kVvuLAeNdpBP4+qrDAY5E0X2iKJqTGZXrN88vQ
	 eVJNJWuESjme3Rr6Z9NgPYdEr1n4HLoLXygL3NLibGrlAEJ1X1FrvN5y2HYoXoyGGg
	 13sMAeI0jNJcp0ETo9/F4M7c2tQfuLzLh0pHns3yMLBW5RpiZqq7KdbcRiDVWBHPES
	 6gls1PqBA2lZFJ3Ih9C1vf02htkTJXkkLj3S/N+QkdIGEBVZgRK4w8hXOAXsvimZth
	 VBqKFHNCAeaXBHYq83dIa/+vIyjHyvYga2wNlsAZFOn+zFtOSlbgA25UtI2yK70xYR
	 MbvuBohwZXktQ==
Date: Mon, 14 Apr 2025 17:29:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250414214135.1680076-1-robh@kernel.org>
References: <20250414214135.1680076-1-robh@kernel.org>
Message-Id: <174466977142.1877467.9140482106900041765.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: PCI: Convert marvell,armada8k-pcie to
 schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_152934_550692_19B7161A 
X-CRM114-Status: GOOD (  12.15  )
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


On Mon, 14 Apr 2025 16:41:33 -0500, Rob Herring (Arm) wrote:
> Convert the marvell,armada8k-pcie binding to DT schema. The binding
> uses different names for reg, clocks, and phys which have to be added
> to the common Synopsys DWC binding.
> 
> The "marvell,reset-gpio" property was not documented. Mark it deprecated
> as the "reset-gpios" property can be used instead. The "msi-parent"
> property was also not documented.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/pci/marvell,armada8k-pcie.yaml   | 100 ++++++++++++++++++
>  .../devicetree/bindings/pci/pci-armada8k.txt  |  48 ---------
>  .../bindings/pci/snps,dw-pcie-common.yaml     |   3 +-
>  .../devicetree/bindings/pci/snps,dw-pcie.yaml |   4 +-
>  MAINTAINERS                                   |   2 +-
>  5 files changed, 106 insertions(+), 51 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/marvell,armada8k-pcie.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pci/pci-armada8k.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/marvell,armada8k-pcie.example.dtb: pcie@f2600000 (marvell,armada8k-pcie): interrupts: [[0], [32], [4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/marvell,armada8k-pcie.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250414214135.1680076-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


