Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC449606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HYM9UnJL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IujTEz5i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F9FEofSoUSLMuDf15+WCUoOYCD7og7XvQVtByxgDU1A=; b=HYM9UnJLQJ+YIhCwT7SPnekXpo
	iE72sy7VKNRXDHXT121DiDx5rNOo9N7kqUpX+jHD6dDqjy2leTZGb3n+GCb89GYM/ReEV1zC5rBH3
	LVvlsh1Tb9e/ZZ52swYePaq9/kN8d11UFjL/Wc52G32lVV2/s/+VYv8ey1d09xMsdEfehFcBWoviL
	D2498bafIhG43sRjgE2oaFVGM6/2udUNup+wCEg0D15l3EL0WlqYQOY3TfMxEWX76n4fEqx4ocrZK
	V1BFiR5F7s1F6emB8wqen6Ps+gcrY2u5k0pA67eDWaFTdLtkGRQrHdK8r+DBIQtX579fLsF5TJR6i
	MkLwEICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLou0-00000005oBw-3CkP;
	Tue, 27 Oct 2026 21:40:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLou0-00000005oBq-04hX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 21:40:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CD7C4026B;
	Tue, 27 Oct 2026 21:40:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13BD01F01825;
	Tue, 27 Oct 2026 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793137214;
	bh=F9FEofSoUSLMuDf15+WCUoOYCD7og7XvQVtByxgDU1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IujTEz5iUJJ8fLWRNgswwtRnTCYdpMxhrlitVPuCT32SzFTcFnPci0d0/lWxLkKcA
	 +pSqNESCKFi9kTJHVm4lxMoirRODOdyNoYPKN0u173eEpwFVUq4xy4GRzfQ2bo6D8D
	 1fQcKGu84IbHFNMxkTvuyMxGSc//Dl52HSfcusk1KtCE8USl9jkVtmd8Oo9nYEPLsv
	 KGPH38edv/r7PQ8aGHwnWAMiGAUarLTbX2RAG6iL0vfeKxJUUCNhkZ7g5xovCEYg0Z
	 h0XYI/mkZnv53QJ/b31UGrsg/sTekZe2+wxwOVhMUYkMcyNfXs8ZOgr3xEL6kQLsmr
	 2hOR2siSQGkmA==
Date: Tue, 27 Oct 2026 16:40:10 -0500
From: Rob Herring <robh@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
	stefandoesinger@gmail.com, krzk@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/24] dt-bindings: PCI: Add ZTE ZX279128S host
 controller
Message-ID: <20261027214010.GA1212169-robh@kernel.org>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-13-ghahramani.navid@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014072109.1759502-13-ghahramani.navid@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 14, 2026 at 08:20:52AM +0100, Navid Ghahremani wrote:
> Add Device Tree binding for the DesignWare PCIe host controller on the
> ZTE ZX279128S SoC, using standard clocks, resets, and phys properties.
> 
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../bindings/pci/zte,zx279128s-pcie.yaml      | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
> new file mode 100644
> index 0000000000..dc0214511f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/zte,zx279128s-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE zx279128s PCIe host controller
> +
> +maintainers:
> +  - Navid Ghahremani <ghahramani.navid@gmail.com>
> +
> +description:
> +  The ZTE zx279128s has two PCIe host controllers based on the Synopsys
> +  DesignWare PCIe IP, each with one lane. Their clocks, resets and PHYs are
> +  controlled through the SoC's Top CRM blocks.
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - $ref: /schemas/pci/snps,dw-pcie-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: zte,zx279128s-pcie
> +
> +  reg:
> +    items:
> +      - description: Data Bus Interface (DBI) registers
> +      - description: Controller wrapper registers
> +      - description: PCIe configuration space region
> +
> +  reg-names:
> +    items:
> +      - const: dbi
> +      - const: ctrl
> +      - const: config
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PCIe controller clock
> +
> +  clock-names:
> +    items:
> +      - const: pcie

Drop. No point in -names for 1 entry.

> +
> +  resets:
> +    items:
> +      - description: PCIe controller reset
> +
> +  reset-names:
> +    items:
> +      - const: core

Drop

> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: pcie

Drop

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Optional board GPIO reset line for downstream endpoints.

Is this for PERST#? If so, make that clear.

> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: Optional second board GPIO enable line driven together with reset-gpios.
> +
> +required:
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - '#interrupt-cells'
> +  - interrupt-map
> +  - interrupt-map-mask
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - phys
> +  - phy-names
> +
> +unevaluatedProperties: false

