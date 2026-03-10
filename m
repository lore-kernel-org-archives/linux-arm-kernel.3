Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A65EEA854E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDnvAqGNNm3WAv14lqVG/Cz8m/tMIKxrjvpf5+LfotM=; b=Yh4CRmigIzE9fIJH7KxPU0h7vr
	jmnrDNksT97gQ7j9I2EpzOtpfye1wOR+kBW+qfjgK0vj44SMRz4vzD3qDdpR882TmnHYCgRSZ2nHL
	LRyjdRZD6tlZxfXrz/jZ29FH1zaxXC5U9e46I8dYmJQ0BdO472btwScyF/5+LcaoRoFJte961zbtm
	EaOKrBiq79Qm0V/fIkb3+C/aJzfaw5CJoY+c5L8AQNl8dmEOhxo7hYIWK2MZAFBgkdlpnqreXhBtK
	JKJuAUPeCuqFgfnuTFCTNXLaoxkGYDLdOqHW7Xizo6yuBrNndmyMfDRTXWZRlG5t48uxLUcn0oTI9
	hcIk4Nrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzslk-00000008zqq-2Hw6;
	Tue, 10 Mar 2026 08:48:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsli-00000008zq8-3Yy9;
	Tue, 10 Mar 2026 08:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=LDnvAqGNNm3WAv14lqVG/Cz8m/tMIKxrjvpf5+LfotM=; b=l0wIErnCa7VHZPHycc5wGKaUkL
	Yvz5kANYlS0XPLz/iuR2NrLGPcRURHOBzm4faD1fWbmUqHDdbBPI9z4rsa/I61cA44XbcjfQPzSQI
	3JH4sSNf+xfTq6bJE2qbkzZaR3ywZHyEXWZ4OeT/t1ncRkWfvm3Be3AY6w1bBi5Jo2GmLwbKxEmMC
	9SzOmfK47DvNw80PUtVeLGQH6/0OrqRDnDgb4kmCKe808R4hhSaTTDC4lTtu9MovXpN+i/43gjRaT
	oCZ9/2WFrq91UN5rTmSZC9LV5vi9tuUFV1EgdXUDbacu60B/wcVrDVEmRsehDCCkKEWM4Vg2mtT3s
	rQPM1bSA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pedro Alves <pta2002@pta2002.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pedro Alves <pta2002@pta2002.com>
Subject: Re: [PATCH v2] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
Date: Tue, 10 Mar 2026 09:48:43 +0100
Message-ID: <9638846.rMLUfLXkoz@phil>
In-Reply-To: <20260304-radxa-r5-itx-hdmirx-v2-1-6567e9e3298b@pta2002.com>
References: <20260304-radxa-r5-itx-hdmirx-v2-1-6567e9e3298b@pta2002.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_014846_893021_B1A61B2B 
X-CRM114-Status: GOOD (  14.41  )
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

Hi Pedro,

Am Mittwoch, 4. M=C3=A4rz 2026, 21:44:39 Mitteleurop=C3=A4ische Normalzeit =
schrieb Pedro Alves:
> The Radxa Rock 5 ITX board exposes an HDMI input exactly the same way as
> the Rock 5B, but this was not reflected in its DTS.
>=20
> Change the rk3588-rock-5-itx to configure and enable the hdmi_receiver
> and hdmi_receiver_cma nodes.
>=20
> The hot-plug detection (HPD) pin keeps the hdmirx_det name rather than
> the hdmirx_hpd name used in other boards since that is what matches the
> official schematics (HDMIIRX_DET_L).
>=20
> The configurations were confirmed to be identical on the downstream
> Radxa kernel, and this has been tested to work on a Rock 5 ITX board
> running kernel 6.19.3.
>=20
> Signed-off-by: Pedro Alves <pta2002@pta2002.com>

> +&hdmi_receiver {
> +	pinctrl-0 =3D <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_r=
x_sda &hdmirx_det>;

are you sure the hdmim1_rx_hpdin is routed?
Because that is gpio3_D4 while your hpd-gpios below is gpio1_c6.

> +	pinctrl-names =3D "default";
> +	hpd-gpios =3D <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;

Also please provide a pinctrl setting for the gpio hpd pin.

Thanks a lot
Heiko

> +
> +	status =3D "okay";
> +};
> +
>  &hdptxphy1 {
>  	status =3D "okay";
>  };
>=20
> ---
> base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> change-id: 20260303-radxa-r5-itx-hdmirx-f4645e64f8c3
>=20
> Best regards,
>=20





