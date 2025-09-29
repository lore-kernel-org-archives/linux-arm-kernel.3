Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B31CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrzZy+SvYXi7ABuHtmbiecpAl4vYThQd/q8FwI+dLCs=; b=ljdhogL/Sqm7Pqw3kphLaB01gS
	BaHJzdvDjrq2ji0wmwZj4qmKodvsaVZp5kByHrADsMaFyNPsqqFDxwocgyrQ8djsioucND0J7s8MR
	36cAvoyV0UE1T4NulyiE5cdWynvBfCUrD0sC6YJLXN0hpmFFEAblxktawwhcPChjppMQRCpNTqiWq
	/CPHFmsYfpFhSkbR5wMDLH91CILaGStMpf6iiuSshcmUBv3pftaG88bZG7eOoGYoE6dIBxHLyS2HL
	yE8h90y27d0IbZC2IsW8DsSgmCPkN0QYSp2f8PE1LC5j/03fCqtzPSmZa21As4bcRw1IBqbmhvyTM
	nBMg/okQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DOn-00000002VBP-0oqO;
	Mon, 29 Sep 2025 12:54:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3DOl-00000002VBC-2LOc;
	Mon, 29 Sep 2025 12:54:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A32E4624BA;
	Mon, 29 Sep 2025 12:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8BFC4CEF4;
	Mon, 29 Sep 2025 12:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759150474;
	bh=P/BYUfk/mkzHib6TOHlBmvk32uOprykrIp5dMYZHmwc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rjFJCBU/Hz0ffTlTH+O4WgtWOn2phyXD9UHUaxOepC3ZxWMOgu5fPYJhKMHBfU8fl
	 OMnmxdK7d1npNHMOth1kdw9ZIn5QwpwJGxGlpLKWYk/sV8KS/IsLfSIvcnkU36J7Nh
	 CzyBYwGJpbRS+kgOcOVO1gDMc+sG/8yoHz2cwpybHe7E/KowWHSCzmEQHy3z1cPz1D
	 8a5tezd3JiTs0Rim9CYT5azieX6XBSUMk6JzGkuF+2SHMGPQ+h30Y5F8uMwqQRh1Kl
	 g2Ah/YioPPMnTzb6zGzke2xm0r6EPo+fvANlshwsKbnUG4UhBD/udVtvtmQCo8dhCb
	 uYGht/F5lj3oQ==
Date: Mon, 29 Sep 2025 07:54:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-pci@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ryder Lee <ryder.lee@mediatek.com>, Manivannan Sadhasivam <mani@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250929113806.2484-4-ansuelsmth@gmail.com>
References: <20250929113806.2484-1-ansuelsmth@gmail.com>
 <20250929113806.2484-4-ansuelsmth@gmail.com>
Message-Id: <175915047324.3882585.17769722251535304485.robh@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: PCI: mediatek: Add support for
 Airoha AN7583
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


On Mon, 29 Sep 2025 13:38:02 +0200, Christian Marangi wrote:
> Introduce Airoha AN7583 SoC compatible in mediatek PCIe controller
> binding.
> 
> Similar to GEN3, the Airoha AN7583 GEN2 PCIe controller require the
> PBUS csr property to permit the correct functionality of the PCIe
> controller.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/pci/mediatek-pcie.yaml           | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/mediatek-pcie.example.dtb: pcie@1fa92000 (airoha,an7583-pcie): Unevaluated properties are not allowed ('resets' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250929113806.2484-4-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


