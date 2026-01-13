Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E316BD0C83D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 10:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H/hNTgciu6FD3AcTNuZC1um8OdojwIPslmchvUjaNU=; b=b0g1s1b+1+gawobbPa9HZltBM5
	Zy9AmMKsvvha9abqVnBOaHJ5AFxpjjdDgpifKVgnz734INF7Hhu7I4sfNc6+d6lQL1aVBjGHymkW6
	36sicjG8seKJexBUHUA21UhI13+eGMd+YFheFiA5aJ8w0mIHe3v14ghj/gZ+2CEu4tRBpOw8ayhI7
	M9YinJXHo3yr7nX+AHsYAA6sM6qY+/de/a0El6P8Sytr4q4qdVYE88L2FTVM6vQ554z8AFMXQIuUV
	jaAblxKIrZlVOuzkv8P4j/VlW1tHrpttN7E+AlRl4JJHI6n9kj+UMlJPaQ/o+GGR1bJODHTStyiev
	huFJca9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbbY-00000006u4P-0sMI;
	Tue, 13 Jan 2026 10:26:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbbT-00000006u3Q-3UzK;
	Tue, 13 Jan 2026 10:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=5H/hNTgciu6FD3AcTNuZC1um8OdojwIPslmchvUjaNU=; b=f+oe9TAeVNeRg5dxijtlcbewz/
	8NqL4OlUILWM3MaE4inNGMQXs/GqUCwYjwoj6kn5QKowFEPZR5vIjTVEGRLHYS17UyO0KSxRI/y+Y
	mVg0qLOAAUPQL4YuGsCGYUtHx429wavsvYetCsCfZ6khZ0Wk9O8NaDL9SBogjxfPXi0DPI3QVJBbg
	ud+/E4Ebaoik4+Iu4zRvEycPKg3I4XWW02JtvojWYnB5QPBmusI5OZTaoKa4ffwjx+6NT7v6z3yZj
	Q0XqYllxcHVJ05dYNNgsqwbgZ7Mnc/Jrk9m9KOc/0McOMtf5N6geNPuNCFbQVXbKgdrC4ot9JCjt4
	TpaIqXUA==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfbbR-0025PF-Ey; Tue, 13 Jan 2026 11:26:22 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 guptarud@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rudraksha Gupta <guptarud@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Martijn Braam <martijn@brixit.nl>,
 Kamil =?UTF-8?B?VHJ6Y2nFhHNraQ==?= <ayufan@ayufan.eu>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Remove interrupt GPIO for WiFi for the
 Pinephone Pro
Date: Tue, 13 Jan 2026 11:26:21 +0100
Message-ID: <14738774.lVVuGzaMjS@diego>
In-Reply-To: <20260112-ppp_connectivity-v1-3-284d6e83b212@gmail.com>
References: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
 <20260112-ppp_connectivity-v1-3-284d6e83b212@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_022624_136765_42E37921 
X-CRM114-Status: GOOD (  15.90  )
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

Am Dienstag, 13. Januar 2026, 07:42:26 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Rudraksha Gupta via B4 Relay:
> From: Ondrej Jirman <megi@xff.cz>
>=20
> Wifi is currently unusable if interrupts are defined. Let's remove them
> so that Wifi networks are actually discoverable.

Please don't describe not what you're doing but why.

The interrupt seems to the one that is connected to wifi, so I'd expect
a description why that causes problems first, instead of going
"doesn't work for me" - "just remove it" .

As the below just looks like a temporary hack until the real cause is
found.

> Co-developed-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Co-developed-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> Signed-off-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 97d0bf455258..69bb9de4ce55 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -834,9 +834,6 @@ &sdio0 {
>  	brcmf: wifi@1 {
>  		compatible =3D "brcm,bcm4329-fmac";
>  		reg =3D <1>;
> -		interrupt-parent =3D <&gpio4>;
> -		interrupts =3D <RK_PD0 IRQ_TYPE_LEVEL_HIGH>;
> -		interrupt-names =3D "host-wake";
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&wifi_host_wake_l>;
>  	};
>=20
>=20

Thanks
Heiko



