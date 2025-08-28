Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67B8C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPdymbaCqau+yaCWSCW4KLmPAF+HpjkM+g2fCUR5lNY=; b=gAEsk75jFmym2ECJ7PPTHJTKt4
	VT9gI37u/+qALbvYpSXMprmBLWfJj7OOu7ic0zFoBusX06GH3hYLByJs9SoOgDg2BwTt5/wLaXAAV
	MYBEWjVQy9YLjn/UTcwMQtYRU74OHo3RcIKu1s7ojZruFaosgRqGGbmuVkUELXGVqg3aYEzQNz/M7
	b5/4uKdsNoL/XCPw/cW0wx7SWwMhfHOevH24eN6m7ea7car/KeItem1C4OFEuj2gq7u40AkGitvT7
	8YqVZRY3B8PlXFqvFrL11m8YUebi48Zhn4yJ+I8xkN0w9WRLCNVVJBSKPFzBDDYM+8XxGD2GmmI+e
	IlI3vZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgLk-00000002Q4q-14sA;
	Thu, 28 Aug 2025 17:23:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urbN2-00000001RD1-2OMI;
	Thu, 28 Aug 2025 12:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vPdymbaCqau+yaCWSCW4KLmPAF+HpjkM+g2fCUR5lNY=; b=dXfse24ojcLjDHCLcShxSynjgY
	N3lUpTszTBimpfq/1btLaJ5GmD2APYQLHOXc4DgzbEXb/MrcIWlyZKL4lIS5mG2MbF9glnlRmfRhT
	me0SSegWwB5BxdHbpsmlFCgvJy4VgoZkLTtUjvjksXVm1Y5lpTDUhCqGkrtdFHe3gcKFAoCpOFIJB
	764/UBax1SXtRp8cspT1503G4cSGfPKToIyaS7joNn/ldwsScvHDynbipeCcaulw9057Sxg6kDz1q
	h+pciZ0fW0BLrTeIMjqZoALd147RFdPQjJFZhWNZCYLVAIUIAbdZM+Dcpq+pna1EeX7feXmYmg3ih
	kyFo7bBQ==;
Received: from [185.205.242.134] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1urbMy-0005X1-Ex; Thu, 28 Aug 2025 14:04:44 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hide Hako <opi5plus@bcc.bai.ne.jp>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Hide Hako <opi5plus@bcc.bai.ne.jp>
Subject: Re: [PATCH v2] arm64: dts: rockchip: Enables sound output from the audio jack
 on OrangePI5 Plus
Date: Thu, 28 Aug 2025 14:04:43 +0200
Message-ID: <9820114.4vTCxPXJkl@phil>
In-Reply-To: <20250826134456.9636-2-opi5plus@bcc.bai.ne.jp>
References: <20250826134456.9636-2-opi5plus@bcc.bai.ne.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_050448_636583_885EC371 
X-CRM114-Status: GOOD (  17.84  )
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

Hi Hide Hako,

Am Dienstag, 26. August 2025, 15:44:57 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Hide Hako:
> Currently, analog sound is not output from the audio jack.
> This patch allows you to select analog headphones in alsamixer.
> Works with kernel 6.16.1, but not 6.17-rc1.
>=20
> Points of concern:
> 6.16.1 kernel with ubuntu 25.04 Setting -> Sound -> Output Device
>  I select Speakers Built-in Audio, the sound will be output from the audi=
o jack.
>=20
> Changes since v1:
> - As pointed out by Jimmy, the file to be modified has been changed
>   from rk3588-orangepi-5.dtsi to rk3588-orangepi-5-plus.dts.

All of what Maud said, but also I think this deserves some

=46ixes: 236d225e1ee7 ("arm64: dts: rockchip: Add board device tree for rk3=
588-orangepi-5-plus")

tag + could do the subject as=20
  "arm64: dts: rockchip: Fix sound output from the audio jack on OrangePI5 =
Plus"

because this really sounds like it fixes functionality to is supposed
to be working :-)


Thanks a lot
Heiko

> Signed-off-by: Hide Hako <opi5plus@bcc.bai.ne.jp>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> index 121e4d1c3..44bb15951 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> @@ -78,6 +78,7 @@ &analog_sound {
>  	pinctrl-0 =3D <&hp_detect>;
>  	simple-audio-card,aux-devs =3D <&speaker_amp>, <&headphone_amp>;
>  	simple-audio-card,hp-det-gpios =3D <&gpio1 RK_PD3 GPIO_ACTIVE_LOW>;
> +	simple-audio-card,pin-switches =3D "Speaker", "Headphones";
>  	simple-audio-card,widgets =3D
>  		"Microphone", "Onboard Microphone",
>  		"Microphone", "Microphone Jack",
>=20





