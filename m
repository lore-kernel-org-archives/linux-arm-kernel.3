Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED35CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 22:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dvf/XQpzulji1wBhBHLC8XVhm9Xe3eYDeZQP7tzMob0=; b=mWdV/8G+SmxrLez5x95wiVjiBw
	xZ1gjYWheXAQNVdQyLrSaD7An1TZHdN3No3dxw7gfF5g7k0SNbu6b+5LHX3ZoNZ9pGG6i8utE7BWO
	Mha22nPwJ97Ux42HYi74ty12osD0zvKgigO+hZzHIyL9OeM7DIHD74F26B9BN5hbOCNLmXdqLwEAG
	OqN5v6OLS7zceqwXntzMeIMm/ZHSYs17qdwzVPB1xhaGAyQJOyoL5JluUJDSYJHG7fEmxyHK2DXMr
	jMeNITZKJMIrN/FFdNj4ciMYnCwHu/UGcYaL5iVqv9KO4YArww6anDuAPMz7uxA6vFtPvrJdrphte
	51wTo23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8pa-0000000GKP3-3RiL;
	Thu, 06 Nov 2025 22:51:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8pX-0000000GKOZ-3kcM;
	Thu, 06 Nov 2025 22:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Dvf/XQpzulji1wBhBHLC8XVhm9Xe3eYDeZQP7tzMob0=; b=yIjWpIx5joxDlkCEEOayYDdvkF
	E4y4iX+xlBS0cYIF0dlv2X8MnTLPR2GT7/iGLLPbDiHL/ftjrbiNsce/KIu/r0bIzisALENVXwMNX
	9Jq0M125bUHdah5OUvBLrV7HdTKu+oHCVuGcqlMNHGXXJCgHTOW5BfTA/OJfY1aANka9B2uu8v+yL
	u3IiKF2KGD3SKucquTQRMVFZo830WdFRVQbu6aywuKLRXZKNIveDqB0l3UScL04mxSqoqs/FlxiDO
	xs3G+PM9CsF+iFlk7eoKcXGbZCwn3ZuahwpDvR273xXHVqppQT5wNtojuAdl9Tgh1USDVzsdjmcDB
	TX20EwoQ==;
Received: from i53875bac.versanet.de ([83.135.91.172] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vH8pR-0001my-97; Thu, 06 Nov 2025 23:51:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Coia Prant <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add devicetree for the 9Tripod X3568
 v4
Date: Thu, 06 Nov 2025 23:51:40 +0100
Message-ID: <7930630.EvYhyI6sBW@phil>
In-Reply-To: <20251103171702.1518730-4-coiaprant@gmail.com>
References: <20251103171702.1518730-1-coiaprant@gmail.com>
 <20251103171702.1518730-4-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_145147_979419_AC2593DD 
X-CRM114-Status: GOOD (  20.88  )
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

Am Montag, 3. November 2025, 18:17:02 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Coia Prant:
> The 9Tripod X3568 v4 is an RK3568-based SBC, just like the RK3568-EVB.
> It always uses soldered connections between the X3568CV2/X3568CV3/X3568CV=
4 core board
> and the X3568bv4 I/O board.
>=20
> The differences between the core boards
> - PCB size, layout
> - CPU (RKK3568B2/RK3568J)
> - Memory type (DDR4/LPDDR4/LPDDR4X) and size
> - eMMC size
> - DSI/EDP resistor values
> Although the components vary, they maintain full compatibility.
>=20
> The X3568 board has multiple hardware revisions, and we currently support=
 v4 (I/O board).

[...]

> Signed-off-by: Coia Prant <coiaprant@gmail.com>

I've dropped the camera overlay for the time being, when applying the
board, because there were a number of smallish issues with it.

So please submit it separately again. Also, how can you use the camera
yet, when the whole vicap work is still pending?

Details below

> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |  11 +
>  .../rk3568-9tripod-x3568-v4-camera-demo.dtso  |  84 ++
>  .../rk3568-9tripod-x3568-v4-video-demo.dtso   | 154 +++
>  .../dts/rockchip/rk3568-9tripod-x3568-v4.dts  | 887 ++++++++++++++++++
>  4 files changed, 1136 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-=
camera-demo.dtso
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-=
video-demo.dtso
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.=
dts
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index ad684e383..959a806a2 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -130,6 +130,9 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3566-lubancat-1.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3566-nanopi-r3s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3566-bigtreetech-cb2-manta.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3566-bigtreetech-pi2.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-9tripod-x3568-v4.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-9tripod-x3568-v4-camera-demo.dtbo
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-9tripod-x3568-v4-video-demo.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-bpi-r2-pro.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-evb1-v10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-fastrhino-r66s.dtb
> @@ -252,6 +255,14 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3576-armsom-sige5=
=2Dv1.2-wifibt.dtb
>  rk3576-armsom-sige5-v1.2-wifibt-dtbs :=3D rk3576-armsom-sige5.dtb \
>  	rk3576-armsom-sige5-v1.2-wifibt.dtbo
> =20
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-9tripod-x3568-v4-camera-demo.dtb
> +rk3568-9tripod-x3568-v4-camera-demo-dtbs :=3D rk3568-9tripod-x3568-v4.dt=
b \
> +	rk3568-9tripod-x3568-v4-camera-demo.dtbo
> +
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3568-9tripod-x3568-v4-video-demo.dtb
> +rk3568-9tripod-x3568-v4-video-demo-dtbs :=3D rk3568-9tripod-x3568-v4.dtb=
 \
> +	rk3568-9tripod-x3568-v4-video-demo.dtbo
> +

when adding overlays, please sort them correctly,
rk3568-9tripod* should be above rk3568-wolfvision*


>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3588-edgeble-neu6a-wifi.dtb
>  rk3588-edgeble-neu6a-wifi-dtbs :=3D rk3588-edgeble-neu6a-io.dtb \
>  	rk3588-edgeble-neu6a-wifi.dtbo
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-=
demo.dtso b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-dem=
o.dtso
> new file mode 100644
> index 000000000..2b428ca71
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-demo.dt=
so
> @@ -0,0 +1,84 @@

[...]

> +&csi_dphy {
> +	status =3D "okay";
> +
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		port@0 {

=2E./arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-demo.dtso:=
41.8-56.4: Warning (graph_child_address): /fragment@2/__overlay__/ports: gr=
aph node has single child node 'port@0', #address-cells/#size-cells are not=
 necessary


> +			reg =3D <0>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			mipi_in_ucam: endpoint@2 {
> +				reg =3D <2>;
> +				remote-endpoint =3D <&ucam_out>;
> +				data-lanes =3D <1 2 3 4>;
> +			};
> +		};
> +	};

/home/devel/hstuebner/00_git-repos/linux-rockchip/_build-arm64/arch/arm64/b=
oot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-demo.dtb: phy@fe870000 (roc=
kchip,rk3568-csi-dphy): 'ports' does not match any of the regexes: '^pinctr=
l-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/phy/rockchip-inno-cs=
i-dphy.yaml#

not sure what is up with that.

> +};
> +
> +&i2c4 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	status =3D "okay";
> +
> +	camera@37 {
> +		compatible =3D "ovti,ov5695";
> +		reg =3D <0x37>;
> +		clocks =3D <&cru CLK_CIF_OUT>;
> +		clock-names =3D "xvclk";
> +		avdd-supply =3D <&vcc_cam>;
> +		dvdd-supply =3D <&vcc_cam>;
> +		dovdd-supply =3D <&vcc_cam>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&cif_clk>;
> +		reset-gpios =3D <&gpio3 RK_PB6 GPIO_ACTIVE_LOW>;
> +		pwdn-gpios =3D <&gpio4 RK_PB4 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			ucam_out: endpoint {
> +				remote-endpoint =3D <&mipi_in_ucam>;
> +				data-lanes =3D <1 2 3 4>;
> +			};
> +		};

/home/devel/hstuebner/00_git-repos/linux-rockchip/_build-arm64/arch/arm64/b=
oot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-demo.dtb: camera@37 (ovti,o=
v5695): port:endpoint:data-lanes: [1, 2, 3, 4] is too long
        from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov569=
3.yaml#
/home/devel/hstuebner/00_git-repos/linux-rockchip/_build-arm64/arch/arm64/b=
oot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-demo.dtb: camera@37 (ovti,o=
v5695): Unevaluated properties are not allowed ('port', 'pwdn-gpios' were u=
nexpected)
        from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov569=
3.yaml#


> +	};
> +};



Heiko



