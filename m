Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162CCE91299
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 09:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wyfs5BDhEUF8azNylMmDnGdxxb/1Is/WY8k3BfKKfe4=; b=ibzRCiE4n5i5+3JWgXLnAx4JPi
	gI/QiNFd2je0oOooiquHWZul06RurYHPn6cPNOygg/IsyZ/PHgzlrMZYn47heAM2mM7PhEaoiBpzX
	KJyCQFwYKinLlBsci4gBLy6xfS4czWEs+TtAxKGtYLrRh3CQh6QUkJkOsIFpUdE7OKCtXtW1JqVw0
	iGUDg3pib389tFlELOZBvQUFcluHZ24yRFhmFGDwm5nXgJUvVofhsQ68CuNe3pw5cUpAMKdlaV2Wq
	n78PU907rk5rVpNe/HEjgmpnRqvcBB9uIWZAc6IatJzkMzDE+q4gNy8LfbXRgfdpUBozjwYLt69zi
	vbzExxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvQB-00000009gBZ-3CBe;
	Thu, 05 Feb 2026 09:13:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnvQA-00000009gAT-1kcb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 09:13:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72B6A60128;
	Thu,  5 Feb 2026 09:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 974DEC4CEF7;
	Thu,  5 Feb 2026 09:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770282785;
	bh=6P+RzgxrHHsOPrWorXefV5aQyNrxfF8FiKVM6BWUqvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUGlFh4mLruuaYXSMa3gxriyYIWQvIJ8AjlAozutphkm/d3JIPOm2L+zZDpeLbE/w
	 76dDqeTt2NMDryN39tzZ29Nx2oU/3bHh5h7twhSqU+pkvPInMUCZZSYOK2mDgfgEmy
	 G5V5II5boaDubgfr1uPlj5APR3p3Nw+9N29tPWUXBVM8ZgzXo537tJq9Xse0Lgmhxb
	 P5rVWWUy+I/JImwfRHVR1azONnKGjdc9vnKnmISXcDs06jBhLjPl2Vs7FQsckxLYGH
	 IYJ3+8p6CAaFNtLOgT/Eg3W1+6Ut43UvyFxp4dsWAJ+O6/4rigGvaoXYtuFchi7/XV
	 MsrXnJV46H2CA==
Date: Thu, 5 Feb 2026 10:13:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, peter.chen@cixtech.com, unicorn_wang@outlook.com, 
	inochiama@gmail.com, alchark@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v7 1/3] dt-bindings: soc: cix: document the simple-mfd
 syscon on Sky1 SoC
Message-ID: <20260205-noisy-fabulous-bumblebee-e0cb32@quoll>
References: <20260204020644.155094-1-gary.yang@cixtech.com>
 <20260204020644.155094-2-gary.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204020644.155094-2-gary.yang@cixtech.com>
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

On Wed, Feb 04, 2026 at 10:06:42AM +0800, Gary Yang wrote:
> There are two system control on Cix sky1 Soc. One is located in S0 domain,
> and the other is located in S0 and S5 domain. The system control contains
> resets, usb typeC and more. At this point, only the reset controller child
> is described as usb typeC uses it by phandle.
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../soc/cix/cix,sky1-system-control.yaml      |  49 ++++++
>  include/dt-bindings/reset/cix,sky1-rst-fch.h  |  42 +++++
>  include/dt-bindings/reset/cix,sky1-rst.h      | 164 ++++++++++++++++++
>  3 files changed, 255 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst-fch.h
>  create mode 100644 include/dt-bindings/reset/cix,sky1-rst.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
> new file mode 100644
> index 000000000000..5fb6b97c3c00
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/cix/cix,sky1-system-control.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cix Sky1 SoC system control register region
> +
> +maintainers:
> +  - Gary Yang <gary.yang@cixtech.com>
> +
> +description:
> +  An wide assortment of registers of the system controller on Sky1 SoC,
> +  including resets, usb, wakeup sources and so on.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - cix,sky1-system-control
> +          - cix,sky1-s5-system-control
> +      - const: syscon
> +      - const: simple-mfd

Drop simple-mfd, no children

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':

Drop, no children

> +    const: 1
> +
> +  '#size-cells':

Drop

Do you see any recent simple-mfd binding written like this? There are
no. Did you read any of other bindings before sending this? Or at least
my slides or amny other resources from vast documentation from
elinux.org?

Best regards,
Krzysztof


