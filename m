Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3877EA4E20
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CScwP8j93rksIyuNDJIvOZRuSEzape/ji14TrGStkRU=; b=g0hV8Bfn8INy1H5QSvR8zG+Pm5
	m5gwpCSALbsmvCIll5MMkhFpLR2lAoXWN07/Syz+O7R2uHJvkkLHn0D4mSLdxEGWpFG/EWTfRaAHN
	uK73RoCu9t6cTepP84wyvuGk5xSev6QO8kvo5H5ioIiDTSBWKgoq1qNI2rBeQh9bMtls+D0Ks2qfF
	gdGxBKPUgGJAmlgfjUZrogXg1JbZZVvx//zmSHqOoT7yXxRD0ESevjnlx4GFmyqb3rWPmMkTZz5yy
	9rR46mlmnC591wKa8KSC+/rhmIkaWLNGGLlOXohocTzG1mrBJq40rq5DuIepufV3Sxn5+XP3V2ixs
	+rK0qy/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx523-0000000DLSO-2Xfg;
	Mon, 02 Mar 2026 15:18:03 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx520-0000000DLPW-1FwR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:18:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87DE8C40F86;
	Mon,  2 Mar 2026 15:18:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A1965FE89;
	Mon,  2 Mar 2026 15:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CB1F10369561;
	Mon,  2 Mar 2026 16:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772464675; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CScwP8j93rksIyuNDJIvOZRuSEzape/ji14TrGStkRU=;
	b=VUg75ZURvjstC7NYpKglyHEoSrItp6LFXtWbOCcQbM1w/hK9VSh85lNIqqBbbLXkdUsXc9
	a3UrTxw9ipgOKQAgTj+v6RvCR8YM3tM/DRvqaIYwNjqklYKOmjIp6H5d0ZFdJJ/xhRTAhu
	ajSpm863+EYSkgeCbO2b1HdK5+eP045RvuyzjFelOOCCqvxbrirJs/TSVQxPGh1t1fFYc9
	HUERsf94hEQ47RRI9WbThPZl3e60Et/KZKDY0TU+QfhT+ouibIThOfKAr5C8l039GJ42sl
	HRwdiZH+itK2WB95DZt5CzlloPudKMHcF8jqLDLqdRyEdnMxas8IoiMxW/t4Aw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Elad Nachman <enachman@marvell.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, pali@kernel.org, mrkiko.rs@gmail.com,
 chris.packham@alliedtelesis.co.nz, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: enachman@marvell.com
Subject: Re: [PATCH] arm64: dts: a7k: use phy handle
In-Reply-To: <20260126113627.2769695-1-enachman@marvell.com>
References: <20260126113627.2769695-1-enachman@marvell.com>
Date: Mon, 02 Mar 2026 16:17:45 +0100
Message-ID: <87342igt0m.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071800_501340_CE76B920 
X-CRM114-Status: GOOD (  15.19  )
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

Elad Nachman <enachman@marvell.com> writes:

> From: Elad Nachman <enachman@marvell.com>
>
> Documentation/devicetree/bindings/net/ethernet-controller.yaml
>
>   phy:
>     : #/properties/phy-handle
>     deprecated: true
>
> New dts files should not be using deprecated properties.
>
> What should be used is:
>
>   phy-handle:
>     : /schemas/types.yaml#/definitions/phandle
>     description:
>       Specifies a reference to a node representing a PHY device.
>
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Elad Nachman <enachman@marvell.com>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi b/ar=
ch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
> index 2b5ec4a451e3..0cfcf5f6bde1 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-7020-comexpress.dtsi
> @@ -70,7 +70,7 @@ &cp0_eth0 {
>=20=20
>  &cp0_eth1 {
>  	status =3D "okay";
> -	phy =3D <&phy0>;
> +	phy-handle =3D <&phy0>;
>  	phy-mode =3D "rgmii-id";
>  };
>=20=20
> --=20
> 2.25.1
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

