Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783DBCDB473
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 02:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:References:Content-Type:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uX/2pMBq8YFtdwCkOWoxt85FC5FnMn/zz8PPEr/Rp4Y=; b=yulcUz4w0JHXI4I3ywKm+VkP+s
	FEjYHKRV7H6eKCylMAfB+tJ82D3MtfmxcuCS+u03ndqobJ+iowYMEqvG/R0m1Q025IkSnGRvCOgM2
	bB9LDpKUG+nwc7mkd9OIMVptxUEYG3WXX0bJz+NsGkm00vOGbcMjmtA8uUplCC5M8draT2B59/Y2s
	Ua1TC/cko4Mg8xDC+O5ZxrZgONGZw1xBzm6/ZyCYuGXbwjkk11V6koUIi3a+4rqM52ChuVRhpKvgk
	mSWGI6ITCCM302/NiesKd9AYp8h7O3WHZd89WrSCFG3OfZ8y4b3Qn3PC3FsFJl3GZ/wDUi9l1g+2Q
	fA60jj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjWc-0000000BQ4X-0ntm;
	Fri, 14 Nov 2025 02:26:58 +0000
Received: from mail1.manjaro.org ([2a01:4f8:c010:b6e8::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJjWW-0000000BQ3u-2Bfo;
	Fri, 14 Nov 2025 02:26:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPA id B965140FDC;
	Fri, 14 Nov 2025 03:26:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=dkim;
	t=1763087208; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uX/2pMBq8YFtdwCkOWoxt85FC5FnMn/zz8PPEr/Rp4Y=;
	b=gV5/qBQ3Oa6tB8kZtXNvJObLDzSLcBmdWZ0AVAlgsa/2nTrUBxbTmikAuAOG6Wq+aIQ0O2
	AI+qnMmKmobMlAPwge5iOUEuf1xahHRlLE3vBCe6CXlfwAZBD2gvzTKo5RBiYpVjpWkWEF
	aNtXN9rFTTMMm2IOtQ1Xu11ymJmGklHz7t8n/3ssNcXTJIQNK3D1FpU8kFTkMku/HPoII/
	twAB59OjvwHKH3uhnMnz49f9r2k0ZSy5mBGG4JaRnnBWg8EmLLxPKtYFsvW6UVlcHUBtYe
	nQz/v2u9M2biibMvAKts247VkEOtQ+8mf2zygw8M8assdlZQ+Qu9HcjLna086w==
From: "Dragan Simic" <dsimic@manjaro.org>
In-Reply-To: <20251111172003.2324525-3-michael.opdenacker@rootcommit.com>
Content-Type: text/plain; charset="utf-8"
References: <20251111172003.2324525-1-michael.opdenacker@rootcommit.com> <20251111172003.2324525-3-michael.opdenacker@rootcommit.com>
Date: Fri, 14 Nov 2025 03:26:47 +0100
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: michael.opdenacker@rootcommit.com
MIME-Version: 1.0
Message-ID: <dbacc018-2631-6606-7562-27371cf45d6f@manjaro.org>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/2] =?utf-8?q?arm64=3A?==?utf-8?q?_dts=3A?=
 =?utf-8?q?_rockchip=3A?= add Tinkerboard 3 and 3S device tree
User-Agent: SOGoMail 5.12.3
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: None
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_182652_965622_6C9FFBAD 
X-CRM114-Status: GOOD (  21.70  )
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

Hello Michael,

Thanks for this patch!  Please, see some comments below.

On Tuesday, November 11, 2025 18:20 CET, michael.opdenacker@rootcommit.=
com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>=20
> Add initial device tree support for Asus Tinkerboard 3 [1] and 3S [2]=
,
> which are SBCs based on the Rockchip 3566 SoC.

For consistency and because it's a proper noun, this should be
s/Tinkerboard/Tinker Board/.

> The "3S" version ("S" for "storage") just adds a 16 GB eMMC
> and a "mask ROM" DIP switch (to mask the eMMC and enter "Mask ROM"
> mode for recovery) to the "3" version.
>=20
> This adds support for:
> - Debug UART (/dev/ttyS2)
> - SD card (/dev/mmcblk1)
> - eMMC (/dev/mmcblk0, only on Tinkerboard 3S)
> - I2C:
>   - i2c0 (internal bus with a PMIC and regulators)
>   - i2c2 (internal bus with an at24 eeprom and an RTC device)
> - USB 2.0 ports
> - 2 GPIO LEDS
>=20
> Link: https://tinker-board.asus.com/series/tinker-board-3.html [1]
> Link: https://tinker-board.asus.com/series/tinker-board-3s.html [2]

These two lines should read like this, to serve as references, with
an empty line afterwards, of course:

  [1] https://tinker-board.asus.com/series/tinker-board-3.html
  [2] https://tinker-board.asus.com/series/tinker-board-3s.html

> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   2 +
>  .../boot/dts/rockchip/rk3566-tinker-3.dts     |  14 +
>  .../boot/dts/rockchip/rk3566-tinker-3.dtsi    | 264 ++++++++++++++++=
++
>  .../boot/dts/rockchip/rk3566-tinker-3s.dts    |  30 ++
>  4 files changed, 310 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-3s.dts
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/=
dts/rockchip/Makefile
> index ad684e3831bc..381831cab20c 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -130,6 +130,8 @@ dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-luban=
cat-1.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-nanopi-r3s.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-bigtreetech-cb2-manta.dt=
b
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-bigtreetech-pi2.dtb
> +dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-tinker-3.dtb
> +dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3566-tinker-3s.dtb

The board .dts/.dtb files should include "-board", i.e. these should
be "rk3566-tinker-board-3.dtb" and "rk3566-tinker-board-3s.dtb"
instead, because there's no real need for shortening.  These boards
are simply named "Tinker Board", which should be preserved.

>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3568-bpi-r2-pro.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3568-evb1-v10.dtb
>  dtb-$(CONFIG=5FARCH=5FROCKCHIP) +=3D rk3568-fastrhino-r66s.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dts b/arch/=
arm64/boot/dts/rockchip/rk3566-tinker-3.dts
> new file mode 100644
> index 000000000000..938af35b9004
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcom=
mit.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "rk3566-tinker-3.dtsi"

The same comment from above about the naming applies here (as well
as in other places), so we should have "rk3566-tinker-board-3.dtsi"
here instead.

> +
> +/ {
> +	model =3D "Rockchip RK3566 Asus Tinker Board 3";

For consistency and to avoid redundancy, the "Rockchip RK3566"
part should be removed.

> +	compatible =3D "asus,rk3566-tinker-3", "rockchip,rk3566";

Actually, the compatible should be "asus,rk3566-tinker-board-3"
instead, because there's no real need for shortening it.

> +};
> +
> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dtsi b/arch=
/arm64/boot/dts/rockchip/rk3566-tinker-3.dtsi
> new file mode 100644
> index 000000000000..45269d33b0cb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-3.dtsi

This .dtsi file should be named "rk3566-tinker-board-3.dtsi" instead,
because there's no need for shortening.  Please see also a comment
above, regarding the naming.

[snip]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3566-tinker-3s.dts b/arch=
/arm64/boot/dts/rockchip/rk3566-tinker-3s.dts
> new file mode 100644
> index 000000000000..ba7efd702050
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3566-tinker-3s.dts

This .dts file should be named "rk3566-tinker-board-3s.dts" instead,
because there's no need for shortening.

> @@ -0,0 +1,30 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcom=
mit.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "rk3566-tinker-3.dtsi"
> +
> +/ {
> +	model =3D "Rockchip RK3566 Asus Tinker Board 3S";

For consistency and to avoid redundancy, the "Rockchip RK3566"
part should be removed.

> +	compatible =3D "asus,rk3566-tinker-3s", "asus,rk3566-tinker-3", "ro=
ckchip,rk3566";

The compatibles should be as below instead, for the same reasons
as already explained above.

  "asus,rk3566-tinker-board-3s", "asus,rk3566-tinker-board-3", "rockchi=
p,rk3566"

Though, perhaps it would be better to not include the "asus,rk3566-
tinker-board-3" part, because I think it's pretty much redundant.

[snip]


