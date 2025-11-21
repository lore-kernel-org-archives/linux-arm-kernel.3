Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBBCCFA477
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 07:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9QyhDASWexuySNVNRbyVic7YpT1WkuPHmlx9bTA2XQ=; b=I15orZVSgkJdft5BLsVWCp/P5H
	BsxwqumWaMom1HUfXNgAOWRt8lOB1wZ5EglhJoXYHLlea9T5ZrfI5yLLW3BkwYhIG0RiX2UsCg0jc
	BGse9+5yvcaIfYzX5PNLyRTQpRit3EJGD2LWN/UKIOABd9lfjTWq9p8hINJY4Dj/eBKkDwX+eMMaE
	NyEQP3QjSS3ZtC5Kk9cIHcpb2mekU0ETUjnBKOJki9bblXRSCkdikn30eY4YyWBTQXonZtgQdLNB+
	MZ7mIbKIHZ5SQ3CRqoyqDDIiDM7b2Der9rdGlM9k8z6XmHMFYZ69Rq4t3VlBngfcrntuQQ4DGQygJ
	TlSSQCUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLX3-00000007y88-0EOd;
	Fri, 21 Nov 2025 07:26:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLX0-00000007y7k-45zF;
	Fri, 21 Nov 2025 07:26:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33D0F4020E;
	Fri, 21 Nov 2025 07:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 826C4C4CEF1;
	Fri, 21 Nov 2025 07:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763709970;
	bh=zoTP0H6LCrDf44J80jKYYIbxqWfXSddsSjSQgVFRNfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L8CQ9wsFqMOEctmbhfeXOzYXupALekL3vnuD1Y7rFavM7Ye6aM9XIu49fnSyMVvD5
	 oZt/mKvzeMd7qpubTvXUhCKx1ZrmbtClmMg3lyMa/A8fFTl7xvjv0COubOw9SQ4pam
	 /hbucJ5shkJ/Eye/XId6Y/myqwJSjCHRiASna+zbiTyJTm0/V1O2BZiDzaR1hPvzhP
	 OLIpYfSGr14tRiYUzjNASGbSPGdpqPYafDTMAq9hzSE1EZRk9JLH6MwlXpha3izQW0
	 QKBEbvqHVif4zyYp9alSuBPJVkMrsuOq++wlIw8JTaSNBDRL/CfeHhMJHtKnQaZbO/
	 L6y3XBJucNLwQ==
Date: Fri, 21 Nov 2025 08:26:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de, 
	robh@kernel.org, p.zabel@pengutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, finley.xiao@rock-chips.com
Subject: Re: [PATCH v8 1/2] dt-bindings: clock: rockchip: Add RK3506 clock
 and reset unit
Message-ID: <20251121-tunneling-quaint-copperhead-18328e@kuoka>
References: <20251121024645.360615-1-zhangqing@rock-chips.com>
 <20251121024645.360615-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251121024645.360615-2-zhangqing@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_232611_057099_FE603A9C 
X-CRM114-Status: GOOD (  18.57  )
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

On Fri, Nov 21, 2025 at 10:46:44AM +0800, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3506-cru.yaml   |  54 ++++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++++++++++
>  3 files changed, 550 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> new file mode 100644
> index 000000000000..fee49700113e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> @@ -0,0 +1,54 @@
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
> +description:
> +  The RK3506 CRU generates the clock and also implements reset for SoC
> +  peripherals.
> +
> +properties:
> +  compatible:
> +    const: rockchip,rk3506-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Reference clock input. This is optional when the clock source
> +      has already been configured and enabled by the bootloader/firmware.

So your description confirms - this is not an optional clock. It must be
enabled/configure and it is always in the hardware. You could have
avoided one more version of patchset if you only bothered to respond to
review.

Drop description and make it required.

> +
> +  clock-names:
> +    const: xin24m

Nothing improved. Conor made comments some revisions ago and reminded
you about them. And you just ignored them?

That's just xin pin, isn't it?

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"

clocks and clock-names.

Best regards,
Krzysztof


