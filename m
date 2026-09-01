Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E26C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4okLrgTesZNCTwGc9pt7tVg1zsDdOnzz5zopu0OeRA4=; b=TrLwxP4SLAEF4VG6P3aW7L1+Xl
	GL7ZFjaB3ymtYViCg08YyfpP+UVY3hyu8Q9s0j6vWzMto1K5TSRtyjW6gu9HTnlGDG60lzpl46dA1
	dountrtb/eCgnzbJctR1MgwONnSSZL2j7mlu88G7KIpZvNRNb/+cWBnJaw2Hbnp3ImkKUSsRYa7Ki
	wcWfIyN11P0Ovz1+EtN8mkXp2LiCxYktdb91ZSVkEHE95RnHieahq31A/vkGouOnbYxSFabRpcAw0
	cuUWWCuvgao0TK8iTew4cli+CkFEFCJ+HugMJkgs75ywq531gVE7+v0cbhAVE57m1J/X0Y+WuGEGT
	arJ1ECBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PSE-0000000CKpG-1dbH;
	Tue, 01 Sep 2026 14:27:14 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PSB-0000000CKob-0R7J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1788272825;
	bh=AhJNT/NbiwuvDf+yhvjO9/pLXEAE/7mBodgsYiWNRmo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jLL8kVChJrcMXifFJ8V/P84E0/24nUQgS+ci5c89I5Fexk2RNxA74Cv69rgGSgM7W
	 rQHAChMAv3g9HY3iwr6Kw56w5MEP8Io2TobR78vxtSl9grpjaf/h8qdC9GeChqHLiY
	 NTPzjFZz+65dnrasrThCDW2RX88SfcCLwHG2XhX0=
Message-ID: <be168b7cd89c23855dc4e5b0df57940e902afa27.camel@crapouillou.net>
Subject: Re: [PATCH v2] ARM: dts: samsung: exynos4210-i9100: Enable RTS/CTS
 in Bluetooth node
From: Paul Cercueil <paul@crapouillou.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, Alim Akhtar	 <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 01 Sep 2026 16:27:03 +0200
In-Reply-To: <20260829101509.138284-1-paul@crapouillou.net>
References: <20260829101509.138284-1-paul@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_072711_352515_FFFA7137 
X-CRM114-Status: GOOD (  16.24  )
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

Le samedi 29 ao=C3=BBt 2026 =C3=A0 12:15 +0200, Paul Cercueil a =C3=A9crit=
=C2=A0:
> The BCM4330 is connected using CTS/RTS too, so add the 'uart-has-
> rtscts'
> property.
>=20
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>=20
> Notes:
> =C2=A0=C2=A0=C2=A0 Changes:
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 V1 was: "ARM: dts: samsung: exynos4210-i9100: Fix Blue=
tooth node"
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 -v2: Drop max-speed property. It's only supposed to be=
 used in
> some
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cases, which don't apply=
 here. As this was the "fix" for
> getting
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Bluetooth to work on my =
device, which will be applied to the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver instead, the Fixe=
s: tag was removed.

I'll V3. I think I did not understand properly what 'max-speed' was
for, and indeed it does apply in this case - the Bluetooth chip's
maximum rate is 4 Mbps while the max baudrate of the SoC's UART is 3
Mbps.

Cheers,
-Paul

>=20
> =C2=A0arch/arm/boot/dts/samsung/exynos4210-i9100.dts | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> index 8a635bee59fa..95964be7daa8 100644
> --- a/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> +++ b/arch/arm/boot/dts/samsung/exynos4210-i9100.dts
> @@ -875,6 +875,7 @@ &serial_0 {
> =C2=A0	status =3D "okay";
> =C2=A0
> =C2=A0	pinctrl-names =3D "default";
> +	uart-has-rtscts;
> =C2=A0	pinctrl-0 =3D <&bt_en>, <&bt_res>, <&uart0_data>,
> <&uart0_fctl>;
> =C2=A0
> =C2=A0	bluetooth {

