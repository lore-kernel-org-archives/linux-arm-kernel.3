Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518E6CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXbqGEqtn7uQLSJTDpkbfTb/HIT9zRnLyNNGASNhKDc=; b=nkPzKUsKU8m/obVTC5PWd6RNWP
	pUtBcluWj+KTDjc8d1y3gd/J+lfTeoJLm2dXzW3qCt4AF1EcYd1iElJMDVKEPDTkVFmZXLHmvFtfD
	kNEF3D0PFiyskA4obD47jKP8tVMp0OXOR1tZl83+4mJjL7ZF/qRQguscta3lPtOcyE+WgDgvLsvHb
	9BYWYpuQpwXA71soNfSawOXV8ST35ooiPuEAcFu0s/2jXYkTa/Nc0DKzqaKUGTIyyVU/tQ6UYtDde
	bgK+QtESJKHC6Yc0Vrwb6i/ZrJFwdZoVTdaQ7Wzx2Qe2O/Y/o7SV2SH1uQMcUFJAJZO9sbpQFB3vd
	Y15TDCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7tM-0000000GJMD-2Y6y;
	Tue, 21 Oct 2025 08:38:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7tK-0000000GJLK-0Mb4;
	Tue, 21 Oct 2025 08:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=GXbqGEqtn7uQLSJTDpkbfTb/HIT9zRnLyNNGASNhKDc=; b=iEdMi9lIca+YqotIqGbMIEpwR8
	z073jtgmRswef6NyTJsXqw8tvedCaf67afY5Up+KyW2MoL+XrmFr6G0+2reuEJ1HdXbvIuA/ePs9r
	4HuGjGADqCQMBO5DJUxD9RGGTzwtzzVZQbtXvdCyc+Og6PCT8aRmiSeSIibQK9GdBz9a7q4OfO/Qv
	LYiRKWrveDlm8s1T2cmeKVum+KxCcyQ2QAagVs+BL5OKQGhMuMNl+hWVX6tHFAydUkonqZo6hQctF
	OWPz21P82+fVZd+CujyborfqXwX5kOqBvc+Rt7XmC5ST7WdLe3S3mT1nEbi8LQhEXwSxW4HrXf3gx
	uaNGptCA==;
Received: from [212.111.240.218] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB7tH-0001Ua-Sv; Tue, 21 Oct 2025 10:38:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 finley.xiao@rock-chips.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: clock, reset: Add support for rv1126b
Date: Tue, 21 Oct 2025 10:38:46 +0200
Message-ID: <4463339.ejJDZkT8p0@phil>
In-Reply-To: <20251021065232.2201500-3-zhangqing@rock-chips.com>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
 <20251021065232.2201500-3-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_013850_124513_E8223CCC 
X-CRM114-Status: GOOD (  15.82  )
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

Hi Elaine,

Am Dienstag, 21. Oktober 2025, 08:52:27 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:
> Add clock and reset ID defines for rv1126b.
> Also add documentation for the rv1126b CRU core.
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/clock/rockchip,rv1126b-cru.yaml  |  52 +++
>  .../dt-bindings/clock/rockchip,rv1126b-cru.h  | 392 +++++++++++++++++
>  .../dt-bindings/reset/rockchip,rv1126b-cru.h  | 405 ++++++++++++++++++
>  3 files changed, 849 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv11=
26b-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rv1126b-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rv1126b-cru.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru=
=2Eyaml b/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
> new file mode 100644
> index 000000000000..04b0a5c51e4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rv1126b-cru.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rv1126b-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RV1126B Clock and Reset Unit
> +
> +maintainers:
> +  - Elaine Zhang <zhangqing@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description:
> +  The rv1126b clock controller generates the clock and also implements a
> +  reset controller for SoC peripherals.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - rockchip,rv1126b-cru
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
> +
> +  clock-names:
> +    const: xin24m

I think we're missing the optional

   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the syscon managing the "general register files" (GRF),
       if missing pll rates are not changeable, due to the missing pll
       lock status.


because RV1126B_GRF_SOC_STATUS0 contains the PLL lock status.


Heiko




