Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B57CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcnvnJ0EDsbh2HgTw68qT2VPMbWvBxyXim8/aNAse1I=; b=tyHooa4CNUUWnrGgbnir/q4kRb
	4fJXcoteELMtiqxg8+LgeBqG5UtKIIOuRydOY2Lu8PoxY5+q8zjOiq4YBHDhdDvrM4QoPmjwjpGgV
	wKXvvqcZprt6Ax18etGnMBwoSFx25GN33LI+tFbx2SJeUf2y+X2L8QYJiKMfFwSPkx3m0pKUN74O9
	FnRTSr9uvFAcVstKuGlxwVCmsmxGRxuYelJZYAekzDd6wuYGrSPu5Inxb1jY0IhtAVJyc/Xt/NZGD
	9YVt1jNGJ2Y86JlaMzA7HoKOkqRoBcfCMWzdVeJfen5TOIBG4Ze97/erpNeXrCEou+Floy0wcJn8X
	dqoMDo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNjS-0000000E670-1dDT;
	Mon, 27 Oct 2025 13:57:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNjP-0000000E66a-3Mxp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 13:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E79140408;
	Mon, 27 Oct 2025 13:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E7C3C4CEF1;
	Mon, 27 Oct 2025 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573475;
	bh=vQlBeuOimfnDQArLcW6HVQ1cZwXaJm+WEydOmRjU5rE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QYX9aQgnXs4w4qx23uZ1wSZQTKEhkqsu6hBA8OFqCL03nz4a66I2RXsW+tItPEiZB
	 tTr+MMdzfFfQaEPMNodsnPXLZE8WCKh+lHTgF1W4gXBIi9U6kkQI382+B2swxQjFrv
	 S3LuZBfQXKw0wr6cX8MbB15mCu0dRuPNPFnBjdfBMMB+2YrxFlnO0UvwTjznpckpc4
	 hptzh3FzAeEHNNnePQXkAC3No2jW9SzTVKDMCuVmwymv7m+wKfeNW97T0SZepVPJxE
	 sn/w1JCP5khrBGhHV9essXo5om5jcbms9lj5N7tuYGT4/ExjTRd4qOejG4inPuWxaE
	 EyOKH6g+NzS4A==
Date: Mon, 27 Oct 2025 08:57:52 -0500
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: socionext,milbeaut-m10v-sdhci-3.0:
 convert to DT schema
Message-ID: <20251027135752.GA316916-robh@kernel.org>
References: <20251023-milbeaut-v1-1-3e4ff67110ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-milbeaut-v1-1-3e4ff67110ad@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_065755_906661_403D9F34 
X-CRM114-Status: GOOD (  23.08  )
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

On Thu, Oct 23, 2025 at 05:37:36PM +0000, Charan Pedumuru wrote:
> Convert SOCIONEXT Milbeaut SDHCI controller binding to YAML format.
> Add a new property "voltage-ranges" to resolve dt_check errors.
> 
> Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
> ---
>  .../devicetree/bindings/mmc/sdhci-milbeaut.txt     | 30 ---------
>  .../mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml     | 78 ++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt b/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
> deleted file mode 100644
> index 627ee89c125b..000000000000
> --- a/Documentation/devicetree/bindings/mmc/sdhci-milbeaut.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -* SOCIONEXT Milbeaut SDHCI controller
> -
> -This file documents differences between the core properties in mmc.txt
> -and the properties used by the sdhci_milbeaut driver.
> -
> -Required properties:
> -- compatible: "socionext,milbeaut-m10v-sdhci-3.0"
> -- clocks: Must contain an entry for each entry in clock-names. It is a
> -  list of phandles and clock-specifier pairs.
> -  See ../clocks/clock-bindings.txt for details.
> -- clock-names: Should contain the following two entries:
> -	"iface" - clock used for sdhci interface
> -	"core"  - core clock for sdhci controller
> -
> -Optional properties:
> -- fujitsu,cmd-dat-delay-select: boolean property indicating that this host
> -  requires the CMD_DAT_DELAY control to be enabled.
> -
> -Example:
> -	sdhci3: mmc@1b010000 {
> -		compatible = "socionext,milbeaut-m10v-sdhci-3.0";
> -		reg = <0x1b010000 0x10000>;
> -		interrupts = <0 265 0x4>;
> -		voltage-ranges = <3300 3300>;
> -		bus-width = <4>;
> -		clocks = <&clk 7>, <&ahb_clk>;
> -		clock-names = "core", "iface";
> -		cap-sdio-irq;
> -		fujitsu,cmd-dat-delay-select;
> -	};
> diff --git a/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
> new file mode 100644
> index 000000000000..6b67bef30347
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mmc/socionext,milbeaut-m10v-sdhci-3.0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SOCIONEXT Milbeaut SDHCI controller
> +
> +maintainers:
> +  - Taichi Sugaya <sugaya.taichi@socionext.com>
> +  - Takao Orito <orito.takao@socionext.com>
> +
> +description:
> +  The SOCIONEXT Milbeaut SDHCI controller is a specialized SD Host
> +  Controller found in some of Socionext's Milbeaut image processing SoCs.
> +  It features a dedicated "bridge controller." This bridge controller
> +  implements special functions like reset control, clock management for
> +  various SDR modes (SDR12, SDR25, SDR50) and physical pin property settings.
> +
> +allOf:
> +  - $ref: sdhci-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: socionext,milbeaut-m10v-sdhci-3.0
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +
> +  fujitsu,cmd-dat-delay-select:
> +    description:
> +      Its presence indicates that the controller requires a specific command
> +      and data line delay selection mechanism for proper operation, particularly
> +      when dealing with high-speed SD/eMMC modes.
> +    type: boolean
> +
> +  voltage-ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

Sounds more like a uint32-array.

> +    description:
> +      Two cells are required, first cell specifies minimum slot voltage (mV),
> +      second cell specifies maximum slot voltage (mV).
> +    maxItems: 1

You can better describe it like this:

items:
  - description: minimum slot voltage (mV)
  - description: maximum slot voltage (mV)

