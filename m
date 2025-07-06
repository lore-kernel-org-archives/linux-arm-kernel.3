Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BCCC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 23:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8mXtsnzWr44dCBY/VD2LX7Tq4Hq+eA4Rif8Z8xYcMI=; b=iQ4SWWj+9E9p9F3FdugFkvV442
	/F6gIAd7b6kDoZPAnGD2ejBgfiDlGkbZXyCQ/m0v0NcDHv5D7+9K48tN550fCP8SZE/cMxHBfq8ag
	tqpqzMizw7gHg6iSMkUJ1+o0gsSK3Jhv50Y2fI3Zfd07ADJ01w8B9bJDCDNN2awfY0PqUwlgjrpNt
	V5fwZirWxmmL+05wG6p93HD48lRIQkIBM9D1hXVgoYxK7EkNCckLLsLbruwmrjSmiU3TlrgEAaMuj
	7x92LAkCxe6iUXnBRCAiYisQ3ozac5Gc8uwGTyux8ARR7ncVsqS2PdavvwDzIknXBG0k+tVxfc+ns
	EMt12KOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYyQ-00000000y3e-1hrJ;
	Sun, 06 Jul 2025 23:40:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYYw5-00000000xoJ-2lur
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 23:38:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A98CB1E8D;
	Sun,  6 Jul 2025 16:38:00 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB5DB3F694;
	Sun,  6 Jul 2025 16:38:11 -0700 (PDT)
Date: Mon, 7 Jul 2025 00:36:40 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>, Samuel
 Holland <samuel@sholland.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: power: Add A523 PPU and PCK600 power
 controllers
Message-ID: <20250707003640.73e08911@minigeek.lan>
In-Reply-To: <20250627152918.2606728-2-wens@kernel.org>
References: <20250627152918.2606728-1-wens@kernel.org>
	<20250627152918.2606728-2-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_163817_798437_07CEDC90 
X-CRM114-Status: GOOD (  22.07  )
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

On Fri, 27 Jun 2025 23:29:15 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The A523 PPU is likely the same kind of hardware seen on previous SoCs.
> 
> The A523 PCK600, as the name suggests, is likely a customized version
> of ARM's PCK-600 power controller. Comparing the BSP driver against
> ARM's PPU datasheet shows that the basic registers line up, but
> Allwinner's hardware has some additional delay controls in the reserved
> register range. As such it is likely not fully compatible with the
> standard ARM version.
> 
> Document A523 PPU and PCK600 compatibles.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Both PPUs are merely mentioned in the user manual, but do not have a
register description. But the BSP source code confirms the mapping of
the power domains used below, so:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  .../bindings/power/allwinner,sun20i-d1-ppu.yaml   |  2 ++
>  .../power/allwinner,sun55i-a523-pck600.h          | 15 +++++++++++++++
>  .../dt-bindings/power/allwinner,sun55i-a523-ppu.h | 12 ++++++++++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
>  create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
> 
> diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
> index f578be6a3bc8..b9f550994512 100644
> --- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
> +++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
> @@ -18,6 +18,8 @@ properties:
>      enum:
>        - allwinner,sun20i-d1-ppu
>        - allwinner,sun8i-v853-ppu
> +      - allwinner,sun55i-a523-ppu
> +      - allwinner,sun55i-a523-pck-600
>  
>    reg:
>      maxItems: 1
> diff --git a/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h b/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
> new file mode 100644
> index 000000000000..6b3d8ea7bb69
> --- /dev/null
> +++ b/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_POWER_SUN55I_A523_PCK600_H_
> +#define _DT_BINDINGS_POWER_SUN55I_A523_PCK600_H_
> +
> +#define PD_VE			0
> +#define PD_GPU			1
> +#define PD_VI			2
> +#define PD_VO0			3
> +#define PD_VO1			4
> +#define PD_DE			5
> +#define PD_NAND			6
> +#define PD_PCIE			7
> +
> +#endif /* _DT_BINDINGS_POWER_SUN55I_A523_PCK600_H_ */
> diff --git a/include/dt-bindings/power/allwinner,sun55i-a523-ppu.h b/include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
> new file mode 100644
> index 000000000000..bc9aba73c19a
> --- /dev/null
> +++ b/include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_POWER_SUN55I_A523_PPU_H_
> +#define _DT_BINDINGS_POWER_SUN55I_A523_PPU_H_
> +
> +#define PD_DSP			0
> +#define PD_NPU			1
> +#define PD_AUDIO		2
> +#define PD_SRAM			3
> +#define PD_RISCV		4
> +
> +#endif /* _DT_BINDINGS_POWER_SUN55I_A523_PPU_H_ */


