Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37855E7C6E4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 20:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGwHSkJZn2IHtl0VYuWdb593LJsaVvLLi0zc9pE7w4M=; b=YBxzKtuYqfCudgjf4pcvNIZjDw
	DSrbZPntV0fhhIk2D822ZvprFwqlqgV1XwIU6nLLN/cBxXDnr8ihbMp32ztL4S31o4VWffM2JsS5d
	ytflTOrcVezzFpKqyMMv2DmyA2l5TW4zheKQH+tN81ty7M1lk/V17AE2yDA09Wh8GT9uQMJzzbnMT
	lPX4nEhhCkb7uKrpC9rq6Jm+DzaOjbdP2KP9aRPjyO4azW1okv2e82pTbOfOfcQN/FDig6nkPCsEP
	wRPkXBODWywXyqbEsdQ0QkpzMy2nSY9OWbUnWaNdKzpRgguT8dHJIXkA+MmhYJ7dEc+zF3bYJRAVC
	9xVJ03wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHZ4-00000002ylu-1vwO;
	Sat, 31 Jan 2026 20:27:30 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHYz-00000002ykf-2Ck3;
	Sat, 31 Jan 2026 20:27:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id 855EA41C15;
	Sat, 31 Jan 2026 21:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1769891239; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rGwHSkJZn2IHtl0VYuWdb593LJsaVvLLi0zc9pE7w4M=;
	b=ZyqFDnDImliBIsUp4VykZflufnaQHVYRGy/rqwfzoKWPcQyhQFcSnPflhjZRJQFnKhJacu
	YSOLR8EPflWQM7jcPniJUdaj7UMm6vNDrDJHz/s3u/9gD2tKGa9S1tpKiHjUEqt/sIiAGc
	Eebkdhib4q0FS0TWnpHeZPjo3nopjTtje9Bzuv+AmWyLHiAwO01X9GHI08Wmb0g08NszXB
	DF7WGRS5R6EVu4AVK5HO/BpM8jlCD3VuoSECH7ce670CtP9oZQLKL7ppkPrzhbAAwtWEjl
	wau7sAQs0r+72mhm+aTXwXN6xJmZDU3P2qe3gxD4pMOX7AHSp31pRMVUTOXbrw==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20260131153106.31723-4-jerrysteve1101@gmail.com>
Content-Type: text/plain; charset="utf-8"
References: <20260131153106.31723-1-jerrysteve1101@gmail.com> <20260131153106.31723-4-jerrysteve1101@gmail.com>
Date: Sat, 31 Jan 2026 21:27:13 +0100
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, alchark@gmail.com
To: "Jun Yan" <jerrysteve1101@gmail.com>
MIME-Version: 1.0
Message-ID: <d2005c66-536c-8c0c-658a-fb6ed7b5f3c6@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 3/3] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= Add OneThing Edge Cube series
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_122725_931594_C34156A0 
X-CRM114-Status: GOOD (  16.87  )
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

Hello Jun,

Please, see a quick remark below, for now.

On Saturday, January 31, 2026 16:31 CET, Jun Yan <jerrysteve1101@gmail.=
com> wrote:
> The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
> eMMC storage, and supports one SATA interface, one Gigabit Ethernet
> port, and one USB 3.0 port.
>=20
> Other than the difference in RAM capacity, the OEC and OEC-turbo are
> identical in all other specifications.
>=20
>   Specification:
>     - Rockchip RK3566
>     - LPDDR4X 2GB (OEC) / 4GB (OEC-turbo)
>     - eMMC 8GB
>     - Gigabit Ethernet port x 1
>     - USB 3.0 port x 1
>     - USB-C 2.0 port x 1
>     - 12V DC Power supply
>     - SATA 3.0 connector x 1
>=20
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   2 +
>  .../rockchip/rk3566-onething-oec-turbo.dts    |  10 +
>  .../boot/dts/rockchip/rk3566-onething-oec.dts |  10 +
>  .../dts/rockchip/rk3566-onething-oec.dtsi     | 309 ++++++++++++++++=
++
>  4 files changed, 331 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec-=
turbo.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec.=
dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec.=
dtsi
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/=
dts/rockchip/Makefile
> index 4d384f153c13..ec57719e4573 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -104,6 +104,8 @@ dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-anber=
nic-rg353v.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-anbernic-rg353vs.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-anbernic-rg503.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-odroid-m1s.dtb
> +dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-onething-oec.dtb
> +dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-onething-oec-turbo.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-orangepi-3b-v1.1.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-orangepi-3b-v2.1.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-pinenote-v1.1.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.d=
ts b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
> new file mode 100644
> index 000000000000..16d0cd0cf577
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3566-onething-oec.dtsi"
> +
> +/ {
> +	model =3D "OneThing OEC-turbo";
> +	compatible =3D "onething,oec-turbo", "rockchip,rk3566";
> +};
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts b/a=
rch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
> new file mode 100644
> index 000000000000..81da771ad63d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
> @@ -0,0 +1,10 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include "rk3566-onething-oec.dtsi"
> +
> +/ {
> +	model =3D "OneThing OEC";
> +	compatible =3D "onething,oec", "rockchip,rk3566";
> +};

The only difference between the two OneThing OEC board variants is, as
far as I can tell, the amount of LPDDR4X DRAM they have, so I don't thi=
nk
it's justified to have two separate board dts files that descend from t=
he
common dtsi ancestor.

Having different amounts of DRAM on the same board design is present on
virtually all boards from other manufacturers, and some kind of special
DT treatment is needed only in some special cases, such as when differe=
nt
types of DRAM are used for different capacities.

The different naming of the two board variants could be solved by havin=
g
something like this is the single board dts file:

  model =3D "OneThing OEC/OEC-turbo";

Having two separate board dts files only makes it harder down the road,
such as having to build and provide two separate U-Boot builds, with no
real benefits.  Every user can run free(1) to check the amount of avail=
able
DRAM on their board, which also tells them the board variant.


