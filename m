Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1944EC2A06F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 18:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrG6WDsV+mJXUtMhDV9DQtV1cfGpkAXeDDeqY6eDHFk=; b=xOBpnOJtJft+MHh45Ng8TB7e4M
	CCdComojpGiW505MsMbdNBuxBsRgXP0llbr9YcZmK3TQ0okyUv0CWUccLetcaFSVT+JlPiPut9eKI
	z1CX6aZFSYML66z+11S3S36+/IbRXD7C2AFxmxIsDN0xWngKwMFtlrjEso93CUE2tZvzK8DvUKNFS
	cO+1+0K9js5vt7iTfSUF9QYAFItAgOjooqQiD2lxh2Xvfr5Cz6j7PxJonMb6uP4J60ZLVFfW+cXnm
	2zqM4I3npa7B6WYk0z8nKPcSoFgh6vG2xrzJCsxHfDW6sRSoCW+7aJG3AJF5mqluo7/tHFg9zgOL+
	hjeO+4Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk57V-0000000BPP7-2ZYI;
	Sun, 25 Jan 2026 18:45:57 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk57T-0000000BPOO-1qeN;
	Sun, 25 Jan 2026 18:45:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 5E0F641B4A;
	Sun, 25 Jan 2026 19:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1769366752; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZrG6WDsV+mJXUtMhDV9DQtV1cfGpkAXeDDeqY6eDHFk=;
	b=GRhGLAsoB0NY3YG2IuRCx3e9PAqd0NKFa3vesTIaHF5rkGyeIgJPillci5hzU87ywXXxQj
	97jJj/cAp1OhCCW7VLzDqVoEwju0X7UcHyl2MBOYfVWXtsjw6gSQxlQoM+UWSlKbaoJ45Q
	QnH5UAReI7bPmTj7j6znid6Kba5zSi2vmQbPYx52qHntuhaR3S2YcDfiTf4Q5+sEW8RV1s
	knaPhlp+T+k64OiMV+mD/VfLFY0DqL4Pw9Il8D3pviNP7PK5JoYkjFBqOrtegvkcKccSHj
	IWfRw3DVsiF0BZgpefixgTaJ0EAOABg7ijpX5SaNqQGp4teqJu3nmHmBjxBQlQ==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260125181228.25145-1-sigmaris@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20260125181228.25145-1-sigmaris@gmail.com>
Date: Sun, 25 Jan 2026 19:45:51 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Alexey Charkov" <alchark@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Hugh Cole-Baker" <sigmaris@gmail.com>
MIME-Version: 1.0
Message-ID: <8b1a5b5e-c917-f101-6472-9071afb145d0@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v3] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= add pwm-fan for NanoPC-T6
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_104555_652655_1B5C5459 
X-CRM114-Status: GOOD (  13.47  )
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

Hello Hugh,

On Sunday, January 25, 2026 19:10 CET, Hugh Cole-Baker <sigmaris@gmail.=
com> wrote:
> FriendlyELEC offers an optional heatsink and fan addon [1] for the
> NanoPC-T6 and T6 LTS, which plugs in to the fan connector on the boar=
d
> driven by pwm1. Add the fan as an active cooling device for the SoC p=
ackage.
> The PWM duty cycle values are taken from the vendor's source [2].
>=20
> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
>=20
> [1]: https://www.friendlyelec.com/index.php?route=3Dproduct/product&p=
roduct=5Fid=3D305
> [2]: https://github.com/friendlyarm/kernel-rockchip/blob/4944602540b6=
2f5aad139fe602a76cf7c3176128/arch/arm64/boot/dts/rockchip/rk3588-nanopi=
6-rev01.dts#L75-L90
> ---
> Changes from v2: https://lore.kernel.org/linux-rockchip/2025110919212=
8.72527-1-sigmaris@gmail.com/
> * Set trip points to 55 and 65=C2=B0C (Dragan)
>=20
> Changes from v1: https://lore.kernel.org/linux-rockchip/2025102619485=
8.92461-1-sigmaris@gmail.com/
> * add the fan to the base board dtsi instead of overlay (Heiko)
> * just use 2 trip points for warm and hot temperatures (Dragan, Alexe=
y)
>=20
>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 39 +++++++++++++++++=
++
>  1 file changed, 39 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arc=
h/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> index 90e7fe254491b..84b6b53f016ab 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/rockchip.h>
>  #include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/thermal/thermal.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "rk3588.dtsi"
> =20
> @@ -89,6 +90,14 @@ usr=5Fled: led-1 {
>  		};
>  	};
> =20
> +	fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		cooling-levels =3D <0 35 64 100 150 255>;
> +		fan-supply =3D <&vcc5v0=5Fsys>;
> +		pwms =3D <&pwm1 0 50000 0>;
> +		#cooling-cells =3D <2>;
> +	};
> +
>  	sound {
>  		compatible =3D "simple-audio-card";
>  		pinctrl-names =3D "default";
> @@ -590,6 +599,36 @@ &i2s6=5F8ch {
>  	status =3D "okay";
>  };
> =20
> +&package=5Fthermal {
> +	polling-delay =3D <1000>;
> +
> +	trips {
> +		package=5Fwarm: package-warm {
> +			temperature =3D <55000>;
> +			hysteresis =3D <2000>;
> +			type =3D "active";
> +		};
> +
> +		package=5Fhot: package-hot {
> +			temperature =3D <65000>;
> +			hysteresis =3D <2000>;
> +			type =3D "active";
> +		};
> +	};
> +
> +	cooling-maps {
> +		map0 {
> +			trip =3D <&package=5Fwarm>;
> +			cooling-device =3D <&fan THERMAL=5FNO=5FLIMIT 1>;
> +		};
> +
> +		map1 {
> +			trip =3D <&package=5Fhot>;
> +			cooling-device =3D <&fan 2 THERMAL=5FNO=5FLIMIT>;
> +		};
> +	};
> +};
> +
>  &pcie2x1l0 {
>  	reset-gpios =3D <&gpio4 RK=5FPB3 GPIO=5FACTIVE=5FHIGH>;
>  	vpcie3v3-supply =3D <&vcc=5F3v3=5Fpcie20>;

Thanks for the v3 of this patch, it's looking good to me, as explained
further in my comments on the v1 and v2.

Please feel free to include

Reviewed-by: Dragan Simic <dsimic@manjaro.org>


