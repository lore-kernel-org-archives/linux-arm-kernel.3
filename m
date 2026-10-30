Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED5F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 19:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ybAO7ifV;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=vcu0mzRq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vPaZTew6bHfge4tOyLNLySlYKC2rw8qbkKNVjP45eiQ=; b=ybAO7ifVepUFuBjosjtEPmJUOo
	LtHCc1LgBOBJxvgq7ZagkPyjhMfrv9sBGyJGUf5uzxioqDUUDyqkl43N2sJ952DEZ3MlPXqU/xUpE
	Ap405WctsauZFq1V7fXsUXIchyHbdBQHgRj4Ecu7F/s/7uW7ajn0RDg0+iNmZHIlpNCANQEQ07jSc
	NC6RPILilmBiEDgarVFFo1fH9efpWeLUsZVqhlMrHLWqiKkfdl5lmzSGquJs+5uaNceA5vYu6lApq
	Or7LBYQlJkpXH/nniHvsHS2/9ubrKK3ojmTuq2AP/V6IkgnVKQL1OiC36bYKoQ+5cZNW7h9wNSt+p
	4MG8MwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMsIY-0000000CUco-15YT;
	Fri, 30 Oct 2026 19:29:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMsIV-0000000CUcN-1KJJ;
	Fri, 30 Oct 2026 19:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vPaZTew6bHfge4tOyLNLySlYKC2rw8qbkKNVjP45eiQ=; b=vcu0mzRqxjxJVB7xA26R21VLOx
	1XuofCcoDvKjYRmwM2obB+hnUCFpJkF2LJaei8BwSJBywSI21TReldCkGn+wUdrlpC7lnPOFPVhJQ
	InLmBANLT+fRBAxuq/0hEXI/HTmcRD1WdeJyimQeu+GuZ+aIzaKMVUMW5u7kxr5NWsbEIeqO8r7eb
	5z+MErXmfIQH1kwv44t0UWeM9iwm1+TY4B6nc5OszREoFiojcFy4mUbQ3rDmDMv1XLbd5qsr1tFQp
	dgsq2+G4QhKtf2FimPUBNyCXhiEmCVykMTENu6eE6MY5CF20VntzbvgM9RbUsso6Sm919olW2kuYP
	eLFI0hRQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: iav@iav.lv
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Date: Fri, 30 Oct 2026 20:29:47 +0100
Message-ID: <1937939.QCnGb9OGeP@phil>
In-Reply-To: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
References: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_122955_360570_81F1C2D8 
X-CRM114-Status: GOOD (  16.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Am Samstag, 10. Oktober 2026, 23:53:01 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Igor Velkov via B4 Relay:
> From: Igor Velkov <iav@iav.lv>
>=20
> The GPU core of Helios64 is supplied by U12, a Silergy SYR838 on i2c0
> at 0x41, with its VSEL pin on GPU_SLEEP_H (GPIO1_B6). Describe it as
> silergy,syr828, the way vdd_cpu_b (a SYR837) is described as
> silergy,syr827, and enable the GPU.
>=20
> Assisted-by: LLM
> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Schematic, sheet 7:
> https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.=
2.pdf
>=20
> Tested on mainline: panfrost probes, devfreq moves vdd_gpu from 825 mV
> at 200 MHz to 1100 mV at 800 MHz, glmark2-es2-wayland under headless
> weston scores 548-577 in three runs. Two of them logged one panfrost
> job timeout each; the Armbian DT gave none in three runs.
> ---
>  .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 28 ++++++++++++++++=
++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index 63ad79b4c8ac..1f50982291bf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> @@ -339,6 +339,11 @@ &gmac {
>  	status =3D "okay";
>  };
> =20
> +&gpu {
> +	mali-supply =3D <&vdd_gpu>;
> +	status =3D "okay";
> +};
> +
>  &i2c0 {
>  	clock-frequency =3D <400000>;
>  	i2c-scl-rising-time-ns =3D <168>;
> @@ -453,6 +458,25 @@ regulator-state-mem {
>  			regulator-off-in-suspend;
>  		};
>  	};
> +
> +	vdd_gpu: regulator@41 {
> +		compatible =3D "silergy,syr828";
> +		reg =3D <0x41>;
> +		fcs,suspend-voltage-selector =3D <1>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&vsel2_pin>;
> +		regulator-name =3D "vdd_gpu";
> +		regulator-always-on;
> +		regulator-boot-on;

both of these should not be needed, as the GPU should control its
regulator. (always-on and boot-on)

Heiko



