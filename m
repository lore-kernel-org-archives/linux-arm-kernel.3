Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E72CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CW9LOlJAtSZATcZIaY6uLfTJOIqnCg+SkeFpTOqsGbw=; b=4jzkukl7zfWqRjCBxWP+iicTMc
	/0Ql9MJfCOHWz03T7UQR5y2VRg5eavUcoXoBxQ7wmCE6/u5bNkMeru1b3QoWr6BFEwwwxOZY3o4nF
	KaSGb1CsH9SpWlZGmyfYAPOFDNz7XEbwscoJwj1lBMT4hy1/j+aQDhHsj4/vx8bELbocqMIWkxFAr
	uOE4zu5RU7HKI554ZKpvMuYNzwrVVnGamdGZqVNj68zI438dBOqBftUWLAvFzx6LbFxCt4E4WZ2VW
	b0bKoM2yhgsPIgNo+LWG3ART3TsSvg6pI1cn2DXWZ/65vx7yx9PQmvTt/IdQqzjqlh7o3J60ex+ym
	RgmpUlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWLc-0000000Dnp8-2DGF;
	Tue, 02 Jun 2026 21:08:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWLZ-0000000DnoH-22q7;
	Tue, 02 Jun 2026 21:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CW9LOlJAtSZATcZIaY6uLfTJOIqnCg+SkeFpTOqsGbw=; b=ODppvQTZUOOtiSOWcFlUNW1uKK
	b9+m5bbK3ZQ4qMKyM4bsPZKmHRn7jvGmQvKT4GBYvXRMMzlbS7UcLMj+9j1Mrvtywx4BFNJhW/G4U
	1u9lxb7YMbrFCWAspW7Ewhi/cKm1iYtVZKNJMFX9QRfCMnz/WttwGdLDburXwPgxl+AS2Zqaof/jm
	AmGQ7xEXfcbCTr73Lt8ETxgVBEtQfdKK1q2sLTo3LzZKE4wvF2s042Z9wf1OONn1wl58A2mBs5nH/
	yWEDtdelYw5kgz7GXRBdL5FLeF4AOEKq+c8Q76bpTuT0q5DJ3XaP4tf2+mUOkovcjaI31NJtP/pmn
	uEE9Ikog==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: stable@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: fix emmc reset polarity on px30-cobra
Date: Tue, 02 Jun 2026 23:08:20 +0200
Message-ID: <3631825.d7IHhHJzqS@phil>
In-Reply-To: <20260512092225.34835-1-jakob.unterwurzacher@cherry.de>
References: <20260512092225.34835-1-jakob.unterwurzacher@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_140825_523230_3DB85FFF 
X-CRM114-Status: GOOD (  18.67  )
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

Am Dienstag, 12. Mai 2026, 11:22:09 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Jakob Unterwurzacher:
> Technically, the reset signal is active low - it's called RST_n after all.
>=20
> But it is ignored completely unless RST_n_FUNCTION=3D1 (byte 162 in extcs=
d)
> is set in the emmc. It is 0 per default.
>=20
> For emmcs that have RST_n_FUNCTION=3D1 we failed like this:
>=20
> 	[    3.074480] mmc1: Failed to initialize a non-removable card
>=20
> With this change they work normally.
>=20
> Cc: stable@vger.kernel.org
> Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and =
board variants")
> Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>

as Quentin remarked, author (@gmail) and signed-off-by do not match.
While I'm generally open to fixing things, when it touches the DCO this
isn't the case.

So please resend this with the correct author.

In general "git send-email" will do the correct thing (that From: line),
when patch author and email-id do not match.


Thanks
Heiko

> ---
>  arch/arm64/boot/dts/rockchip/px30-cobra.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/bo=
ot/dts/rockchip/px30-cobra.dtsi
> index b7e669d8ba4d..90751b04f95c 100644
> --- a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> @@ -35,7 +35,7 @@ emmc_pwrseq: emmc-pwrseq {
>  		compatible =3D "mmc-pwrseq-emmc";
>  		pinctrl-0 =3D <&emmc_reset>;
>  		pinctrl-names =3D "default";
> -		reset-gpios =3D <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
> +		reset-gpios =3D <&gpio1 RK_PB3 GPIO_ACTIVE_LOW>;
>  	};
> =20
>  	gpio-leds {
>=20





