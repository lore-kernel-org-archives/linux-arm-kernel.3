Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C8B103A9A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 02:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwTq8tVboakA0dlKm2095mjACNVUEwjvucSKWH8sawo=; b=fsPDm6JeQitQqmH52hOuUX8VwF
	n5T+2J8DZEnr/ckc85lnp+q9EMgqNXAjaZwcbRVSPieYkmFjHIoCN1wYfVjhxQvYo5dXVhuK0TGK7
	OmUJp/gKQeEiF4tFo8iiJzWILU3kh26rUhez2zClomYLQwfBgptLW5tfahRxw7WAkjItAR+rHyoaO
	EI5r4WWuJkDOOvlmHeaCr+CI1HdHcZd0+sfHUxgA0cL2/r/7zesX4JPgzB6Qf44m2a0qUQYjHnLAC
	1gXRRy0T1zCfp/ipZvIl9TsZ8uXiAhIdcQK3js/legzo+yxuymQoKalamhN+1MPI0sLaSQtQM/Bb7
	SDUlGapg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EIt-00000002Xwy-1iTS;
	Wed, 25 Mar 2026 02:49:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EIs-00000002XwY-0uMi;
	Wed, 25 Mar 2026 02:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A4F9560128;
	Wed, 25 Mar 2026 02:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50888C2BCB2;
	Wed, 25 Mar 2026 02:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406945;
	bh=NXf2WNHgUrsXctzD8+piqofyVEnIOCaRrGV7Z3iMfXY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=frXEP3sgTwL9btbGzemrAzj0euOr8ss/Sh5SHnDklwKWKklwI+YBkOAeumbzTx5Qk
	 yuWHIRTc7untDvKLJGv1USaWcCItcTftPV/IxNZI0W8odCNGDyS8g4YjZGgwsiavmr
	 e7REuLLsi/FBrCpgngM5SGNtdRWdTWKCOIKbdbImPlTH0RAKzKyBVbSvzrWRjncxKu
	 7tEIxVwjyeFR442QXVo4WkrbTOGeGDtFS9IARuGvSr6W5SzyNbm4f26wfnmeZjpdFf
	 /nWNDI7Xkk+UZ+bGzxrBww09jQ+tLPTq7H36R4olxEkqePnN7/4FLaY+kvVNRJgrQ7
	 3OciKo0s/FHLg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260324025332.3416977-2-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com> <20260324025332.3416977-2-eleanor.lin@realtek.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: clock: Add Realtek RTD1625 Clock & Reset Controller
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, eleanor.lin@realtek.com
To: Yu-Chun Lin <eleanor.lin@realtek.com>, afaerber@suse.com, conor+dt@kernel.org, cylee12@realtek.com, jyanchou@realtek.com, krzk+dt@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Tue, 24 Mar 2026 18:59:01 -0700
Message-ID: <177440394165.5403.17868576455504268400@localhost.localdomain>
User-Agent: alot/0.12
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

Quoting Yu-Chun Lin (2026-03-23 19:53:22)
> diff --git a/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.=
yaml b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
> new file mode 100644
> index 000000000000..6fabc2da3975
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/realtek,rtd1625-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTD1625 Clock & Reset Controller
> +
> +maintainers:
> +  - Yu-Chun Lin <eleanor.lin@realtek.com>
> +
> +description: |
> +  The Realtek RTD1625 Clock Controller manages and distributes clock
> +  signals to various controllers and implements a Reset Controller for t=
he
> +  SoC peripherals.
> +
> +  Clocks and resets are referenced by unique identifiers, which are defi=
ned as
> +  preprocessor macros in include/dt-bindings/clock/realtek,rtd1625-clk.h=
 and
> +  include/dt-bindings/reset/realtek,rtd1625.h.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1625-crt-clk
> +      - realtek,rtd1625-iso-clk
> +      - realtek,rtd1625-iso-s-clk
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1

Are there any input clks for the clk tree?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@98000000 {
> +      compatible =3D "realtek,rtd1625-crt-clk";
> +      reg =3D <98000000 0x1000>;

Should be 0x98000000 to match the unit address.

> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +    };

