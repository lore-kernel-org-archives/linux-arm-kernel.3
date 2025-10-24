Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F48CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzbSQtw+riqKdYRhmIJe1RVzfTmj8edMFUK3NGuCHeg=; b=QtvutH2ahIIBXF0J9zxhFUrdng
	LIgZU6PhoaSIwNVaITK6INULD9BhQyZ4n7tYhDjrZDAAUMPvFvVF0nDU5XKvpH5Jz5Lz127M+EIJg
	N0xcneLdPXBcsHu1DGumZ2bBAOuAfnUJXwo8w76m4lZgocdO4xE9Rap/xDg0JA4iW50GVi8X0iHp7
	shENCseQNIZaa6FhNFxPB5u6Y/EcgbLhKgKEa4hjuey3tbFPae8Bl+8wirgJEvHCr+BcOCBtQXUMu
	gAq2fRLCuqZcbTQUfYDJ9P34QwGxwWaEmaoftYQ5quef7tVHHyvrFufJqYPp71ahzfZRHeMu/6oKn
	85W90N1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC03-00000008RXv-10TF;
	Fri, 24 Oct 2025 07:14:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCC01-00000008RWx-1PiJ;
	Fri, 24 Oct 2025 07:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEC92404A3;
	Fri, 24 Oct 2025 07:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30551C4CEF1;
	Fri, 24 Oct 2025 07:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761290048;
	bh=tixsbOhPpx+6hLtcafF4AhfrtkXskRGuW6voP6ka0TU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ex1t4OPx1GNhOGgxZG9mfTnTw6vg7QdtA/sCWg+iWh3jsuMYZI9yMUgqkPiIElcTp
	 qb6WczdXr4o3U9dAaNA5iG2HH1NfR16Ork7l3Il5Zta32w7HUou1h+s5ROTuFB1zAZ
	 TgZ8sYNWK60atK1vpk1vYQhxqwmgv/YHigW3PEYOBkNTMZzHD4preROzq6TB1w+QvX
	 taPyrRNHrs7o4UKI8Z/TqDPTTtlRHvf30sttXdLnsT1UVoPLFqTKXHW0V/5AKBqakB
	 777b+6NHPduvK/0TGOPWMTStTjCfsgOTZ2k4+VHN/5hPGL0VDcmWxRscQVMy4rcRtn
	 /zsWNUNhuc6Gg==
Date: Fri, 24 Oct 2025 09:14:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com, 
	heiko@sntech.de, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	huangtao@rock-chips.com, finley.xiao@rock-chips.com
Subject: Re: [PATCH v4 6/7] dt-bindings: clock: rockchip: Add RK3506 clock
 and reset unit
Message-ID: <20251024-wonderful-banana-bumblebee-273c8f@kuoka>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
 <20251021065232.2201500-7-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251021065232.2201500-7-zhangqing@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_001409_392974_04989C43 
X-CRM114-Status: GOOD (  13.79  )
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

On Tue, Oct 21, 2025 at 02:52:31PM +0800, Elaine Zhang wrote:
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> new file mode 100644
> index 000000000000..43e192d9b2af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3506-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3506 Clock and Reset Unit (CRU)
> +
> +maintainers:
> +  - Finley Xiao <finley.xiao@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The RK3506 CRU generates the clock and also implements reset for SoC
> +  peripherals.
> +

...

> diff --git a/include/dt-bindings/clock/rockchip,rk3506-cru.h b/include/dt-bindings/clock/rockchip,rk3506-cru.h
> new file mode 100644
> index 000000000000..f629b6fa75c3
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk3506-cru.h
> @@ -0,0 +1,285 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2023-2025 Rockchip Electronics Co., Ltd.
> + * Author: Finley Xiao <finley.xiao@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3506_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RK3506_H
> +
> +/* cru plls */
> +#define PLL_GPLL			1

Other binding starts from 0, so be consistent.

> +#define PLL_V0PLL			2
> +#define PLL_V1PLL			3
> +
> +/* cru-clocks indices */

You should not have holes in indices. These are abstract numbers, not
hardware values.


> +#define ARMCLK				15

...


> +#ifndef _DT_BINDINGS_REST_ROCKCHIP_RK3506_H
> +#define _DT_BINDINGS_REST_ROCKCHIP_RK3506_H
> +
> +/* CRU-->SOFTRST_CON00 */
> +#define SRST_NCOREPORESET0_AC		0

Here ^^^ starts with 0, not 1.

Best regards,
Krzysztof


