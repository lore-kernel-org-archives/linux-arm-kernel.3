Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1263DCCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 21:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPmSx/rC/bLVWOw7yLLlRYHnQQ8/QE5D94ipJ1ensxQ=; b=c8fkXJeDJuZvTddFkIhvqun20B
	Utk852D0hfhGncMigd3QdpnhGpVzQGVBl8V0I/7wyWt54AV23v3pPO5ffTH8QUiUSaix3h48D72qh
	QXedNcbRvyvpjmZz4m4H2rPUCUhbWcaWLp3TIyb3apWo6bo/9RhEJaXm077lpe7ZIsrC+jcEm+xxs
	kPoPWuO8UBOgk/j2/VNNO7YlCiw3r5y/ynHG5xuSrqjoLzw8qQqLAa4SeNIhQRE8WuXLy1gyJkHBa
	K8OSFJVYyXYgyvMHsYDgsvA5QPsYPcBTL2M+A7R/XjrE/9wTSwm94u531sC+0ZYb37uV/m4+83UzX
	YUeLV2bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClQ8-0000000BktK-066R;
	Sat, 25 Oct 2025 21:03:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vClQ5-0000000Bksq-1ass;
	Sat, 25 Oct 2025 21:03:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=UPmSx/rC/bLVWOw7yLLlRYHnQQ8/QE5D94ipJ1ensxQ=; b=YEASFOKREVuSgjHgpy0Y2dRBS3
	s82bVK4joK0JDK3UxqW/p4Y+wOnrE1Z/gZ1xovq/jEE/iWp2erD6477NYCnkHkJhntAkS7Xt/sWMk
	eqxQiHLMv5qgMYH3W+UKGZo9GMivQN0gpIxjon1UaOBTeHvm0QeoPdAbfILHltsECucUdEzwREHmg
	j8wL8BOvlHlTE8ksd5mOq1Wej4mYpIPWPCaeVhwgjWdwSx2nGgrJKXr82Txtqu955ouA+BaqOcdcf
	ZsCwQgQqzoBHmD2rGpH8r/7GmVwM6Q+SssAZ6LxkeYciepqmsKAMgMjs0a0EiDppethbe3IHQ/XSC
	MKArByuA==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vClPs-0005MZ-EF; Sat, 25 Oct 2025 23:03:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Coia Prant <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the X3568 v4
Date: Sat, 25 Oct 2025 23:03:11 +0200
Message-ID: <2940731.88bMQJbFj6@phil>
In-Reply-To: <20251025203711.3859240-1-coiaprant@gmail.com>
References: <20251025203711.3859240-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_140325_444998_DB24F0C7 
X-CRM114-Status: GOOD (  16.62  )
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

general comments, I haven't disected the devicetrees yet.


Am Samstag, 25. Oktober 2025, 22:37:11 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Coia Prant:

Please also provide some description what type of board this is,
not just a list of specs

> Specification:
> - SoC: RockChip RK3568 ARM64 (4 cores)
> - eMMC: 16-128 GB
> - RAM: 2-8 GB
> - Power: DC 12V 2A
> - Ethernet: 2x YT8521SC RGMII (10/100/1000 Mbps)
> - Wireless radio: 802.11b/g/n/ac/ax dual-band
> - LED:
>   Power: AlwaysOn
>   User: GPIO
> - Button:
>   VOL+: SARADC/0 <35k =C2=B5V>
>   VOL-: SARADC/0 <450k =C2=B5V>
>   Power/Reset: PMIC RK809
> - CAN
>   CAN/1: 4-pin (PH 2.0)
> - PWM
>   PWM/4: Backlight DSI/0 DSI/1
>   PWM/7: IR Receiver [may not install]
> - UART:
>   UART/2: Debug TTL - 1500000 8N1 (1.25mm)
>   UART/3: TTL (PH 2.0)
>   UART/4: TTL (PH 2.0)
>   UART/8: AP6275S Bluetooth
>   UART/9: TTL (PH 2.0)
> - I2C:
>   I2C/0: PMIC RK809
>   I2C/1: Touchscreen DSI/0 DSI/1
>   I2C/4: Camera
>   I2C/5: RTC@51 PCF8563
> - I2S:
>   I2S/0: miniHDMI Sound
>   I2S/1: RK809 Audio Codec
>   I2S/3: AP6275S Bluetooth Sound
> - SDMMC:
>   SDMMC/0: microSD (TF) slot
>   SDMMC/2: AP6275S SDIO WiFi card
> - Camera: 1x CSI
> - Video: miniHDMI / DSI0 (MIPI/LVDS) / DSI1 (MIPI/EDP)
> - Audio: miniHDMI / MIC on-board / Speaker / SPDIF / 3.5mm Headphones / A=
P6275S Bluetooth
> - USB:
>   USB 2.0 HOST x2
>   USB 2.0 HOST x3 (4-pin)
>   USB 2.0 OTG x1 (shared with USB 3.0 OTG/HOST) [slot may not install]
>   USB 3.0 HOST x1
>   USB 3.0 OTG/HOST x1
> - SATA: 1x SATA 3.0 with Power/4-pin [slot may not install]
> - PCIe: 1x PCIe 3.0 x2 (x4 connecter) [clock/slot may not install]
>=20
> Link:
> - https://appletsapi.52solution.com/media/X3568V4%E5%BC%80%E5%8F%91%E6%9D=
%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C.pdf
> - https://blog.gov.cooking/archives/research-ninetripod-x3568-v4-and-flas=
h.html

2nd link ends in a 404 error, page not found


> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> Tested-by: Coia Prant <coiaprant@gmail.com>


When you submit a patch, we expect you to have tested it, so tere
is no need to have a separate tested-by line :-) .


> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |  11 +
>  .../rockchip/rk3568-x3568-camera-demo.dtso    |  82 ++
>  .../boot/dts/rockchip/rk3568-x3568-v4.dts     | 884 ++++++++++++++++++
>  .../dts/rockchip/rk3568-x3568-video-demo.dtso | 141 +++

please name your boards including the ninetree name, because x3568 is way
too generic, so
rk3568-ninetree-x3568 .....

Additionally, from that PDF above, it seems this is a system-on-module?
X3568CV2 + baseboard? If so, please split this into a dtsi + dts.
See all the other system-on-modules for reference.

Additionally, you'll need to have a 2nd patch to add the board to
Documentation/devicetree/bindings/arm/rockchip.yaml

And also possily a 3rd patch to add ninetree to
Documentation/devicetree/bindings/vendor-prefixes.yaml


Heiko



