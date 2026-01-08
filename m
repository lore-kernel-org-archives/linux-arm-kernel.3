Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC37D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 19:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Egeoauu85j4e+WeXxWLxZq8WExQ6Zh5dl8x5NP2WN0=; b=s2sY4kOPADNM2wakQXiR+gGUHy
	UVjr521wTKqeM8cjAn/I7pTCrr0iDw5+hLkw5jKfCUR90Uu8M2Brx0Asw0pR6rJ33Y3gcQjGrRdcw
	NGhnMdl36kEF63ZjYUrRRXsBqzt+UwTO34R8gbDZwFm7JbTjZGvFrrFG/eKKFlLUmzekpO30eMlth
	LyVsmNyVrmmMrb9MXNDYO4pS0rmCcjvZVL62thOtEz+/vEuKBJmM1DPG7mOxXK609byTknYi73MNc
	HJbSqrr7IRfKH2WpAbKJdHLakrfkNwkv5E8vnXgkGDlMaoeWq7Qua8BUMPDpH2nluOrF/JTXGnYL3
	xN/nS4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvGp-00000000h8l-3WQB;
	Thu, 08 Jan 2026 19:02:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdvGn-00000000h7w-1Od5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 19:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF30140A00;
	Thu,  8 Jan 2026 19:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4478C116C6;
	Thu,  8 Jan 2026 19:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767898924;
	bh=cGVPGNzS5dackujqgZ6gZ4apORen6+dbC4SXpFIwMX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gds6PdVtl7nh9hqOKIShu4yNF5qDmklyNOic3poXva+cTt8kxVAIOWhkFHV2Xa5pj
	 bpx1EvHsEoP3H8+Cs9/i7L+ndXn+UEnKbVjOI1V4pCLxRwsc0VdWav/A308DJB3tfJ
	 qluxPbP6gsQX3M0vIW6GTkQ/Ogb3KlROpvCNtc9aDsRfPVs3kgddj5+OimSy9hgu8m
	 OIsykjiXH5OlQp2WNLD9mmY+GGRCtmOgOziJN0g0AX0oVqlgTwf3xwgjgtg6642HRN
	 THiJlE9WyGfKTcj+8NR0M7HkQp2wM3OODPhvGngwmozWB8VsPIC/0pU1VHOvoG6oav
	 CfldgY+DC16Cg==
Date: Thu, 8 Jan 2026 13:02:03 -0600
From: Rob Herring <robh@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: fsl: qe: Add an interrupt
 controller for QUICC Engine Ports
Message-ID: <20260108190203.GA780464-robh@kernel.org>
References: <63f19db21a91729d91b3df336a56a7eb4206e561.1767804922.git.chleroy@kernel.org>
 <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7708243d6cca21004de8b3da87369c06dbee3848.1767804922.git.chleroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_110205_433681_FEAE7D4E 
X-CRM114-Status: GOOD (  18.19  )
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

On Wed, Jan 07, 2026 at 05:59:10PM +0100, Christophe Leroy (CS GROUP) wrote:
> The QUICC Engine provides interrupts for a few I/O ports. This is
> handled via a separate interrupt ID and managed via a triplet of
> dedicated registers hosted by the SoC.
> 
> Implement an interrupt driver for it so that those IRQs can then
> be linked to the related GPIOs.
> 
> Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Already? On a v1?

> ---
>  .../soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml       | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> new file mode 100644
> index 0000000000000..1f3c652b1569d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ports-ic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale QUICC Engine I/O Ports Interrupt Controller
> +
> +maintainers:
> +  - Christophe Leroy (CS GROUP) <chleroy@kernel.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,mpc8323-qe-ports-ic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#address-cells':
> +    const: 0
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#address-cells'
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller@c00 {
> +      compatible = "fsl,mpc8323-qe-ports-ic";
> +      reg = <0xc00 0x18>;
> +      interrupt-controller;
> +      #address-cells = <0>;
> +      #interrupt-cells = <1>;
> +      interrupts = <74 0x8>;
> +      interrupt-parent = <&ipic>;

This doesn't look like a separate block, but just part of its parent. So 
just add interrupt-controller/#interrupt-cells to the parent.

Rob

