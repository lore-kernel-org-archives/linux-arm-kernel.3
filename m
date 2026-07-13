Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC11FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHnLSken2nxzqxRuJHgo1Iepw2h57jn7vd+PGFLRjFQ=; b=s8GIcV/ukSnCp3bKUuGTgGvuVs
	W2+tZHj4mYPswvuYyCjP3E5Hl/PdQTmZU1ygCgBue3um9zlw0xiFojF1aYeOHzf/JA9SZQR9idmAr
	pXEX0jeiKif323o5na8uMOebFoj7wVkxNmoRuFHVFDqdvBd+oCWaAfd8IlTPxYsWBBqVAwTh4E9a8
	eLbsHAMNayEpYIFudPDYUX1GYfyM2mxu/ODkVtwGnMqiCZQA3cXntxG7eX4hBIACiir9mcKnf3KOg
	7aIgPPPSIbTwRAfeNtjQfHSBmO5g3EXDsWgQSjNxOfxCRfpkOCdYVFgMTknPDbmPw9HCnF0nFsfBu
	SQ6WFYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIx5-00000009qPM-1XMf;
	Mon, 13 Jul 2026 15:52:15 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIx1-00000009qO0-4A2R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:52:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C61B81A0FA0;
	Mon, 13 Jul 2026 15:52:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 993E860345;
	Mon, 13 Jul 2026 15:52:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89E6011BD22AD;
	Mon, 13 Jul 2026 17:52:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783957924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BHnLSken2nxzqxRuJHgo1Iepw2h57jn7vd+PGFLRjFQ=;
	b=wFAo7AunDzvnlqEemCbJAZ4mns2JTynkuYk6NKtMCsyr/ZWdNdJWkMMomZikRrc1KRN7Kz
	xM0y+uw+o3SsGg8YkhAGbuZYvqKY2E0ns35ZIY8iKPMWEdKt7pgzdOK0/6hmR1b2lbpcgd
	NQ1Q7rfGg7RLaAuLAcfX6j3CjZDeOa4iTzhfv0w2FlwAqNLOg4blyBveGTccOpniJgeTx4
	Z9oqBcK2QVfJheWljYqgoOnETYJzjBR6mvbozUwDgOIe2ur5B++4+glH6UhnMTcDTwy6yb
	02OjbFBMqy0XNhN/EYHPKSo7MD5kuiMe9wZmvDstJesBRP1oHYbvisGkdRBd5w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] ARM: dts: marvell: armada: Correct indentation
In-Reply-To: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706180333.648401-4-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:52:01 +0200
Message-ID: <877bmy7uqm.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_085212_177574_00C2B9EC 
X-CRM114-Status: GOOD (  15.95  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>
> Ongoing bigger work for all bindings and DTS with built-in checker (dt-ch=
eck-style).
> ---
>  arch/arm/boot/dts/marvell/armada-370.dtsi  |  8 ++++----
>  arch/arm/boot/dts/marvell/armada-xp-gp.dts | 14 +++++++-------
>  2 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-370.dtsi b/arch/arm/boot/dt=
s/marvell/armada-370.dtsi
> index 2013a5ccecd3..cf73287501da 100644
> --- a/arch/arm/boot/dts/marvell/armada-370.dtsi
> +++ b/arch/arm/boot/dts/marvell/armada-370.dtsi
> @@ -63,8 +63,8 @@ pcie0: pcie@1,0 {
>  				interrupt-names =3D "intx";
>  				interrupts-extended =3D <&mpic 58>;
>  				#interrupt-cells =3D <1>;
> -                                ranges =3D <0x82000000 0 0 0x82000000 0x=
1 0 1 0
> -                                          0x81000000 0 0 0x81000000 0x1 =
0 1 0>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x1 0 1 0
> +					  0x81000000 0 0 0x81000000 0x1 0 1 0>;
>  				bus-range =3D <0x00 0xff>;
>  				interrupt-map-mask =3D <0 0 0 7>;
>  				interrupt-map =3D <0 0 0 1 &pcie0_intc 0>,
> @@ -91,8 +91,8 @@ pcie2: pcie@2,0 {
>  				interrupt-names =3D "intx";
>  				interrupts-extended =3D <&mpic 62>;
>  				#interrupt-cells =3D <1>;
> -                                ranges =3D <0x82000000 0 0 0x82000000 0x=
2 0 1 0
> -                                          0x81000000 0 0 0x81000000 0x2 =
0 1 0>;
> +				ranges =3D <0x82000000 0 0 0x82000000 0x2 0 1 0
> +					  0x81000000 0 0 0x81000000 0x2 0 1 0>;
>  				bus-range =3D <0x00 0xff>;
>  				interrupt-map-mask =3D <0 0 0 7>;
>  				interrupt-map =3D <0 0 0 1 &pcie2_intc 0>,
> diff --git a/arch/arm/boot/dts/marvell/armada-xp-gp.dts b/arch/arm/boot/d=
ts/marvell/armada-xp-gp.dts
> index d1d348b91c0a..65cc0373fe04 100644
> --- a/arch/arm/boot/dts/marvell/armada-xp-gp.dts
> +++ b/arch/arm/boot/dts/marvell/armada-xp-gp.dts
> @@ -34,13 +34,13 @@ chosen {
>  	memory@0 {
>  		device_type =3D "memory";
>  		/*
> -                 * 8 GB of plug-in RAM modules by default.The amount
> -                 * of memory available can be changed by the
> -                 * bootloader according the size of the module
> -                 * actually plugged. However, memory between
> -                 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
> -                 * the address range used for I/O (internal registers,
> -                 * MBus windows).
> +		 * 8 GB of plug-in RAM modules by default.The amount
> +		 * of memory available can be changed by the
> +		 * bootloader according the size of the module
> +		 * actually plugged. However, memory between
> +		 * 0xF0000000 to 0xFFFFFFFF cannot be used, as it is
> +		 * the address range used for I/O (internal registers,
> +		 * MBus windows).
>  		 */
>  		reg =3D <0x00000000 0x00000000 0x00000000 0xf0000000>,
>  		      <0x00000001 0x00000000 0x00000001 0x00000000>;
> --=20
> 2.53.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

