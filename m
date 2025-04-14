Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AE4C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oQty0lcT26LGD7pF2bpOzeJUHivvlWxMoP2U/JsFOg4=; b=jvTBwRs2cViJwpV3d89xCJalPh
	nMhoq8g7qDOoTdYGwoDUDtFm6ZvnPqqZNNzIj6ZWvmMKrVltumb4UtMM9omWUiN5U6OLLfN/EPVsL
	+cLfpSdmvUr3S3sKyoRsIOBCGfvt9TJzSJrbRs48QMUCMfrOkar3jdCifkHWdabKlTMb02OIpnyev
	X2slfPYblhLfaCsI6bbtji1Thxg5uhhSOk307TXmt1VA6Z9HC+2Y4TVySx/oc1yoxWlXFgbe9Bfu3
	Mc6sM5psfjX9VoUqqH0HLk1V98akF4C4DN1UFr3H2Pfh3UycWCnUvrfSi6T2yYEAq9b9V+wRK4RGT
	4RC9l5FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GPD-00000001K5U-3OUF;
	Mon, 14 Apr 2025 09:47:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4G6A-00000001GtE-0T7B;
	Mon, 14 Apr 2025 09:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744622844;
	bh=k9z8u+21LVEgAfkjUSJ5SSMbZtKhyPUmMn4Bg55YBOg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hzICPuV94bxD6HHKvy/Wd4B91VbG1VXczdYg7fWy6kGa3jUKFAZWHaPsNPorYGECV
	 cjIkUZMjROI0HtHVyY/EPyfcVqKG8Jndcmw5iuf2UDTj+UQa/rHrF02K3qfWB/kxNu
	 x2bNEshdtao6xCP8hai/B/4DsXNoP5H/WpAX+Pn+g/kUurso5XfOIX/rJ/F3y8fJlq
	 BFOVsmfPYPcRyJQmgOFNPmt2NmLUOLT7Lm+pgFybA7ElUOmmcgwlaNIucpDHLG3dY7
	 uxpQABkS2x7MTjZOxYkJ45laKd89jROk2Epkx6jxGyHGe5zZ7G+mWlMLi/2CgrAsof
	 f/blUgmhEqlFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A90AA17E0F85;
	Mon, 14 Apr 2025 11:27:23 +0200 (CEST)
Message-ID: <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
Date: Mon, 14 Apr 2025 11:27:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
To: Frank Wunderlich <linux@fw-web.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>
References: <20250412102109.101094-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250412102109.101094-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_022726_346486_6C3B9CB8 
X-CRM114-Status: GOOD (  17.83  )
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

Il 12/04/25 12:21, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Sinovoip has released other variants of Bananapi-R4 board.
> The known changes affecting only the LAN SFP+ slot which is replaced
> by a 2.5G phy with optional PoE.
> 
> Just move the common parts to a new dtsi and keep differences (only
> i2c for lan-sfp) in dts.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - added basic dts for 2g5 variant
> - moved i2c used for sfp-lan to board dts
> ---
>   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
>   .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |   5 +
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
>   4 files changed, 414 insertions(+), 400 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 58484e830063..a1ebc9aa4ba6 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
> @@ -107,4 +108,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
>   DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
>   DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
>   DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
> +DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 := -@
>   DTC_FLAGS_mt8395-radxa-nio-12l := -@
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> new file mode 100644
> index 000000000000..76eca976b968
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +/dts-v1/;
> +
> +#include "mt7988a-bananapi-bpi-r4.dtsi"

This should at least have some different compatible, if not probably also a
different model string - as it's a different device.

	compatible = "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt7988a";
	model = "Banana Pi BPI-R4 (2.5GbE)";
	chassis-type = "embedded";

> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> index 6623112c24c7..431bf066fffb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts

..snip..

a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi 
b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> new file mode 100644
> index 000000000000..1ab09ed2f151
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
> +
> +#include "mt7988a.dtsi"
> +
> +/ {
> +	compatible = "bananapi,bpi-r4", "mediatek,mt7988a";
> +	model = "Banana Pi BPI-R4";
> +	chassis-type = "embedded";

Please keep compatible/model/chassis-type in dts files.


Cheers,
Angelo

