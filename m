Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09866CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WG9vTEWwIZVMq+QYKgZxoTdh2ThhQxPZUlCOwAdd1Nw=; b=cCOQKdxAcCjrsRJjHfZFJuTV9r
	rIBsWoEFvu1g1jeVxUCN2sBnYBbLiYJMHS4XIzUnbBdiUVoXVo8eZwLWV3qPOEfcPvcARqTx+Qdgm
	DlBbhJR+vJZd19vRMXZDDSQMnL6DV3CnSdCJviMR+n/uJdQEWk7sgluPKZQGECm/jIfrrgtRS9RbT
	9D420WlUDsT3gmbcG6n66mWWzt68Xw/J4yJvbT3IkCILa1zObGK7DH06amCyYUhMcnPTnjR+GLM55
	CDZcvtdN2rBfoU5apfXoqC7ubmfj/soiRuX+iMN5zQqumE8z6R1zXyLZgoPCstVEj53inpEB/5gLI
	cTcJ0phQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHit-0000000HGCI-1IRS;
	Thu, 15 Oct 2026 09:26:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHiq-0000000HGBk-2s7m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:26:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2526643F60;
	Thu, 15 Oct 2026 09:26:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AD7A1F000C5;
	Thu, 15 Oct 2026 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056360;
	bh=WG9vTEWwIZVMq+QYKgZxoTdh2ThhQxPZUlCOwAdd1Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P40WvaLY0gUklKpUU2+rBdcAfusbsxZdBS/nFMYtqu3xUk9ZNPieBVwoJhu3vk9c1
	 8PP26k+uRMo4UvCmXvfehRNwOeFYP6C4KXCNRETxxSwLPktJ4lAaYY5k+qoMnUVVDm
	 2S9OhXQOKdJjkbZEmU2kUE1FvmVkodPoltu0R5CvEMF4AwFmLI9GuZReu5kX0ktMVb
	 LZaRZUYFxH1K+8uvw0V6UxY5+7RKJnciwuB6+cAsQRxV8YAMGpp3Qg4kxhPiahgHCC
	 ZxW8/3sI4Bk7FFnO66G3xq8VUo7KVzr39IKpWZoxx2Mxy1eL0eY2EOWhacii3/B41X
	 P/fqv3E13uXoA==
Date: Thu, 15 Oct 2026 11:25:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, arnd@arndb.de, 
	stefandoesinger@gmail.com, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] dt-bindings: clock: Add ZTE ZX279128S CRM clock
 bindings
Message-ID: <20261015-misty-lively-galago-693c57@quoll>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
 <20261014072109.1759502-5-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261014072109.1759502-5-ghahramani.navid@gmail.com>
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

On Wed, Oct 14, 2026 at 08:20:44AM +0100, Navid Ghahremani wrote:
> Add Device Tree binding schemas for the ZTE ZX279128S clock controllers:
> topcrm, lspcrpm, and crm2. Define fixed clock lists and simple-mfd
> for child nodes inside topcrm.
>=20
> Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
> ---
>  .../bindings/clock/zte,zx279128s-crm2.yaml    |  48 +++++++++
>  .../bindings/clock/zte,zx279128s-lspcrpm.yaml | 101 ++++++++++++++++++
>  .../bindings/clock/zte,zx279128s-topcrm.yaml  |  86 +++++++++++++++
>  include/dt-bindings/clock/zte,zx279128s-crm.h |  51 +++++++++
>  4 files changed, 286 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s=
-crm2.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s=
-lspcrpm.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx279128s=
-topcrm.yaml
>  create mode 100644 include/dt-bindings/clock/zte,zx279128s-crm.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.y=
aml b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
> new file mode 100644
> index 0000000000..aa90ad15d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-crm2.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/zte,zx279128s-crm2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE ZX279128S CRM2 clock and reset controller
> +
> +maintainers:
> +  - Navid Ghahremani <ghahramani.navid@gmail.com>
> +
> +description:
> +  Top CRM 2 (clock and reset module 2) provides clocks and resets for
> +  PCIe controllers on the ZTE ZX279128S SoC.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: zte,zx279128s-crm2
> +      - items:
> +          - const: zte,zx279128s-crm2
> +          - const: syscon

This is odd. Device is specific, fixed. It either is or is not
compatible, not both.

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1

=2E..

> diff --git a/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm=
=2Eyaml b/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
> new file mode 100644
> index 0000000000..9466661929
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/zte,zx279128s-topcrm.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/zte,zx279128s-topcrm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE ZX279128S Top Clock and Reset Module
> +
> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +  - Navid Ghahremani <ghahramani.navid@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The top clock and reset module (CRM) of the ZTE ZX279128S holds the PL=
Ls,
> +  bus clocks, peripheral clocks and the reset controller.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: zte,zx279128s-topcrm
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 25 MHz crystal oscillator
> +
> +  clock-names:
> +    items:
> +      - const: osc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reboot:
> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    description: System reboot controller child node
> +
> +patternProperties:
> +  "^phy@[01]$":

phy-0
phy-1

because your reboot node does not have unit address.

> +    type: object
> +    description: PCIe PHY child nodes

Missing description, compatibles with additionalProperties: true or
full schema with 'false'

So the PHY does not need any resources from the parent? It gets its own
clocks? See explanation of simple-mfd.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/zte,zx279128s-crm.h>
> +    #include <dt-bindings/reset/zte,zx279128s-reset.h>
> +
> +    topcrm: clock-controller@94000000 {
> +        compatible =3D "zte,zx279128s-topcrm", "syscon", "simple-mfd";
> +        reg =3D <0x94000000 0x1000>;
> +        clocks =3D <&osc>;
> +        clock-names =3D "osc";
> +        #clock-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +
> +        reboot {
> +            compatible =3D "syscon-reboot";
> +            offset =3D <0x44>;
> +            mask =3D <0x1>;
> +            value =3D <0x1>;

Incomplete example.


Best regards,
Krzysztof


