Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559CAE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 08:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUARF1yVPgvSNI9Dyr1FTjzqkM46aFI8TYgu5HKrqHU=; b=BJaIBUTBKtXhJRjwKsQUd+J2Xd
	r9AYZYdmgIAAHdbuAGDZDsheFTnYxXt4qbcCmrsEOUx5M83PhXtZ3FJEmO8LV9MpRcyBrXNIZ9mrE
	GQCqCYGXHAExiCjwiskn6r1dpzXFo7ecPtUak/3Bf52RFktECeFGCtDCA79ZXd/Exxw7xoduuTQou
	kvqu3BFs6jZ5CPsS1y/ltWXaKzoBGsJHdtLe08zAKUTGSj5a/rPvRRqloki3O5W1ExCNYsLOeMvwI
	iLrBWwU86MRrWheK/vbY/q9D0eaOQf+U2aajlEyNOPZuR4mx9cY9o3vULuovxiyI2yCwCyA1KMoZ0
	eUAGERqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5j3-0000000HN8c-0lFd;
	Fri, 27 Dec 2024 08:29:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5hr-0000000HMzL-2qhU;
	Fri, 27 Dec 2024 08:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 623285C61BE;
	Fri, 27 Dec 2024 08:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6393C4CED0;
	Fri, 27 Dec 2024 08:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735288106;
	bh=p8zJeNpOL7BNADVFRZy7kL0pcKZuH29D+UKM40qaNt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdwEqomwr07J32xV1rjUBDpb/fkHGCsOjExRz2sOdvKz2W33GbeCkKKMZilA2gKPx
	 KtPHw1JCZMqlA6AUr3bqiJSO3x9jfF46InAhKCBH3Uqc73A7FFbTC48+QzKWyPzU/v
	 r9o6/rkGVcdvfM9B62IrZlrUAXsc5AnIqxu95uKLfRyME3QrbGG6JDCCQV1Dk7yV4a
	 90MuHXbB3F469uLcYuQLfmzQnVe6fCbAe4KomuviANMiQJF8kKWxPB1+0W4u5Oz1Ys
	 fUd6I4SzOhldP807P/yxwRB+KYevQ4zsE7T4PolWY+ig5uv7FQv7oipnMfYbRoCphd
	 rMD5ytqMPAoYw==
Date: Fri, 27 Dec 2024 09:28:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock, reset: rockchip: Add support
 for rk3562
Message-ID: <z7jb32foci6bamqqddkkp34hazi2itp6uclarsoi5pkrgso2go@bxflagkaciq6>
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
 <20241224092310.3814460-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224092310.3814460-2-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_002827_775576_CABF1DA3 
X-CRM114-Status: GOOD (  20.11  )
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

On Tue, Dec 24, 2024 at 05:23:09PM +0800, Kever Yang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add the dt-bindings header for the rk3562, that gets shared between
> the clock controller and the clock references in the dts.
> Add softreset ID for rk3562.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2:
> - rename the file to rockchip,rk3562-cru.h
> - remove CLK_NR_CLKS
> - add new file for reset ID
> - update to use dual license
> 
>  .../dt-bindings/clock/rockchip,rk3562-cru.h   | 377 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3562-cru.h   | 360 +++++++++++++++++


No, that's not a separate patch. Headers *ALWAYS* go with the bindings
patch.


>  2 files changed, 737 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3562-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3562-cru.h
> 
> diff --git a/include/dt-bindings/clock/rockchip,rk3562-cru.h b/include/dt-bindings/clock/rockchip,rk3562-cru.h
> new file mode 100644
> index 000000000000..ad07ad3a12ad
> --- /dev/null
> +++ b/include/dt-bindings/clock/rockchip,rk3562-cru.h
> @@ -0,0 +1,377 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */

Why not using license requested by checkpatch?

> +/*
> + * Copyright (c) 2022-2024 Rockchip Electronics Co., Ltd.
> + * Author: Finley Xiao <finley.xiao@rock-chips.com>
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_ROCKCHIP_RK3562_H
> +#define _DT_BINDINGS_CLK_ROCKCHIP_RK3562_H
> +
> +/* cru-clocks indices */
> +
> +/* cru plls */
> +#define PLL_APLL			1

Start with 0. Your other binding also starts with 0, so be consistent.

> +#define PLL_GPLL			2
> +#define PLL_VPLL			3
> +#define PLL_HPLL			4
> +#define PLL_CPLL			5
> +#define PLL_DPLL			6
> +
> +/* cru clocks */

Missing clock for 7. You are not supposed to have any holes here.




> +#define ARMCLK				8
> +#define CLK_GPU				9
> +#define ACLK_RKNN			10

Best regards,
Krzysztof


