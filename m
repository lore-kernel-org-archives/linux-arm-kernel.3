Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED98CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 04:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eBpV//B5/NrI5cFXQWjvu27goLCCU45mxVcrKziYGBI=; b=oLcVJWwuMJdCH1bw+zY/GSrvBg
	XrXIltQpNoQIWTX2TxGhBuhHffjm/LfGfLQ4lXwDm6GvAVT2nAlPkamEVTrIq813vLmh3EtcdD5NQ
	iDFyctHuCzb7o0N8Mqu+T4s3Gy5BzP9usfCn7sHuKiku00GE2hCrmM1nh3yBwyrumvzwXlktU+R01
	TkoZDRGa12LuhXtzVOKGedWTBMiW1VjrrvRQPYCKhua9Hxhx7YkrO4mABUZqA7TEJ2MELHMAmURS1
	fRFPiLUCLUeXgByhysUWq9uz7zCPAp+xIYpa7I6jNOHURWzAkcmnGMjQ3ZoO9BLRKYSBiIe/fDowF
	TAOxPPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOPQ-0000000B4wK-3TDE;
	Mon, 24 Nov 2025 04:42:40 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNOPN-0000000B4vz-30Fu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 04:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763959355;
	bh=eBpV//B5/NrI5cFXQWjvu27goLCCU45mxVcrKziYGBI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WcGG1lFwZTg1XdJb1dOLwR4NR8V2lH/fJ58owDwziziZw13fHygM/1kn3ovsQk/OF
	 MDocDJ/mWGRIOGURhH4ApGj/0TgfrHwGX17ps3IYchCAy+nUYlyxMSnvzmUZask61t
	 gT5jDzGlHsMhswidYWeCt2qX7uG+HzRuubOOk+PLJ2kQ/CE3B+FwlPldU8A75KMnHG
	 xSvbOssgQEtqSEjYJ29Jz/Kxm5Z09nKs4TpiOnB0gNuYFT1C91NXTlbsrujvVOuHNi
	 rVa046rC6YeVw8Ql3eVx2fxV4QH8cRuNDGNAvSu1ogfdgElDc7ZwkFAwLCDT//KfLM
	 ScnP3d7BQBf8w==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C1BB77BE0E;
	Mon, 24 Nov 2025 12:42:34 +0800 (AWST)
Message-ID: <ad11cd30eddc1b7c496cc92eef129eb5c0f2d604.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/3] ARM: dts: aspeed: yosemite5: Update sensor
 configuration
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kevin Tung <kevin.tung.openbmc@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Amithash
 Prasasd	 <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, Ken
 Chen	 <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Date: Mon, 24 Nov 2025 15:12:34 +1030
In-Reply-To: <20251118-yv5_revise_dts-v1-2-fcd6b44b4497@gmail.com>
References: <20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com>
	 <20251118-yv5_revise_dts-v1-2-fcd6b44b4497@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_204237_952365_0C17E7AB 
X-CRM114-Status: GOOD (  10.88  )
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

On Tue, 2025-11-18 at 18:53 +0800, Kevin Tung wrote:
> Remove sensors 10-0040 and 10-0045 to align with the latest
> hardware design changes.

Can you please elaborate on this commit message? I'd like this
description to be much more specific about revisions of the hardware
design, and why you expect all instances of the previous design to
suddenly stop existing.

I can't imagine this is the only hardware change that occurred. What
other changes are lurking?

Andrew

>=20
> Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 14 ---=
-----------
> =C2=A01 file changed, 14 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> index 7991e9360847532cff9aad4ad4ed57d4c30668a0..45b8ac2e8c65a4f672e645716=
31b7f6944f26213 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
> @@ -674,20 +674,6 @@ gpio-expander@22 {
> =C2=A0			"PWRGD_P3V3_AUX","ALERT_TEMP";
> =C2=A0	};
> =C2=A0
> -	power-sensor@40 {
> -		compatible =3D "ti,ina233";
> -		reg =3D <0x40>;
> -		shunt-resistor =3D <2000>;
> -		ti,maximum-expected-current-microamp =3D <32768000>;
> -	};
> -
> -	power-sensor@45 {
> -		compatible =3D "ti,ina233";
> -		reg =3D <0x45>;
> -		shunt-resistor =3D <2000>;
> -		ti,maximum-expected-current-microamp =3D <32768000>;
> -	};
> -
> =C2=A0	adc@48 {
> =C2=A0		compatible =3D "ti,ads7830";
> =C2=A0		reg =3D <0x48>;

