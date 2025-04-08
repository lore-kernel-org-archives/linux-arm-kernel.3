Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF26C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DaIn1hXvAed6evdNr/FMZd3K+jUtBILZseoN0UJCnA=; b=BTg3zxqLJwi6Laayj0VTBGwMV0
	JG+0VUt4KYf2xTz/gt6c714jHM7KmmusbIdeqDW5J+ntsjLgA/ofprlDdYMFrA4JD/m305EjLZiy8
	rw9pE0XH5wzulCAOxI/7ntaaqjFE6GlCav8g33HJFa8eklJVili9lxAME8rhc7UsxKIdb8pwYYiry
	+whSDCAKmzGfINZ2wZdTblLXBJUDnjyE/EORd/7mt5c4j/OFa+UTme2ralsgAu1CgqTTUflxxxxvZ
	VmBUGPnOKgyVGYISEYCX0pApetpMpWzNv+5heiVXmAnt5RmDIWgG7K0AHaprkBmAQcMH9CVmSzvtr
	c3aOmQSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QE-00000004HFY-0Glk;
	Tue, 08 Apr 2025 13:55:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28of-00000004AA6-2pQl;
	Tue, 08 Apr 2025 13:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/DaIn1hXvAed6evdNr/FMZd3K+jUtBILZseoN0UJCnA=; b=brAI1u2ulxGM0CCcKVIk9DLtsU
	x1QpBDf4t40EYyDk0aExI2CA+f1LjNX0RAFgksI6LHldUu9YOSlJIS1BhUkNNWNumPckieva8Fl3N
	MPKpKfIrmSgf0nEbPFy0URBBb2W93xlmIwDpp0L3imOkXltGVPBQgakdiLfq5ZzRtO4tjjDC9o1zO
	r/cVK+P2fc7XzfzfOw+evJd/s1kpAP1bP3kzv8dGzFqqiaCaaXl7gTQE4leefAPUucP/50aDr+QQ9
	WLtX6pnoQjaJpgmoe/e3fJqSAHNsz9VpejNpzoBDyqij3Wzx692DediLU+cvvztjYwa5IpbLBbM61
	YMlFt0bw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28oc-00000008J2W-2nK7;
	Tue, 08 Apr 2025 13:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/DaIn1hXvAed6evdNr/FMZd3K+jUtBILZseoN0UJCnA=; b=Pj/kCOmSCTuBYrYVphjmizbPXT
	PoWmvrUNX5cTy4GMWhifyZCeMyTjgleXjvMmM/k6tI+4/jznlaOBbR4gOJgNNsm446wUAwyuhTzuY
	L5fc6bIowzbzaXxf2HohBWN1cs/RUjGMtxIIsl479bZ0fd6YtfxwT5C46MfbnI133zjrGCORTe2sY
	2V+EEQeFTzOdwuL6G8YjXDdfDSqW2Vb8pK+Yu1GGKjer0U8xZOCCk2yIBMNY9v9SUPufm6fkIohgI
	WCxaJDn9tZNePV7sXXs0Jxa9sAa/kRKzFHNNxEbAQG8Xz56Mt/C5Uz1mlyvTZAtWuofnGfhwQDn7L
	hNOs0iLw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u28oD-00035s-9O; Tue, 08 Apr 2025 15:16:09 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Niklas Cassel <cassel@kernel.org>, Alexey Charkov <alchark@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, kernel@collabora.com
Subject: Re: [PATCH v4 6/6] arm64: dts: rockchip: Add rkvdec2 Video Decoder on
 rk3588(s)
Date: Tue, 08 Apr 2025 15:16:05 +0200
Message-ID: <9432379.CDJkKcVGEf@diego>
In-Reply-To: <20250325213303.826925-7-detlev.casanova@collabora.com>
References: <20250325213303.826925-1-detlev.casanova@collabora.com>
 <20250325213303.826925-7-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_141634_870176_64F0AFC6 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

Hi Detlev,

Am Dienstag, 25. M=C3=A4rz 2025, 22:22:22 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Detlev Casanova:
> Add the rkvdec2 Video Decoder to the RK3588s devicetree.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---

> +	vdec1_mmu: iommu@fdc40700 {
> +		compatible =3D "rockchip,rk3588-iommu", "rockchip,rk3568-iommu";
> +		reg =3D <0x0 0xfdc40700 0x0 0x40>, <0x0 0xfdc40740 0x0 0x40>;
> +		interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
> +		clocks =3D <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
> +		clock-names =3D "aclk", "iface";
> +		power-domains =3D <&power RK3588_PD_RKVDEC0>;
> +		#iommu-cells =3D <0>;
> +	};

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boo=
t/dts/rockchip/rk3588-base.dtsi
index 24ecbff06cd27..8bde8e257eac9 100644
=2D-- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1395,7 +1395,7 @@ vdec1_mmu: iommu@fdc40700 {
                interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH 0>;
                clocks =3D <&cru ACLK_RKVDEC0>, <&cru HCLK_RKVDEC0>;
                clock-names =3D "aclk", "iface";
=2D               power-domains =3D <&power RK3588_PD_RKVDEC0>;
+               power-domains =3D <&power RK3588_PD_RKVDEC1>;
                #iommu-cells =3D <0>;
        };

Needs to use the correct power-domain, otherwise ends in SErrors on 6.15-rc1


Heiko



