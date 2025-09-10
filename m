Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96158CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLK6M0Ok63DCwZN8D5YaDFcLAt+qkrterKt4ooK5cpg=; b=TyQm2kSYluKWb10l6brFj7w8vm
	vHuw8ZcjCBOBrqbtiJU/WTzmgVn8s9cwOhrTFJ/spjV0iHk8EP4T1T0loplIIiEd3Ja6vEV0KET9F
	xVDBXtvqohkcl2IVcbLWfCObuM4g5AGRCbFLD5AOY+aMYHXQpiAgkt0bSez+U6j5fuZ4qR2BAtvct
	icG7m1Hne/8TROr6vtqB2XZDCjbj4eZzGdL0W/KYa0+IoIAu4Q7H401PPro7KzB8Tia7dq/v4pv+O
	Wl3wgj6s8QNPiseKN7wJc4o8Owsf09dEd3eL8i7GDQMYgRusbfxUU4YK1MGPNGfXL+wC3M19dNtCS
	FP8C2SQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFhW-0000000CiaJ-1G4q;
	Wed, 10 Sep 2025 07:57:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFhT-0000000CiZc-45Q7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:57:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 75AC5419A1;
	Wed, 10 Sep 2025 07:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F7AC4CEF0;
	Wed, 10 Sep 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757491027;
	bh=9fjD2fNRSaM8UgWVZRkBtaZv1nqX5uwHyIlpPz0EWXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kaLZpnsmrHrGGLP+0KguzRFCRfaUyvd8cTnmNsdxhg0gWm2UTWQ6Uo+799KsWNSym
	 CrhsRXZgc8VeqUDQ3XRRqKG6KXv3iR6Wf5CeDAZyZRbqRB5k/o5xfwXknqNEN9neoA
	 VgLtVqNSaQmLc9iKjxB30OcWaDJKHvc2TCk64/46ZwBNAJOlwtrWPI7Fr2/arNJxwM
	 ZCKIt0zrgNySUkCx5ycX5hyuNwSEF1PWfMyln4YO+5Vxg3qO5YVxDOe+z24g8ksHOz
	 iT354QBmykiQdgu59sVJGEwJFmmv+oImcIKDNKRvr67QwsclSwr4QjHX8wyL6yDlQ0
	 l4Rr09eDm7cZA==
Date: Wed, 10 Sep 2025 09:57:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>
Cc: Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Julius Werner <jwerner@chromium.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Subject: Re: [PATCH v6 12/20] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
Message-ID: <20250910-adamant-hospitable-firefly-ae30c5@kuoka>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250909-b4-ddrperfm-upstream-v6-12-ce082cc801b5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_005708_037895_57D24E69 
X-CRM114-Status: GOOD (  14.61  )
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

On Tue, Sep 09, 2025 at 12:12:19PM +0200, Cl=C3=A9ment Le Goffic wrote:
> From: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
>=20
> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
> It allows to monitor DDR events that come from the DDR Controller
> such as read or write events.
>=20
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <legoffic.clement@gmail.com>
> ---
>  .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 94 ++++++++++++++++=
++++++
>  1 file changed, 94 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml=
 b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
> new file mode 100644
> index 000000000000..1d97861e3d44
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +maintainers:
> +  - Cl=C3=A9ment Le Goffic <legoffic.clement@gmail.com>
> +
> +title: STMicroelectronics STM32 DDR Performance Monitor (DDRPERFM)
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: st,stm32mp131-ddr-pmu
> +      - items:
> +          - enum:
> +              - st,stm32mp151-ddr-pmu
> +          - const: st,stm32mp131-ddr-pmu
> +      - items:
> +          - const: st,stm32mp251-ddr-pmu

You did not implement Rob's comment.

Best regards,
Krzysztof


