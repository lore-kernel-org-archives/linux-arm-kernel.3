Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF16C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+77mLNRKP7S3a1EeDVlp4Z40e4a+H2yITmtvU3k1wSo=; b=CT00dIzbhuslF7n4J9LcIoc1un
	wu92ChNUi4e7YHJXfXQYJbL5eYy/a6gFItK3eHXBk+jXBWjvS5h1JpbuUULuwKgsztt1lx8oGBBUU
	t3jVogQOU5nd1YCtyEg8dnagFQ3ANh3woWDoFLf79SpxP9sxB3shdjyXUZhSYKKWdclkSoRjIVIQB
	3Vl4JgSTqDSJCUwHt6i9sggiKM/S9zx5D4HNB5GaC12IM8XGGM+3axO+kWDRwdPM7V6TMYBc4PdLo
	kcL4lrsFNP+KAsld3uAoUfXd6FgAjkHEPLrk+M42/KW1RhGk4HtBmIs36DRiz1PECnZe0zbcLC4vW
	NjRw1xBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYtH-0000000FK4M-2u6a;
	Fri, 20 Jun 2025 10:22:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXnV-0000000FA9S-094P;
	Fri, 20 Jun 2025 09:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+77mLNRKP7S3a1EeDVlp4Z40e4a+H2yITmtvU3k1wSo=; b=pMjv3keHGRwyvE7kWF7p/mXjzW
	JLeyfMK7GJJvLwDxXLm5Si6mdN0/M9RoKoW7y6er0Wnli5GymY1sGpesPmVaz29O3PfK6UJkAhA9J
	ElEuWdlbwBto0BRnWao1uRmBP/OKGeg5e4gR91ayq7n4bR4kpH0o76AZ+VRXaubvgRSNQttyhqJJA
	S7mVWqaBggV9Y0O0egMXAjI8hSrFsWeToX8SNfocUFdISuhSJ5Pr4QQvO8skYL2hx/KmKEa3oewbm
	bs2woefRQcUsCwIODVuhC4OwAWkJs9ucxpVRwVFCbud6yH/Rz92aq5/qSl58HjCdVdNWkiHfVFmC+
	gwZlUe9A==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSXnS-00088r-9A; Fri, 20 Jun 2025 11:12:30 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: John Clark <inindev@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 John Clark <inindev@gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support
Date: Fri, 20 Jun 2025 11:12:29 +0200
Message-ID: <2432603.PIDvDuAF1L@phil>
In-Reply-To: <20250616212214.139585-3-inindev@gmail.com>
References: <20250616212214.139585-1-inindev@gmail.com>
 <20250616212214.139585-3-inindev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_021233_072326_5265194D 
X-CRM114-Status: GOOD (  12.71  )
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

Am Montag, 16. Juni 2025, 23:22:14 Mitteleurop=C3=A4ische Sommerzeit schrie=
b John Clark:
> Add device tree for FriendlyElec NanoPi M5 with Rockchip RK3576 SoC
> (4x Cortex-A72, 4x Cortex-A53, Mali-G52 MC3 GPU, 6 TOPS NPU). Enables
> basic booting and connectivity.
>=20
> Supported features:
> - RK3576 SoC
> - 4GB/8GB/16GB LPDDR4X/LPDDR5 RAM
> - 16MB SPI Nor Flash
> - 2x 1Gbps Ethernet
> - 2x USB 3.2 Gen 1 Type-A ports
> - microSD UHS-I
> - M.2 M-Key PCIe 2.1 x1 NVMe support
> - HDMI 1.4/2.0 (up to 4096x2304@60Hz)
> - 30-pin GPIO (2x SPI, 4x UART, 3x I2C, 5x PWM, 20x GPIO)
> - Debug UART
> - RTC with HYM8563TS
> - Power via USB-C (PD, 6V~20V)
>=20
> Signed-off-by: John Clark <inindev@gmail.com>
> ---

apart from the schema problems, Rob's bot found, I saw some additional
nitpicks below.


[...]

> +	sound {
[...]
> +	};
> +
> +	vcc_12v_dcin: regulator-vcc-12v-dcin {

nodes without addresses should get sorted by nodename
aka regulator-* before sound.

Phandles count into the sorting only below in the
&phandle {}; parts


> +		compatible =3D "regulator-fixed";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <12000000>;
> +		regulator-max-microvolt =3D <12000000>;
> +		regulator-name =3D "vcc_12v_dcin";

blank lines between properties and subnodes please.
same for other regulators below and also the pmic.

> +		regulator-state-mem {
> +			regulator-on-in-suspend;
> +		};
> +	};
> +

> +&fspi1m1_pins {
> +	rockchip,pins =3D
> +		/* clk, d0~4 */

comment could state a tiny bit more what is changed compared to
the "original" pin settings

> +		<1 RK_PD5 3 &pcfg_pull_none>,
> +		<1 RK_PC4 3 &pcfg_pull_none>,
> +		<1 RK_PC5 3 &pcfg_pull_none>,
> +		<1 RK_PC6 3 &pcfg_pull_none>,
> +		<1 RK_PC7 3 &pcfg_pull_none>;
> +};




> +&saradc {
> +	status =3D "okay";
> +	vref-supply =3D <&vcca_1v8_s0>;

status is the last property

> +};





