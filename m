Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BE3CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzjSzcMiMfvyxgchJvQg0UkKHrfCLh0KZ54XotRuE78=; b=K8TohoV0sRWsdRgWt/VnO420Jt
	XOqJ+OspXRXWOR9NJTeHjDhJH1bhdJUoUlR04IOOJ/SqnV1eYE0MlPj2MJin8yFaxDcmztzyTPonm
	v6yJGGjoH/qBuhXQDLJNm529n92mMLYhcaseNsPuw7+7mdJcQA5qz45XgoJ+4TdB7GEjCzSz22hPS
	7C5OzxTFNS+PxBMHYK6sOPDajZyxF2cds9eiSqo7TWphuW5RZ+TUrReZB6RqeL4CNBAOqZc1wLua8
	SzgMnSOTrTih8Vj62E2UEV5lu6W93gBhaKidy8kIqf8H7lI2TNSAHi2C1wU9dLZ7vK05PxilYhHhS
	YKMSfAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7rZ-0000000GIk8-0FXf;
	Tue, 21 Oct 2025 08:37:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7rW-0000000GIhw-15AI;
	Tue, 21 Oct 2025 08:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=uzjSzcMiMfvyxgchJvQg0UkKHrfCLh0KZ54XotRuE78=; b=qB5LIpGNS6VFKFLCsQ7oi+wSOg
	/gArHf6epn6m21W3unoEXDPGUQAXZ9m7K7Rn+oeJ7JoBTN+ERYRDShJuirU885aLX5XyGLpHTXBSC
	E1YaPDNxlmOwHcY/a/j2vCuQvvkr2tNAxR5Y2lJh7dynyISUinvs6ndeDB5YVgvegEbddLJbE+3r3
	sita/nZb3YjX638SsaONPcDcq/p9RieF4Nv9+pKLjxP4esookDF/TG2wvF1AkNtYYF3h8sVihnN5a
	hCy0rvV3e/Eq3GOpFSmgjhDapqEmqGYm44wguRibcHutYarOgTIftclczed7RRtZhSD9Y+Z+PoJaK
	zMCyixjQ==;
Received: from [212.111.240.218] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vB7rS-0001TP-CV; Tue, 21 Oct 2025 10:36:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 finley.xiao@rock-chips.com
Subject: Re: [PATCH v4 6/7] dt-bindings: clock: rockchip: Add RK3506 clock and reset
 unit
Date: Tue, 21 Oct 2025 10:36:53 +0200
Message-ID: <24128799.6Emhk5qWAg@phil>
In-Reply-To: <20251021065232.2201500-7-zhangqing@rock-chips.com>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
 <20251021065232.2201500-7-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_013658_294445_2C16790D 
X-CRM114-Status: GOOD (  15.28  )
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

Am Dienstag, 21. Oktober 2025, 08:52:31 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:
> From: Finley Xiao <finley.xiao@rock-chips.com>
>=20
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
>=20
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3506-cru.yaml   |  45 +++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++++++++++
>  3 files changed, 541 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk35=
06-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.=
yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
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

I think we want clocks and clock-names properties here for xin24m
similar to the rv1126b binding (and other modern soc bindings)

Also, I think we'll need

   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the syscon managing the "general register files" (GRF),
       if missing pll rates are not changeable, due to the missing pll
       lock status.

because, you're using RK3506_GRF_SOC_STATUS
for the PLL locking status.


Heiko



