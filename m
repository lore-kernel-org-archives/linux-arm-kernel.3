Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60DBC54756
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuJth4b7mSGrp3rbiwhR274TXr1yLV08nwiXwf4KD8c=; b=ssKP7YhGYoBTLuj4lyxEtNAe3I
	WBVu1Ie7NH+IPxeMzKke+JOiseJmXMhs6vixzKkIxyn8uv+iDOxq8NufX4q9THSiv0FSZXJYSxRnf
	FZZK4GD5iwQFEFWQPRJVRRjH57QekXnGpKU14GeQEXnSooJOAXgQMuHJ/I5f+gKBiXPoBjp9dW2Ju
	qeejP/gyH6GPpDqfmxDCDraZ/o/uyWWEa7Jf1j+osQRSb3YrwGEsVcMz+H0tR/9Wb4Xjyw3qxs8mA
	UjDhSbpkYZJDYGsfdC9gp63tTvC5ezLU7DaJvCD3KMRNOPvTkiTfcahyKFkMM2eyRMidPCMIOtl/k
	zpfQqfxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1Xg-00000000KdE-3Plh;
	Thu, 22 May 2025 08:44:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI1Lz-00000000IGC-2aQU;
	Thu, 22 May 2025 08:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=WuJth4b7mSGrp3rbiwhR274TXr1yLV08nwiXwf4KD8c=; b=cxed8hOHQAkc9ggZiVrM4KL4Fq
	Ohi3DyZ6gcYYOOCui+NtxigZS7eDiz3YSDAs7ws6Gs8/tIHOKIfDqqoO3v3VR+906Y8o9eZN8DeeU
	11U7Gbsjq0SYEqtR10yLiwPJu++N8vHDfx8tf8MdTRTrl5TK5z/WRCEeiZosv9Z5UZCQWZFyA2bzn
	QIh/sGh0lhzvlcBVzc8Gu7sqR+SjY2LiXm+B+jOd6lxSBiREDgLKxWkWI214+umu2a6F0X/an6o7s
	x1Yt2CBiyG9gHCwjK5ZbMDYwpIbM0wiP5Q/b3DgZ4gf49oZeNWUIE7a+wOt1kRJl3UQxf7MYqIawo
	HexnBV7A==;
Received: from i53875b2e.versanet.de ([83.135.91.46] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uI1Lu-0005jc-D5; Thu, 22 May 2025 10:32:34 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: add ethernet1 alias to RK3588 Jaguar
Date: Thu, 22 May 2025 10:32:33 +0200
Message-ID: <2901570.AiC22s8V5E@diego>
In-Reply-To: <20250521-jaguar-mezz-eth-switch-v1-1-9b5c48ebb867@cherry.de>
References: <20250521-jaguar-mezz-eth-switch-v1-0-9b5c48ebb867@cherry.de>
 <20250521-jaguar-mezz-eth-switch-v1-1-9b5c48ebb867@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_013239_674124_27DD3A08 
X-CRM114-Status: GOOD (  14.59  )
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

Am Mittwoch, 21. Mai 2025, 17:44:19 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Quentin Schulz:
> From: Quentin Schulz <quentin.schulz@cherry.de>
>=20
> The RK3588 Jaguar exposes pins that can be muxed for GMAC1 functions to
> the Mezzanine proprietary connector, so let's add the alias to prepare
> for adapters using those signals in that function.

In light of the discussion about unused aliases in [0], always adding an
ethernet1 alias for something that may never be used is probably not
the way to go.


Heiko

[0] https://lore.kernel.org/linux-rockchip/df6003e3-7fc3-4e50-a702-f0aa8d66=
3dff@app.fastmail.com/

> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/=
boot/dts/rockchip/rk3588-jaguar.dts
> index 9fceea6c1398e92114dcb735cf2babb7d05d67a5..70a2569478f6165f067befb6c=
dfb4f58f00dd17d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
> @@ -33,6 +33,7 @@ button-bios-disable {
> =20
>  	aliases {
>  		ethernet0 =3D &gmac0;
> +		ethernet1 =3D &gmac1;
>  		i2c10 =3D &i2c10;
>  		mmc0 =3D &sdhci;
>  		mmc1 =3D &sdmmc;
>=20
>=20





