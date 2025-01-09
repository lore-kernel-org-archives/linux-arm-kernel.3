Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8D5E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmZyQIKfYO2MnmubRRaS3zHrRFaFcl+yIdWnrRjnmig=; b=mp4HXoydINKjDODbFbUZX9nHd2
	20xZ/nbhBSZz7Bk4XL0IGeGacLG7xHSHpeTnyLyLRBqaXSXhKwxp9WNOF5SM5HN/K/8uIk09D2VS2
	GFI+QuTfaRqEI5UzBqDBwc8QUeWnTUob6VFNDfPAhbNs7Gr7NL7E4Bj8CIMpwCob8DEaATJ4saI0z
	WpvXNsFxCmct87KgYRxzLQ0dteySL9lCTktiP88TKMweZPSCMYYxkzF8xmXtWHy0R7a+JqASOGwYf
	Nhm1gbfwHYC3dohJQwDk/EVwXM2mRKAze+cJvy+Z39Xf8zLAHM7FhSTlRcvgHNaZF3OUKqY8dYjFt
	LAv00JjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoPG-0000000BFLu-2wKJ;
	Thu, 09 Jan 2025 09:00:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoO1-0000000BF4q-3Hd1;
	Thu, 09 Jan 2025 08:59:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43E2E5C5A32;
	Thu,  9 Jan 2025 08:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19AB2C4CED2;
	Thu,  9 Jan 2025 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413169;
	bh=Sc6QqQz2Zq7wQpvdnuknqWgjeROXiIqNNUloa9EIDdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C4GWE1do+W6PEulta2FXq7gYIj/EGTO+4e7I2toDxA7xnsKq6EU7na3HIPE1VXXHT
	 Z0KM7wy2o4Erjau/dW7Q2vTJndt2xh5KvOZQd9iLmByDbqMOK4HTZdmX28MGc/oE5o
	 pADlHWwHxJ/hqOw2CQBEXJaNERc3qmLyIRThwzH4F0pzQwztlw9J5o1otiW23iiajP
	 UWuqEPXmERGhZV+eQVjswDBebe9VKKrlTH++8af1Awh7PinxRpB5gTr8zUPoNqQdGT
	 sS7V1Rosc640tAxbQZ32ChWw344dnIq1/z6WvMZv9d9SxcIZKUAV0zeA4mpkmNSXms
	 Vb71gJUtkH4RQ==
Date: Thu, 9 Jan 2025 09:59:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Document clock and reset unit
 of RK3528
Message-ID: <tep74dy3oc6y2wwhp6bthv6brhkge7cojzrtj6x53lvtsws4g5@areqtyxhyayq>
References: <20250108114605.1960-2-ziyao@disroot.org>
 <20250108114605.1960-3-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108114605.1960-3-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_005929_905830_99BFA9F7 
X-CRM114-Status: GOOD (  19.14  )
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

On Wed, Jan 08, 2025 at 11:46:02AM +0000, Yao Zi wrote:
> There are two types of clocks in RK3528 SoC, CRU-managed and
> SCMI-managed. Independent IDs are assigned to them.
> 
> For the reset part, differing from previous Rockchip SoCs and
> downstream bindings which embeds register offsets into the IDs, gapless
> numbers starting from zero are used.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/clock/rockchip,rk3528-cru.yaml   |  67 +++
>  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
>  3 files changed, 761 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> new file mode 100644
> index 000000000000..19dbda858172
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3528-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3528 Clock and Reset Controller
> +
> +maintainers:
> +  - Yao Zi <ziyao@disroot.org>
> +
> +description: |
> +  The RK3528 clock controller generates the clock and also implements a reset
> +  controller for SoC peripherals. For example, it provides SCLK_UART0 and
> +  PCLK_UART0 as well as SRST_P_UART0 and SRST_S_UART0 for the first UART
> +  module.
> +  Each clock is assigned an identifier, consumer nodes can use it to specify
> +  the clock. All available clock and reset IDs are defined in dt-binding
> +  headers.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3528-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  assigned-clocks: true
> +
> +  assigned-clock-rates: true

Drop both, totally redundant.

> +
> +  clocks:
> +    items:
> +      - description: External 24MHz oscillator clock
> +      - description: 50MHz clock generated by PHY module
> +
> +  clock-names:
> +    items:
> +      - const: xin24m
> +      - const: gmac0

gmac
(unless you have gmac1 here as well but then please add it now)

Best regards,
Krzysztof


