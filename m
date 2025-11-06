Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F53ACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 22:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1X/CXcnKu0utomIoDVTa8ejjlinauV2USLh4t/RueAg=; b=t8/w46srdY4/thZuTbOSyLVixe
	W7hA9FOuSzPEvK4gUQrRlFKVLD58k2YlU450yj5nJIzeDuNp5M/FfTEWPyQdYthlWBXAW4vANcoLB
	9I3AgBN0hhgBi5cVgtIFhBniULlEpAfVYqXLXGsnbOlho1Z/U3zabfwG6FlCXDhoF2w37HmlemjcI
	qlvkMBmvmGEp5ZVhn3zCv+v3cma4qpdN1UDjjIVMqGple7e0xA+5t89qJLgG5SABmfbGiOiYXjMgZ
	H4Pyy9wyOukUpTUqa5IRqDa7czpi9hZQrXCdY41/Z6sBw41Ut5VzMMULBnCotL6E1LBIPCB/tfoEc
	8pqlCrLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8sY-0000000GKii-1Q9x;
	Thu, 06 Nov 2025 22:54:54 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8sW-0000000GKiI-1y7X;
	Thu, 06 Nov 2025 22:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1X/CXcnKu0utomIoDVTa8ejjlinauV2USLh4t/RueAg=; b=HeLO/m2CPzKLXigoYGRXggshjT
	mBlEYe3+mSRH4JhbWQahv5wTHPo02zAgAdwp4xkKdrnE8TNMhOMmP2JHeNxLP/IKB3ZfCGNw/1Q7K
	7ZwBNet8eT7aFBxEUukH4xOIUQkjje2WPh8mLsLUNlz8mS/Ms95B2RhyBFzYe1KGZjghcWHirxTNk
	qfpw/pO/dVpLqmnauHd7nV8BEdiLN4lc+dwhAp6E0Fc7l0iTO6PukVqK08aK+hZhPzUdhkNMIT99y
	vc/jRiy4rs04C0TQP1Eifl+bfL7lv+p/YB9E6fsvid2+NaF+yABDumfWDZMGs3SHkNakc9mkKDMOG
	UFr250Gg==;
Received: from i53875bac.versanet.de ([83.135.91.172] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vH8sQ-0001oK-HK; Thu, 06 Nov 2025 23:54:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dragan Simic <dsimic@manjaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Coia Prant <coiaprant@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Coia Prant <coiaprant@gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add devicetree for the 9Tripod X3568
 v4
Date: Thu, 06 Nov 2025 23:54:45 +0100
Message-ID: <3719039.iIbC2pHGDl@phil>
In-Reply-To: <20251103171702.1518730-4-coiaprant@gmail.com>
References: <20251103171702.1518730-1-coiaprant@gmail.com>
 <20251103171702.1518730-4-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_145452_513537_410589BB 
X-CRM114-Status: GOOD (  17.44  )
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
>=20
> Specification:
> - SoC: RockChip RK3568 ARM64 (4 cores)
> - eMMC: 16-128 GB
> - RAM: 2-16 GB
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
> - PCIe: 1x PCIe 3.0 x2 (x4 connecter) [power/clock/slot may not install]
>=20
> Link:
> - https://appletsapi.52solution.com/media/X3568V4%E5%BC%80%E5%8F%91%E6%9D=
%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C.pdf
> - https://blog.gov.cooking/archives/research-ninetripod-x3568-v4-and-flas=
h.html
>=20
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video-d=
emo.dtso b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video-demo.=
dtso
> new file mode 100644
> index 000000000..e7fa1ca48
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video-demo.dtso
> @@ -0,0 +1,154 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +
> +// This is a sample reference, due to lack of hardware can not be tested=
, at your own risk

and I've also dropped the 2nd overlay now.
Please only ever submit patches for stuff you have actually tested.

We don't really add stuff with "use at your own risk" caveats ;-)


Heiko



