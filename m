Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C25CC87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 07:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNgJqPg/9cMj74upxC1Y9B51u4IOVFul0qs6VIXKL0M=; b=Kxy/PTKwx/sCXJVtyvRGjaE2Sc
	9ABcLv9vlMvX0ldaIW9YQS3UNrs35bK7f9pGb8nUClX1dDPdbyru1WjbX+2j3Y154CrkcteIi8nGw
	bnF+44G4/C3r915SEVbDg+fct15uk8+gyPMImm+Ybii1gkbI0oi31wsRaDX4+WJ+jDugAwCKiytfI
	AGP3tlt4UXCgNVuH+lT8kpNPq1LObuRKSKkLsw4uSUqJbLDLcuQP8JSiiop9k52aA60AJxa7c9+11
	AyalWgFbTLvmHW9VojamcvCPkLoHxhpjF05a23ytmzK07/TXCJCZ6rvIIPZgxZXCV1tJNopf11W1d
	AeVbwfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHti-00000002G2N-3Ywh;
	Fri, 08 Aug 2025 07:52:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukHcw-00000002D3S-0tQF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 07:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3EF6FA5574C;
	Fri,  8 Aug 2025 07:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB82C4CEED;
	Fri,  8 Aug 2025 07:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754638496;
	bh=htYYTMvBIoJF3AsCajNAqmICTBXqJVYTEKxD4QMF3D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANxjiPOewS3527iiBY1Trtv9QJ/OmWTljS3mBn4JNASVq1ZMOxzVTWGSS+spxi8O/
	 bJKqyUNR9Bfs/23ShbX4Zitb0Uollq10bGEygmjL0K/JfHRE1j1xSoX9r5GsoXt5CF
	 FrHsHcd9Z7gqNmYa7wSJXIk92MSMx15EYPaL8ZOFDQfSrn0Hl8dKfdTTIZQoNraF6W
	 vw9MUHVy4A6XNzl6fvrtbp1I6FzyeK0P8ao3L0QJuy5wNmj0qXlWxM0xxowolkFUYD
	 h6O+02wMdAm032dr7mnIApf41xcyr20RtNTlFQE8RD0gTTVmNwJ6xDzc+N8wymXp7P
	 cR8JYDBFoLRHw==
Date: Fri, 8 Aug 2025 09:34:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, David Wronek <david@mainlining.org>, 
	Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH RFC 2/5] dt-bindings: power: Add Marvell PXA1908 domains
Message-ID: <20250808-portable-expert-turkey-4f8f19@kuoka>
References: <20250806-pxa1908-genpd-v1-0-16409309fc72@dujemihanovic.xyz>
 <20250806-pxa1908-genpd-v1-2-16409309fc72@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250806-pxa1908-genpd-v1-2-16409309fc72@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_003458_401935_5C833718 
X-CRM114-Status: GOOD (  18.02  )
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

On Wed, Aug 06, 2025 at 07:33:21PM +0200, Duje Mihanovi=C4=87 wrote:
> Add device tree bindings for Marvell PXA1908's power domains.
>=20
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
>  .../power/marvell,pxa1908-power-controller.yaml    | 105 +++++++++++++++=
++++++
>  include/dt-bindings/power/marvell,pxa1908-power.h  |  17 ++++
>  2 files changed, 122 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/power/marvell,pxa1908-powe=
r-controller.yaml b/Documentation/devicetree/bindings/power/marvell,pxa1908=
-power-controller.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..1cf3a45d56cbb7b75f7204d65=
6016a9a569da186
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/marvell,pxa1908-power-contr=
oller.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/marvell,pxa1908-power-controlle=
r.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell PXA1908 Power Domain Controller
> +
> +maintainers:
> +  - Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> +
> +description: |
> +  The Marvell PXA1908 SoC includes multiple power domains which can be p=
owered
> +  on/off to save power when different IP cores are not in use.
> +
> +properties:
> +  $nodename:
> +    pattern: '^power-controller$'
> +
> +  compatible:
> +    const: marvell,pxa1908-power-controller
> +
> +  '#power-domain-cells':
> +    const: 1

So this is power domain controller?

> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^power-domain@[0-9a-f]+$":
> +    type: object

And this is as well?

You duplicated them.

> +
> +    description: |
> +      Represents a power domain within the power controller node as docu=
mented
> +      in Documentation/devicetree/bindings/power/power-domain.yaml.

We do not represent individual power domains, just like we do not
represent individual clocks.



> +
> +    properties:
> +      reg:
> +        description: |
> +          Power domain index. Valid values are defined in:
> +              "include/dt-bindings/power/marvell,pxa1908-power.h"
> +        maxItems: 1

So no address space, thus this is not a separate device node.

> +
> +      clocks:
> +        description: |

Drop everywhere |

> +          A number of phandles to clocks that need to be enabled during =
domain
> +          power up.

This does not exist in your example, so it is just confusing.

> +
> +      '#power-domain-cells':
> +        const: 0
> +
> +    required:
> +      - reg
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/power/marvell,pxa1908-power.h>
> +
> +    clock-controller@d4282800 {
> +      compatible =3D "marvell,pxa1908-apmu", "simple-mfd", "syscon";
> +      reg =3D <0xd4282800 0x400>;
> +      #clock-cells =3D <1>;
> +
> +      power-controller {
> +        compatible =3D "marvell,pxa1908-power-controller";

No address space, so this should be folded into the parent.

Best regards,
Krzysztof


