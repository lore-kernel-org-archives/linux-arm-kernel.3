Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0EDC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4g4coC2IuMxL3aYFyteOm3c4yfrMMiVwCHmdodsx/Qo=; b=pN+REVnEWcU4ZwsJdlahzm2bBs
	M0XfKz5rh1UX8Miai86DCzdEDP1V2X6LjQM1hEZbaVshfYArVQO0X8V/XYRmdLldeDT4M8lTwpCrB
	4XBZD8375M0h3sUB6pMExBHLUmvkDG317KJU6fbfqjXrotIwc4qv8zDzFqpO1uCgHz0RtKKM0sF+t
	xB7cMwpyhiakc3AOOjDu+KZd2A2AZ9nzC/Bpmm/t5NK+t5wNnHK4F5vmYUNzoPyUyvFzhHfbOdf0y
	FniBTUR3lSOFOv/j1y+4EdTnEe20gLiTa56fCjwDIYhkwYseCEeJqKPEHpaRLqVVEP9xNj/j0eJmV
	/WFjaKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVjM-0000000BhpN-1gMF;
	Wed, 22 Jul 2026 12:07:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVjI-0000000BhnL-4Buy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784722034;
	bh=4g4coC2IuMxL3aYFyteOm3c4yfrMMiVwCHmdodsx/Qo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XR/mvfMpKCG8tmi7pzG43sBGfvGNOaGpo9M2PY/Jcv3U75dFMchC+rlKSmXi6PhSJ
	 M4KoIjsMDaXmz8Wbj5MWoUX3rViUcKK0RafgyCrZrbqM08GyyPXPdxqxV8x2yFbjzH
	 VeMQeChy5advnbHSjAg02Zvi/hNdeVql/W/+q3qvf+XP/LkAznuexaIQOitO2b8aju
	 UvqaF4UWs3JNzF+cJJJ84YuEKo8FkM2f4io65cLQfM3ucx5XvEwdAiB8BFO5lGdvmU
	 dr6h0bZlff2Ey3/k752UzEXhV3xtnncVUYBSVH5SZN345tkjHRCNE+kleFDK4WKagk
	 a4qz4RzHMLf+Q==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EA69A662E1;
	Wed, 22 Jul 2026 20:07:13 +0800 (AWST)
Message-ID: <831a8c9b383d3e765a49fa35e1e36d75504fee1d.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: add current-range
 property for PDB HSC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Mike Hsieh <mike.quanta.115@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Cosmo Chou
	 <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, Mik Lin
	 <mik.lin@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>
Date: Wed, 22 Jul 2026 21:37:13 +0930
In-Reply-To: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-2-cccf959c9b78@gmail.com>
References: <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-0-cccf959c9b78@gmail.com>
	 <20260618-sanmiguel-dts-config-hsc-lm5066i-v1-2-cccf959c9b78@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_050717_320506_52ACE55B 
X-CRM114-Status: GOOD (  11.53  )
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

On Thu, 2026-06-18 at 15:41 +0800, Mike Hsieh wrote:
> Configure the ti,current-range property for the four TI LM5066i
> hot-swap controllers on PDB board.
>=20
> This defines the hardware current limit operating mode (low/high)
> for each sensor to match the physical board design.
>=20
> Specific configurations:
> - HSC1 (0x11): low
> - HSC2 (0x13): high
> - HSC3 (0x15): high
> - HSC4 (0x17): low
>=20
> Signed-off-by: Mike Hsieh <mike.quanta.115@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> index 3faac0925a79..e518e3fc1c97 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
> @@ -451,6 +451,7 @@ pdb_ti_hsc1: power-monitor@11 {
> =C2=A0		compatible =3D "ti,lm5066i";
> =C2=A0		reg =3D <0x11>;
> =C2=A0		shunt-resistor-micro-ohms =3D <1000>;
> +		ti,current-range =3D "low";
> =C2=A0	};
> =C2=A0
> =C2=A0	pdb_mps_hsc2: power-monitor@12 {
> @@ -462,6 +463,7 @@ pdb_ti_hsc2: power-monitor@13 {
> =C2=A0		compatible =3D "ti,lm5066i";
> =C2=A0		reg =3D <0x13>;
> =C2=A0		shunt-resistor-micro-ohms =3D <321>;
> +		ti,current-range =3D "high";
> =C2=A0	};
> =C2=A0
> =C2=A0	pdb_mps_hsc3: power-monitor@14 {
> @@ -473,6 +475,7 @@ pdb_ti_hsc3: power-monitor@15 {
> =C2=A0		compatible =3D "ti,lm5066i";
> =C2=A0		reg =3D <0x15>;
> =C2=A0		shunt-resistor-micro-ohms =3D <321>;
> +		ti,current-range =3D "high";
> =C2=A0	};
> =C2=A0
> =C2=A0	pdb_mps_hsc4: power-monitor@16 {
> @@ -484,6 +487,7 @@ pdb_ti_hsc4: power-monitor@17 {
> =C2=A0		compatible =3D "ti,lm5066i";
> =C2=A0		reg =3D <0x17>;
> =C2=A0		shunt-resistor-micro-ohms =3D <500>;
> +		ti,current-range =3D "low";
> =C2=A0	};
> =C2=A0
> =C2=A0	pdb_ioexp_20: gpio@20 {

The property isn't inspected by the associated driver, nor is it
allowed by the binding:

   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: power-monito=
r@11 (ti,lm5066i): Unevaluated properties are not allowed ('ti,current-rang=
e' was unexpected)
           from schema $id: http://devicetree.org/schemas/hwmon/pmbus/ti,lm=
25066.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: power-monito=
r@13 (ti,lm5066i): Unevaluated properties are not allowed ('ti,current-rang=
e' was unexpected)
           from schema $id: http://devicetree.org/schemas/hwmon/pmbus/ti,lm=
25066.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: power-monito=
r@15 (ti,lm5066i): Unevaluated properties are not allowed ('ti,current-rang=
e' was unexpected)
           from schema $id: http://devicetree.org/schemas/hwmon/pmbus/ti,lm=
25066.yaml
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dtb: power-monito=
r@17 (ti,lm5066i): Unevaluated properties are not allowed ('ti,current-rang=
e' was unexpected)
           from schema $id: http://devicetree.org/schemas/hwmon/pmbus/ti,lm=
25066.yaml

Andrew

