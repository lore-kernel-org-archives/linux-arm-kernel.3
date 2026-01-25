Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD65E63CAC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 18:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PN7cFYtYsOCpeUwMlZ0LtZz5pvDAZSFd5KI1Prsv4Cw=; b=Jx+YCspPLiHlNHv0/DjzPUsneV
	bYNyv+UwDEtXvloUhGRg87OdKYDKpc6hWafq0+DhT2Xp2iweiijk4Q2bboHPrXUF3Bk4U1NMjb+ZR
	n5nxwW46cWjhfloHMYdTJ+PHjwUT+4PcYYeRwZKVoXCapMZRFaKjzMZbdJ6KizK2JGoun5Jf7qJMs
	lfbJ/qIj1sSGXeLacv1FefBRB1FNvysK9fTf5R/4xUM8XriqktvI5wd2o8mPgVmoNMjO+tHogl6J8
	FVYvotY+6ZxgWKcqfsMMHRKCsuyQanCkVjDhKBt8okIHAgMpQW9/covd2k2bzuJGErgq0COduHIMw
	gCRpX6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk4zV-0000000BOpJ-11yd;
	Sun, 25 Jan 2026 18:37:41 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk4zS-0000000BOop-2mII;
	Sun, 25 Jan 2026 18:37:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id EBE8141B4A;
	Sun, 25 Jan 2026 19:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1769366252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PN7cFYtYsOCpeUwMlZ0LtZz5pvDAZSFd5KI1Prsv4Cw=;
	b=bi7v9Sa6qR+Op8b1axILuxj7zi82VTGJqqKDreAXzJg6QaWDEv/JBDinEgV8R06FWYEuNN
	Ak26KLA7QHy4UNMlluOO53YDHn1UaD1rUCuwYfXTM8zRg+uQ4PxbLtfhke93ChLHHMaybM
	4Xz9+VelTcg1NQTJG+k5rrNHffKyyV+DqFXIwKwTL7qRemqvT7/yWtB/AlCF4tkX3YYloA
	E8g3s4Txn9ndQ1S4akLDBYAjeE9+f5G4Fj+67dsEi7YfsnpeqTmJj5rUqp0b34V92fXGmc
	JOnO5Txco3H2CJyZJspF+SIK2pCPZrD+ybsN9FDkmmLhDH1i809mV6/F6dQrrg==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <6235f7ee-d0fa-4c46-b98b-54af4d9d5ce8@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20251109192128.72527-1-sigmaris@gmail.com>
 <da6721a3-8f59-9c0c-762c-bc02b39ac472@manjaro.org> <6235f7ee-d0fa-4c46-b98b-54af4d9d5ce8@gmail.com>
Date: Sun, 25 Jan 2026 19:37:27 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Alexey Charkov" <alchark@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: "Hugh Cole-Baker" <sigmaris@gmail.com>
MIME-Version: 1.0
Message-ID: <fe32b221-5bc3-0505-49d1-5bc374cf2267@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH v2] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= add pwm-fan for NanoPC-T6
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_103739_074252_A8C92B07 
X-CRM114-Status: GOOD (  35.28  )
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

On Sunday, January 25, 2026 19:04 CET, Hugh Cole-Baker <sigmaris@gmail.=
com> wrote:
> On 10/11/2025 00:23, Dragan Simic wrote:
> > On Sunday, November 09, 2025 20:20 CET, Hugh Cole-Baker <sigmaris@g=
mail.com> wrote:
> >> FriendlyELEC offers an optional heatsink and fan addon for the Nan=
oPC-T6
> >> and T6 LTS, which plugs in to the fan connector on the board drive=
n by
> >> pwm1. Add the fan as an active cooling device for the SoC package.
> >>
> >> Signed-off-by: Hugh Cole-Baker <sigmaris@gmail.com>
> >> ---
> >> Changes from v1: https://lore.kernel.org/linux-rockchip/2025102619=
4858.92461-1-sigmaris@gmail.com/
> >> * add the fan to the base board dtsi instead of overlay (Heiko)
> >> * just use 2 trip points for warm and hot temperatures (Dragan, Al=
exey)
> >>
> >> References:
> >> FriendlyELEC heatsink with fan addon:
> >> https://www.friendlyelec.com/index.php?route=3Dproduct/product&pro=
duct=5Fid=3D305
> >> Vendor DT with trip points and PWM duty cycle values:
> >> https://github.com/friendlyarm/kernel-rockchip/blob/4944602540b62f=
5aad139fe602a76cf7c3176128/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-=
rev01.dts#L75-L90
> >=20
> > I think it would be better to move these references to the patch
> > description, so they become directly available in the repository.
> > It might be the best to use the "... [n]" form for the references,
> > which puts them as close to the backed contents as possible.
> >=20
> > Oh, and I think that "arm64: dts: rockchip: Enable active cooling
> > on NanoPC-T6" as the patch subject would read nicer. :)
> >=20
> >>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 39 ++++++++++++++=
+++++
> >>  1 file changed, 39 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/=
arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >> index fafeabe9adf9e..9164a0ee6228e 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> >> @@ -11,6 +11,7 @@
> >>  #include <dt-bindings/input/input.h>
> >>  #include <dt-bindings/pinctrl/rockchip.h>
> >>  #include <dt-bindings/soc/rockchip,vop2.h>
> >> +#include <dt-bindings/thermal/thermal.h>
> >>  #include <dt-bindings/usb/pd.h>
> >>  #include "rk3588.dtsi"
> >> =20
> >> @@ -89,6 +90,14 @@ usr=5Fled: led-1 {
> >>  		};
> >>  	};
> >> =20
> >> +	fan: pwm-fan {
> >> +		compatible =3D "pwm-fan";
> >> +		cooling-levels =3D <0 35 64 100 150 255>;
> >> +		fan-supply =3D <&vcc5v0=5Fsys>;
> >> +		pwms =3D <&pwm1 0 50000 0>;
> >> +		#cooling-cells =3D <2>;
> >> +	};
> >> +
> >>  	sound {
> >>  		compatible =3D "simple-audio-card";
> >>  		pinctrl-names =3D "default";
> >> @@ -591,6 +600,36 @@ &i2s6=5F8ch {
> >>  	status =3D "okay";
> >>  };
> >> =20
> >> +&package=5Fthermal {
> >> +	polling-delay =3D <1000>;
> >> +
> >> +	trips {
> >> +		package=5Fwarm: package-warm {
> >> +			temperature =3D <50000>;
> >> +			hysteresis =3D <2000>;
> >> +			type =3D "active";
> >> +		};
> >> +
> >> +		package=5Fhot: package-hot {
> >> +			temperature =3D <60000>;
> >> +			hysteresis =3D <2000>;
> >> +			type =3D "active";
> >> +		};
> >> +	};
> >=20
> > It should be better to use 55 and 65 oC as the trip thresholds,
> > because people often report around 50 oC as the observed idle-state
> > temperature of their RK3588 SoCs, so increasing the first threshold
>=20
> Were these people using the heatsink accessory on the NanoPC-T6, or w=
ere
> they using some other board with worse heat dissipation? I recorded t=
he
> package temperature on my NanoPC-T6 with the FriendlyELEC heatsink an=
d fan
> and even though it's not idle but actually running Home Assistant,
> OpenLDAP, PostgreSQL, Prometheus, Grafana and Nginx, the temperature =
ranges
> between 46 and 48=C2=B0C, and the fan never even spins up.
>=20
> Then I ran stress-ng and recorded the temperature under CPU load, wit=
h this
> version of the patch and another version with 55 & 65=C2=B0C trip poi=
nts. [1]
>=20
> I suspect if people are seeing 50=C2=B0C at idle, they're either usin=
g a less
> effective heatsink, or in a very warm ambient temperature. When talki=
ng
> about the NanoPC-T6 fan specifically, we kinda have to assume the
> FriendlyELEC heatsink is used, as there's no mounting for the fan wit=
hout
> the heatsink.

Those are all valid points, the overall thermal performance depends
on the room temperature and the actually used cooling solution, while
the latter depends on the specific board.

You're right that, based on thermals you observed, raising the trip
points to 55 and 65 oC may not always lead to the expected improvements=
,
but let's keep in mind that it actually may keep the fan spinning less
in some environments, which is good for both the end-user perception
and for the fan's longevity.

> > to 55 oC should be beneficial by preventing the fan from spinning
> > when the SoC is actually idle.  The second threshold is usually set
> > to be 10 oC higher, so it should end up at 65 oC.
>=20
> I'll send a v3 with 55 and 65=C2=B0C trip points, but I doubt it make=
s any
> difference to the fan activating while idle; from my testing it seems=
 to
> just let the SoC get a bit hotter under heavy load.
>=20
> [1]: https://gist.github.com/sigmaris/2d5590271cf26da8ec6cfc7ef8e3e8b=
c

Having the SoC running about 5 oC hotter under load is still fine while
it possibly makes the fan spin a bit less, so it may all together be
a reasonable compromise.

> >> +	cooling-maps {
> >> +		map0 {
> >> +			trip =3D <&package=5Fwarm>;
> >> +			cooling-device =3D <&fan THERMAL=5FNO=5FLIMIT 1>;
> >> +		};
> >> +
> >> +		map1 {
> >> +			trip =3D <&package=5Fhot>;
> >> +			cooling-device =3D <&fan 2 THERMAL=5FNO=5FLIMIT>;
> >> +		};
> >> +	};
> >> +};
> >> +
> >>  &pcie2x1l0 {
> >>  	reset-gpios =3D <&gpio4 RK=5FPB3 GPIO=5FACTIVE=5FHIGH>;
> >>  	vpcie3v3-supply =3D <&vcc=5F3v3=5Fpcie20>;


