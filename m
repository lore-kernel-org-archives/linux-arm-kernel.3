Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461F0C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNzVtAsxtGf0lFnJlcfQ3TByjHHmjVeIgw7TiXHmnEM=; b=fkGfkre0zAcP0gMsDsEps1vixc
	DlMRkEfBbFUZQ73TW+evHZcgjj18wMM4TvruTHGux24CpLUZ+zJ0wYzgaTR0nUiM9t9Kxd8GVSuIg
	V2JhBRbwrGIUHxEVw1PiMIU87JlT3DhwANiExN5oU9K99gqnmmHp25KdegOhKM+g3FmahK9wf2QbT
	AjjJ1PTvsJPQdJZsyRBPYzeWotHcNG0JsPuI9rp6qcpMKt1utK3+wrFCSB1VCBfZDvj+tn2zPpR6H
	IhA/RpjJi5fLDrCNHQD4XmEL5bDQOx5S58z1DPIP+gR+lFS9pb0LB+RguS+3m26HkNe1xcRhqrzMn
	NM9eBqYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulM5o-00000006brE-06uW;
	Mon, 11 Aug 2025 06:33:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulM3E-00000006bdv-08vx;
	Mon, 11 Aug 2025 06:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=jNzVtAsxtGf0lFnJlcfQ3TByjHHmjVeIgw7TiXHmnEM=; b=08oRKhIb1ajpli+TpTvmpRH+tl
	uEKnt6dZtNTopvuqjd613RK0L1/C0hYvZLIhNJjsKR93y1tgjTSYRQPSp5XUObmHBljtmdjC59nw3
	IN3ZtZb37VTpoI+kgkG2ucskyqnRCxJLr3i23yOwX2vbIymb2SOaAMpt3vDnoWx927okoBLRIXSUc
	CMF0m69rvjfBjrIDPSMgYpT8AK9KOinsArvfGZxqL0qlrED7VdOXHRxnniK15BmfWb9OCUto0h4PM
	jhmvqwZdw+GGuKkk4/hCozET4ujSOKMxXAi4hFT2S2NKAR/XnK9xufGxP78quMKKJsd65E+ots8o+
	EQ1ZgrTw==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulM33-0006sA-Nx; Mon, 11 Aug 2025 08:30:21 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, FUKAUMI Naoki <naoki@radxa.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: disable display subsystem for Radxa
 E52C
Date: Mon, 11 Aug 2025 08:30:19 +0200
Message-ID: <3125650.687JKscXgg@diego>
In-Reply-To: <20250810100020.445053-1-amadeus@jmu.edu.cn>
References: <20250810100020.445053-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_233032_098241_6E8FD45B 
X-CRM114-Status: GOOD (  15.36  )
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

Am Sonntag, 10. August 2025, 12:00:18 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Chukun Pan:
> The Radxa E52C SBC do not have HDMI output, so disable
> the display subsystem.
>=20
> Fixes: 9be4171219b6 ("arm64: dts: rockchip: Add Radxa E52C")
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

What actual problem does this fix?

=46or example we also enable on-soc iommus all the time, because they're on
the soc and don't need board-level properties.

The "display-subsystem" without users looks mostly in the same spot.

So I do expect a description of what proplem gets fixed that this needs
to be disabled.

Thanks
Heiko

> ---
>  arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts b/arch/ar=
m64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> index e04f21d8c831..3b519be6e1ea 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
> @@ -207,6 +207,10 @@ &cpu_l3 {
>  	cpu-supply =3D <&vdd_cpu_lit_s0>;
>  };
> =20
> +&display_subsystem {
> +	status =3D "disabled";
> +};
> +
>  &i2c0 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&i2c0m2_xfer>;
>=20





