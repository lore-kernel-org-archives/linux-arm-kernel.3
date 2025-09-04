Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2F4CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwge+blLUFpH6Ek92QEQxISXEiFpHVzTGg65l+goiiY=; b=d1ghfExD0nzMug5Gq949e7CaZf
	yVMGSZ8VUGvONRhsvvyuG8V0UGqhNMrdd0iB5/t5N3fG/xdd8olEPQ3vRzaVwtA9YrxhXREgCQjEV
	inyb4VB+Mq2tNLFH/5VX1YyacUKfd7zoeTZlLjMnuTVeexRIycIeC1MRB4+MVAb4WyOHP7ZcrGrHb
	TN5LCpv+5yfEyzdqOSxLUd+H40DSb+KgCgxAmVruTuE0M4zvhqpddpjbU6YyfI9f6cdXS7ntoIoy2
	k26QP+Lj08X1uMkEGaX84JL9eR3LNFwGeFm8BXku7oeR3djy/RtyxHuEFj9mOlQfcoz1ctVj5VkS5
	xk6234KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM6f-0000000G5rm-1uXR;
	Fri, 05 Sep 2025 02:23:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuJew-0000000FDHx-2kpG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 23:46:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4C5B6028C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 23:46:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76799C4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Thu,  4 Sep 2025 23:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757029589;
	bh=i1kFtWy98vImxO8YkS1RH8GElz9dgakxtm96c9NmdD4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RKkfQf2F2iXVQnd3u2s1Vpw416n8APKIV+klP8CIlxhOGsrFQcEruD3e1jJY4TS/+
	 GNGL5Eu9fnKALGAGXmc5WdjSoiu8hGFxf2x23O9DqXuWXx6cVe/LbA1tYi9gx4qF6Q
	 czU4cIgWTR8ArAkIpF/IixIPcs86X65pelkr+qtHkVuvHOMK4jrRe3Hbu+ztl3JJ5h
	 KanIaXDpZKJxlwkPpx0yu/sA4jMVB/bnjB+JBIHXWf6I1ec0NAvs6I4iyGagAXaTMT
	 NSjZ8ZMiRKnAKWXYLtA1KwgleVv/iqKs3VLUU+3LRkiexc4IFhpBpLvRaExOIzB6RV
	 G5bHBnMLjOQCQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61ce4c32a36so2936179a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 16:46:29 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw8Mmm7fzUgxaGupnlRQCgAPqteygBW9fuBlI7kevKK2Jxq0DFg
	l3of0ShJmdk+SOc2UEkgjmPnGPIGcFynejtJRh3GhNlK99ERwKPRLNlioij8edKK7ifoKKPTuT5
	WpS/MT9TKSUWdMxssqID5zlfBc0WX+Q==
X-Google-Smtp-Source: AGHT+IEz5bRGq1Ef5wXJp0xhiW6NY7VImt7KxXjfQYc7qioU1N0YZwuPJSsQyLbbm0HDP2yexpCWjHdRGmZMKty8ZyY=
X-Received: by 2002:a05:6402:370c:b0:61d:1182:7679 with SMTP id
 4fb4d7f45d1cf-61d26d72ffamr19643711a12.27.1757029588044; Thu, 04 Sep 2025
 16:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250805232502.2827725-1-robh@kernel.org>
In-Reply-To: <20250805232502.2827725-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Sep 2025 18:46:03 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLQ_5X0STH=eSbjtkLkvgr+iPDwtLQYCntgiO8s1Dwy4A@mail.gmail.com>
X-Gm-Features: Ac12FXzGVurdBcMt-pBPjtPBNvxvRRQD8iIew05zyJeySdOtVRKk7OooxuRiu0A
Message-ID: <CAL_JsqLQ_5X0STH=eSbjtkLkvgr+iPDwtLQYCntgiO8s1Dwy4A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: marvell: Convert marvell,armada-370-xp
 boards to DT schema
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Aug 5, 2025 at 6:25=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Convert Marvell Armada 370/XP based boards to DT schema format.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/arm/marvell/98dx3236.txt         | 23 ------
>  .../bindings/arm/marvell/armada-370-xp.txt    | 24 ------
>  .../arm/marvell/marvell,armada-370-xp.yaml    | 78 +++++++++++++++++++
>  3 files changed, 78 insertions(+), 47 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/marvell/98dx323=
6.txt
>  delete mode 100644 Documentation/devicetree/bindings/arm/marvell/armada-=
370-xp.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell=
,armada-370-xp.yaml

Ping on this and the 5 other board conversions.

>
> diff --git a/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt b=
/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
> deleted file mode 100644
> index 64e8c73fc5ab..000000000000
> --- a/Documentation/devicetree/bindings/arm/marvell/98dx3236.txt
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Marvell 98DX3236, 98DX3336 and 98DX4251 Platforms Device Tree Bindings
> -----------------------------------------------------------------------
> -
> -Boards with a SoC of the Marvell 98DX3236, 98DX3336 and 98DX4251 familie=
s
> -shall have the following property:
> -
> -Required root node property:
> -
> -compatible: must contain "marvell,armadaxp-98dx3236"
> -
> -In addition, boards using the Marvell 98DX3336 SoC shall have the
> -following property:
> -
> -Required root node property:
> -
> -compatible: must contain "marvell,armadaxp-98dx3336"
> -
> -In addition, boards using the Marvell 98DX4251 SoC shall have the
> -following property:
> -
> -Required root node property:
> -
> -compatible: must contain "marvell,armadaxp-98dx4251"
> diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-370-xp.=
txt b/Documentation/devicetree/bindings/arm/marvell/armada-370-xp.txt
> deleted file mode 100644
> index c6ed90ea6e17..000000000000
> --- a/Documentation/devicetree/bindings/arm/marvell/armada-370-xp.txt
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Marvell Armada 370 and Armada XP Platforms Device Tree Bindings
> ----------------------------------------------------------------
> -
> -Boards with a SoC of the Marvell Armada 370 and Armada XP families
> -shall have the following property:
> -
> -Required root node property:
> -
> -compatible: must contain "marvell,armada-370-xp"
> -
> -In addition, boards using the Marvell Armada 370 SoC shall have the
> -following property:
> -
> -Required root node property:
> -
> -compatible: must contain "marvell,armada370"
> -
> -In addition, boards using the Marvell Armada XP SoC shall have the
> -following property:
> -
> -Required root node property:
> -
> -compatible: must contain "marvell,armadaxp"
> -
> diff --git a/Documentation/devicetree/bindings/arm/marvell/marvell,armada=
-370-xp.yaml b/Documentation/devicetree/bindings/arm/marvell/marvell,armada=
-370-xp.yaml
> new file mode 100644
> index 000000000000..e65eadfbd097
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/marvell/marvell,armada-370-xp=
.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +---
> +$id: http://devicetree.org/schemas/arm/marvell/marvell,armada-370-xp.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Armada 370 and Armada XP platforms
> +
> +maintainers:
> +  - Andrew Lunn <andrew@lunn.ch>
> +  - Gregory Clement <gregory.clement@bootlin.com>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ctera,c200-v2
> +              - dlink,dns327l
> +              - globalscale,mirabox
> +              - netgear,readynas-102
> +              - netgear,readynas-104
> +              - marvell,a370-db
> +              - marvell,a370-rd
> +              - seagate,dart-2
> +              - seagate,dart-4
> +              - seagate,cumulus-max
> +              - seagate,cumulus
> +              - synology,ds213j
> +          - const: marvell,armada370
> +          - const: marvell,armada-370-xp
> +
> +      - items:
> +          - enum:
> +              - mikrotik,crs305-1g-4s
> +              - mikrotik,crs326-24g-2s
> +              - mikrotik,crs328-4c-20s-4s
> +          - const: marvell,armadaxp-98dx3236
> +          - const: marvell,armada-370-xp
> +
> +      - items:
> +          - const: marvell,db-xc3-24g4xg
> +          - const: marvell,armadaxp-98dx3336
> +          - const: marvell,armada-370-xp
> +
> +      - items:
> +          - const: marvell,db-dxbc2
> +          - const: marvell,armadaxp-98dx4251
> +          - const: marvell,armada-370-xp
> +
> +      - items:
> +          - enum:
> +              - lenovo,ix4-300d
> +              - linksys,mamba
> +              - marvell,rd-axpwifiap
> +              - netgear,readynas-2120
> +              - synology,ds414
> +          - const: marvell,armadaxp-mv78230
> +          - const: marvell,armadaxp
> +          - const: marvell,armada-370-xp
> +
> +      - items:
> +          - const: plathome,openblocks-ax3-4
> +          - const: marvell,armadaxp-mv78260
> +          - const: marvell,armadaxp
> +          - const: marvell,armada-370-xp
> +
> +      - items:
> +          - enum:
> +              - marvell,axp-db
> +              - marvell,axp-gp
> +              - marvell,axp-matrix
> +          - const: marvell,armadaxp-mv78460
> +          - const: marvell,armadaxp
> +          - const: marvell,armada-370-xp
> +
> +additionalProperties: true
> --
> 2.47.2
>

