Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EAFEC01B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6keZ0J8bp8XaUyK9YS2ONZrB864NUMZU0QHXs1cWj4=; b=MrtJKVv34s1H1r9jCEHMftipII
	ze2aNGlwJZmLn1DVDIGd6BSAns1zUyFbg5ATxHPwou8ttM/b9Ea05Prbuqh87xgGGWaegKkYYydEk
	pSyaPUS4/0BmaA3Ocofi65YhRNmk+/Knpj2NmoFlggTa+ZbwUHDmNquB7vEGPaeEYIDdsvIMsWx57
	LVfGe4mLnYC+mQvUdFapE6A0Ltks5bXTguWU1gnlz6VqVdJKzWp6d1E1LjClXmsP2CMRhfIGm9fou
	d1myEEBCSMUKqIHynX0JtzIL29CBDuaQv9pO6gxwCPj9TII48tT9zp7SUN+IYnscYyAEqnb5Okqiv
	mbbBLdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cGS-0000000GT8L-1g1U;
	Mon, 23 Mar 2026 10:12:04 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cGP-0000000GT7V-0Sfw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=W6keZ0J8bp8XaUyK9YS2ONZrB864NUMZU0QHXs1cWj4=; b=Qf5aIl4GVdq+PVzn9w/hvh7DOX
	FCCUAW7ftXAsDzHJNPTVjt7mwFKnUwy03aE9Xs7W/wrZ1IZ36xE2uXOt+E/SU8cGgCzyZq3ezpmn1
	99UmOCXZ0oTFgxS/00h14C2XCgPvHsTEwAypDJy6TRq30NfdCPXSfeh66zklbOg0ehoOExCyJffSF
	kb/bp9qhyQ8oVg1MxcQnCrDW1VI4Frxa4NcgDzKb7Nqy5zbETXlZfsdzxokLbdjblfxSdFZzUhTTc
	ct4yKgRDo/i5WvBZUWM6SRR4gzIo5X/ZFUuB1Mt7A6nwO2kS5r52kTaxvUNF35OCuRejf3EsIoigK
	2qoF9H4Q==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w4cGF-000MKb-02;
	Mon, 23 Mar 2026 11:11:51 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w4cGD-0009hO-2R;
	Mon, 23 Mar 2026 11:11:50 +0100
Message-ID: <9e5367c6dfba0708578cda69fc48531b3749b5e8.camel@ew.tq-group.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s: Add main_i2c4 device node
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Aniket Limaye <a-limaye@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, u-kumar1@ti.com, Jared McArthur
 <j-mcarthur@ti.com>
Date: Mon, 23 Mar 2026 11:11:49 +0100
In-Reply-To: <20260304-j722s-main-i2c4-dt-v1-1-03f79f0cdf97@ti.com>
References: <20260304-j722s-main-i2c4-dt-v1-1-03f79f0cdf97@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/27949/Mon Mar 23 07:24:47 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031201_415169_9B1F3D4B 
X-CRM114-Status: GOOD (  20.60  )
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

On Wed, 2026-03-04 at 14:41 +0530, Aniket Limaye wrote:
> Add missing device tree node for main_i2c4, and the corresponding ranges
> in cbass_main. Interrupt for this i2c controller is routed through the
> Main GPIOMUX Router.
> Base address, Interrupt IDs are taken from J722S TRM [0].
> Device, Clock IDs are taken from TISCI docs [1].
>=20
> Additionally, the I2C4 is the only interrupt source to the GPIOMUX INTR
> router that generates level interrupts, while all other sources generate
> edge interrupts. Due to this, the router needs to handle interrupt-type
> on a per-line basis. Modify the router node and its consumers to
> specify the interrupt type corresponding to each interrupt line.
>=20
> [0]: https://www.ti.com/lit/zip/sprujb3
> [1]:
> https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/index.html#j722s
>=20
> Signed-off-by: Jared McArthur <j-mcarthur@ti.com>
> Signed-off-by: Aniket Limaye <a-limaye@ti.com>
> ---
> Note:
> Support for per-line interrupt-types was added through a recent series
> [2], which was already merged in.
>=20
> Testing:
> - Enable I2C4 (additional DT patch) on j722s-evm and run i2cdetect [3].
> - Add testcode to ignore the NACK interrupt, which results in an irq
>   storm -> showing that GIC is actually receiving level interrupt from
>   the INTR [4].

I ran a basic test on our MBa67xx board based on current linux-next with th=
is
patch applied. Probe and configuration of a RPi DSI camera module (IMX219)
connected to I2C4 is working as expected.

Tested-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>



>=20
> [2]: https://lore.kernel.org/all/20260123-ul-driver-i2c-j722s-v4-0-b08625=
c487d5@ti.com/
> [3]: https://gist.github.com/aniket-l/844925345316adf9f65f04c8cdedd62d#fi=
le-j722s-evm-main-i2c4-working-logs-txt
> [4]: https://gist.github.com/aniket-l/844925345316adf9f65f04c8cdedd62d#fi=
le-j722s-evm-main-i2c4-irqstorm-logs-txt
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 13 +++++++-----=
-
>  arch/arm64/boot/dts/ti/k3-j722s-main.dtsi              | 13 ++++++++++++=
+
>  arch/arm64/boot/dts/ti/k3-j722s.dtsi                   |  3 ++-
>  3 files changed, 22 insertions(+), 7 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arc=
h/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> index 0e1af2a69ca2..f130c7cb998d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
> @@ -543,10 +543,9 @@ main_spi2: spi@20120000 {
>  	main_gpio_intr: interrupt-controller@a00000 {
>  		compatible =3D "ti,sci-intr";
>  		reg =3D <0x00 0x00a00000 0x00 0x800>;
> -		ti,intr-trigger-type =3D <1>;
>  		interrupt-controller;
>  		interrupt-parent =3D <&gic500>;
> -		#interrupt-cells =3D <1>;
> +		#interrupt-cells =3D <2>;
>  		ti,sci =3D <&dmsc>;
>  		ti,sci-dev-id =3D <3>;
>  		ti,interrupt-ranges =3D <0 32 16>;
> @@ -558,8 +557,9 @@ main_gpio0: gpio@600000 {
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		interrupt-parent =3D <&main_gpio_intr>;
> -		interrupts =3D <190>, <191>, <192>,
> -			     <193>, <194>, <195>;
> +		interrupts =3D <190 IRQ_TYPE_EDGE_RISING>, <191 IRQ_TYPE_EDGE_RISING>,
> +			     <192 IRQ_TYPE_EDGE_RISING>, <193 IRQ_TYPE_EDGE_RISING>,
> +			     <194 IRQ_TYPE_EDGE_RISING>, <195 IRQ_TYPE_EDGE_RISING>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <2>;
>  		ti,davinci-gpio-unbanked =3D <0>;
> @@ -574,8 +574,9 @@ main_gpio1: gpio@601000 {
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
>  		interrupt-parent =3D <&main_gpio_intr>;
> -		interrupts =3D <180>, <181>, <182>,
> -			     <183>, <184>, <185>;
> +		interrupts =3D <180 IRQ_TYPE_EDGE_RISING>, <181 IRQ_TYPE_EDGE_RISING>,
> +			     <182 IRQ_TYPE_EDGE_RISING>, <183 IRQ_TYPE_EDGE_RISING>,
> +			     <184 IRQ_TYPE_EDGE_RISING>, <185 IRQ_TYPE_EDGE_RISING>;
>  		interrupt-controller;
>  		#interrupt-cells =3D <2>;
>  		ti,davinci-gpio-unbanked =3D <0>;
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi b/arch/arm64/boot/=
dts/ti/k3-j722s-main.dtsi
> index 9ee5d0c8ffd1..ddf20e44f0ea 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-main.dtsi
> @@ -154,6 +154,19 @@ usb1: usb@31200000 {
>  		};
>  	};
> =20
> +	main_i2c4: i2c@fe80000 {
> +		compatible =3D "ti,am64-i2c", "ti,omap4-i2c";
> +		reg =3D <0x00 0x0fe80000 0x00 0x100>;
> +		interrupt-parent =3D <&main_gpio_intr>;
> +		interrupts =3D <178 IRQ_TYPE_LEVEL_HIGH>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		power-domains =3D <&k3_pds 257 TI_SCI_PD_EXCLUSIVE>;
> +		clocks =3D <&k3_clks 257 2>;
> +		clock-names =3D "fck";
> +		status =3D "disabled";
> +	};
> +
>  	ti_csi2rx1: ticsi2rx@30122000 {
>  		compatible =3D "ti,j721e-csi2rx-shim";
>  		reg =3D <0x00 0x30122000 0x00 0x1000>;
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s.dtsi b/arch/arm64/boot/dts/t=
i/k3-j722s.dtsi
> index 059c65ece183..1b36dcf37925 100644
> --- a/arch/arm64/boot/dts/ti/k3-j722s.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j722s.dtsi
> @@ -160,7 +160,8 @@ cbass_main: bus@f0000 {
>  			 <0x00 0x0fd80000 0x00 0x0fd80000 0x00 0x00080000>, /* GPU */
>  			 <0x00 0x0fd20000 0x00 0x0fd20000 0x00 0x00000100>, /* JPEGENC0_CORE =
*/
>  			 <0x00 0x0fd20200 0x00 0x0fd20200 0x00 0x00000200>, /* JPEGENC0_CORE_=
MMU */
> -			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Third peripher=
al window */
> +			 <0x00 0x0fe00000 0x00 0x0fe00000 0x00 0x000f0400>, /* Third peripher=
al window */
> +			 <0x00 0x20000000 0x00 0x20000000 0x00 0x0a008000>, /* Fourth periphe=
ral window */
>  			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
>  			 <0x00 0x301c0000 0x00 0x301c0000 0x00 0x00001000>, /* DPHY-TX */
>  			 <0x00 0x30101000 0x00 0x30101000 0x00 0x00080100>, /* CSI window */
>=20
> ---
> base-commit: d517cb8cea012f43b069617fc8179b45404f8018
> change-id: 20260303-j722s-main-i2c4-dt-8a1344d04ffe
>=20
> Best regards,

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

