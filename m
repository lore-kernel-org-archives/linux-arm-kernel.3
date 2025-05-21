Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836F7C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 15:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXhUwaSBbZB3IaLQX9hyzU2AcPezfoNvPerZSAFDLfc=; b=oo+64zpV97mntKii5oeAqyFwNA
	IG50vOBvSMnAWy4lR9XW6iuMTwJ2dHeaEnbPPxJMa2vCV0/r7E4JVvRKhLjhwppwAKsscwWPupnZi
	eoAHPZelhn951tXFW4ec55Do1cEzkM/N/UiAexGbczN9Nx/NIxGoxlTFh2HjIrSMbHQX3tcLjFp1M
	Y9X4A+jm06F7lUaltmLF+MVK99nPZafzwavP+g/hMhZGOkghzQfpjMJprew+M+WqKU/TqCN1oezfY
	QOm+ShMf+BQ6gzd91KovV51B5gY06HMk80ZoyM9woyd0Zglg7TxqQvMSpmXNJ9J49O2m/Vmqm/AiR
	JzBkq+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlMf-0000000GHEy-1SCj;
	Wed, 21 May 2025 15:28:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHlKV-0000000GGw8-14Zh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 15:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E94C5C5BC3;
	Wed, 21 May 2025 15:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A09C4CEE4;
	Wed, 21 May 2025 15:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747841162;
	bh=MDKD9lGxNck7Ne+uaSDs1WAO4Wl3ZxiYCJEk3xlWYQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=auaZZXT2l+8GZIC3AVHmxcjl3G5L1QU1tF1rtJddcr3k9zk+gLZ3cWQZj5r0CsoMM
	 5XjsDeAruOgf8HOM39k3Js/2MTXoag2DC7QRlBXns0wht6SverBWuDxTQQRxg6iCWx
	 OHmdPkPhWg/5ik1rUC9kR6vZzfMD0CJ5aV9+1JNNHFE8FqmBufF/I1rL4iTtrZr14h
	 E7jOM1LoGi9VvH5QMA+Cp9UoiWpE9jvTRXoUQ2G/9XjaVtk1saH1Q9BikwRvmFWQ9v
	 mve1aET3ZhOq+JhKSOkp177mxeQDegQ7GAJf4pGQwzwisC044XScvPLJX1KOCnCpjS
	 rZuHwpVW+zCUQ==
Date: Wed, 21 May 2025 16:25:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: stm32: add STM32MP21 clocks and
 reset bindings
Message-ID: <20250521-quantum-flashily-611a7d5f4f06@spud>
References: <20250521-upstream_rcc_mp21-v3-0-cac9d8f63d20@foss.st.com>
 <20250521-upstream_rcc_mp21-v3-1-cac9d8f63d20@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DDoC0JY4QW9yHonk"
Content-Disposition: inline
In-Reply-To: <20250521-upstream_rcc_mp21-v3-1-cac9d8f63d20@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_082603_382504_6E0D6BBB 
X-CRM114-Status: GOOD (  16.67  )
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


--DDoC0JY4QW9yHonk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 02:38:49PM +0200, Gabriel Fernandez wrote:
> Adds clock and reset binding entries for STM32MP21 SoC family.
>=20
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp21-rcc.yaml           | 199 ++++++++++
>  include/dt-bindings/clock/st,stm32mp21-rcc.h       | 426 +++++++++++++++=
++++++
>  include/dt-bindings/reset/st,stm32mp21-rcc.h       | 138 +++++++
>  3 files changed, 763 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yam=
l b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d41f0b963aceee534acea77bc=
9d276fd0c9b1548
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
> @@ -0,0 +1,199 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32mp21-rcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STM32MP21 Reset Clock Controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The RCC hardware block is both a reset and a clock controller.
> +  RCC makes also power management (resume/suspend).
> +
> +  See also::

I believe you missing some comments from Rob about removing the :: from
here, and from the source you copied it from (if one exists).

Otherwise,

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> +    include/dt-bindings/clock/st,stm32mp21-rcc.h
> +    include/dt-bindings/reset/st,stm32mp21-rcc.h

--DDoC0JY4QW9yHonk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaC3whQAKCRB4tDGHoIJi
0gw7AQDclF/KssvPyuRlJxORbowXvNW9eQ2qNLO+ANWJeMmAqgEA0ulde5mpAGbH
AZx6s03+erRmI/Hkhg+AZke5WIMQmQ0=
=YaFH
-----END PGP SIGNATURE-----

--DDoC0JY4QW9yHonk--

