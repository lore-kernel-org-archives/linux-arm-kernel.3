Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEFDEF06E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 05:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dnth1D2JhNyrTS1K8rbSc9KWM9EP1WSLD2zMCtx/c3c=; b=aCanl+WyIbm+kdhprr0KfssQmg
	2HrRvDRBZ0HupELylwGucZe5Dyyjmf5MedaO1zxOpHckMfXRi3NGCaWhI5m3nOYyrs9xY+KC/iUvQ
	XuxNgUp+oS6PZDe2EB4APJrUxdGIUNNcH6utj8GR/BijdlISFGn8tD/27QPu5YNzAVoxVPPpCgScG
	t4XMYWTOCVqIln/xWeU1VdjFLhcCCz1otQ93DguifA+M71We5u+V0+MpnAQe4lET22CySyWuxlsPD
	6VsvAa8qyQSsM2kSfYFJlmLzGdTsS8BmO1q1BepVU5o3OrMEd2qo6c5IJP2x+TS9QzzRa600362u0
	PLc3mdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK5z-0000000ErSe-2HiF;
	Mon, 09 Feb 2026 05:46:03 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpK5w-0000000ErSI-28dL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 05:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1770615954;
	bh=dnth1D2JhNyrTS1K8rbSc9KWM9EP1WSLD2zMCtx/c3c=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=AR5ZxWSB35SlYy/pXbKX2GRwoqq4wqalLnZpTotUz3VQK/FZmbBP1ykAYMDHPRwhX
	 ul8evizpvDVPNDXdoq2igN0n8vWRUdQi7QwbxTsCe0UYi+1rljAjfuc+xMeihjNoqB
	 HC7z+thhCgg9jWZccNUdsu7mN1ki0rKrgxKkvE8J6nPXXUzvK5hBAQcGym6k5PGDQk
	 wKwekbEW/wQHuofbk+R+UVpCTOy8b/Ts/PM4m7cofq96QjlqaG29K4i7NvBNWy+X/U
	 ut6MUlRU356ueoxIbWAIAI1D+s+BsLlG1s35MSV1k3SOLw1i5JFfJkcJ8aelAATTFo
	 LFHjYTvExRfgw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5FB9D603F0;
	Mon,  9 Feb 2026 13:45:52 +0800 (AWST)
Message-ID: <212de4074664dc0507b6ed174443b37cf7bf5053.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: santabarbara: Add swb cpld io expander
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 09 Feb 2026 16:15:51 +1030
In-Reply-To: <20260129073749.3155383-1-fredchen.openbmc@gmail.com>
References: <20260129073749.3155383-1-fredchen.openbmc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_214600_880383_57571077 
X-CRM114-Status: GOOD (  12.26  )
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

On Thu, 2026-01-29 at 15:37 +0800, Fred Chen wrote:
> Add CPLD-simulated IO expanders
>=20

If these are not genuine PCA9555 parts then I expect you should define
your own compatible string for the implementation which allows
nxp,pca9555 as a fallback. That way you can account for bugs in the
implementation either way (either in the kernel if updating the CPLD
firmware is not feasible in some situations, or by updating the
firmware when it is).

Andrew

>  for cable presence detection and 4 SPI
> flash control. To resolve sideband pin shortages, one IO expander is
> utilized to aggregate interrupt signals.
>=20
> Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> ---
> =C2=A0.../aspeed-bmc-facebook-santabarbara.dts=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 48 +++++++++++++++++++
> =C2=A01 file changed, 48 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dt=
s b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
> index 0a3e2e241063..39f7fade8ff7 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
> @@ -1335,6 +1335,39 @@ eeprom@50 {
> =C2=A0&i2c12 {
> =C2=A0	status =3D "okay";
> =C2=A0
> +	ioexp0: gpio@20 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-parent =3D <&sgpiom0>;
> +		interrupts =3D <148 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names =3D
> +			"IOEXP_21h_INT_N","","","",
> +			"","","","",
> +			"","","","",
> +			"","","","";
> +	};
> +
> +	gpio@21 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x21>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-parent =3D <&ioexp0>;
> +		interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names =3D
> +			"PDB_PRSNT_J1_N","PDB_PRSNT_J2_N",
> +			"PRSNT_NIC1_N","PRSNT_NIC2_N",
> +			"PRSNT_NIC3_N","PRSNT_NIC4_N",
> +			"SWB_PWR_FAULT_STATUS","",
> +			"CBL_PRSNT_MCIO_0_N","CBL_PRSNT_MCIO_1_N",
> +			"CBL_PRSNT_MCIO_2_N","CBL_PRSNT_MCIO_3_N",
> +			"","","","";
> +	};
> +
> =C2=A0	gpio@27 {
> =C2=A0		compatible =3D "nxp,pca9555";
> =C2=A0		reg =3D <0x27>;
> @@ -1349,6 +1382,21 @@ gpio@27 {
> =C2=A0			"SPI_MUX_SEL","","","";
> =C2=A0	};
> =C2=A0
> +	gpio@28 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x28>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		gpio-line-names =3D
> +			"SCO_UART_MUX_SEL0","SCO_UART_MUX_SEL1",
> +			"SPI_PROG_PL12_SEL","SPI_PROG_PL34_SEL",
> +			"","","","",
> +			"I3C_HUB_3_MUX_SEL_PLD","",
> +			"SPI_PROG_PL12_EN_N","SPI_PROG_PL34_EN_N",
> +			"SCO1_SPI_SEL","SCO2_SPI_SEL",
> +			"SCO3_SPI_SEL","SCO4_SPI_SEL";
> +	};
> +
> =C2=A0	// SWB FRU
> =C2=A0	eeprom@52 {
> =C2=A0		compatible =3D "atmel,24c64";

