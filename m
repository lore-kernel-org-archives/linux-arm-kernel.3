Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6E9D3F09D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BG8fm6Z67+VoDdJeqwQd0nIhaenQup0lPxVOsS369F4=; b=X8h/7FaMCzl18xOFl3FrCkAzQw
	pPp6Pyza5UONBpoMYb5jfQG8alh/PkbHUcoTuL3Uhz+0SFdV4QwSYg9J2XEjIiMKFiWADh/lSMJ6P
	YbNvceBGySeKkTZFuGQaviDl+j8+cVPGaD7coaC2Zn2PixJHqWG0tX/xEvkwq9Ag3uoaa2e1PcpPn
	A/WS2cVPAlEeleX/tBbUwjW1+agBYcHeDD4h/89CQ1l/CWCpUEpeMqwAEsCufC9Kzj18LQ++Wpklw
	+PiEcvWSMNpp8zAa/gcXGswC/+cj+mM//ImuLf2yLxbTL69ZLaJetel+tqqB75UXatMWUTMidVz5K
	PFclUGLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVIu-00000000NUP-0UBq;
	Thu, 29 Jan 2026 16:55:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVIq-00000000NTr-3bWO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 16:55:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 688D34370B;
	Thu, 29 Jan 2026 16:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2388DC4CEF7;
	Thu, 29 Jan 2026 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769705732;
	bh=mZs03WYD4uRFTip8el8/SaAOaPr/KLn2tNNfr3ADzqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nZ9zKXPrUoLdPcQT07k41nF6WLFtAZZe85ruwQmm2Z6RUd7uI19PFYB+1ygycb4+M
	 sNCytqXi9y3Yl5Rb0q7B1wy1J+Zf+bZbyrUT78u17Tt5sefiGwO5vzgAQOZsFmDWt4
	 XopdtXorOrT50Q/a0g3gO2NgU3+P/zLd4y0BZr3B1SiNTxEw2h6ptRyVgpvGLwllX3
	 BhgOzt+uetn51K+48rjGu/HaNDaolUvnMJfo5ufAUzH3x/dkCNxmTSxeg4rMso2fAr
	 /3haGHrGsIPWwslXr3sdWoGcmN2aIIgvJ1QpRE0smIEE4lBIGhJTMYVYznTNnyTr2N
	 aBTvmwwndhT5w==
Date: Thu, 29 Jan 2026 10:55:31 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Juan Yescas <jyescas@google.com>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 01/10] dt-bindings: soc: google: add google,gs101-dtzpc
Message-ID: <20260129165531.GA1269692-robh@kernel.org>
References: <20260128-gs101-pd-v4-0-cbe7bd5a4060@linaro.org>
 <20260128-gs101-pd-v4-1-cbe7bd5a4060@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128-gs101-pd-v4-1-cbe7bd5a4060@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_085532_934907_8CED7A6F 
X-CRM114-Status: GOOD (  19.87  )
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

On Wed, Jan 28, 2026 at 04:10:50PM +0000, André Draszik wrote:
> The Exynos Distributed TruztZone Protection Control (D_TZPC) provides
> an interface to the protection bits that are included in the TrustZone
> design in a secure system. It configures each area of the memory as
> secure or non-secure.

This sounds like what access-controllers binding is for. Does that work 
here?

> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../bindings/soc/google/google,gs101-dtzpc.yaml    | 42 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..a8c61ce069d6910c47753bf14a792eb58e6ae182
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/google/google,gs101-dtzpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos Distributed TruztZone Protection Control.
> +
> +description:
> +  Distributed TrustZone Protection Control (D_TZPC) provides an interface to the
> +  protection bits that are included in the TrustZone design in a secure system.
> +  It configures each area of the memory as secure or non-secure.
> +
> +maintainers:
> +  - André Draszik <andre.draszik@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: google,gs101-dtzpc
> +
> +  clocks:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/google,gs101.h>
> +
> +    dtzpc_hsi0: dtzpc@11010000 {
> +      compatible = "google,gs101-dtzpc";
> +      reg = <0x11010000 0x10000>;
> +      clocks = <&cmu_hsi0 CLK_GOUT_HSI0_D_TZPC_HSI0_PCLK>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a56f8f00aebb938aa765a8a6d66dfeb7f062dac8..98b2ef47c809ac0232e6941c9483b19d7c798bb4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10833,6 +10833,7 @@ P:	Documentation/process/maintainer-soc-clean-dts.rst
>  C:	irc://irc.oftc.net/pixel6-kernel-dev
>  F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>  F:	Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
> +F:	Documentation/devicetree/bindings/soc/google/google,gs101-dtzpc.yaml
>  F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
>  F:	Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
>  F:	arch/arm64/boot/dts/exynos/google/
> 
> -- 
> 2.52.0.457.g6b5491de43-goog
> 

