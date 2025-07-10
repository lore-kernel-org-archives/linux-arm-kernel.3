Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2BEC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44pTvFaVwV8DGemXvVyLFKizLr/RNUQE/CGSbN7Xx/4=; b=rIiMNEtOKwLTYzQJW++aQ/d3J9
	ci9FS7QQ/cINx3fu5LXEJBlEw0snNo84onmGAwX5ewEuR2xVac6xUE4/ApT/01ptGuB9zl9necLrB
	W8mV1kS8bVwUSNKkecG+sp4uDbLcT12MjgxmvstIqgCNBvzOvZS0/hwxlVrk9wSIv+s8EolFCiOR9
	ajk4jB/BroycKrekb/gHIwbSwdDGZOad4vV6fpQuqUcvLFFMui8eZ9xISRN/ejG/DXUAVyrfRiOXF
	et+61lvIwAKaQhYf6Nh9fZEzgRZmwooHgZxnXgxhYhjz+SbKT1IKpY0zUx0mawC44T5RI+I+oXYez
	dLKt2JHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqxs-0000000Bs26-1DAE;
	Thu, 10 Jul 2025 13:05:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpLD-0000000Bcpy-1SQF;
	Thu, 10 Jul 2025 11:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=44pTvFaVwV8DGemXvVyLFKizLr/RNUQE/CGSbN7Xx/4=; b=oWqA3t5FpiwDDXz3OxYTP0050s
	uo4AjZyZHhIUBwCD3rcwbx1oUdmgKY/XOq8QfxELCK0s0b6ROHLFRy0hpIm1B2jYOnC2k9yQEoxyo
	CAUJB8l3om1s7GESdPFCQaYxCQf6QF30ziZ9hTXT5L7163S4KBLqsf2hUVPUMiBfwaZxvp/QrDk31
	Q1rNS16MOCr9O3SY3PK5WJrNZtvqKaEvgth0l6a+tQg1c3zAIyf/LWtsBsCYF7HG0mmaitsPwMeHW
	svILvWuLii/xUsSMZYLlFz+AauuNXHNxM3oIQEetbP2yJm40YmcesL5jG8PDCGmewJtxxIPQnwACz
	f6WwTd7Q==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZpL6-0004SZ-8y; Thu, 10 Jul 2025 13:21:20 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v6 4/7] dt-bindings: thermal: rockchip: document otp thermal trim
Date: Thu, 10 Jul 2025 13:21:19 +0200
Message-ID: <3592348.tdWV9SEqCh@phil>
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-4-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <20250610-rk3576-tsadc-upstream-v6-4-b6e9efbf1015@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_042127_390619_2936A70B 
X-CRM114-Status: GOOD (  16.47  )
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

Am Dienstag, 10. Juni 2025, 14:32:40 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> Several Rockchip SoCs, such as the RK3576, can store calibration trim
> data for thermal sensors in OTP cells. This capability should be
> documented.
>=20
> Such a rockchip thermal sensor may reference cell handles that store
> both a chip-wide trim for all the sensors, as well as cell handles
> for each individual sensor channel pointing to that specific sensor's
> trim value.
>=20
> Additionally, the thermal sensor may optionally reference cells which
> store the base in terms of degrees celsius and decicelsius that the trim
> is relative to.
>=20
> Each SoC that implements this appears to have a slightly different
> combination of chip-wide trim, base, base fractional part and
> per-channel trim, so which ones do which is documented in the bindings.
>=20
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Acked-by: Heiko Stuebner <heiko@sntech.de>

with one question below

> ---
>  .../bindings/thermal/rockchip-thermal.yaml         | 61 ++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/rockchip-thermal.y=
aml b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> index 49ceed68c92ce5a32ed8d4f39bd88fd052de0e80..573f447cc26ed710063827759=
8b0e745d436fd01 100644
> --- a/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/rockchip-thermal.yaml
> @@ -40,6 +40,17 @@ properties:
>        - const: tsadc
>        - const: apb_pclk
> =20
> +  nvmem-cells:
> +    items:
> +      - description: cell handle to where the trim's base temperature is=
 stored
> +      - description:
> +          cell handle to where the trim's tenths of Celsius base value i=
s stored
> +
> +  nvmem-cell-names:
> +    items:
> +      - const: trim_base
> +      - const: trim_base_frac
> +

are we sure, we want underscores here?
trim-base, trim-base-frac looks somewhat nicer.

Heiko



