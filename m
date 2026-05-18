Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E182DCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 13:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wk4N9ie3hEmSMwAYk9HPUXBeGpJpagkJEfLUPb7keEw=; b=CVi1y9VMOYQ023YeuuAnDCfu/7
	wWtYUfYQvpD1ZMp9DlKZWGlmizd82/nG/zSkFKTikBjnVtSwWPlwcBUAvMRo6gXKel9IXZxxlJnK3
	wkF4Uf8Uo2+40lPtEPGRdjbOinh/zoer9T14/Ch8HVioP5Y3jL3/aabfxVwjRX6obvQSGSdrQEvYZ
	xFEJ2MVI7vW7ZBn2AiktRUTlu0my4dZDWkAORO48+BQ+fIPPC4kJYiykZj1XbY/XP/RxuvwHN2wCR
	0pVNIrTge9iV6SD05D1WObnXI2ot74aRKeY/OI1gM7TiuAIvkqs1ffVx++gwyyH7XSFU2mAMvHOzS
	qPpS4s8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxin-0000000FlDS-3DtB;
	Mon, 18 May 2026 13:09:25 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxil-0000000FlCj-3sTF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 13:09:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779109761;
	bh=wk4N9ie3hEmSMwAYk9HPUXBeGpJpagkJEfLUPb7keEw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Em6xs+oeJOjqD4rk3pYZnRmeO3EJQ9djpAWpdLfGk96Vrx6oeBoV+RjvFKhZyaB+j
	 6xoxiwM4wg2f5ng9FU95wGM2FkU5dl17l101i2kRrjoBrcxD+Rfxt473MazS68tqgL
	 CaWi8oyrTTMzd4ffwY6HlwrjGI7ZGRQbEqmSDhIfwNi3/sHX+CiidyHJ0EBBFkz/MO
	 RZ8o2MoTNpobGxacJfUJsVDTcxnaXymFKvWowjbEY3eAj+H9nmL8F4vAj+e1Psl/3f
	 2rP6qMhYSYjuIpCMtHdGW9Wy2wMAazIRtOt11bv8FSk+E2wcgE+d9t/aI+WxA4G6Gc
	 L1I3w0z0CEnWg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DD3256025D;
	Mon, 18 May 2026 21:09:20 +0800 (AWST)
Message-ID: <a27e89c927016d1cdd87d76474b680f74b519b29.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Andy.Chung@amd.com, Colin Huang <u8813345@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 devicetree@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, 	linux-kernel@vger.kernel.org
Date: Mon, 18 May 2026 22:39:20 +0930
In-Reply-To: <20260327-dts_enable_nic_mctp-v1-1-5b5c05f4442c@amd.com>
References: <20260327-dts_enable_nic_mctp-v1-1-5b5c05f4442c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_060924_175676_25B8D57B 
X-CRM114-Status: GOOD (  14.05  )
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

Hi Andy,

Sorry for the delay.

On Fri, 2026-03-27 at 14:59 +0800, Andy Chung via B4 Relay wrote:
> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Add the mctp-controller property to enable frontend NIC management
> via PLDM over MCTP.
> Also add EEPROM device for NIC FRU.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> ---
> Add the mctp-controller property to enable frontend NIC management
> via PLDM over MCTP.
> Also add EEPROM device for NIC FRU.
> ---
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-anacapa.dts=C2=A0=C2=A0=C2=A0=C2=
=A0 | 67 +++++++++++++++++++++-
> =C2=A01 file changed, 65 insertions(+), 2 deletions(-)

Do you mind coordinating with Colin on this one, as he's rearranging
the Anacapa devicetrees.

Cheers,

Andrew

>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> index 221af858cb6b..138b081be049 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa.dts
> @@ -584,38 +584,67 @@ eeprom@56 {
> =C2=A0// R Bridge Board
> =C2=A0&i2c10 {
> =C2=A0	status =3D "okay";
> +	multi-master;
> +	mctp@10 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> =C2=A0
> =C2=A0	i2c-mux@71 {
> =C2=A0		compatible =3D "nxp,pca9548";
> =C2=A0		reg =3D <0x71>;
> =C2=A0		#address-cells =3D <1>;
> =C2=A0		#size-cells =3D <0>;
> -		i2c-mux-idle-disconnect;
> =C2=A0
> =C2=A0		i2c10mux0ch0: i2c@0 {
> =C2=A0			reg =3D <0>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> =C2=A0		};
> =C2=A0		i2c10mux0ch1: i2c@1 {
> =C2=A0			reg =3D <1>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c10mux0ch2: i2c@2 {
> =C2=A0			reg =3D <2>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c10mux0ch3: i2c@3 {
> =C2=A0			reg =3D <3>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c10mux0ch4: i2c@4 {
> =C2=A0			reg =3D <4>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c10mux0ch5: i2c@5 {
> =C2=A0			reg =3D <5>;
> @@ -661,38 +690,72 @@ i2c10mux0ch7: i2c@7 {
> =C2=A0// L Bridge Board
> =C2=A0&i2c11 {
> =C2=A0	status =3D "okay";
> +	multi-master;
> +	mctp@10 {
> +		compatible =3D "mctp-i2c-controller";
> +		reg =3D <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +	};
> =C2=A0
> =C2=A0	i2c-mux@71 {
> =C2=A0		compatible =3D "nxp,pca9548";
> =C2=A0		reg =3D <0x71>;
> =C2=A0		#address-cells =3D <1>;
> =C2=A0		#size-cells =3D <0>;
> -		i2c-mux-idle-disconnect;
> =C2=A0
> =C2=A0		i2c11mux0ch0: i2c@0 {
> =C2=A0			reg =3D <0>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// FE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch1: i2c@1 {
> =C2=A0			reg =3D <1>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch2: i2c@2 {
> =C2=A0			reg =3D <2>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch3: i2c@3 {
> =C2=A0			reg =3D <3>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch4: i2c@4 {
> =C2=A0			reg =3D <4>;
> =C2=A0			#address-cells =3D <1>;
> =C2=A0			#size-cells =3D <0>;
> +			mctp-controller;
> +			// BE NIC FRU
> +			eeprom@50 {
> +				compatible =3D "atmel,24c32";
> +				reg =3D <0x50>;
> +			};
> =C2=A0		};
> =C2=A0		i2c11mux0ch5: i2c@5 {
> =C2=A0			reg =3D <5>;
>=20
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260327-dts_enable_nic_mctp-e35a5765b176
>=20
> Best regards,
> --=C2=A0=20
> Andy Chung <Andy.Chung@amd.com>
>=20

