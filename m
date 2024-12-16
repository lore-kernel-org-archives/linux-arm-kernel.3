Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C105FE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mO97MSHpGD8mvKW7qAKYG5qtmOgQA3lhlZ3vy41oN7Y=; b=PDppoVI3VagccA2VEazIucVEuV
	IvV8Hse/thzsUGNrtp9HTlYVY/mp22wW+L2u6tCx4Xcg7XFkoV/1ZOIRAMhFRJrqO/pc3ATls5esC
	kMAbJykX4t+OIxHslx7uaHrn/+hXnLCIIzBTTUFVYczHZpu9XHwRe4AGyHTgolg+PbTHyywrvG0St
	tdV6kJHWg377vERPX3hHXzirhX/KZjfvU7CfVgv6z/pZhJg4wGTyO1Hj5zCdgUyNfN4XbU6wfJ7AF
	Nik65wjFZmD17ddV9vKE1BeEC5DpYBujHw8haIEi6RFjkBKa9VnfXgT+4hlLiU9uENfM6sngKwUa2
	qOEX2EKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7PG-00000009XT6-2PLC;
	Mon, 16 Dec 2024 09:28:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7NX-00000009XCT-189g;
	Mon, 16 Dec 2024 09:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 905B5A40DEF;
	Mon, 16 Dec 2024 09:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E36CC4CED0;
	Mon, 16 Dec 2024 09:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734341222;
	bh=RiNZbWnZxjqP5avkWIr4+Q2y+t0Cf4R8Bb/gjwRkOhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P839JV1cAUMLZ7jxjjy/0R4WSlaoT6Ejp1FNkM2wZtm3KjWc2lWi134wD3z/a5Hz2
	 GO6tgq308F1Q5m5OyeJcd5RtSQtGb+fBK1IeSln/DnhaTXl9mxxSVSlvcyDAfK3o6Y
	 1QNPp07NJ75j6PJ7VqZOyLZwK0QCjw/atdyMgGHYh4kQnigfSb+NU4PWTgYMh9M3dL
	 yDvQFPbpBqQFVtUyTxFwd94Qtr6hG37v0hyg5Z3tXgFVrxW+WpultvTGcYeMledd8X
	 obepvIzeUShWIcqimGolI8FJgKieAk+KiuVqH7lyebMyY4I3geRN78jix0Kx27Sm/z
	 XDCvqCYUvCuzw==
Date: Mon, 16 Dec 2024 10:26:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shimrra Shai <shimrrashai@gmail.com>
Cc: linux-kernel@vger.kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, heiko@sntech.de, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	robh@kernel.org
Subject: Re: [PATCH v3 1/3] arm64: dts: rockchip: add DTs for Firefly
 ITX-3588J and its Core-3588J SoM
Message-ID: <itsbbexem4wlkbk6tczmawkp5z6ngse477iretyarg2ut5jhi3@atg4o3lr3u6u>
References: <20241215032507.4739-1-shimrrashai@gmail.com>
 <20241215032507.4739-2-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241215032507.4739-2-shimrrashai@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_012703_446432_3456E155 
X-CRM114-Status: GOOD (  16.10  )
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

On Sat, Dec 14, 2024 at 09:24:53PM -0600, Shimrra Shai wrote:
> Main DTS for the boards and Makefile addition.
> 
> Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../rockchip/rk3588-firefly-core-3588j.dtsi   | 453 +++++++++++
>  .../dts/rockchip/rk3588-firefly-itx-3588j.dts | 712 ++++++++++++++++++
>  3 files changed, 1166 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 86cc418a2..3f2eebd1f 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -137,6 +137,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-firefly-itx-3588j.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
> new file mode 100644
> index 000000000..e911a6472
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
> @@ -0,0 +1,453 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +#include "rk3588.dtsi"
> +
> +/ {
> +	compatible = "firefly,core-3588j", "rockchip,rk3588";

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

It does not look like you tested the DTS against bindings. Please run
'make dtbs_check W=1' (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

Best regards,
Krzysztof


