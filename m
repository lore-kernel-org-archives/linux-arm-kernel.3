Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B504B1090225
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 13:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksvyivwMMcfAco4JH1SNvzalhs1WV6ffPUpIeWy4SQ8=; b=y1WvgzSUi8O2QMaT0Y/fTYt2kI
	lv+NxERW77m57gq48ZXtoacBwZoyX/4PmL00+4saXZBgurvPvLvw6fNwNWZwdhTTk4Gujcff8UjPG
	Tl7X/cVEwWLWQsoHz5YyjbtlO9vUZrEOWYcWge+OIaxpttqh3SOzHn/oxwekS953ZWGdIQuOLrTH3
	X6vbJn0hLvid1ORxcr6mf+lxGehIYNnYSMOZLg0DvtoNtx8xhQdMRcO+ekbv7XoYsstA6CwGHlr9X
	GFMbMkousRBYPe2PIjBCbqc2/dB2K5WS4E9J4D6Ev3PVQSD4gmhx2W+GcuG6s+M7zhWzFQuk8sX7c
	QfnMnT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DaG-0000000AhWq-1slw;
	Thu, 19 Mar 2026 13:38:44 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3DaD-0000000AhVo-2omB;
	Thu, 19 Mar 2026 13:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1773927515;
	bh=ksvyivwMMcfAco4JH1SNvzalhs1WV6ffPUpIeWy4SQ8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Wjg+5HA2DcTy7ImzDCfL/hiwNCW3P+AT+sac3h1AcSSNPOrO713uAzTj+LGFyQIFN
	 qZw7s81n5YdPRSxoA+qWuuOqKcdY5sAKCEH1+bgXIPB6PDV/AKYCjaJZ38qyuU8n+E
	 +NbUAIZRrQvXeRWqEhXISlJM+aOu9BAoOryWWTIM=
Message-ID: <5a390e368fa74f7f96bcceefea34af306d768929.camel@crapouillou.net>
Subject: Re: [PATCH 05/15] dt-bindings: rtc: ingenic,rtc: Use generic
 power-controller schema
From: Paul Cercueil <paul@crapouillou.net>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J. Wysocki"	 <rafael@kernel.org>, Ulf
 Hansson <ulf.hansson@linaro.org>, Florian Fainelli	
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Saenz Julienne <nsaenz@kernel.org>, Lee
 Jones <lee@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>,  Jerome
 Neanne <jerome.neanne@baylibre.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>, Heiko
 Stuebner <heiko@sntech.de>, Joseph Chen <chenjh@rock-chips.com>,  Chris
 Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>,
 Sebastian Reichel	 <sebastian.reichel@collabora.com>, Andreas Kemnade
 <andreas@kemnade.info>,  Jonathan =?ISO-8859-1?Q?Neusch=E4fer?=	
 <j.neuschaefer@gmx.net>, Lubomir Rintel <lkundrak@v3.sk>, Julien Panis	
 <jpanis@baylibre.com>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Alexander Kurz <akurz@blala.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 	linux-rtc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260316-power-controller-v1-5-92c80e5e1744@nxp.com>
References: <20260316-power-controller-v1-0-92c80e5e1744@nxp.com>
	 <20260316-power-controller-v1-5-92c80e5e1744@nxp.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Date: Thu, 19 Mar 2026 12:12:52 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_063842_238466_4A0CA1D0 
X-CRM114-Status: GOOD (  10.70  )
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

Hi,

Le lundi 16 mars 2026 =C3=A0 22:47 +0800, Peng Fan (OSS) a =C3=A9crit=C2=A0=
:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Convert the binding to use the generic power-controller schema
> instead by
> referencing power-controller.yaml and removing the local
> `system-power-controller` property definition.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml | 7 +------
> =C2=A01 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> index
> de9879bdb3175a7e0f24304b5a084a8faa233c46..415566d8dba564ebad976689596
> bbcd699ed6021 100644
> --- a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> @@ -11,6 +11,7 @@ maintainers:
> =C2=A0
> =C2=A0allOf:
> =C2=A0=C2=A0 - $ref: rtc.yaml#
> +=C2=A0 - $ref: /schemas/power/power-controller.yaml#
> =C2=A0=C2=A0 - if:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> @@ -53,12 +54,6 @@ properties:
> =C2=A0=C2=A0 "#clock-cells":
> =C2=A0=C2=A0=C2=A0=C2=A0 const: 0
> =C2=A0
> -=C2=A0 system-power-controller:
> -=C2=A0=C2=A0=C2=A0 description: |
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Indicates that the RTC is responsible for=
 powering OFF
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the system.
> -=C2=A0=C2=A0=C2=A0 type: boolean
> -
> =C2=A0=C2=A0 ingenic,reset-pin-assert-time-ms:
> =C2=A0=C2=A0=C2=A0=C2=A0 minimum: 0
> =C2=A0=C2=A0=C2=A0=C2=A0 maximum: 125

